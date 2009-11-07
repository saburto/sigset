using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;

namespace Data.Repositorios.Configuraciones
{
    public class ConfiguracionRepositorio
    {
        private sigsetEntities _ent;
        public ConfiguracionRepositorio()
        {
            _ent = new sigsetEntities();
        }

        public IQueryable<Configuracion> GetConfiguraciones()
        {
            return _ent.Configuracions;
        }

        public Configuracion GetConfiguracion(int id)
        {
            return _ent.Configuracions.Where(x => x.Id == id).FirstOrDefault();
        }

        public void ModificarConfiguracion(int id, string valor)
        {
            var config = GetConfiguracion(id);
            config.Valor = valor;
            _ent.SubmitChanges();
        }
    }
}
