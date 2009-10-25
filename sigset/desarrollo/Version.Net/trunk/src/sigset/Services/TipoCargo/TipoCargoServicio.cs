using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using System.Text.RegularExpressions;
using Services.Helpers;
using xVal.ServerSide;
using Data.Repositorios.Perfiles;

namespace Services.TipoCargo
{
    public class TipoCargoServicio : Services.TipoCargo.ITipoCargoServicio 
    {
        private IPerfilRepositorio _repo;

        public TipoCargoServicio(IPerfilRepositorio repo)
        {
            _repo = repo;
        }
        public TipoCargoServicio()
            : this(new PerfilRepositorio())
        {
        }

        public IList<Perfil> GetTodosLosTiposCargo()
        {
            return _repo.GetPerfil().ToList();
        }
        public Perfil GetTipoCargoById(int id)
        {
            var Perfil = _repo.GetPerfilById(id);
            return Perfil;
        }
        public Perfil EditarTipoCargo(int id, Perfil tipo)
        {
            if (tipo.Descripcion == "")
            {
                throw new RulesException("Descripcion", "Descripción es necesaria");
            }

            if (!tipo.Descripcion.SoloTexto())
            {
                throw new RulesException("Descripcion", "Descripción debe ingresar sólo letras");
            }
            var Perfil = _repo.EditarTipoCargo(id, tipo);
            return Perfil;
        }
        public void BorrarTipoCargo(int id)
        {
             var Perfil = _repo.GetPerfilById(id);
             if (Perfil == null)
             {
                 throw new RulesException("Tipo Cargo", "Tipo de cargo no encontrado.");
             }
             else  
             {
                 if (_repo.ContarEmpleadoSegunTipoCargo(Perfil) > 0)
                 {
                     throw new RulesException("Tipo Cargo", "No se puede borrar el cargo por que tiene empleados asociados.");
                 }
                 else
                 {
                     _repo.BorrarTipoCargo(id);
                 }
                                  
             }

        }

        
        public void CrearTipoCargo(Perfil tipoNuevo)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>();
            if (tipoNuevo.Id <= 0)
            {
                _errors.Add(new ErrorInfo("Id_Perfil", "Id es necesario"));
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
                int tipo = (int)tipoNuevo.Id;
                if (_repo.GetPerfilById(tipo) != null)
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
