USE [sigset]

INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(1, 'SERVICIO T�CNICO', 'Nombre de empresa')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(2, '56 2 12345678', 'Tel�fono de empresa')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(3, 'true,false', 'Habilitar Asignaci�n Autom�tica')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(4, '33', 'Asignaci�n Autom�tica: N�mero m�ximo de ordenes asignadas que puede tener un tecnico')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(5, '4', 'Asignaci�n Autom�tica: N�mero m�ximo de ordenes en revisi�n que puede tener un tecnico')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(6, '10', 'Asignaci�n Autom�tica: N�mero m�ximo de ordenes en estado reparaci�n')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(7, 'true,false', 'Asignaci�n Autom�tica: Selecciona por mejor nivel')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(8, 'true', 'Asignaci�n Autom�tica: Solo seleccionar t�cnicos especialistas')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(9, 'true,false','Asignaci�n Autom�tica: Seleccionar a m�s desocupado si no existe ning�n t�cnico seg�n el criterio o dejar sin asignaci�n')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(10, 'true,false', 'Mostrar Logo')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(22, 'Vicu�a Mackena 123', 'Direcci�n de Empresa ')
GO