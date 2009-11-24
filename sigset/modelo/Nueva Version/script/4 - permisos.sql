
USE [sigset]

SET IDENTITY_INSERT [dbo].[Permisos] ON
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(1, 1, 'ordenes_crear', 'Crear orden de trabajo')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(2, 1, 'ordenes_consulta', 'Consulta ordenes de trabajo')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(3, 1, 'ordenes_listar', 'Listar ordenes de trabajo')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(4, 1, 'clientes_crear', 'Crear nuevo cliente')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(5, 1, 'clientes_buscar', 'Busca cliente')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(6, 1, 'clientes_listar', 'Listar clientes')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(7, 1, 'articulo_crear', 'Crear nuevo artículo')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(8, 1, 'articulo_buscar', 'Busca artículo')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(9, 1, 'articulo_listar', 'Listar artículos')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(10, 2, 'usuarios_crear', 'Crear nuevo usuario')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(11, 2, 'usuarios_listar', 'Listar usuarios')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(12, 2, 'usuarios_buscar', 'Busca usuarios')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(13, 2, 'usuarios_perfiles', 'Lista perfiles de usuario')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(14, 2, 'config_generales', 'Configuración de sistema')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(15, 2, 'config_permisos', 'Configuración de permisos')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(16, 2, 'config_categoria', 'Configuración de categorías')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(17, 2, 'config_tipo_articulo', 'Configuración de tipo artículos')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(18, 2, 'config_precios', 'Configuración de precios')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(19, 3, 'tec_ordenes_asignadas', 'Ordenes de trabajo asignadas')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(20, 3, 'tec_ordenes_reparadas', 'Ordenes de trabajo en estado reparado')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(21, 4, 'ad_ordenes_consulta', 'Consulta Ordenes de trabajo')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(22, 4, 'ad_ordenes_sin_asignar', 'Lista ordenes sin asignar')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(23, 4, 'ad_tecnicos_lista', 'Lista de técnicos')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(24, 4, 'ad_tecnicos_especialidades', 'Especialidades de técnicos')
GO

INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(25, 5, 'informes_ordenes', 'Ordenes')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(26, 5, 'informes_tecnicos', 'Técnicos')
GO

SET IDENTITY_INSERT [dbo].[Permisos] OFF
GO