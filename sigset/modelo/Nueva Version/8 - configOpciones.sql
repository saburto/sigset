INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(1, 'SERVICIO T�CNICO', 'Nombre de empresa')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(2, '33', 'Telefono de empresa')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(3, 'true,false', 'Habilitar Asignaci�n Automatica')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(4, '33', 'Asignaci�n Automatica: N�mero maximo de ordenes asignadas que puede tener un tecnico')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(5, '4', 'Asignaci�n Automatica: N�mero maximo de ordenes en revision que puede tener un tecnico')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(6, '10', 'Asignaci�n Automatica: N�mero maximo de ordenes en estado reparacion')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(7, 'true,false', 'Asignaci�n Automatica: Selecciona por mejor nivel')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(8, 'true', 'Asignaci�n Automatica: Solo seleccionar tecnicos especialistas')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(9, 'false', 'Asignaci�n Automatica: Seleccionar a m�s desocupado si no existe ningun tecnico segun el criterio o dejar sin asignacion')
GO