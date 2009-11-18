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

        public bool? GetAsignacionHabilitada()
        {
            var nomnbre = repo.GetConfiguracion(3);
            if (nomnbre != null && !string.IsNullOrEmpty(nomnbre.Valor))
            {
                return nomnbre.Valor.Contains("true");
            }
            else
            {
                return false;
            }
        }

        public int? GetMaxOrdenesAsignadas()
        {
            var config = repo.GetConfiguracion(4);
            int valor;
            if (config != null)
            {
                if (int.TryParse(config.Valor, out valor))
                {
                    return valor;
                }
            }
            return 999;

        }

        public int? GetMaxOrdenesEnRevision()
        {
            var config = repo.GetConfiguracion(5);
            int valor;
            if (config != null)
            {
                if (int.TryParse(config.Valor, out valor))
                {
                    return valor;
                }
            }
            return 999;

        }

        public int? GetMaxOrdenesEnReparacion()
        {
            var config = repo.GetConfiguracion(6);
            int valor;
            if (config != null)
            {
                if (int.TryParse(config.Valor, out valor))
                {
                    return valor;
                }
            }
            return 999;
        }

        public bool? GetAsignacionPorNivel()
        {
            var nomnbre = repo.GetConfiguracion(7);
            if (nomnbre != null && !string.IsNullOrEmpty(nomnbre.Valor))
            {
                return nomnbre.Valor.Contains("true");
            }
            else
            {
                return false;
            }
        }

     

        public bool? GetAsignacionMasDesocupado()
        {
            var nomnbre = repo.GetConfiguracion(9);
            if (nomnbre != null && !string.IsNullOrEmpty(nomnbre.Valor))
            {
                return nomnbre.Valor.Contains("true");
            }
            else
            {
                return false;
            }
        }



        public bool? GetAsignacionSoloEspecialista()
        {
            var nomnbre = repo.GetConfiguracion(8);
            if (nomnbre != null && !string.IsNullOrEmpty(nomnbre.Valor))
            {
                return nomnbre.Valor.Contains("true");
            }
            else
            {
                return false;
            }
        }
    }

    public static class Configuracion
    {
        static string _nombreEmpresa;
        static bool? _asignacionAutHabilitada = null;
        static int? _maxOrdenesAsignadas = null;
        static int? _maxOrdenesRevision = null;
        static int? _maxOrdenesEnReparacion = null;
        static bool? _asignacionPorNivel = null;
        static bool? _asignacionMasDesocupado = null;
        static bool? _asginacionSoloEspecialista = null;
        internal static bool _modificada;

        public static bool EsConfiguracionNumerico(int id)
        {
            return id == 4 || id == 5 || id == 6;
        }

        public static bool EsConfiguracionBoolean(int id)
        {
            return id == 3 || id == 7 || id == 8 || id == 9;
        }


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

        }

        public static bool AsignacionAutHabilitada
        {
            get
            {
                if (!_asignacionAutHabilitada.HasValue || _modificada)
                {
                    ConfiguracionServicio serv = new ConfiguracionServicio();
                    _asignacionAutHabilitada = serv.GetAsignacionHabilitada();
                    _modificada = false;
                }
                return _asignacionAutHabilitada.Value;
            }
        }

        public static bool AsignacionSoloEspecialista
        {
            get
            {
                if (!_asginacionSoloEspecialista.HasValue || _modificada)
                {
                    ConfiguracionServicio serv = new ConfiguracionServicio();
                    _asginacionSoloEspecialista = serv.GetAsignacionSoloEspecialista();
                    _modificada = false;
                }
                return _asginacionSoloEspecialista.Value;
            }
        }

        public static int MaxOrdenesAsignadas
        {
            get
            {
                if (!_maxOrdenesAsignadas.HasValue || _modificada)
                {
                    ConfiguracionServicio serv = new ConfiguracionServicio();
                    _maxOrdenesAsignadas = serv.GetMaxOrdenesAsignadas();
                    _modificada = false;
                }
                return _maxOrdenesAsignadas.Value;
            }
        }

        public static int MaxOrdenesEnReparacion
        {
            get
            {
                if (!_maxOrdenesEnReparacion.HasValue || _modificada)
                {
                    ConfiguracionServicio serv = new ConfiguracionServicio();
                    _maxOrdenesEnReparacion = serv.GetMaxOrdenesEnReparacion();
                    _modificada = false;
                }
                return _maxOrdenesEnReparacion.Value;
            }
        }

        public static int MaxOrdenesEnRevision
        {
            get
            {
                if (!_maxOrdenesRevision.HasValue || _modificada)
                {
                    ConfiguracionServicio serv = new ConfiguracionServicio();
                    _maxOrdenesRevision = serv.GetMaxOrdenesEnRevision();
                    _modificada = false;
                }
                return _maxOrdenesRevision.Value;
            }
        }

        public static bool AsignacionPorNivel
        {
            get
            {
                if (!_asignacionPorNivel.HasValue || _modificada)
                {
                    ConfiguracionServicio serv = new ConfiguracionServicio();
                    _asignacionPorNivel = serv.GetAsignacionPorNivel();
                    _modificada = false;
                }
                return _asignacionPorNivel.Value;
            }
        }

        public static bool AsignacionMasDesocupado
        {
            get
            {
                if (!_asignacionMasDesocupado.HasValue || _modificada)
                {
                    ConfiguracionServicio serv = new ConfiguracionServicio();
                    _asignacionMasDesocupado = serv.GetAsignacionMasDesocupado();
                    _modificada = false;
                }
                return _asignacionMasDesocupado.Value;
            }
        }
            
    }
}
