SET IDENTITY_INSERT [dbo].[Modulos] ON
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(1, N'OrdenTrabajo', N'Orden de Trabajo')
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(2, N'Admin', N'Administración de Sistema')
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(3, N'AreaTecnica', N'Area Tecnica')
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(4, N'Administrativos', N'Administrativos')
GO
SET IDENTITY_INSERT [dbo].[Modulos] OFF
GO