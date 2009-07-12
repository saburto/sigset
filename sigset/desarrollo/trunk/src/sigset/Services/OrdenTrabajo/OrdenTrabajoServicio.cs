using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using Data.Repositorios.OrdenTrabajoRepositorio;


namespace Services.OrdenTrabajo
{
    public class OrdenTrabajoServicio
    {
        private IOrdenTrabajoRepositorio _repo;
        public OrdenTrabajoServicio(IOrdenTrabajoRepositorio repo)
        {
            _repo = repo;
        }
        public OrdenTrabajoServicio()
               : this(new OrdenTrabajoRepositorio())
        {
        }

    }
}
