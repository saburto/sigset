
USE [sigset]
SET IDENTITY_INSERT [dbo].[Permisos] ON
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(1, 1, 'ordenes_crear', 'Crear')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(2, 1, 'ordenes_consulta', 'Consulta')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(3, 1, 'ordenes_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(4, 1, 'clientes_crear', 'Crear')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(5, 1, 'clientes_consulta', 'Consulta')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(6, 1, 'clientes_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(7, 1, 'articulo_crear', 'Crear')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(8, 1, 'articulo_consulta', 'Consulta')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(9, 1, 'articulo_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(10, 4, 'ordenes_ingresadas', 'Ingresadas')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(11, 4, 'ordenes_pendientes', 'Pendientes')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(12, 4, 'ordenes_consulta', 'Consulta')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(13, 4, 'asignacion_manual', 'Manual')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(14, 4, 'asignacion_automatica', 'Automatica')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(15, 3, 'ordenes_asignadas', 'Asignadas')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(16, 3, 'ordenes_pendientes', 'Pendientes')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(17, 3, 'ordenes_consulta', 'Consulta')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(18, 3, 'articulo_consulta', 'Consulta')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(19, 3, 'articulo_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(20, 5, 'informes_ordenes', 'Ordenes')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(21, 5, 'informes_tecnicos', 'Tecnicos')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(22, 2, 'usuarios_crear', 'Crear')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(23, 2, 'usuarios_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(24, 2, 'permisos_crear', 'Crear')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(25, 2, 'permisos_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(26, 2, 'perfiles_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]([Id], [Mod_Id], [Opcion], [DescripcionOpcion])
  VALUES(27, 2, 'sistema_configuracio', 'Configuracion')
GO
SET IDENTITY_INSERT [dbo].[Permisos] OFF
GO