using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using Services.Helpers;
using xVal.ServerSide;
using Data.Repositorios.Tecnicos;

namespace Services.Tecnicos
{
    public class TecnicoServicio : Services.Tecnicos.ITecnicoServicio
    {
        private ITecnicoRepositorio _repo;
        public TecnicoServicio(ITecnicoRepositorio repo)
        {
            _repo = repo;
        }
        public TecnicoServicio() : this(new TecnicoRepositorio())
        { 
        }
        public Tecnico GetTecnicoByRut(decimal rut)
        {
            return _repo.GetTecnicoByRut(rut);
        }
        public IList<Empleado> GetTodosLosTecnicosEmpleados()
        {
            return _repo.GetEmpleadosTecnicos().ToList();
        }

        public IList<Tecnico> GetTodosLosTecnicos()
        {
            return _repo.GetTodosLosTecnicos().ToList();
        }
       
        public IList<Tipo_Especialidad> GetTodosLosTiposDeEspecialidad()
        {
            return _repo.GetTodosLosTiposEspecialidad().ToList();
        }
        public IList<Nivel> GetTodosLosNiveles()
        {
           return _repo.GetTodosLosNiveles().ToList();
        }

        public void CrearTecnico(Tecnico tecnico)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>();
            if (tecnico.Rut == -1)
            {
                _errors.Add(new ErrorInfo("Rut", "Debe seleccionar Empleado a registrar como tecnico"));

            }
            if (tecnico.Nivel == -1)
            {
                _errors.Add(new ErrorInfo("Nivel", "Debe seleccionar Nivel"));
           
            }
            DataValidation.GetErrors(tecnico, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            else
            {
                _repo.CreateTecnico(tecnico);
            }
                
                
               
        }
    }
}
