USE [sigset]
GO
/****** Objeto:  ForeignKey [FK_Contacto_Cliente]    Fecha de la secuencia de comandos: 06/03/2009 22:06:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contacto_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contacto]'))
ALTER TABLE [dbo].[Contacto] DROP CONSTRAINT [FK_Contacto_Cliente]
GO
/****** Objeto:  ForeignKey [FK_Contacto_Tipo_Contacto]    Fecha de la secuencia de comandos: 06/03/2009 22:06:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contacto_Tipo_Contacto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contacto]'))
ALTER TABLE [dbo].[Contacto] DROP CONSTRAINT [FK_Contacto_Tipo_Contacto]
GO
/****** Objeto:  ForeignKey [FK_Direccion_Cliente]    Fecha de la secuencia de comandos: 06/03/2009 22:06:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Direccion_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Direccion]'))
ALTER TABLE [dbo].[Direccion] DROP CONSTRAINT [FK_Direccion_Cliente]
GO
/****** Objeto:  ForeignKey [FK_Direccion_Tipo_Direccion]    Fecha de la secuencia de comandos: 06/03/2009 22:06:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Direccion_Tipo_Direccion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Direccion]'))
ALTER TABLE [dbo].[Direccion] DROP CONSTRAINT [FK_Direccion_Tipo_Direccion]
GO
/****** Objeto:  Table [dbo].[Contacto]    Fecha de la secuencia de comandos: 06/03/2009 22:06:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contacto]') AND type in (N'U'))
DROP TABLE [dbo].[Contacto]
GO
/****** Objeto:  Table [dbo].[Direccion]    Fecha de la secuencia de comandos: 06/03/2009 22:06:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Direccion]') AND type in (N'U'))
DROP TABLE [dbo].[Direccion]
GO
/****** Objeto:  Table [dbo].[Articulo]    Fecha de la secuencia de comandos: 06/03/2009 22:06:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Articulo]') AND type in (N'U'))
DROP TABLE [dbo].[Articulo]
GO
/****** Objeto:  Table [dbo].[Tipo_Articulo]    Fecha de la secuencia de comandos: 06/03/2009 22:06:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Articulo]') AND type in (N'U'))
DROP TABLE [dbo].[Tipo_Articulo]
GO
/****** Objeto:  Table [dbo].[Tipo_Contacto]    Fecha de la secuencia de comandos: 06/03/2009 22:06:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Contacto]') AND type in (N'U'))
DROP TABLE [dbo].[Tipo_Contacto]
GO
/****** Objeto:  Table [dbo].[Cliente]    Fecha de la secuencia de comandos: 06/03/2009 22:06:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
DROP TABLE [dbo].[Cliente]
GO
/****** Objeto:  Table [dbo].[Tipo_Direccion]    Fecha de la secuencia de comandos: 06/03/2009 22:06:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Direccion]') AND type in (N'U'))
DROP TABLE [dbo].[Tipo_Direccion]
GO
/****** Objeto:  Table [dbo].[Tipo_Contacto]    Fecha de la secuencia de comandos: 06/03/2009 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Contacto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Contacto](
	[Id] [numeric](2, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_Contacto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Objeto:  Table [dbo].[Tipo_Direccion]    Fecha de la secuencia de comandos: 06/03/2009 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Direccion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Direccion](
	[Id] [numeric](2, 0) IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_Direccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Objeto:  Table [dbo].[Cliente]    Fecha de la secuencia de comandos: 06/03/2009 22:06:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Objeto:  Table [dbo].[Articulo]    Fecha de la secuencia de comandos: 06/03/2009 22:06:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Articulo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Articulo](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Modelo] [varchar](50) NOT NULL,
	[Serie] [varchar](100) NULL,
	[Marca] [numeric](6, 0) NOT NULL,
	[Tipo_Articulo] [numeric](4, 0) NOT NULL,
	[Categoria] [numeric](4, 0) NOT NULL,
	[Fecha_Fabricacion] [datetime] NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Articulo]') AND name = N'ModeloSerie')
CREATE UNIQUE NONCLUSTERED INDEX [ModeloSerie] ON [dbo].[Articulo] 
(
	[Modelo] ASC,
	[Serie] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Tipo_Articulo]    Fecha de la secuencia de comandos: 06/03/2009 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Articulo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Articulo](
	[Id] [numeric](4, 0) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Objeto:  Table [dbo].[Contacto]    Fecha de la secuencia de comandos: 06/03/2009 22:06:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Objeto:  Table [dbo].[Direccion]    Fecha de la secuencia de comandos: 06/03/2009 22:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Objeto:  ForeignKey [FK_Contacto_Cliente]    Fecha de la secuencia de comandos: 06/03/2009 22:06:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contacto_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contacto]'))
ALTER TABLE [dbo].[Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_Cliente] FOREIGN KEY([Rut])
REFERENCES [dbo].[Cliente] ([Rut])
GO
ALTER TABLE [dbo].[Contacto] CHECK CONSTRAINT [FK_Contacto_Cliente]
GO
/****** Objeto:  ForeignKey [FK_Contacto_Tipo_Contacto]    Fecha de la secuencia de comandos: 06/03/2009 22:06:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Contacto_Tipo_Contacto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contacto]'))
ALTER TABLE [dbo].[Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_Tipo_Contacto] FOREIGN KEY([Tipo_Contacto])
REFERENCES [dbo].[Tipo_Contacto] ([Id])
GO
ALTER TABLE [dbo].[Contacto] CHECK CONSTRAINT [FK_Contacto_Tipo_Contacto]
GO
/****** Objeto:  ForeignKey [FK_Direccion_Cliente]    Fecha de la secuencia de comandos: 06/03/2009 22:06:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Direccion_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Direccion]'))
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Cliente] FOREIGN KEY([Rut])
REFERENCES [dbo].[Cliente] ([Rut])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Cliente]
GO
/****** Objeto:  ForeignKey [FK_Direccion_Tipo_Direccion]    Fecha de la secuencia de comandos: 06/03/2009 22:06:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Direccion_Tipo_Direccion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Direccion]'))
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Tipo_Direccion] FOREIGN KEY([Tipo_Direccion])
REFERENCES [dbo].[Tipo_Direccion] ([Id])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Tipo_Direccion]
GO
