USE [sigset]
SET IDENTITY_INSERT [dbo].[Usuario] ON
GO
INSERT INTO [dbo].[Usuario]([Id], [User], [Password], [PerfilUsuario], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Email], [Rut], [Telefono], [Activo])
  VALUES(1, N'sistema', N'sistema', 6, N'sistema', N'sistema', N'sistema', N'sistema', 0, N'0', 1)
GO
INSERT INTO [dbo].[Usuario]([Id], [User], [Password], [PerfilUsuario], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Email], [Rut], [Telefono], [Activo])
  VALUES(2, 'Admin', 'Admin', 4, 'Admin', 'Admin','Admin', 'Admin', 0, N'0', 1)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
