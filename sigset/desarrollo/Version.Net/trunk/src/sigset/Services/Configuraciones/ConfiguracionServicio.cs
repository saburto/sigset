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

        public bool? GetMostrarLogo()
        {
            var nomnbre = repo.GetConfiguracion(10);
            if (nomnbre != null && !string.IsNullOrEmpty(nomnbre.Valor))
            {
                return nomnbre.Valor.Contains("true");
            }
            else
            {
                return false;
            }
        }

        internal string GetDireccionEmpresa()
        {
            var nomnbre = repo.GetConfiguracion(22);
            return nomnbre.Valor;
        }

        internal string GetTelefonoEmpresa()
        {
            var nomnbre = repo.GetConfiguracion(2);
            return nomnbre.Valor;
        }
    }

    public static class Configuracion
    {
        static string _nombreEmpresa;
        static string _direccionEmpresa;
        static string _telefonoEmpresa;
        static bool? _asignacionAutHabilitada = null;
        static int? _maxOrdenesAsignadas = null;
        static int? _maxOrdenesRevision = null;
        static int? _maxOrdenesEnReparacion = null;
        static bool? _asignacionPorNivel = null;
        static bool? _asignacionMasDesocupado = null;
        static bool? _asginacionSoloEspecialista = null;
        static bool? _mostrarLogo = null;

        internal static bool _modificada;

        public static bool EsConfiguracionNumerico(int id)
        {
            return id == 4 || id == 5 || id == 6;
        }

        public static bool EsConfiguracionBoolean(int id)
        {
            return id == 3 || id == 7 || id == 8 || id == 9 || id == 10;
        }


        public static string NombreEmpresa
        {
            get
            {
                if (string.IsNullOrEmpty(_nombreEmpresa) || _modificada)
                {
                    LoadConfiguraciones();
                }
                return _nombreEmpresa;
            }
        }

        public static string DireccionEmpresa { 
        get
        {
            if (string.IsNullOrEmpty(_direccionEmpresa) || _modificada )
            {
                LoadConfiguraciones();
            }
            return _direccionEmpresa;
        }

        }

        public static string TelefonoEmpresa
        {
            get
            {
                if (string.IsNullOrEmpty(_telefonoEmpresa) || _modificada)
                {
                    LoadConfiguraciones();
                }
                return _telefonoEmpresa;
            }

        }


        public static bool AsignacionAutHabilitada
        {
            get
            {
                if (!_asignacionAutHabilitada.HasValue || _modificada)
                {
                    LoadConfiguraciones();
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
                    LoadConfiguraciones();
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
                    LoadConfiguraciones();
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
                    LoadConfiguraciones();
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
                    LoadConfiguraciones();
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
                    LoadConfiguraciones();
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
                    LoadConfiguraciones();
                }
                return _asignacionMasDesocupado.Value;
            }
        }

        public static bool MostrarLogo
        {
            get
            {
                if (!_mostrarLogo.HasValue || _modificada)
                {
                    LoadConfiguraciones();
                }
                return _mostrarLogo.Value;
            }
        }

        private static void LoadConfiguraciones()
        {
            ConfiguracionServicio serv = new ConfiguracionServicio();
            _mostrarLogo = serv.GetMostrarLogo();
            _asignacionMasDesocupado = serv.GetAsignacionMasDesocupado();
            _asignacionPorNivel = serv.GetAsignacionPorNivel();
            _maxOrdenesAsignadas = serv.GetMaxOrdenesAsignadas();
            _maxOrdenesEnReparacion = serv.GetMaxOrdenesEnReparacion();
            _maxOrdenesRevision = serv.GetMaxOrdenesEnRevision();
            _asginacionSoloEspecialista = serv.GetAsignacionSoloEspecialista();
            _nombreEmpresa = serv.GetNombreEmpresa();
            _asignacionAutHabilitada = serv.GetAsignacionHabilitada();
            _direccionEmpresa = serv.GetDireccionEmpresa();
            _telefonoEmpresa = serv.GetTelefonoEmpresa();

            _modificada = false;
        }
            
    }
}
