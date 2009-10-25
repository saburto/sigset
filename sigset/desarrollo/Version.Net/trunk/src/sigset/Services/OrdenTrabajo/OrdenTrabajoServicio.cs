using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using Data.Repositorios.OrdenTrabajoRepositorio;
using xVal.ServerSide;
using System.Threading;
using Data.Repositorios.Tecnicos;
using Data.Repositorios.Usuarios;


namespace Services.OrdenTrabajo
{
    public class OrdenTrabajoServicio : Services.OrdenTrabajo.IOrdenTrabajoServicio 
    {
        private IOrdenTrabajoRepositorio _repo;
        private ITecnicoRepositorio _repoTecnico;
        private IUsuarioRepositorio _repoUsuarios;

        public OrdenTrabajoServicio(IOrdenTrabajoRepositorio repo, ITecnicoRepositorio repoTecnicos, IUsuarioRepositorio repoUsuario)
        {
            _repo = repo;
            _repoTecnico = repoTecnicos;
            _repoUsuarios = repoUsuario;
        }
        public OrdenTrabajoServicio()
               : this(new OrdenTrabajoRepositorio(), new TecnicoRepositorio(), new UsuarioRepositorio())
        {
        }

        public decimal CrearOrdenTrabajo(Data.Modelo.OrdenTrabajo orden, string usuario)
        {
            orden.FechaIngreso = DateTime.Now;
            ValidarOrden(orden, null);
            Data.Modelo.OrdenTrabajo ot = _repo.GuardarOrdenTrabajo(orden);
            Detalle detalle = new Detalle();
            detalle.IdOrden = ot.Id;
            //aca se cae.
            var user = _repoUsuarios.GetUsuarioByNombreUsuario(usuario);

            detalle.IdUsuario = user != null ? user.Id: 1;
            detalle.Estado = 1;
            detalle.FechaCreacion = ot.FechaIngreso;
            _repo.GuardarDetalle(detalle);



            //Asignacion de tecnicos automaticamente asincronicamente
            ThreadStart star = delegate { AsigancionAutomatica(orden); };
            Thread asigancion = new Thread(star);
            asigancion.Start();
            
            
            return ot.Id;
        }

        public void AsigancionAutomatica(Data.Modelo.OrdenTrabajo ot)
        {
            //var tecnicos = _repoTecnico.GetTodosLosTecnicos();
            //var tecnicosLibre = from t in tecnicos
            //                    orderby t.OrdenTrabajos.Min()
            //                    select t;
            //foreach (var tec in tecnicosLibre)
            //{
            //    //Si existe algun tecnico ocioso
            //    if (tec.OrdenTrabajos.Count() == 0)
            //    {
            //        ot.Id_Tecnico_Asignado = tec.Rut;
            //        ot.Tecnico = tec;
            //        _repo.SaveChanges();
            //        return;
            //    }
            //}

        }


        private void ValidarOrden(Data.Modelo.OrdenTrabajo orden, IList<ErrorInfo> _error)
        {
            if (_error == null)
            {
                _error = new List<ErrorInfo>();
            }

            if (string.IsNullOrEmpty(orden.Serie))
            {
                _error.Add(new ErrorInfo("Serie","Serie es necesario"));
            }

            if (string.IsNullOrEmpty(orden.Falla))
            {
                _error.Add(new ErrorInfo("Falla","Falla es necesario"));
            }

            if (orden.FechaEntrega == null)
            {
                _error.Add(new ErrorInfo("Fecha_Entrega","Fecha de entrega debe ser informada"));
            }

            if (orden.TipoOrden <= 0)
            {
                _error.Add(new ErrorInfo("Tipo_Orden","Tipo de orden debe ser seleccionado"));
            }
            else if (orden.TipoOrden != 2)
            {
                if (string.IsNullOrEmpty(orden.Boleta))
                {
                    _error.Add(new ErrorInfo("Boleta", "Se debe informar boleta"));
                }

                if (string.IsNullOrEmpty(orden.Poliza))
                {
                    _error.Add(new ErrorInfo("Poliza", "Se debe informar Poliza"));
                }

                if (string.IsNullOrEmpty(orden.LugarCompra))
                {
                    _error.Add(new ErrorInfo("Lugar_Compra", "Se debe informar lugar de compra"));
                }

                if (orden.FechaCompra == null)
                {
                    _error.Add(new ErrorInfo("Fecha_Compra", "Se debe informar fecha de compra"));
                }

            }

            if (_error.Any())
            {
                throw new RulesException(_error);
            }

        }

