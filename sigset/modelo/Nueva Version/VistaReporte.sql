CREATE VIEW [dbo].[OrdenTrabajoVista]
AS
SELECT     o.Id, (CASE c.TipoCliente WHEN 1 THEN
                          (SELECT     cp.Nombre + ' ' + cp.ApellidoPaterno
                            FROM          ClienteParticular AS cp
                            WHERE      cp.Id = c.Id) WHEN 2 THEN
                          (SELECT     cc.RazonSocial + ' ' + cc.Sucursal
                            FROM          ClienteComercial AS cc
                            WHERE      cc.RazonSocial = c.Id) END) AS Nombre, (CASE c.TipoCliente WHEN 1 THEN
                          (SELECT     cp.Rut
                            FROM          ClienteParticular AS cp
                            WHERE      cp.Id = c.Id) WHEN 2 THEN
                          (SELECT     cc.Rut
                            FROM          ClienteComercial AS cc
                            WHERE      cc.RazonSocial = c.Id) END) AS Rut, a.Modelo,
                          (SELECT     Descripcion
                            FROM          dbo.Marca
                            WHERE      (IdMarca = a.Marca)) AS Marca,
                          (SELECT     Descripcion
                            FROM          dbo.Linea
                            WHERE      (IdLinea = a.Linea)) AS Linea,
                          (SELECT     Descripcion
                            FROM          dbo.TipoArticulo
                            WHERE      (IdTipoArticulo = a.TipoArticulo)) AS TipoArticulo,
                          (SELECT     Descripcion
                            FROM          dbo.Categoria
                            WHERE      (IdCategoria = a.Categoria)) AS Categoria,
                          (SELECT     ValorReparacion
                            FROM          dbo.PrecioGarantia
                            WHERE      (IdPrecioGarantia = a.PrecioGarantia)) AS ValorReparacion,
                          (SELECT     ValorRevision
                            FROM          dbo.PrecioGarantia AS PrecioGarantia_1
                            WHERE      (IdPrecioGarantia = a.PrecioGarantia)) AS ValorRevision, o.Serie, o.Falla, o.CondicionArticulo, o.FechaIngreso, o.FechaEntrega, o.TipoOrden,
                          (SELECT     Descripcion
                            FROM          dbo.TipoOrden
                            WHERE      (IdTipoOrden = o.TipoOrden)) AS DescripTipoOrden, o.Boleta, o.Poliza, o.FechaCompra, o.LugarCompra, o.Observacion
FROM         dbo.OrdenTrabajo AS o INNER JOIN
                      dbo.Cliente AS c ON c.Id = o.IdCliente INNER JOIN
                      dbo.Articulo AS a ON o.IdArticulo = a.Id

GO