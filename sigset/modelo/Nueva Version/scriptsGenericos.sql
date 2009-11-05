SET IDENTITY_INSERT [dbo].[TipoCliente] ON
GO
INSERT INTO [dbo].[TipoCliente]([Id], [Descripcion])
  VALUES(1, N'Cliente Particular')
GO
INSERT INTO [dbo].[TipoCliente]([Id], [Descripcion])
  VALUES(2, N'Cliente Comercial')
GO
SET IDENTITY_INSERT [dbo].[TipoCliente] OFF
GO


SET IDENTITY_INSERT [dbo].TipoOrden ON
GO
INSERT INTO TipoOrden(IdTipoOrden, Descripcion)
  VALUES(1, 'Garantia')
GO
INSERT INTO TipoOrden(IdTipoOrden, Descripcion)
  VALUES(2, 'Reparación Particular')
GO
INSERT INTO TipoOrden(IdTipoOrden, Descripcion)
  VALUES(3, 'Reingreso')
GO
SET IDENTITY_INSERT [dbo].TipoOrden OFF
GO


set IDENTITY_INSERT Perfil ON

INSERT INTO Perfil(Id, Descripcion)
  VALUES(1, 'Técnico')
GO
INSERT INTO Perfil(Id, Descripcion)
  VALUES(2, 'Recepcionista')
GO
INSERT INTO Perfil(Id, Descripcion)
  VALUES(3, 'Administrativo')
GO
INSERT INTO Perfil(Id, Descripcion)
  VALUES(4, 'Administrador')
GO
INSERT INTO Perfil(Id, Descripcion)
  VALUES(5, 'Gerente')
GO
INSERT INTO Perfil(Id, Descripcion)
  VALUES(6, 'Super Usuario')
GO
set IDENTITY_INSERT Perfil OFF
GO

set IDENTITY_INSERT TipoEspecialidad ON
GO
INSERT INTO TipoEspecialidad(IdTipoEspecialidad, Descripcion)
  VALUES(1, 'Televisión')
GO
INSERT INTO TipoEspecialidad(IdTipoEspecialidad, Descripcion)
  VALUES(2, 'Audio')
GO
INSERT INTO TipoEspecialidad(IdTipoEspecialidad, Descripcion)
  VALUES(3, 'Camaras')
GO
INSERT INTO TipoEspecialidad(IdTipoEspecialidad, Descripcion)
  VALUES(4, 'Video')
GO
INSERT INTO TipoEspecialidad(IdTipoEspecialidad, Descripcion)
  VALUES(5, 'Computación')
GO
INSERT INTO TipoEspecialidad(IdTipoEspecialidad, Descripcion)
  VALUES(6, 'Electrodomésticos')
GO

set IDENTITY_INSERT TipoEspecialidad OFF
GO

--*******************************************+


INSERT INTO TipoDireccion(IdTipoDireccion, Descripcion)
  VALUES(1, 'Casa')
GO
INSERT INTO TipoDireccion(IdTipoDireccion, Descripcion)
  VALUES(2, 'Trabajo')
GO
INSERT INTO TipoDireccion(IdTipoDireccion, Descripcion)
  VALUES(3, 'Otro')
GO



--*************************************************



INSERT INTO TipoContacto(IdTipoContacto, Descripcion)
  VALUES(1, 'Telefono')
GO
INSERT INTO TipoContacto(IdTipoContacto, Descripcion)
  VALUES(2, 'Celular')
GO
INSERT INTO TipoContacto(IdTipoContacto, Descripcion)
  VALUES(3, 'Correo Electrónico')
GO



--*************************************************

set IDENTITY_INSERT TipoArticulo ON
GO

INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(1, 'Televisión')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(2, 'Reproductor Dvd')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(3, 'Reproductor Video')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(4, 'Equipo Audio')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(5, 'Discman')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(6, 'Reproductor Mp3')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(7, 'Reproductor Mp4')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(8, 'Batidora')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(9, 'Juguera')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(10, 'Tostadora')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(11, 'Notebook')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(12, 'Mini Componente')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(13, 'Parlantes')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(14, 'Radio de Auto')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(15, 'Home Theater')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(16, 'Plasma')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(17, 'LCD')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(18, 'Alisador de Pelo')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(19, 'Secador de Pelo')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(20, 'Camara Digital')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(21, 'Camara Video')
GO

SET IDENTITY_INSERT TipoArticulo OFF
GO

--*************************************************

set IDENTITY_INSERT PrecioGarantia ON
GO

INSERT INTO PrecioGarantia(IdPrecioGarantia, ValorRevision, ValorReparacion)
  VALUES(1, 10500, 18000)
GO
INSERT INTO PrecioGarantia(IdPrecioGarantia, ValorRevision, ValorReparacion)
  VALUES(2, 11600, 20000)
GO
INSERT INTO PrecioGarantia(IdPrecioGarantia, ValorRevision, ValorReparacion)
  VALUES(3, 7000, 10000)
GO
INSERT INTO PrecioGarantia(IdPrecioGarantia, ValorRevision, ValorReparacion)
  VALUES(4, 6900, 12000)
GO
SET IDENTITY_INSERT PrecioGarantia OFF
GO

--*************************************************

SET IDENTITY_INSERT Estado ON
GO

INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(1, 'Ingresado')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(2, 'Asignado')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(3, 'En Revisión')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(4, 'En Reparación')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(5, 'Reparado')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(6, 'Entregado')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(7, 'Pendiente ')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(8, 'Sin Garantia')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(9, 'Anulado')
GO


SET IDENTITY_INSERT Estado OFF
GO

--*************************************************

SET IDENTITY_INSERT Categoria ON
GO

INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(1, 'Fotografia/Video')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(2, 'Audio Mayor')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(3, 'Audio Menor')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(4, 'Audio Medio')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(5, 'Televisión 14''''')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(6, 'Televisión 21''''')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(7, 'Pantalla 32''''')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(8, 'Video Juegos')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(9, 'Computación')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(10, 'Televisión 29''''')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(11, 'Pantalla 42''''')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(12, 'Electrodoméstico Pequeño')
GO

SET IDENTITY_INSERT Categoria OFF
GO

--*************************************************

SET IDENTITY_INSERT Nivel ON
GO

INSERT INTO Nivel(IdNivel, Descripcion)
  VALUES(1, 'Básico')
GO
INSERT INTO Nivel(IdNivel, Descripcion)
  VALUES(2, 'Medio')
GO
INSERT INTO Nivel(IdNivel, Descripcion)
  VALUES(3, 'Avanzado')
GO

SET IDENTITY_INSERT Nivel OFF
GO
--*************************************************

SET IDENTITY_INSERT Marca ON
GO

INSERT INTO Marca(IdMarca, Descripcion)
  VALUES(1, 'Sony ')
GO
INSERT INTO Marca(IdMarca, Descripcion)
  VALUES(2, 'Philips')
GO
INSERT INTO Marca(IdMarca, Descripcion)
  VALUES(3, 'Lg')
GO
INSERT INTO Marca(IdMarca, Descripcion)
  VALUES(4, 'Samsung')
GO
INSERT INTO Marca(IdMarca, Descripcion)
  VALUES(5, 'Recco')
GO

SET IDENTITY_INSERT Marca OFF
GO

--*************************************************

SET IDENTITY_INSERT Linea ON
GO

INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(1, 'Bravia')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(2, 'Walkman')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(3, 'Festa')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(4, 'Googear')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(5, 'Genezis')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(6, 'Cyber Shot')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(7, 'Handycam')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(8, 'Vaio')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(9, 'Xplod')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(10, 'Trinitron')
GO

SET IDENTITY_INSERT Linea OFF
GO

