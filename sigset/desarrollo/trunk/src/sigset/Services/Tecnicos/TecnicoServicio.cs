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
    }
}
