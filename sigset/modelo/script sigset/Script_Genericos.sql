
INSERT INTO Tipo_Orden(Id_Tipo_Orden, Descripcion)
  VALUES(1, 'Garantia')
GO
INSERT INTO Tipo_Orden(Id_Tipo_Orden, Descripcion)
  VALUES(2, 'Reparación Particular')
GO
INSERT INTO Tipo_Orden(Id_Tipo_Orden, Descripcion)
  VALUES(3, 'Reingreso')
GO

INSERT INTO Tipo_Usuario(Id_Tipo_Usuario, Descripcion)
  VALUES(1, 'Técnico')
GO
INSERT INTO Tipo_Usuario(Id_Tipo_Usuario, Descripcion)
  VALUES(2, 'Recepcionista')
GO
INSERT INTO Tipo_Usuario(Id_Tipo_Usuario, Descripcion)
  VALUES(3, 'Administrativo')
GO
INSERT INTO Tipo_Usuario(Id_Tipo_Usuario, Descripcion)
  VALUES(4, 'Administrador')
GO
INSERT INTO Tipo_Usuario(Id_Tipo_Usuario, Descripcion)
  VALUES(5, 'Gerente')
GO


INSERT INTO Tipo_Especialidad(Id_Tipo_Especialidad, Descripcion)
  VALUES(1, 'Televisión')
GO
INSERT INTO Tipo_Especialidad(Id_Tipo_Especialidad, Descripcion)
  VALUES(2, 'Audio')
GO
INSERT INTO Tipo_Especialidad(Id_Tipo_Especialidad, Descripcion)
  VALUES(3, 'Camaras')
GO
INSERT INTO Tipo_Especialidad(Id_Tipo_Especialidad, Descripcion)
  VALUES(4, 'Video')
GO
INSERT INTO Tipo_Especialidad(Id_Tipo_Especialidad, Descripcion)
  VALUES(5, 'Computación')
GO
INSERT INTO Tipo_Especialidad(Id_Tipo_Especialidad, Descripcion)
  VALUES(6, 'Electrodomésticos')
GO



INSERT INTO Tipo_Direccion(Id_Tipo_Direccion, Descripcion)
  VALUES(1, 'Casa')
GO
INSERT INTO Tipo_Direccion(Id_Tipo_Direccion, Descripcion)
  VALUES(2, 'Trabajo')
GO
INSERT INTO Tipo_Direccion(Id_Tipo_Direccion, Descripcion)
  VALUES(3, 'Otro')
GO

INSERT INTO Tipo_Cargo(Id_Tipo_Cargo, Descripcion)
  VALUES(1, 'Tecnico')
GO
INSERT INTO Tipo_Cargo(Id_Tipo_Cargo, Descripcion)
  VALUES(2, 'Administrativo')
GO
INSERT INTO Tipo_Cargo(Id_Tipo_Cargo, Descripcion)
  VALUES(3, 'Recepcionista')
GO
INSERT INTO Tipo_Cargo(Id_Tipo_Cargo, Descripcion)
  VALUES(4, 'Gerente')
GO
INSERT INTO Tipo_Cargo(Id_Tipo_Cargo, Descripcion)
  VALUES(5, 'Telefonista')
GO
INSERT INTO Tipo_Cargo(Id_Tipo_Cargo, Descripcion)
  VALUES(6, 'Guardia')
GO
INSERT INTO Tipo_Cargo(Id_Tipo_Cargo, Descripcion)
  VALUES(7, 'Supervisor')
GO


INSERT INTO Tipo_Contacto(Id_Tipo_Contacto, Descripcion)
  VALUES(1, 'Telefono Casa')
GO
INSERT INTO Tipo_Contacto(Id_Tipo_Contacto, Descripcion)
  VALUES(2, 'Celular')
GO
INSERT INTO Tipo_Contacto(Id_Tipo_Contacto, Descripcion)
  VALUES(3, 'Correo Electrónico')
GO



INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(1, 'Televisión')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(2, 'Reproductor Dvd')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(3, 'Reproductor Video')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(4, 'Equipo Audio')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(5, 'Discman')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(6, 'Reproductor Mp3')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(7, 'Reproductor Mp4')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(8, 'Batidora')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(9, 'Juguera')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(10, 'Tostadora')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(11, 'Notebook')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(12, 'Mini Componente')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(13, 'Parlantes')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(14, 'Radio de Auto')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(15, 'Home Theater')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(16, 'Plasma')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(17, 'LCD')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(18, 'Alisador de Pelo')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(19, 'Secador de Pelo')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(20, 'Camara Digital')
GO
INSERT INTO Tipo_Articulo(Id_Tipo_Articulo, Descripcion)
  VALUES(21, 'Camara Video')
GO



INSERT INTO Precio_Garantia(Id_Precio_Garantia, Valor_Revision, Valor_Reparacion)
  VALUES(1, 10500, 18000)
