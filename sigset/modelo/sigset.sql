IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contacto_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contacto]'))
ALTER TABLE [dbo].[Contacto] DROP CONSTRAINT [FK_Contacto_Cliente]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contacto_Tipo_Contacto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contacto]'))
ALTER TABLE [dbo].[Contacto] DROP CONSTRAINT [FK_Contacto_Tipo_Contacto]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Direccion_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Direccion]'))
ALTER TABLE [dbo].[Direccion] DROP CONSTRAINT [FK_Direccion_Cliente]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Direccion_Tipo_Direccion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Direccion]'))
ALTER TABLE [dbo].[Direccion] DROP CONSTRAINT [FK_Direccion_Tipo_Direccion]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Porcentaje_Precio_Garantia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Porcentaje]'))
ALTER TABLE [dbo].[Porcentaje] DROP CONSTRAINT [FK_Porcentaje_Precio_Garantia]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Historial_Modificacion_Orden_Orden_Trabajo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Historial_Modificacion_Orden]'))
ALTER TABLE [dbo].[Historial_Modificacion_Orden] DROP CONSTRAINT [FK_Historial_Modificacion_Orden_Orden_Trabajo]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_Estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle]'))
ALTER TABLE [dbo].[Detalle] DROP CONSTRAINT [FK_Detalle_Estado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_Orden_Trabajo1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle]'))
ALTER TABLE [dbo].[Detalle] DROP CONSTRAINT [FK_Detalle_Orden_Trabajo1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle]'))
ALTER TABLE [dbo].[Detalle] DROP CONSTRAINT [FK_Detalle_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Especialidades_Tecnicos]') AND parent_object_id = OBJECT_ID(N'[dbo].[Especialidades]'))
ALTER TABLE [dbo].[Especialidades] DROP CONSTRAINT [FK_Especialidades_Tecnicos]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Especialidades_Tipo_Especialidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Especialidades]'))
ALTER TABLE [dbo].[Especialidades] DROP CONSTRAINT [FK_Especialidades_Tipo_Especialidad]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Marca_Linea]') AND parent_object_id = OBJECT_ID(N'[dbo].[Marca]'))
ALTER TABLE [dbo].[Marca] DROP CONSTRAINT [FK_Marca_Linea]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Articulo_Categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[Articulo]'))
ALTER TABLE [dbo].[Articulo] DROP CONSTRAINT [FK_Articulo_Categoria]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Articulo_Marca]') AND parent_object_id = OBJECT_ID(N'[dbo].[Articulo]'))
ALTER TABLE [dbo].[Articulo] DROP CONSTRAINT [FK_Articulo_Marca]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Articulo_Precio_Garantia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Articulo]'))
ALTER TABLE [dbo].[Articulo] DROP CONSTRAINT [FK_Articulo_Precio_Garantia]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Articulo_Tipo_Articulo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Articulo]'))
ALTER TABLE [dbo].[Articulo] DROP CONSTRAINT [FK_Articulo_Tipo_Articulo]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tecnicos_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tecnicos]'))
ALTER TABLE [dbo].[Tecnicos] DROP CONSTRAINT [FK_Tecnicos_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tecnicos_Nivel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tecnicos]'))
ALTER TABLE [dbo].[Tecnicos] DROP CONSTRAINT [FK_Tecnicos_Nivel]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Tipo_Cargo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [FK_Empleado_Tipo_Cargo]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orden_Trabajo_Articulo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orden_Trabajo]'))
ALTER TABLE [dbo].[Orden_Trabajo] DROP CONSTRAINT [FK_Orden_Trabajo_Articulo]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orden_Trabajo_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orden_Trabajo]'))
ALTER TABLE [dbo].[Orden_Trabajo] DROP CONSTRAINT [FK_Orden_Trabajo_Cliente]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orden_Trabajo_Tecnicos]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orden_Trabajo]'))
ALTER TABLE [dbo].[Orden_Trabajo] DROP CONSTRAINT [FK_Orden_Trabajo_Tecnicos]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orden_Trabajo_Tipo_Orden]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orden_Trabajo]'))
ALTER TABLE [dbo].[Orden_Trabajo] DROP CONSTRAINT [FK_Orden_Trabajo_Tipo_Orden]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario]'))
ALTER TABLE [dbo].[Usuario] DROP CONSTRAINT [FK_Usuario_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_Tipo_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario]'))
ALTER TABLE [dbo].[Usuario] DROP CONSTRAINT [FK_Usuario_Tipo_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contacto]') AND type in (N'U'))
DROP TABLE [dbo].[Contacto]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Direccion]') AND type in (N'U'))
DROP TABLE [dbo].[Direccion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Porcentaje]') AND type in (N'U'))
DROP TABLE [dbo].[Porcentaje]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Historial_Modificacion_Orden]') AND type in (N'U'))
DROP TABLE [dbo].[Historial_Modificacion_Orden]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle]') AND type in (N'U'))
DROP TABLE [dbo].[Detalle]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Especialidades]') AND type in (N'U'))
DROP TABLE [dbo].[Especialidades]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Contacto]') AND type in (N'U'))
DROP TABLE [dbo].[Tipo_Contacto]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
DROP TABLE [dbo].[Cliente]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Direccion]') AND type in (N'U'))
DROP TABLE [dbo].[Tipo_Direccion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Marca]') AND type in (N'U'))
DROP TABLE [dbo].[Marca]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Articulo]') AND type in (N'U'))
DROP TABLE [dbo].[Tipo_Articulo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND type in (N'U'))
DROP TABLE [dbo].[Categoria]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Precio_Garantia]') AND type in (N'U'))
DROP TABLE [dbo].[Precio_Garantia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Articulo]') AND type in (N'U'))
DROP TABLE [dbo].[Articulo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tecnicos]') AND type in (N'U'))
DROP TABLE [dbo].[Tecnicos]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Orden]') AND type in (N'U'))
DROP TABLE [dbo].[Tipo_Orden]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Usuario]') AND type in (N'U'))
DROP TABLE [dbo].[Tipo_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND type in (N'U'))
DROP TABLE [dbo].[Empleado]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orden_Trabajo]') AND type in (N'U'))
DROP TABLE [dbo].[Orden_Trabajo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
DROP TABLE [dbo].[Usuario]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estado]') AND type in (N'U'))
DROP TABLE [dbo].[Estado]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Cargo]') AND type in (N'U'))
DROP TABLE [dbo].[Tipo_Cargo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Especialidad]') AND type in (N'U'))
DROP TABLE [dbo].[Tipo_Especialidad]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Linea]') AND type in (N'U'))
DROP TABLE [dbo].[Linea]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nivel]') AND type in (N'U'))
DROP TABLE [dbo].[Nivel]


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Articulo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Articulo](
	[Id] [numeric](4, 0) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_Articulo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Precio_Garantia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Precio_Garantia](
	[Id] [numeric](18, 0) NOT NULL,
	[Articulo] [numeric](18, 0) NOT NULL,
	[Valor_Revision] [numeric](18, 0) NOT NULL,
	[Valor_Reparacion] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Precio_Garantia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Usuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Usuario](
	[Id] [numeric](4, 0) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categoria](
	[Id] [numeric](4, 0) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estado](
	[Id] [numeric](4, 0) NOT NULL,
	[Descripcion] [varchar](20) NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Cargo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Cargo](
	[Id] [numeric](4, 0) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_Cargo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nivel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Nivel](
	[Id] [numeric](18, 0) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Nivel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Orden]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Orden](
	[Id] [numeric](18, 0) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_Orden] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Linea]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Linea](
	[Id] [numeric](18, 0) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Linea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Especialidad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Especialidad](
	[Id] [numeric](18, 0) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Tipo_Especialidad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Contacto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Contacto](
	[Id] [numeric](2, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_Contacto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Direccion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Direccion](
	[Id] [numeric](2, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_Direccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliente](
	[Rut] [numeric](10, 0) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido_Paterno] [varchar](50) NOT NULL,
	[Apellido_Materno] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Rut] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Articulo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Articulo](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Modelo] [varchar](50) NOT NULL,
	[Marca] [numeric](18, 0) NOT NULL,
	[Tipo_Articulo] [numeric](4, 0) NOT NULL,
	[Categoria] [numeric](4, 0) NOT NULL,
	[Precio_Garantia] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Porcentaje]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Porcentaje](
	[Id] [numeric](18, 0) NOT NULL,
	[Id_Precio] [numeric](18, 0) NOT NULL,
	[Porcentaje] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Porcentaje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orden_Trabajo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Orden_Trabajo](
	[Id] [numeric](18, 0) NOT NULL,
	[Id_Cliente] [numeric](10, 0) NOT NULL,
	[Id_Articulo] [numeric](18, 0) NOT NULL,
	[Serie] [varchar](50) NOT NULL,
	[Fecha_Ingreso] [datetime] NOT NULL,
	[Fecha_Entrega] [datetime] NOT NULL,
	[Falla] [varchar](250) NOT NULL,
	[Condicion_Articulo] [numeric](18, 0) NULL,
	[Id_Tecnico_Asignado] [numeric](10, 0) NOT NULL,
	[Tipo_Orden] [numeric](18, 0) NULL,
	[Boleta] [varchar](50) NULL,
	[Poliza] [varchar](50) NULL,
	[Fecha_Compra] [datetime] NULL,
 CONSTRAINT [PK_Orden_Trabajo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Historial_Modificacion_Orden]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Historial_Modificacion_Orden](
	[Id] [numeric](18, 0) NOT NULL,
	[Id_Orden] [numeric](18, 0) NOT NULL,
	[Usuario] [numeric](18, 0) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Detalle] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Detalle](
	[Id] [numeric](18, 0) NOT NULL,
	[Id_Orden] [numeric](18, 0) NOT NULL,
	[Fecha_Creacion] [datetime] NULL,
	[Id_Usuario] [numeric](18, 0) NULL,
	[Detalle] [varchar](250) NULL,
	[Estado] [numeric](4, 0) NOT NULL,
 CONSTRAINT [PK_Detalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usuario](
	[Id] [numeric](18, 0) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Tipo_Usuario] [numeric](4, 0) NOT NULL,
	[Empleado] [numeric](10, 0) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empleado](
	[Rut] [numeric](10, 0) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido_Paterno] [varchar](50) NOT NULL,
	[Apellido_Materno] [varchar](50) NULL,
	[Tipo_Cargo] [numeric](4, 0) NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[Rut] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tecnicos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tecnicos](
	[Rut] [numeric](10, 0) NOT NULL,
	[Nivel] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Tecnicos] PRIMARY KEY CLUSTERED 
