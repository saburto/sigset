using System;
using System.Linq;
using Data.Modelo;
namespace Data.Repositorios.Articulo
{
    public interface IArticuloRepositorio
    {
        System.Linq.IQueryable<global::Data.Modelo.Marca> GetMarcas(string nombre);
        IQueryable<Tipo_Articulo> GetTipoArticulos(string nombre);

        IQueryable<Categoria> GetCategoria(string q);

        IQueryable<Precio_Garantia> GetPrecios();

        IQueryable<Linea> GetLineas(string q);

        IQueryable<Categoria> GetCategoria(decimal p);

        IQueryable<Tipo_Articulo> GetTipoArticulos(decimal p);

        Marca GetMarcasPorNombre(string marca);

        Marca CrearMarca(string marca);

        Linea GetLineaPorNombre(string linea);

        Linea CrearLinea(string linea);

        Data.Modelo.Articulo CrearArticulo(Data.Modelo.Articulo articulo);

        Data.Modelo.Articulo GetArticulo(decimal id);

        Data.Modelo.Articulo GetArticuloPorModeloMarca(string p, string marca);

    }
}
