using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using Services.Helpers;
using xVal.ServerSide;
using Data.Repositorios.Tecnicos;
using Data.Modelo.Enums;

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

        public Tecnico GetTecnicoById(int id)
        {
            return _repo.GetTecnicoById(id);
        }

        public IList<Usuario> GetTodosLosTecnicosEmpleados()
        {
            return _repo.GetEmpleadosTecnicos().ToList();
        }

        public IList<Tecnico> GetTodosLosTecnicos()
        {
            return _repo.GetTodosLosTecnicos().ToList();
        }
       
        public IList<TipoEspecialidad> GetTodosLosTiposDeEspecialidad()
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
            if (tecnico.Id == -1)
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
            if (especialidad.TipoEspecialidad == -1)
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

        public IList<TipoEspecialidad> GetEspecialidadesNoRepetidas(decimal id)
        {
            var especialidadesActuales = _repo.GetEspecialidadByTecnicoId(id);
            var especialidades = _repo.GetTodosLosTiposEspecialidad().ToList();
            IList<TipoEspecialidad> especialidadFaltantes = new List<TipoEspecialidad>();
          
            for (int i = 0; i < especialidades.Count; i++)
            {
                        especialidadFaltantes.Add(especialidades[i]);                        
            }

            foreach(var e in especialidadesActuales)
            {
                if (especialidadFaltantes.Where(x => x.IdTipoEspecialidad == e.TipoEspecialidad).Any())
                {
                    especialidadFaltantes.Remove(especialidadFaltantes.Where(x => x.IdTipoEspecialidad == e.TipoEspecialidad).FirstOrDefault());
                }
            }

            return especialidadFaltantes;
        }
        public void EliminarEspecialidad(decimal id)
        {
            Especialidade especialidad = _repo.GetEspecialidadById(id);
           _repo.DeleteEspecialidad(especialidad);       
        }



        public void CrearTecnicoDefecto(int idUsuario)
        {
            if (GetTecnicoById(idUsuario) == null)
            {
                Tecnico nuevoTecnico = new Tecnico();
                nuevoTecnico.Id = idUsuario;
                nuevoTecnico.Nivel = (int)NivelesTecnicos.Basico;
                _repo.CreateTecnico(nuevoTecnico);
            }
        }

  


        public void ModificarNivel(int idTecnico, int idNivel)
        {
            var tecnico = _repo.GetTecnicoById(idTecnico);
            tecnico.Nivel = idNivel;
            _repo.UpdateTecnico(tecnico);
        }


        


        public IList<TipoEspecialidad> GetTodasEspecialidades()
        {
            return _repo.GetTodosLosTiposEspecialidad().ToList();
        }



        


        public void ModificarEspecialidades(int idTecnico, int[] especialidades)
        {
            List<ErrorInfo> errores = new List<ErrorInfo>();
            if (especialidades == null)
            {   
                errores.Add(new ErrorInfo("especialidades", "Especialdades no pueden ser null"));
                throw new RulesException(errores);
            }

            
            _repo.RemoverTodasLasEspcialidades(idTecnico);


            foreach (var espe in especialidades)
            {
                _repo.CrearEspecialidad(new Especialidade() { IdTecnico= idTecnico, TipoEspecialidad= espe });
            }

        }



      


        public void ModificarTipoEspecialidad(string idTipoEspecialidad, string descripcion)
        {
            if (string.IsNullOrEmpty(descripcion))
            {
                throw new RulesException("_FORM", "Descripción no puede ser un elemento vacio");
            }


            decimal id;
            if (!string.IsNullOrEmpty(idTipoEspecialidad) && decimal.TryParse(idTipoEspecialidad, out id))
            {
               var tipo = _repo.GetTipoEspecialidadById(id);
               if (tipo != null)
               {
                   tipo.Descripcion = descripcion.Trim();
                   _repo.UpdateTipoEspecialidad(tipo);
               }
            }
            else
            {
                _repo.CreateTipoEspecialdad(descripcion);
            }
        }

        public void EliminarTipoEspecialidad(string idTipoEspecialidad)
        {
            decimal id;
            if (decimal.TryParse(idTipoEspecialidad, out id))
            {
                var tipo = _repo.GetTipoEspecialidadById(id);
                if (tipo.Especialidades.Any() || tipo.Categorias.Any())
                {
                    throw new ArgumentException("No se puede eliminar tipo especialidad asociadad a una categoria o un tecnico");
                }
                else
                {
                    _repo.DeleteTipoEspecialidad(tipo);
                }
            }

        }
      
    }
}
