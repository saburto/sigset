USE [sigset]
SET IDENTITY_INSERT [dbo].[Modulos] ON
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(1, 'OrdenTrabajo', 'Orden de Trabajo')
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(2, 'Admin', 'Administraci�n de Sistema')
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(3, 'AreaTecnica','�rea T�cnica')
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(4, 'Administrativos', 'Administrativos')
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(5, 'Gerencia', 'Informes')
GO
SET IDENTITY_INSERT [dbo].[Modulos] OFF
GO

