using System;
namespace Data.Repositorios.Tecnicos
{
    public interface ITecnicoRepositorio
    {
        void CrearEspecialidad(global::Data.Modelo.Especialidade especialidad);
        int ContarEspecialidadesByTecnico(decimal id);
        void CreateTecnico(global::Data.Modelo.Tecnico tecnico);
        void DeleteEspecialidad(global::Data.Modelo.Especialidade especialidad);
        void DeleteTecnico(global::Data.Modelo.Tecnico tecnico);
        System.Linq.IQueryable<global::Data.Modelo.Empleado> GetEmpleadosTecnicos();
        System.Linq.IQueryable<global::Data.Modelo.Especialidade> GetEspecialidadByTecnicoId(decimal id);
        global::Data.Modelo.Nivel GetNivelById(decimal id);
        global::Data.Modelo.Tecnico GetTecnicoByRut(decimal rut);
        global::Data.Modelo.Tipo_Especialidad GetTipoEspecialidadById(decimal id);
        System.Linq.IQueryable<global::Data.Modelo.Especialidade> GetTodasLasEspecialidades();
        System.Linq.IQueryable<global::Data.Modelo.Nivel> GetTodosLosNiveles();
        System.Linq.IQueryable<global::Data.Modelo.Tecnico> GetTodosLosTecnicos();
        System.Linq.IQueryable<global::Data.Modelo.Tipo_Especialidad> GetTodosLosTiposEspecialidad();
        void UpdateTecnico(global::Data.Modelo.Tecnico tecnico);
    }
}
