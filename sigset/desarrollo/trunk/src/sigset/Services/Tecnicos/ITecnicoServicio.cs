using System;
namespace Services.Tecnicos
{
   public interface ITecnicoServicio
    {
        void EliminarEspecialidad(decimal id);
        void CrearEspecialidad(global::Data.Modelo.Especialidade especialidad);
        int ContarEspecialidadesByTecnicos(int id);
        void CrearTecnico(global::Data.Modelo.Tecnico tecnico);
        void EditarTecnico(global::Data.Modelo.Tecnico tecnico);
        System.Linq.IQueryable<global::Data.Modelo.Especialidade> EspecialidadesByTecnico(decimal id);
        global::Data.Modelo.Tecnico GetTecnicoByRut(decimal rut);
        System.Collections.Generic.IList<global::Data.Modelo.Tipo_Especialidad> GetEspecialidadesNoRepetidas(decimal id);
        System.Collections.Generic.IList<global::Data.Modelo.Nivel> GetTodosLosNiveles();
        System.Collections.Generic.IList<global::Data.Modelo.Tecnico> GetTodosLosTecnicos();
        System.Collections.Generic.IList<global::Data.Modelo.Empleado> GetTodosLosTecnicosEmpleados();
        System.Collections.Generic.IList<global::Data.Modelo.Tipo_Especialidad> GetTodosLosTiposDeEspecialidad();
    }
}
