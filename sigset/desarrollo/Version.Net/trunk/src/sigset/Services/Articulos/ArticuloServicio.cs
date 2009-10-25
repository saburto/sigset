using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using Data.Repositorios.Articulo;
using xVal.ServerSide;

namespace Services.Articulos
{
    public class ArticuloServicio : Services.Articulos.IArticuloServicio
    {
        IArticuloRepositorio _rep;
        public ArticuloServicio(IArticuloRepositorio rep)
        {
            _rep = rep;
        }

        public ArticuloServicio()
            :this(new ArticuloRepositorio())
        {

        }

        public IList<Marca> GetMarcas(string nombre)
        {
            return _rep.GetMarcas(nombre).ToList(); ;
        }



        public IList<TipoArticulo> GetTipoArticulos(string nombre)
        {
            return _rep.GetTipoArticulos(nombre).ToList();
        }


        public IList<Categoria> GetCategoria(string q)
        {
            return _rep.GetCategoria(q).ToList();
        }


        public IList<PrecioGarantia> GetPrecios()
        {
            return _rep.GetPrecios().ToList();
        }


        public IList<Linea> GetLineas(string q)
        {
            return _rep.GetLineas(q).ToList();
        }

        private decimal CrearMarca(string marca)
        {
            Marca m = _rep.GetMarcasPorNombre(marca);
            if (m == null)
            {
               m = _rep.CrearMarca(marca);
            }
            return m.IdMarca;
        }

        private decimal CrearLinea(string linea)
        {
            Linea l = _rep.GetLineaPorNombre(linea);
            if (l == null)
            {
                l = _rep.CrearLinea(linea);
            }
            return l.IdLinea;
        }

        public Articulo CrearArticulo(Articulo articulo, string Lista_PrecioGarantia, string Marca, string Linea)
        {
            IList<ErrorInfo> _error = new List<ErrorInfo>();
            ValidarArticulo(articulo, Lista_PrecioGarantia, Marca, Linea, _error);
            if (_error.Any())
            {
                throw new RulesException(_error);
            }
            articulo.Marca = CrearMarca(Marca);
            if (!string.IsNullOrEmpty(Linea))
            {
                articulo.Linea = CrearLinea(Linea);    
            }
            articulo.PrecioGarantia = decimal.Parse(Lista_PrecioGarantia);

            NoRepetidoModeloMarca(articulo,Marca);
            return _rep.CrearArticulo(articulo);
        }


        private bool NoRepetidoModeloMarca(Articulo articulo, string marca)
        {
            Articulo a = _rep.GetArticuloPorModeloMarca(articulo.Modelo, marca);
            if (a != null)
            {
                throw new Exception("Ya existe modelo para esta marca.");
            }
            return true;
        }


        private void ValidarArticulo(Articulo articulo, string precio, string marca, string linea, IList<ErrorInfo> _error)
        {
            if (articulo == null)
            {
                _error.Add(new ErrorInfo("_FORM", "Articulo invalidoS"));
            }

            if (string.IsNullOrEmpty(articulo.Modelo))
            {
                _error.Add(new ErrorInfo("Modelo", "Modelo es necesario."));
            }

            if (articulo.TipoArticulo == 0)
            {
                _error.Add(new ErrorInfo("TipoArticulo", "Tipo Articulo es necesario."));
            }
            else
            {
                var tipo = _rep.GetTipoArticulos(articulo.TipoArticulo);
                if (tipo == null)
                {
                    _error.Add(new ErrorInfo("TipoArticulo", "Tipo Articulo invalido"));
                }

            }

            if (articulo.Categoria == 0)
            {
                _error.Add(new ErrorInfo("Categoria", "Tipo Articulo es necesario."));
            }
            else
            {
                var c = _rep.GetCategoria(articulo.Categoria);
                if (c == null)
                {
                    _error.Add(new ErrorInfo("Categoria", "Categoria invalida"));
                }
            }

            decimal garantia_precio;
            if (!decimal.TryParse(precio,out garantia_precio))
            {
                _error.Add(new ErrorInfo("PrecioGarantia","Precio invalido"));
            }

            if (string.IsNullOrEmpty(marca))
            {
                _error.Add(new ErrorInfo("Marca", "Marca es necesaria."));
            }

        }



        public Articulo GetArticulo(decimal id)
        {
           return _rep.GetArticulo(id);
        }


        public Articulo GetArticuloPorModelo(string Modelo)
        {
           return _rep.GetArticuloPorModelo(Modelo);
        }



        public Articulo GetArticuloPorModeloMarca(string Modelo, string Marca)
        {
            return _rep.GetArticuloPorModeloMarca(Modelo, Marca);
        }

    }
}
