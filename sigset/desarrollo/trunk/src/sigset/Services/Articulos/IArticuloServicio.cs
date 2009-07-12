using System;
using Data.Modelo;
namespace Services.Articulos
{
    public interface IArticuloServicio
    {
        System.Collections.Generic.IList<global::Data.Modelo.Marca> GetMarcas(string nombre);

        System.Collections.Generic.IList<global::Data.Modelo.Tipo_Articulo> GetTipoArticulos(string q);

        System.Collections.Generic.IList<global::Data.Modelo.Categoria> GetCategoria(string q);

        System.Collections.Generic.IList<global::Data.Modelo.Precio_Garantia> GetPrecios();

        System.Collections.Generic.IList<global::Data.Modelo.Linea> GetLineas(string q);

        Articulo CrearArticulo(Data.Modelo.Articulo articulo, string Lista_Precio_Garantia, string Marca, string Linea);

        Articulo GetArticulo(int id);
    }
}
