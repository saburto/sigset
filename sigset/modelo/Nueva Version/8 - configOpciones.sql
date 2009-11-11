INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(1, 'SERVICIO TÉCNICO 2', 'Nombre de empresa')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(2, '33', 'Telefono de empresa')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(3, 'true,false', 'Habilitar Asignación Automatica')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(4, '33', 'Asignación Automatica: Número maximo de ordenes asignadas que puede tener un tecnico')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(5, '4', 'Asignación Automatica: Número maximo de ordenes en revision que puede tener un tecnico')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(6, 'true,false', 'Asignación Automatica: Selecciona por mejor nivel')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(7, 'false', 'Asignación Automatica: Seleccionar a más desocupado si no existe ningun tecnico segun el criterio o dejar sin asignacion')
GO