GO
INSERT INTO Precio_Garantia(Id_Precio_Garantia, Valor_Revision, Valor_Reparacion)
  VALUES(2, 11600, 20000)
GO
INSERT INTO Precio_Garantia(Id_Precio_Garantia, Valor_Revision, Valor_Reparacion)
  VALUES(3, 7000, 10000)
GO
INSERT INTO Precio_Garantia(Id_Precio_Garantia, Valor_Revision, Valor_Reparacion)
  VALUES(4, 6900, 12000)
GO



INSERT INTO Estado(Id_Estado, Descripcion)
  VALUES(1, 'Ingresado')
GO
INSERT INTO Estado(Id_Estado, Descripcion)
  VALUES(2, 'Asignado')
GO
INSERT INTO Estado(Id_Estado, Descripcion)
  VALUES(3, 'En Revisión')
GO
INSERT INTO Estado(Id_Estado, Descripcion)
  VALUES(4, 'En Reparación')
GO
INSERT INTO Estado(Id_Estado, Descripcion)
  VALUES(5, 'Reparado')
GO
INSERT INTO Estado(Id_Estado, Descripcion)
  VALUES(6, 'Entregado')
GO
INSERT INTO Estado(Id_Estado, Descripcion)
  VALUES(7, 'Pendiente ')
GO
INSERT INTO Estado(Id_Estado, Descripcion)
  VALUES(8, 'Sin Garantia')
GO
INSERT INTO Estado(Id_Estado, Descripcion)
  VALUES(9, 'Anulado')
GO


INSERT INTO Categoria(Id_Categoria, Descripcion)
  VALUES(1, 'Fotografia/Video')
GO
INSERT INTO Categoria(Id_Categoria, Descripcion)
  VALUES(2, 'Audio Mayor')
GO
INSERT INTO Categoria(Id_Categoria, Descripcion)
  VALUES(3, 'Audio Menor')
GO
INSERT INTO Categoria(Id_Categoria, Descripcion)
  VALUES(4, 'Audio Medio')
GO
INSERT INTO Categoria(Id_Categoria, Descripcion)
  VALUES(5, 'Televisión 14''''')
GO
INSERT INTO Categoria(Id_Categoria, Descripcion)
  VALUES(6, 'Televisión 21''''')
GO
INSERT INTO Categoria(Id_Categoria, Descripcion)
  VALUES(7, 'Pantalla 32''''')
GO
INSERT INTO Categoria(Id_Categoria, Descripcion)
  VALUES(8, 'Video Juegos')
GO
INSERT INTO Categoria(Id_Categoria, Descripcion)
  VALUES(9, 'Computación')
GO
INSERT INTO Categoria(Id_Categoria, Descripcion)
  VALUES(10, 'Televisión 29''''')
GO
INSERT INTO Categoria(Id_Categoria, Descripcion)
  VALUES(11, 'Pantalla 42''''')
GO
INSERT INTO Categoria(Id_Categoria, Descripcion)
  VALUES(12, 'Electrodoméstico Pequeño')
GO


INSERT INTO Nivel(Id_Nivel, Descripcion)
  VALUES(1, 'Básico')
GO
INSERT INTO Nivel(Id_Nivel, Descripcion)
  VALUES(2, 'Medio')
GO
INSERT INTO Nivel(Id_Nivel, Descripcion)
  VALUES(3, 'Avanzado')
GO


INSERT INTO Marca(Id_Marca, Descripcion)
  VALUES(1, 'Sony ')
GO
INSERT INTO Marca(Id_Marca, Descripcion)
  VALUES(2, 'Philips')
GO
INSERT INTO Marca(Id_Marca, Descripcion)
  VALUES(3, 'Lg')
GO
INSERT INTO Marca(Id_Marca, Descripcion)
  VALUES(4, 'Samsung')
GO
INSERT INTO Marca(Id_Marca, Descripcion)
  VALUES(5, 'Recco')
GO

INSERT INTO Linea(Id_Linea, Descripcion)
  VALUES(1, 'Bravia')
GO
INSERT INTO Linea(Id_Linea, Descripcion)
  VALUES(2, 'Walkman')
GO
INSERT INTO Linea(Id_Linea, Descripcion)
  VALUES(3, 'Festa')
GO
INSERT INTO Linea(Id_Linea, Descripcion)
  VALUES(4, 'Googear')
GO
INSERT INTO Linea(Id_Linea, Descripcion)
  VALUES(5, 'Genezis')
GO
INSERT INTO Linea(Id_Linea, Descripcion)
  VALUES(6, 'Cyber Shot')
GO
INSERT INTO Linea(Id_Linea, Descripcion)
  VALUES(7, 'Handycam')
GO
INSERT INTO Linea(Id_Linea, Descripcion)
  VALUES(8, 'Vaio')
GO
INSERT INTO Linea(Id_Linea, Descripcion)
  VALUES(9, 'Xplod')
GO
INSERT INTO Linea(Id_Linea, Descripcion)
  VALUES(10, 'Trinitron')
GO