        public IList<TipoOrden> GetTiposOrden()
        {
            return _repo.GetTiposOrden().ToList();
        }



        public Data.Modelo.OrdenTrabajo GetOrdenTrabajo(decimal id)
        {
            return _repo.GetOrdenTrabajoById(id);
        }




        public IList<Data.Modelo.OrdenTrabajo> GetOrdenesTrabajoByRut(decimal p)
        {
            return _repo.GetTodasLasOrdenDeTrabajo().Where(x => x.IdCliente == p).OrderBy(x=> x.FechaIngreso).ToList();
        }


        public IList<Estado> GetEstadosOrden()
        {
            return _repo.GetEstadosOrden().ToList();
        }

        public IList<Data.Modelo.OrdenTrabajo> GetOrdenesTrabajo(DateTime Fecha_Inicio, DateTime Fecha_Final, string ListaTipos, string ListaEstados)
        {
            if (Fecha_Final == null || Fecha_Inicio == null)
            {
                throw new Exception("Se debe ingresar fecha inicio y final.");
            }


            if (Fecha_Final < Fecha_Inicio)
            {   
                throw new Exception("Fecha final debe ser mayor que fecha de inicio");
            }

            IQueryable<Data.Modelo.OrdenTrabajo> ordenes;
            if (string.IsNullOrEmpty(ListaTipos) || ListaTipos == "-1")
            {
                ordenes = from o in _repo.GetTodasLasOrdenDeTrabajo()
                          where o.FechaIngreso >= Fecha_Inicio && o.FechaIngreso <= Fecha_Final
                          select o;    
            }
            else
            {
                ordenes = from o in _repo.GetTodasLasOrdenDeTrabajo()
                          where o.FechaIngreso >= Fecha_Inicio && o.FechaIngreso <= Fecha_Final
                            && o.TipoOrden == decimal.Parse(ListaTipos)
                          select o;
            }

            if (string.IsNullOrEmpty(ListaEstados) || ListaEstados == "-1")
            {
                return ordenes.ToList();
            }
            else
            {
                var ord = from o in ordenes
                          where o.Detalles.OrderByDescending(x => x.FechaCreacion).FirstOrDefault().Estado == decimal.Parse(ListaEstados)
                          select o;
                return ord.ToList();                          
            }
        }


        public IList<Data.Modelo.OrdenTrabajo> GetOrdenesTrabajoSinAsignar()
        {
            var ord = from o in _repo.GetTodasLasOrdenDeTrabajo()
                      where o.Detalles.OrderByDescending(x => x.FechaCreacion).FirstOrDefault().Estado == 1
                      select o;
            return ord.ToList();
        }


        public void AsginarTecnicoOrden(Detalle detalle, int rutTecnico, string usuario)
        {
            var orden = GetOrdenTrabajo(detalle.IdOrden.Value);
            orden.IdTecnicoAsignado = rutTecnico;
            _repo.SaveChanges();


            detalle.Estado = 2;
            detalle.FechaCreacion = DateTime.Now;

            var user = _repoUsuarios.GetUsuarioByNombreUsuario(usuario);

            detalle.IdUsuario = user != null ? user.Id : 9;

            _repo.GuardarDetalle(detalle);

        }



        public IList<Data.Modelo.OrdenTrabajo> GetOrdenesTrabajoByTecnico(decimal id)
        {
            return _repo.GetTodasLasOrdenDeTrabajo().Where(x => x.IdTecnicoAsignado == id).ToList();
        }


        public void AgregarDetalle(Detalle detalle, string p)
        {
            detalle.FechaCreacion = DateTime.Now;
            var user = _repoUsuarios.GetUsuarioByNombreUsuario(p);
            detalle.IdUsuario = user != null ? user.Id : 9;
            _repo.GuardarDetalle(detalle);
        }

        
    }
}
