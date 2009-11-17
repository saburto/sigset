using System;
namespace Services.Tecnicos
{
    public interface ITecnicoServicio
    {
        int ContarEspecialidadesByTecnicos(int id);
        void CrearEspecialidad(global::Data.Modelo.Especialidade especialidad);
        void CrearTecnico(global::Data.Modelo.Tecnico tecnico);
        void EditarTecnico(global::Data.Modelo.Tecnico tecnico);
        void EliminarEspecialidad(decimal id);
        System.Linq.IQueryable<global::Data.Modelo.Especialidade> EspecialidadesByTecnico(decimal id);
        System.Collections.Generic.IList<global::Data.Modelo.TipoEspecialidad> GetEspecialidadesNoRepetidas(decimal id);
        global::Data.Modelo.Tecnico GetTecnicoByRut(decimal rut);
        System.Collections.Generic.IList<global::Data.Modelo.Nivel> GetTodosLosNiveles();
        System.Collections.Generic.IList<global::Data.Modelo.Tecnico> GetTodosLosTecnicos();
        System.Collections.Generic.IList<global::Data.Modelo.Usuario> GetTodosLosTecnicosEmpleados();
        System.Collections.Generic.IList<global::Data.Modelo.TipoEspecialidad> GetTodosLosTiposDeEspecialidad();

        void ModificarNivel(int idTecnico, int idNivel);

        global::Data.Modelo.Tecnico GetTecnicoById(int id);

        System.Collections.Generic.IList<global::Data.Modelo.TipoEspecialidad> GetTodasEspecialidades();

        void ModificarEspecialidades(int idTecnico, int[] especialidades);

        void ModificarTipoEspecialidad(string idTipoEspecialidad, string descripcion);
        void EliminarTipoEspecialidad(string idTipoEspecialidad);
    }
}
