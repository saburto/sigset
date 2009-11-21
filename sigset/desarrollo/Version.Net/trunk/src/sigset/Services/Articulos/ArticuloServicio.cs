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

        public Articulo CrearArticulo(Articulo articulo, string Marca, string Linea)
        {
            IList<ErrorInfo> _error = new List<ErrorInfo>();
            ValidarArticulo(articulo, Marca, Linea, _error);
            if (_error.Any())
            {
                throw new RulesException(_error);
            }
            articulo.Marca = CrearMarca(Marca);
            if (!string.IsNullOrEmpty(Linea))
            {
                articulo.Linea = CrearLinea(Linea);    
            }
            

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


        private void ValidarArticulo(Articulo articulo,  string marca, string linea, IList<ErrorInfo> _error)
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



        public IList<Articulo> GetArticulos()
        {
            Data.Repositorios.RepoGenerico<Articulo> repositorio = new Data.Repositorios.RepoGenerico<Articulo>();
            return repositorio.GetAll().ToList();
        }


        #region IArticuloServicio Members


        public IList<Categoria> GetCategorias()
        {
            Data.Repositorios.RepoGenerico<Categoria> repositorio = new Data.Repositorios.RepoGenerico<Categoria>();
            return repositorio.GetAll().ToList();
        }

        #endregion

        #region IArticuloServicio Members


        public void EliminarCategoria(string IdCategoria)
        {
            var categoria = _rep.GetCategoria(decimal.Parse(IdCategoria)).FirstOrDefault();
            if (categoria == null || categoria.Articulos.Any())
            {
                throw new ArgumentException("No se puede borrar categoria que tiene asociado un articulo");
            }
            else
            {
                _rep.EliminarCategoria(categoria);
            }
            
        }

        public void ModificarCategoria(string idCategoria, string descripcion, string idTipoEspecialidad)
        {
            if (!string.IsNullOrEmpty(idCategoria))
            {

                var categoria = _rep.GetCategoria(decimal.Parse(idCategoria)).FirstOrDefault();
                if (categoria != null)
                {
                    categoria.Descripcion = descripcion;
                    categoria.IdTipoEspecialidad = decimal.Parse(idTipoEspecialidad);
                    _rep.ModificarCategoria(categoria);
                    return;
                }
            }
            _rep.CrearCategoria(descripcion, idTipoEspecialidad);

        }

        #endregion

        


        public void ModificarTipoArticulo(string IdTipoArticulo, string descripcion)
        {
            if (!string.IsNullOrEmpty(IdTipoArticulo))
            {

                var tipoArticulo = _rep.GetTipoArticulos(decimal.Parse(IdTipoArticulo)).FirstOrDefault();
                if (tipoArticulo != null)
                {
                    tipoArticulo.Descripcion = descripcion;
                    _rep.ModificarTipoArticulo(tipoArticulo);
                    return;
                }
            }
            _rep.CrearArticulo(descripcion);
        }

        public void EliminarTipoArticulo(string IdTipoArticulo)
        {
            var tipoArticulo = _rep.GetTipoArticulos(decimal.Parse(IdTipoArticulo)).FirstOrDefault();
            if (tipoArticulo == null || tipoArticulo.Articulos.Any())
            {
                throw new ArgumentException("No se puede borrar tipo articulo que tiene asociado un articulo");
            }
            else
            {
                _rep.EliminarTipoArticulo(tipoArticulo);
            }
        }

        public IList<TipoArticulo> GetTiposArticulos()
        {
            Data.Repositorios.RepoGenerico<TipoArticulo> repo = new Data.Repositorios.RepoGenerico<TipoArticulo>();
            return repo.GetAll().ToList();
        }

        
    }
}
