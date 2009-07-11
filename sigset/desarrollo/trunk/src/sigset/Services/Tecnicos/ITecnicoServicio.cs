using System;
using Data.Modelo;
namespace Services.Tecnicos
{
 public interface ITecnicoServicio
    {
       
        void EditarTecnico(Tecnico tecnico);
        void CrearTecnico(Tecnico tecnico);
        global::Data.Modelo.Tecnico GetTecnicoByRut(decimal rut);
        System.Collections.Generic.IList<global::Data.Modelo.Nivel> GetTodosLosNiveles();
        System.Collections.Generic.IList<global::Data.Modelo.Tecnico> GetTodosLosTecnicos();
        System.Collections.Generic.IList<global::Data.Modelo.Empleado> GetTodosLosTecnicosEmpleados();
        System.Collections.Generic.IList<global::Data.Modelo.Tipo_Especialidad> GetTodosLosTiposDeEspecialidad();
    }
}
