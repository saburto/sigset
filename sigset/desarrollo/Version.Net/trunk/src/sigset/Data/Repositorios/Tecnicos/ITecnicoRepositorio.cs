using System;
namespace Data.Repositorios.Tecnicos
{
    interface ITecnicoRepositorio
    {
        int ContarEspecialidadesByTecnico(decimal id);
        void CrearEspecialidad(global::Data.Modelo.Especialidade especialidad);
        void CreateTecnico(global::Data.Modelo.Tecnico tecnico);
        void DeleteEspecialidad(global::Data.Modelo.Especialidade especialidad);
        void DeleteTecnico(global::Data.Modelo.Tecnico tecnico);
        System.Linq.IQueryable<global::Data.Modelo.Usuario> GetEmpleadosTecnicos();
        global::Data.Modelo.Especialidade GetEspecialidadById(decimal id);
        System.Linq.IQueryable<global::Data.Modelo.Especialidade> GetEspecialidadByTecnicoId(decimal id);
        global::Data.Modelo.Nivel GetNivelById(decimal id);
        global::Data.Modelo.Tecnico GetTecnicoById(int id);
        global::Data.Modelo.Tecnico GetTecnicoByRut(decimal rut);
        global::Data.Modelo.TipoEspecialidad GetTipoEspecialidadById(decimal id);
        System.Linq.IQueryable<global::Data.Modelo.Especialidade> GetTodasLasEspecialidades();
        System.Linq.IQueryable<global::Data.Modelo.Nivel> GetTodosLosNiveles();
        System.Linq.IQueryable<global::Data.Modelo.Tecnico> GetTodosLosTecnicos();
        System.Linq.IQueryable<global::Data.Modelo.TipoEspecialidad> GetTodosLosTiposEspecialidad();
        void UpdateTecnico(global::Data.Modelo.Tecnico tecnico);
    }
}
