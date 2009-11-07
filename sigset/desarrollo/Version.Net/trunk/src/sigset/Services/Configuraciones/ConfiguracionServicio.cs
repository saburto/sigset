using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Repositorios.Configuraciones;

namespace Services.Configuraciones
{
    public class ConfiguracionServicio
    {
        ConfiguracionRepositorio repo;
        public ConfiguracionServicio()
        {
            repo = new ConfiguracionRepositorio();
        }

        public string GetNombreEmpresa()
        {
            var nomnbre = repo.GetConfiguracion(1);
            return nomnbre.Valor;
        }

        public string SetNombreEmpresa(string nombre)
        {
            if (string.IsNullOrEmpty(nombre))
            {
                throw new xVal.ServerSide.RulesException("_FORM", "Nombre de empresa no puede estar vacio");
            }

            nombre = nombre.Trim();
            repo.ModificarConfiguracion(1, nombre);
            return nombre;
        }

        public void ModificarConfiguracion(int id,string valor)
        {
            if (string.IsNullOrEmpty(valor))
            {
                throw new xVal.ServerSide.RulesException("_FORM", "Valor de configuracion no puede estar vacio");
            }

            valor = valor.Trim();
            repo.ModificarConfiguracion(id, valor);
            Configuracion._modificada = true;
        }

        public List<Data.Modelo.Configuracion> GetConfiguraciones()
        {
            return repo.GetConfiguraciones().ToList();
        }
    }

    public static class Configuracion
    {
        static string _nombreEmpresa;
        internal static bool _modificada;
        public static string NombreEmpresa { 
        get
        {
            if (string.IsNullOrEmpty(_nombreEmpresa) || _modificada )
            {
                ConfiguracionServicio serv = new ConfiguracionServicio();
                _nombreEmpresa = serv.GetNombreEmpresa();
                _modificada = false;
            }
            return _nombreEmpresa;
        }
            set
            {
                ConfiguracionServicio serv = new ConfiguracionServicio();
                _nombreEmpresa = serv.SetNombreEmpresa(value);
            }
        }
            
    }
}
