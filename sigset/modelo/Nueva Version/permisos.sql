SET IDENTITY_INSERT "dbo"."Permisos" ON
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(1, 1, N'ordenes_crear', N'Crear')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(2, 1, N'ordenes_consulta', N'Consulta')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(3, 1, N'ordenes_listar', N'Listar')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(4, 1, N'clientes_crear', N'Crear')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(5, 1, N'clientes_consulta', N'Consulta')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(6, 1, N'clientes_listar', N'Listar')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(7, 1, N'articulo_crear', N'Crear')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(8, 1, N'articulo_consulta', N'Consulta')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(9, 1, N'articulo_listar', N'Listar')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(11, 4, N'ordenes_ingresadas', N'Ingresadas')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(12, 4, N'ordenes_pendientes', N'Pendientes')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(14, 4, N'ordenes_consulta', N'Consulta')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(15, 4, N'asignacion_manual', N'Manual')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(19, 4, N'asignacion_automatica', N'Automatica')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(23, 3, N'ordenes_asignadas', N'Asignadas')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(24, 3, N'ordenes_pendientes', N'Pendientes')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(25, 3, N'ordenes_consulta', N'Consulta')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(28, 3, N'articulo_consulta', N'Consulta')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(29, 3, N'articulo_listar', N'Listar')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(30, 5, N'informes_ordenes', N'Ordenes')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(31, 5, N'informes_tecnicos', N'Tecnicos')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(32, 2, N'usuarios_crear', N'Crear')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(33, 2, N'usuarios_listar', N'Listar')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(34, 2, N'permisos_crear', N'Crear')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(35, 2, N'permisos_listar', N'Listar')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(36, 2, N'perfiles_listar', N'Listar')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(37, 2, N'sistema_configuracion', N'Configuracion')
GO
SET IDENTITY_INSERT "dbo"."Permisos" OFF
GO