USE [sigset]

INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(1, 'SERVICIO TÉCNICO', 'Nombre de empresa')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(2, '56 2 12345678', 'Teléfono de empresa')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(3, 'true,false', 'Habilitar Asignación Automática')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(4, '33', 'Asignación Automática: Número máximo de ordenes asignadas que puede tener un tecnico')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(5, '4', 'Asignación Automática: Número máximo de ordenes en revisión que puede tener un tecnico')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(6, '10', 'Asignación Automática: Número máximo de ordenes en estado reparación')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(7, 'true,false', 'Asignación Automática: Selecciona por mejor nivel')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(8, 'true', 'Asignación Automática: Solo seleccionar técnicos especialistas')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(9, 'true,false','Asignación Automática: Seleccionar a más desocupado si no existe ningún técnico según el criterio o dejar sin asignación')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(10, 'true,false', 'Mostrar Logo')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(22, 'Vicuña Mackena 123', 'Dirección de Empresa ')
GO