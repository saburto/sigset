using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;

namespace Data.Repositorios.Articulo
{
    public class ArticuloRepositorio : Data.Repositorios.Articulo.IArticuloRepositorio
    {
        sigsetEntities _ent;
        public ArticuloRepositorio()
        {
            _ent = new sigsetEntities();
        }

        public IQueryable<Marca> GetMarcas(string nombre)
        {
            var marcas = from m in _ent.Marcas
                         where m.Descripcion.StartsWith(nombre)
                         select m;
            return marcas;
        }

        public IQueryable<TipoArticulo> GetTipoArticulos(string nombre)
        {
            var tipos = from a in _ent.TipoArticulos
                        where a.Descripcion.StartsWith(nombre)
                        select a;
            return tipos;
        }


        public IQueryable<Categoria> GetCategoria(string q)
        {
            var cetegorias = from a in _ent.Categorias
                             where a.Descripcion.StartsWith(q)
                             select a;
            return cetegorias;
        }


        public IQueryable<PrecioGarantia> GetPrecios()
        {
            return _ent.PrecioGarantias;
        }



        public IQueryable<Linea> GetLineas(string q)
        {
            return from l in _ent.Lineas
                   where l.Descripcion.StartsWith(q)
                    select l;
        }

        public IQueryable<Categoria> GetCategoria(decimal p)
        {
            return from c in _ent.Categorias
                   where c.IdCategoria == p
                   select c;
        }



        public IQueryable<TipoArticulo> GetTipoArticulos(decimal p)
        {
            return from t in _ent.TipoArticulos
                   where t.IdTipoArticulo == p
                   select t;
        }

        
        public Marca GetMarcasPorNombre(string marca)
        {
            marca = marca.Trim();
            return (from m in _ent.Marcas
                   where m.Descripcion.ToLower() == marca.ToLower()
                    select m).FirstOrDefault();
        }

        public Marca CrearMarca(string marca)
        {
            marca = marca.Trim();
            Marca m = new Marca();
            m.Descripcion = marca;
            m.IdMarca = _ent.Marcas.Count() + 1;

            _ent.Marcas.InsertOnSubmit(m);
            _ent.SubmitChanges();
            return m;
        }


        #region IArticuloRepositorio Members


        public Linea GetLineaPorNombre(string linea)
        {
            linea = linea.Trim();
            return (from l in _ent.Lineas
                   where l.Descripcion.ToLower() == linea.ToLower()
                   select l).FirstOrDefault();
        }

        public Linea CrearLinea(string linea)
        {
            linea = linea.Trim();
            Linea l = new Linea();
            l.Descripcion = linea;
            l.IdLinea = _ent.Lineas.Count() + 1;
            _ent.Lineas.InsertOnSubmit(l);
            _ent.SubmitChanges();
            return l;
        }

        #endregion



        public Data.Modelo.Articulo CrearArticulo(Data.Modelo.Articulo articulo)
        {
            _ent.Articulos.InsertOnSubmit(articulo);
            _ent.SubmitChanges();
            return articulo;
        }

        public Data.Modelo.Articulo GetArticulo(decimal id)
        {
            return (from a in _ent.Articulos
                   where a.Id == id
                   select a).FirstOrDefault();
        }




        public Data.Modelo.Articulo GetArticuloPorModeloMarca(string modelo, string marca)
        {
            marca = marca.Trim();
            return (from a in _ent.Articulos
                   where a.Modelo == modelo && a.Marca1.Descripcion == marca
                    select a).FirstOrDefault() ;
        }



        public Data.Modelo.Articulo GetArticuloPorModelo(string Modelo)
        {
            return (from a in _ent.Articulos
                   where a.Modelo == Modelo
                   select a).FirstOrDefault();
        }

    }
}
