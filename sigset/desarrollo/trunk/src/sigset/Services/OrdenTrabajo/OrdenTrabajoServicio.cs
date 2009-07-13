using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using Data.Repositorios.OrdenTrabajoRepositorio;
using xVal.ServerSide;


namespace Services.OrdenTrabajo
{
    public class OrdenTrabajoServicio : Services.OrdenTrabajo.IOrdenTrabajoServicio
    {
        private IOrdenTrabajoRepositorio _repo;
        public OrdenTrabajoServicio(IOrdenTrabajoRepositorio repo)
        {
            _repo = repo;
        }
        public OrdenTrabajoServicio()
               : this(new OrdenTrabajoRepositorio())
        {
        }

        public decimal CrearOrdenTrabajo(Orden_Trabajo orden)
        {
            orden.Fecha_Ingreso = DateTime.Now;
            ValidarOrden(orden, null);
            Orden_Trabajo ot = _repo.GuardarOrdenTrabajo(orden);
            return ot.Id;
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
    }
}
