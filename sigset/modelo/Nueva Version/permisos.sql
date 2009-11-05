SET IDENTITY_INSERT [dbo].[Permisos] ON
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(1, 1, N'ordenes_crear', N'Crear')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(2, 1, N'ordenes_consulta', N'Consulta')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(3, 1, N'ordenes_listar', N'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(4, 1, N'clientes_crear', N'Crear')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(5, 1, N'clientes_consulta', N'Consulta')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(6, 1, N'clientes_listar', N'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(7, 1, N'articulo_crear', N'Crear')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(8, 1, N'articulo_consulta', N'Consulta')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(9, 1, N'articulo_listar', N'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(10, 4, N'ordenes_ingresadas', N'Ingresadas')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(11, 4, N'ordenes_pendientes', N'Pendientes')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(12, 4, N'ordenes_consulta', N'Consulta')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(13, 4, N'asignacion_manual', N'Manual')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(14, 4, N'asignacion_automatica', N'Automatica')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(15, 3, N'ordenes_asignadas', N'Asignadas')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(16, 3, N'ordenes_pendientes', N'Pendientes')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(17, 3, N'ordenes_consulta', N'Consulta')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(18, 3, N'articulo_consulta', N'Consulta')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(19, 3, N'articulo_listar', N'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(20, 5, N'informes_ordenes', N'Ordenes')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(21, 5, N'informes_tecnicos', N'Tecnicos')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(22, 2, N'usuarios_crear', N'Crear')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(23, 2, N'usuarios_listar', N'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(24, 2, N'permisos_crear', N'Crear')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(25, 2, N'permisos_listar', N'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(26, 2, N'perfiles_listar', N'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(27, 2, N'sistema_configuracion', N'Configuracion')
GO
SET IDENTITY_INSERT [dbo].[Permisos] OFF
GO