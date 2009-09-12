using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Repositorios.TipoCargo;
using Data.Modelo;
using System.Text.RegularExpressions;
using Services.Helpers;
using xVal.ServerSide;

namespace Services.TipoCargo
{
    public class TipoCargoServicio : Services.TipoCargo.ITipoCargoServicio
    {
        private ITipoCargoRepositorio _repo;

        public TipoCargoServicio(ITipoCargoRepositorio repo)
        {
            _repo = repo;
        }
        public TipoCargoServicio()
            : this(new TipoCargoRepositorio())
        {
        }

        public IList<Tipo_Cargo> GetTodosLosTiposCargo()
        {
            return _repo.GetTipoCargo().ToList();
        }
        public Tipo_Cargo GetTipoCargoById(int id)
        {
            var tipo_cargo = _repo.GetTipoCargoById(id);
            return tipo_cargo;
        }
        public Tipo_Cargo EditarTipoCargo(int id, Tipo_Cargo tipo)
        {
            if (tipo.Descripcion == "")
            {
                throw new RulesException("Descripcion", "Descripción es necesaria");
            }

            if (!tipo.Descripcion.SoloTexto())
            {
                throw new RulesException("Descripcion", "Descripción debe ingresar sólo letras");
            }
            var tipo_cargo = _repo.EditarTipoCargo(id, tipo);
            return tipo_cargo;
        }
        public void BorrarTipoCargo(int id)
        {
             var tipo_cargo = _repo.GetTipoCargoById(id);
             if (tipo_cargo == null)
             {
                 throw new RulesException("Tipo Cargo", "Tipo de cargo no encontrado.");
             }
             else  
             {
                 if (_repo.ContarEmpleadoSegunTipoCargo(tipo_cargo) > 0)
                 {
                     throw new RulesException("Tipo Cargo", "No se puede borrar el cargo por que tiene empleados asociados.");
                 }
                 else
                 {
                     _repo.BorrarTipoCargo(id);
                 }
                                  
             }

        }

        
        public void CrearTipoCargo(Tipo_Cargo tipoNuevo)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>();
            if (tipoNuevo.Id_Tipo_Cargo <= 0)
            {
                _errors.Add(new ErrorInfo("Id_Tipo_Cargo", "Id es necesario"));
            }
            if (tipoNuevo.Descripcion == "")
            {
                _errors.Add(new ErrorInfo("Descripcion", "Descripción es necesaria"));
            } 
            else if (!tipoNuevo.Descripcion.SoloTexto())
            {
                _errors.Add(new ErrorInfo("Descripcion", "Descripción debe ingresar sólo letras"));
            }
            DataValidation.GetErrors(tipoNuevo, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            else
            {
                int tipo = (int)tipoNuevo.Id_Tipo_Cargo;
                if (_repo.GetTipoCargoById(tipo) != null)
                {
                    throw new RulesException("Id Tipo Cargo", "Id ya Registrado.");
                }
                else
                {
                    _repo.GuardarNuevoTipoCargo(tipoNuevo);
                }
            }
        }
    }
}
