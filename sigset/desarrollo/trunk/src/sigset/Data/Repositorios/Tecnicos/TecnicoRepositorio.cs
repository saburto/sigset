using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;



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
              var tecnicos = from t in _data.Tecnicos
                             select t;
             return tecnicos;
        }

        public Tecnico GetTecnicoByRut(decimal rut)
        {
            var tecnico = (from t in _data.Tecnicos
                           where t.Rut == rut
                           select t).FirstOrDefault();
            return tecnico;
        }

        public IQueryable<Empleado> GetEmpleadosTecnicos()
        {
            var empleados_tecnicos = (from t in _data.Empleados
                                      where t.Tipo_Cargo1.Descripcion == "Tecnico"
                                      select t);
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

        public IQueryable<Tipo_Especialidad> GetTodosLosTiposEspecialidad()
        {

            var tipo_especialidad = from te in _data.Tipo_Especialidads
                                    select te;
            return tipo_especialidad;

        }

        public Tipo_Especialidad GetTipoEspecialidadById(decimal id)
        {
            var tipo_especialidad = (from te in _data.Tipo_Especialidads
                                    where te.Id_Tipo_Especialidad == id
                                    select te).FirstOrDefault();
            return tipo_especialidad;
        }
       
        public Nivel GetNivelById(decimal id)
        {
            var nivel = (from n in _data.Nivels
                         where n.Id_Nivel == id
                         select n).FirstOrDefault();
            return nivel;
        }
        public IQueryable<Especialidade> GetEspecialidadByTecnicoId(decimal id)
        {
            var especialidades = from e in _data.Especialidades
                                 where e.Id_Tecnico == id
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
          Tecnico tecnicoOriginal = GetTecnicoByRut(tecnico.Rut);
          tecnicoOriginal.Nivel = tecnico.Nivel;          
          _data.SubmitChanges();        
        }

        public void DeleteTecnico(Tecnico tecnico)
        {
            var tecnicoEliminar = (from te in _data.Tecnicos
                                   where te.Rut == tecnico.Rut
                                   select te).FirstOrDefault();                                 
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
            var especialidadEliminar = (from eb in _data.Especialidades
                                        where eb.Id_Tecnico == especialidad.Id_Tecnico
                                        select eb).FirstOrDefault();
            _data.Especialidades.DeleteOnSubmit(especialidadEliminar);
            _data.SubmitChanges();
        }

    }
}
