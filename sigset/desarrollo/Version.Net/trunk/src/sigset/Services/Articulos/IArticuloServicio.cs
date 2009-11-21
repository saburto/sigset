using System;
using Data.Modelo;
using System.Collections.Generic;
namespace Services.Articulos
{
    public interface IArticuloServicio
    {
        System.Collections.Generic.IList<global::Data.Modelo.Marca> GetMarcas(string nombre);

        System.Collections.Generic.IList<global::Data.Modelo.TipoArticulo> GetTipoArticulos(string q);

        System.Collections.Generic.IList<global::Data.Modelo.Categoria> GetCategoria(string q);

        System.Collections.Generic.IList<global::Data.Modelo.PrecioGarantia> GetPrecios();

        System.Collections.Generic.IList<global::Data.Modelo.Linea> GetLineas(string q);

        Articulo CrearArticulo(Data.Modelo.Articulo articulo, string Marca, string Linea);

        Articulo GetArticuloPorModelo(string Modelo);

        Articulo GetArticuloPorModeloMarca(string Modelo, string Marca);

        Articulo GetArticulo(decimal id);

        IList<Data.Modelo.Articulo> GetArticulos();

        System.Collections.Generic.IList<global::Data.Modelo.Categoria> GetCategorias();

        void EliminarCategoria(string IdCategoria);

        void ModificarCategoria(string idCategoria, string descripcion, string idTipoEspecialidad);

        void ModificarTipoArticulo(string IdTipoArticulo, string descripcion);

        void EliminarTipoArticulo(string IdTipoArticulo);

        IList<Data.Modelo.TipoArticulo> GetTiposArticulos();

        Articulo ModificarArticulo(Articulo articulo, string Marca, string Linea);
    }
}