(
	[Rut] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Especialidades]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Especialidades](
	[Id] [numeric](18, 0) NOT NULL,
	[Id_Tecnico] [numeric](10, 0) NOT NULL,
	[Tipo_Especialidad] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Especialidades_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Marca]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Marca](
	[Id] [numeric](18, 0) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Linea] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contacto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Contacto](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Rut] [numeric](10, 0) NOT NULL,
	[Tipo_Contacto] [numeric](2, 0) NULL,
	[Valor_Contacto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Contacto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Direccion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Direccion](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Rut] [numeric](10, 0) NOT NULL,
	[Region] [numeric](2, 0) NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
	[Comuna] [varchar](50) NOT NULL,
	[Calle] [varchar](50) NOT NULL,
	[Numero] [numeric](8, 0) NOT NULL,
	[Codigo_Postal] [varchar](10) NULL,
	[Tipo_Direccion] [numeric](2, 0) NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Articulo_Categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[Articulo]'))
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Categoria] FOREIGN KEY([Categoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Articulo_Marca]') AND parent_object_id = OBJECT_ID(N'[dbo].[Articulo]'))
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Marca] FOREIGN KEY([Marca])
REFERENCES [dbo].[Marca] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Articulo_Precio_Garantia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Articulo]'))
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Precio_Garantia] FOREIGN KEY([Precio_Garantia])
REFERENCES [dbo].[Precio_Garantia] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Articulo_Tipo_Articulo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Articulo]'))
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Tipo_Articulo] FOREIGN KEY([Tipo_Articulo])
REFERENCES [dbo].[Tipo_Articulo] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Porcentaje_Precio_Garantia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Porcentaje]'))
ALTER TABLE [dbo].[Porcentaje]  WITH CHECK ADD  CONSTRAINT [FK_Porcentaje_Precio_Garantia] FOREIGN KEY([Id_Precio])
REFERENCES [dbo].[Precio_Garantia] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orden_Trabajo_Articulo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orden_Trabajo]'))
ALTER TABLE [dbo].[Orden_Trabajo]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Trabajo_Articulo] FOREIGN KEY([Id_Articulo])
REFERENCES [dbo].[Articulo] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orden_Trabajo_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orden_Trabajo]'))
ALTER TABLE [dbo].[Orden_Trabajo]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Trabajo_Cliente] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([Rut])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orden_Trabajo_Tecnicos]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orden_Trabajo]'))
ALTER TABLE [dbo].[Orden_Trabajo]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Trabajo_Tecnicos] FOREIGN KEY([Id_Tecnico_Asignado])
REFERENCES [dbo].[Tecnicos] ([Rut])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orden_Trabajo_Tipo_Orden]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orden_Trabajo]'))
ALTER TABLE [dbo].[Orden_Trabajo]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Trabajo_Tipo_Orden] FOREIGN KEY([Tipo_Orden])
REFERENCES [dbo].[Tipo_Orden] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Historial_Modificacion_Orden_Orden_Trabajo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Historial_Modificacion_Orden]'))
ALTER TABLE [dbo].[Historial_Modificacion_Orden]  WITH CHECK ADD  CONSTRAINT [FK_Historial_Modificacion_Orden_Orden_Trabajo] FOREIGN KEY([Id_Orden])
REFERENCES [dbo].[Orden_Trabajo] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_Estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle]'))
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Estado] FOREIGN KEY([Estado])
REFERENCES [dbo].[Estado] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_Orden_Trabajo1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle]'))
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Orden_Trabajo1] FOREIGN KEY([Id_Orden])
REFERENCES [dbo].[Orden_Trabajo] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle]'))
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario]'))
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empleado] FOREIGN KEY([Empleado])
REFERENCES [dbo].[Empleado] ([Rut])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuario_Tipo_Usuario]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario]'))
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Tipo_Usuario] FOREIGN KEY([Tipo_Usuario])
REFERENCES [dbo].[Tipo_Usuario] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Tipo_Cargo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Tipo_Cargo] FOREIGN KEY([Tipo_Cargo])
REFERENCES [dbo].[Tipo_Cargo] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tecnicos_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tecnicos]'))
ALTER TABLE [dbo].[Tecnicos]  WITH CHECK ADD  CONSTRAINT [FK_Tecnicos_Empleado] FOREIGN KEY([Rut])
REFERENCES [dbo].[Empleado] ([Rut])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tecnicos_Nivel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tecnicos]'))
ALTER TABLE [dbo].[Tecnicos]  WITH CHECK ADD  CONSTRAINT [FK_Tecnicos_Nivel] FOREIGN KEY([Nivel])
REFERENCES [dbo].[Nivel] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Especialidades_Tecnicos]') AND parent_object_id = OBJECT_ID(N'[dbo].[Especialidades]'))
ALTER TABLE [dbo].[Especialidades]  WITH CHECK ADD  CONSTRAINT [FK_Especialidades_Tecnicos] FOREIGN KEY([Id_Tecnico])
REFERENCES [dbo].[Tecnicos] ([Rut])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Especialidades_Tipo_Especialidad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Especialidades]'))
ALTER TABLE [dbo].[Especialidades]  WITH CHECK ADD  CONSTRAINT [FK_Especialidades_Tipo_Especialidad] FOREIGN KEY([Tipo_Especialidad])
REFERENCES [dbo].[Tipo_Especialidad] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Marca_Linea]') AND parent_object_id = OBJECT_ID(N'[dbo].[Marca]'))
ALTER TABLE [dbo].[Marca]  WITH CHECK ADD  CONSTRAINT [FK_Marca_Linea] FOREIGN KEY([Linea])
REFERENCES [dbo].[Linea] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contacto_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contacto]'))
ALTER TABLE [dbo].[Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_Cliente] FOREIGN KEY([Rut])
REFERENCES [dbo].[Cliente] ([Rut])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contacto_Tipo_Contacto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contacto]'))
ALTER TABLE [dbo].[Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_Tipo_Contacto] FOREIGN KEY([Tipo_Contacto])
REFERENCES [dbo].[Tipo_Contacto] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Direccion_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Direccion]'))
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Cliente] FOREIGN KEY([Rut])
REFERENCES [dbo].[Cliente] ([Rut])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Direccion_Tipo_Direccion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Direccion]'))
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Tipo_Direccion] FOREIGN KEY([Tipo_Direccion])
REFERENCES [dbo].[Tipo_Direccion] ([Id])
