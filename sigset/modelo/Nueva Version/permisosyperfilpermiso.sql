--*********************** PERMISOS ****************************************

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
  VALUES(10, 4, N'ordenes_ingresadas', N'Ingresadas')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(11, 4, N'ordenes_pendientes', N'Pendientes')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(12, 4, N'ordenes_consulta', N'Consulta')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(13, 4, N'asignacion_manual', N'Manual')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(14, 4, N'asignacion_automatica', N'Automatica')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(15, 3, N'ordenes_asignadas', N'Asignadas')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(16, 3, N'ordenes_pendientes', N'Pendientes')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(17, 3, N'ordenes_consulta', N'Consulta')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(18, 3, N'articulo_consulta', N'Consulta')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(19, 3, N'articulo_listar', N'Listar')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(20, 5, N'informes_ordenes', N'Ordenes')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(21, 5, N'informes_tecnicos', N'Tecnicos')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(22, 2, N'usuarios_crear', N'Crear')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(23, 2, N'usuarios_listar', N'Listar')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(24, 2, N'permisos_crear', N'Crear')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(25, 2, N'permisos_listar', N'Listar')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(26, 2, N'perfiles_listar', N'Listar')
GO
INSERT INTO "dbo"."Permisos"("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(27, 2, N'sistema_configuracion', N'Configuracion')
GO
SET IDENTITY_INSERT "dbo"."Permisos" OFF
GO


--*******************************PERFILPERMISO ********************************

SET IDENTITY_INSERT "dbo"."PerfilPermiso" ON
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(1, 1, 1, 15)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(2, 1, 1, 16)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(3, 1, 1, 17)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(4, 1, 1, 18)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(5, 1, 1, 19)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(6, 2, 1, 1)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(7, 2, 1, 2)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(8, 2, 1, 3)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(9, 2, 1, 4)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(10, 2, 1, 5)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(11, 2, 1, 6)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(12, 2, 1, 7)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(13, 2, 1, 8)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(14, 2, 1, 9)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(15, 3, 1, 1)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(16, 3, 1, 2)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(17, 3, 1, 3)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(18, 3, 1, 4)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(19, 3, 1, 5)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(20, 3, 1, 6)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(21, 3, 1, 7)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(22, 3, 1, 8)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(23, 3, 1, 9)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(24, 3, 1, 10)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(25, 3, 1, 11)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(26, 3, 1, 12)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(27, 3, 1, 13)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(28, 3, 1, 14)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(29, 4, 1, 27)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(30, 4, 1, 26)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(31, 4, 1, 25)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(32, 4, 1, 24)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(33, 4, 1, 23)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(34, 4, 1, 22)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(35, 5, 1, 1)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(36, 5, 1, 2)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(37, 5, 1, 3)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(38, 5, 1, 4)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(39, 5, 1, 5)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(40, 5, 1, 6)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(41, 5, 1, 7)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(42, 5, 1, 9)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(43, 5, 1, 8)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(44, 5, 1, 11)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(45, 5, 1, 10)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(46, 5, 1, 12)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(47, 5, 1, 14)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(48, 5, 1, 13)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(49, 5, 1, 13)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(50, 5, 1, 15)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(51, 5, 1, 16)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(52, 5, 1, 16)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(53, 5, 1, 17)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(54, 5, 1, 18)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(55, 5, 1, 18)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(56, 5, 1, 19)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(57, 5, 1, 20)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(58, 5, 1, 21)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(59, 5, 1, 22)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(60, 5, 1, 22)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(61, 5, 1, 23)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(62, 5, 1, 24)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(63, 5, 1, 25)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(64, 5, 1, 26)
GO
INSERT INTO "dbo"."PerfilPermiso"("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(65, 5, 1, 27)
GO
SET IDENTITY_INSERT "dbo"."PerfilPermiso" OFF
GO

