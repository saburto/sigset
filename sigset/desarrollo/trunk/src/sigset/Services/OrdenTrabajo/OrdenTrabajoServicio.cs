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

        public decimal CrearOrdenTrabajo(Orden_Trabajo orden, string usuario)
        {
            orden.Fecha_Ingreso = DateTime.Now;
            ValidarOrden(orden, null);
            Orden_Trabajo ot = _repo.GuardarOrdenTrabajo(orden);
            Detalle detalle = new Detalle();
            detalle.Id_Orden = ot.Id;
            detalle.Id_Usuario = _repoUsuarios.GetUsuarioByNombreUsuario(usuario).Id;
            detalle.Estado = 1;
            detalle.Fecha_Creacion = ot.Fecha_Ingreso;
            _repo.GuardarDetalle(detalle);



            //Asignacion de tecnicos automaticamente asincronicamente
            ThreadStart star = delegate { AsigancionAutomatica(orden); };
            Thread asigancion = new Thread(star);
            asigancion.Start();
            
            
            return ot.Id;
        }

        public void AsigancionAutomatica(Orden_Trabajo ot)
        {
            //var tecnicos = _repoTecnico.GetTodosLosTecnicos();
            //var tecnicosLibre = from t in tecnicos
            //                    orderby t.Orden_Trabajos.Min()
            //                    select t;
            //foreach (var tec in tecnicosLibre)
            //{
            //    //Si existe algun tecnico ocioso
            //    if (tec.Orden_Trabajos.Count() == 0)
            //    {
            //        ot.Id_Tecnico_Asignado = tec.Rut;
            //        ot.Tecnico = tec;
            //        _repo.SaveChanges();
            //        return;
            //    }
            //}

        }


        private void ValidarOrden(Orden_Trabajo orden, IList<ErrorInfo> _error)
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

            if (orden.Fecha_Entrega == null)
            {
                _error.Add(new ErrorInfo("Fecha_Entrega","Fecha de entrega debe ser informada"));
            }

            if (orden.Tipo_Orden <= 0)
            {
                _error.Add(new ErrorInfo("Tipo_Orden","Tipo de orden debe ser seleccionado"));
            }
            else if (orden.Tipo_Orden != 2)
            {
                if (string.IsNullOrEmpty(orden.Boleta))
                {
                    _error.Add(new ErrorInfo("Boleta", "Se debe informar boleta"));
                }

                if (string.IsNullOrEmpty(orden.Poliza))
                {
                    _error.Add(new ErrorInfo("Poliza", "Se debe informar Poliza"));
                }

                if (string.IsNullOrEmpty(orden.Lugar_Compra))
                {
                    _error.Add(new ErrorInfo("Lugar_Compra", "Se debe informar lugar de compra"));
                }

                if (orden.Fecha_Compra == null)
                {
                    _error.Add(new ErrorInfo("Fecha_Compra", "Se debe informar fecha de compra"));
                }

            }

            if (_error.Any())
            {
                throw new RulesException(_error);
            }

        }

        public IList<Tipo_Orden> GetTiposOrden()
        {
            return _repo.GetTiposOrden().ToList();
        }



        public Orden_Trabajo GetOrdenTrabajo(decimal id)
        {
            return _repo.GetOrdenTrabajoById(id);
        }




        public IList<Orden_Trabajo> GetOrdenesTrabajoByRut(decimal p)
        {
            return _repo.GetTodasLasOrdenDeTrabajo().Where(x => x.Id_Cliente == p).OrderBy(x=> x.Fecha_Ingreso).ToList();
        }


        public IList<Estado> GetEstadosOrden()
        {
            return _repo.GetEstadosOrden().ToList();
        }

        public IList<Orden_Trabajo> GetOrdenesTrabajo(DateTime Fecha_Inicio, DateTime Fecha_Final, string ListaTipos, string ListaEstados)
        {
            if (Fecha_Final == null || Fecha_Inicio == null)
            {
                throw new Exception("Se debe ingresar fecha inicio y final.");
            }


            if (Fecha_Final < Fecha_Inicio)
            {   
                throw new Exception("Fecha final debe ser mayor que fecha de inicio");
            }

            IQueryable<Orden_Trabajo> ordenes;
            if (string.IsNullOrEmpty(ListaTipos) || ListaTipos == "-1")
            {
                ordenes = from o in _repo.GetTodasLasOrdenDeTrabajo()
                          where o.Fecha_Ingreso >= Fecha_Inicio && o.Fecha_Ingreso <= Fecha_Final
                          select o;    
            }
            else
            {
                ordenes = from o in _repo.GetTodasLasOrdenDeTrabajo()
                          where o.Fecha_Ingreso >= Fecha_Inicio && o.Fecha_Ingreso <= Fecha_Final
                            && o.Tipo_Orden == decimal.Parse(ListaTipos)
                          select o;
            }

            if (string.IsNullOrEmpty(ListaEstados) || ListaEstados == "-1")
            {
                return ordenes.ToList();
            }
            else
            {
                var ord = from o in ordenes
                          where o.Detalles.OrderBy(x => x.Fecha_Creacion).FirstOrDefault().Estado == decimal.Parse(ListaEstados)
                          select o;
                return ord.ToList();                          
            }
        }

    }
}
