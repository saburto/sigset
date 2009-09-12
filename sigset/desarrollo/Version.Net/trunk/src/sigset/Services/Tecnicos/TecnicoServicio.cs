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
                _errors.Add(new ErrorInfo("Rut", "Debe seleccionar empleado a registrar como técnico"));

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
        public void EditarTecnico(Tecnico tecnico)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>();
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
                _repo.UpdateTecnico(tecnico);
            }    
        }
        public int ContarEspecialidadesByTecnicos(int id)
        {
           return _repo.ContarEspecialidadesByTecnico(id);

        }

        public IQueryable<Especialidade> EspecialidadesByTecnico(decimal id)
        {
            return _repo.GetEspecialidadByTecnicoId(id);                         
        }

        public void CrearEspecialidad(Especialidade especialidad)
        {

            List<ErrorInfo> _errors = new List<ErrorInfo>();
            if (especialidad.Tipo_Especialidad == -1)
            {
                _errors.Add(new ErrorInfo("Nivel", "Debe seleccionar Tipo de Especialidad"));

            }
            DataValidation.GetErrors(especialidad, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            else
            {
                _repo.CrearEspecialidad(especialidad);
            }    
        }

        public IList<Tipo_Especialidad> GetEspecialidadesNoRepetidas(decimal id)
        {
            var especialidadesActuales = _repo.GetEspecialidadByTecnicoId(id);
            var especialidades = _repo.GetTodosLosTiposEspecialidad().ToList();
            IList<Tipo_Especialidad> especialidadFaltantes = new List<Tipo_Especialidad>();
          
            for (int i = 0; i < especialidades.Count; i++)
            {
                        especialidadFaltantes.Add(especialidades[i]);                        
            }

            foreach(var e in especialidadesActuales)
            {
                if (especialidadFaltantes.Where(x => x.Id_Tipo_Especialidad == e.Tipo_Especialidad).Any())
                {
                    especialidadFaltantes.Remove(especialidadFaltantes.Where(x => x.Id_Tipo_Especialidad == e.Tipo_Especialidad).FirstOrDefault());
                }
            }

            return especialidadFaltantes;
        }
        public void EliminarEspecialidad(decimal id)
        {
            Especialidade especialidad = _repo.GetEspecialidadById(id);
           _repo.DeleteEspecialidad(especialidad);       
        }

           
    }
}
