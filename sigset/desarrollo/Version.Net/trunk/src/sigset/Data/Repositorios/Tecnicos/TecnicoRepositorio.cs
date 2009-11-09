using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using Data.Modelo.Enums;



namespace Data.Repositorios.Tecnicos
{
    public class TecnicoRepositorio : Data.Repositorios.Tecnicos.ITecnicoRepositorio
    {
        sigsetEntities _data;
        public TecnicoRepositorio()
        {
            _data = new sigsetEntities();
        }

        public IQueryable<Tecnico> GetTodosLosTecnicos()
        { 
              var tecnicos = from t in _data.Usuarios
                             where t.PerfilUsuario == (int)PerfilUsuarios.Tecnico 
                             select t.Tecnico;
             return tecnicos;
        }

        public Tecnico GetTecnicoByRut(decimal rut)
        {
            var tecnico = _data.Usuarios.Where(x => x.PerfilUsuario == (int)PerfilUsuarios.Tecnico && x.Rut == rut).Select(x => x.Tecnico).FirstOrDefault();
            return tecnico;
        }

        public IQueryable<Usuario> GetEmpleadosTecnicos()
        {
            var empleados_tecnicos = _data.Usuarios.Where(x => x.PerfilUsuario == (int)PerfilUsuarios.Tecnico);
            return empleados_tecnicos;
        }

       


        public IQueryable<Nivel> GetTodosLosNiveles()
        {
            var niveles = from n in _data.Nivels
                           select n;
            return niveles;
        }

        public IQueryable<Especialidade> GetTodasLasEspecialidades()
        {
            var especialidades = from e in _data.Especialidades
                                 select e;
            return especialidades;
        }

        public IQueryable<TipoEspecialidad> GetTodosLosTiposEspecialidad()
        {

            var TipoEspecialidad = from te in _data.TipoEspecialidads
                                    select te;
            return TipoEspecialidad;

        }

        public TipoEspecialidad GetTipoEspecialidadById(decimal id)
        {
            var TipoEspecialidad = (from te in _data.TipoEspecialidads
                                    where te.IdTipoEspecialidad == id
                                    select te).FirstOrDefault();
            return TipoEspecialidad;
        }
       
        public Nivel GetNivelById(decimal id)
        {
            var nivel = (from n in _data.Nivels
                         where n.IdNivel == id
                         select n).FirstOrDefault();
            return nivel;
        }
        public IQueryable<Especialidade> GetEspecialidadByTecnicoId(decimal id)
        {
            var especialidades = from e in _data.Especialidades
                                 where e.IdTecnico == id
                                 select e;
            return especialidades;
        }

     
        public void CreateTecnico(Tecnico tecnico)
        {
            _data.Tecnicos.InsertOnSubmit(tecnico);
            _data.SubmitChanges();
        }

        public void UpdateTecnico(Tecnico tecnico)
        { 
          Tecnico tecnicoOriginal = GetTecnicoById(tecnico.Id);
          tecnicoOriginal.Nivel = tecnico.Nivel;          
          _data.SubmitChanges();        
        }

        public Tecnico GetTecnicoById(int id)
        {
            return _data.Tecnicos.Where(x => x.Id == id).FirstOrDefault();
        }

        public void DeleteTecnico(Tecnico tecnico)
        {
            var tecnicoEliminar = GetTecnicoById(tecnico.Id);
            _data.Tecnicos.DeleteOnSubmit(tecnicoEliminar);
            _data.SubmitChanges();
        }
        public void CrearEspecialidad(Especialidade especialidad)
        {
            _data.Especialidades.InsertOnSubmit(especialidad);
            _data.SubmitChanges();        
        }
        public void DeleteEspecialidad(Especialidade especialidad)
        {

            _data.Especialidades.DeleteOnSubmit(especialidad);
            _data.SubmitChanges();
        }
        public int ContarEspecialidadesByTecnico(decimal id)
        {
            int cantidad_especialidades = (from et in _data.Especialidades
                                           where et.IdTecnico == id
                                           select et).Count();
            return cantidad_especialidades;

        }

        public Especialidade GetEspecialidadById(decimal id)
        {
            var especialidad = (from e in _data.Especialidades
                               where e.Id == id
                               select e).FirstOrDefault();
            return especialidad;       
        }


        


        public void RemoverTodasLasEspcialidades(int idTecnico)
        {
            var especialidades = _data.Especialidades.Where(x => x.IdTecnico == idTecnico);
            _data.Especialidades.DeleteAllOnSubmit(especialidades);
            _data.SubmitChanges();
        }

        
    }
}
