using System;
namespace Services.Tecnicos
{
 public interface ITecnicoServicio
    {
        global::Data.Modelo.Tecnico GetTecnicoByRut(decimal rut);
        System.Collections.Generic.IList<global::Data.Modelo.Nivel> GetTodosLosNiveles();
        System.Collections.Generic.IList<global::Data.Modelo.Tecnico> GetTodosLosTecnicos();
        System.Collections.Generic.IList<global::Data.Modelo.Empleado> GetTodosLosTecnicosEmpleados();
        System.Collections.Generic.IList<global::Data.Modelo.Tipo_Especialidad> GetTodosLosTiposDeEspecialidad();
    }
}
