USE [master]
GO
/****** Object:  Database [sigset]    Script Date: 11/20/2009 20:15:56 ******/
CREATE DATABASE [sigset]
GO


USE [sigset]

/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     17-11-2009 14:03:08                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Articulo') and o.name = 'FK_Articulo_Categoria')
alter table Articulo
   drop constraint FK_Articulo_Categoria
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Articulo') and o.name = 'FK_Articulo_Linea')
alter table Articulo
   drop constraint FK_Articulo_Linea
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Articulo') and o.name = 'FK_Articulo_Marca')
alter table Articulo
   drop constraint FK_Articulo_Marca
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Articulo') and o.name = 'FK_Articulo_Precio_Garantia')
alter table Articulo
   drop constraint FK_Articulo_Precio_Garantia
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Articulo') and o.name = 'FK_Articulo_Tipo_Articulo')
alter table Articulo
   drop constraint FK_Articulo_Tipo_Articulo
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Categoria') and o.name = 'FK_CATEGORI_REFERENCE_TIPOESPE')
alter table Categoria
   drop constraint FK_CATEGORI_REFERENCE_TIPOESPE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Cliente') and o.name = 'FKCliente740984')
alter table Cliente
   drop constraint FKCliente740984
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Cliente') and o.name = 'FK_CLIENTE_REFERENCE_DIRECCIO')
alter table Cliente
   drop constraint FK_CLIENTE_REFERENCE_DIRECCIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ClienteComercial') and o.name = 'FK_CLIENTEC_REFERENCE_CLIENTE')
alter table ClienteComercial
   drop constraint FK_CLIENTEC_REFERENCE_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ClienteParticular') and o.name = 'FK_CLIENTEP_REFERENCE_CLIENTE')
alter table ClienteParticular
   drop constraint FK_CLIENTEP_REFERENCE_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Contacto') and o.name = 'FK_Contacto_Tipo_Contacto')
alter table Contacto
   drop constraint FK_Contacto_Tipo_Contacto
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Contacto') and o.name = 'FK_CONTACTO_REFERENCE_CLIENTE')
alter table Contacto
   drop constraint FK_CONTACTO_REFERENCE_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Detalle') and o.name = 'FK_Detalle_Estado')
alter table Detalle
   drop constraint FK_Detalle_Estado
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Detalle') and o.name = 'FK_Detalle_Orden_Trabajo')
alter table Detalle
   drop constraint FK_Detalle_Orden_Trabajo
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Detalle') and o.name = 'FK_DETALLE_REFERENCE_USUARIO')
alter table Detalle
   drop constraint FK_DETALLE_REFERENCE_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Direccion') and o.name = 'FK_Direccion_Comuna')
alter table Direccion
   drop constraint FK_Direccion_Comuna
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Direccion') and o.name = 'FK_Direccion_Region')
alter table Direccion
   drop constraint FK_Direccion_Region
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Direccion') and o.name = 'FK_Direccion_Tipo_Direccion')
alter table Direccion
   drop constraint FK_Direccion_Tipo_Direccion
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Direccion') and o.name = 'FK_DIRECCIO_REFERENCE_PROVINCI')
alter table Direccion
   drop constraint FK_DIRECCIO_REFERENCE_PROVINCI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Especialidades') and o.name = 'FKEspecialid71056')
alter table Especialidades
   drop constraint FKEspecialid71056
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Especialidades') and o.name = 'FK_Especialidades_Tipo_Especialidad')
alter table Especialidades
   drop constraint FK_Especialidades_Tipo_Especialidad
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('HistorialModificacionOrden') and o.name = 'FK_Historial_Modificacion_Orden_Orden_Trabajo')
alter table HistorialModificacionOrden
   drop constraint FK_Historial_Modificacion_Orden_Orden_Trabajo
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OrdenTrabajo') and o.name = 'FKOrdenTraba317573')
alter table OrdenTrabajo
   drop constraint FKOrdenTraba317573
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OrdenTrabajo') and o.name = 'FK_Orden_Trabajo_Articulo')
alter table OrdenTrabajo
   drop constraint FK_Orden_Trabajo_Articulo
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OrdenTrabajo') and o.name = 'FK_Orden_Trabajo_Tipo_Orden')
alter table OrdenTrabajo
   drop constraint FK_Orden_Trabajo_Tipo_Orden
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OrdenTrabajo') and o.name = 'FK_ORDENTRA_REFERENCE_TECNICOS')
alter table OrdenTrabajo
   drop constraint FK_ORDENTRA_REFERENCE_TECNICOS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PerfilPermiso') and o.name = 'FKPerfilPerm618277')
alter table PerfilPermiso
   drop constraint FKPerfilPerm618277
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PerfilPermiso') and o.name = 'FKPerfilPerm713727')
alter table PerfilPermiso
   drop constraint FKPerfilPerm713727
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Permisos') and o.name = 'FKPermisos544499')
alter table Permisos
   drop constraint FKPermisos544499
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Porcentaje') and o.name = 'FK_Porcentaje_Precio_Garantia')
alter table Porcentaje
   drop constraint FK_Porcentaje_Precio_Garantia
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Provincia') and o.name = 'FK_provincia_region')
alter table Provincia
   drop constraint FK_provincia_region
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Tecnicos') and o.name = 'FK_Tecnicos_Nivel')
alter table Tecnicos
   drop constraint FK_Tecnicos_Nivel
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Tecnicos') and o.name = 'FK_TECNICOS_REFERENCE_USUARIO')
alter table Tecnicos
   drop constraint FK_TECNICOS_REFERENCE_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Usuario') and o.name = 'Usuario-TipoUsuario')
alter table Usuario
   drop constraint "Usuario-TipoUsuario"
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UsuarioPermisos') and o.name = 'FK_USUARIOP_REFERENCE_USUARIO')
alter table UsuarioPermisos
   drop constraint FK_USUARIOP_REFERENCE_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UsuarioPermisos') and o.name = 'FK_USUARIOP_REFERENCE_PERMISOS')
alter table UsuarioPermisos
   drop constraint FK_USUARIOP_REFERENCE_PERMISOS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Articulo')
            and   type = 'U')
   drop table Articulo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Categoria')
            and   type = 'U')
   drop table Categoria
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Cliente')
            and   type = 'U')
   drop table Cliente
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ClienteComercial')
            and   type = 'U')
   drop table ClienteComercial
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ClienteParticular')
            and   type = 'U')
   drop table ClienteParticular
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Comuna')
            and   type = 'U')
   drop table Comuna
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Configuracion')
            and   type = 'U')
   drop table Configuracion
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Contacto')
            and   type = 'U')
   drop table Contacto
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Detalle')
            and   type = 'U')
   drop table Detalle
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Direccion')
            and   type = 'U')
   drop table Direccion
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Especialidades')
            and   type = 'U')
   drop table Especialidades
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Estado')
            and   type = 'U')
   drop table Estado
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HistorialModificacionOrden')
            and   type = 'U')
   drop table HistorialModificacionOrden
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Linea')
            and   type = 'U')
   drop table Linea
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Marca')
            and   type = 'U')
   drop table Marca
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Modulos')
            and   type = 'U')
   drop table Modulos
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Nivel')
            and   type = 'U')
   drop table Nivel
go

if exists (select 1
            from  sysobjects
           where  id = object_id('OrdenTrabajo')
            and   type = 'U')
   drop table OrdenTrabajo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Perfil')
            and   type = 'U')
   drop table Perfil
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PerfilPermiso')
            and   type = 'U')
   drop table PerfilPermiso
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Permisos')
            and   type = 'U')
   drop table Permisos
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Porcentaje')
            and   type = 'U')
   drop table Porcentaje
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PrecioGarantia')
            and   type = 'U')
   drop table PrecioGarantia
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Provincia')
            and   type = 'U')
   drop table Provincia
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Region')
            and   type = 'U')
   drop table Region
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Tecnicos')
            and   type = 'U')
   drop table Tecnicos
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TipoArticulo')
            and   type = 'U')
   drop table TipoArticulo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TipoCliente')
            and   type = 'U')
   drop table TipoCliente
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TipoContacto')
            and   type = 'U')
   drop table TipoContacto
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TipoDireccion')
            and   type = 'U')
   drop table TipoDireccion
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TipoEspecialidad')
            and   type = 'U')
   drop table TipoEspecialidad
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TipoOrden')
            and   type = 'U')
   drop table TipoOrden
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Usuario')
            and   type = 'U')
   drop table Usuario
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UsuarioPermisos')
            and   type = 'U')
   drop table UsuarioPermisos
go

/*==============================================================*/
/* Table: Articulo                                              */
/*==============================================================*/
create table Articulo (
   Id                   numeric              identity,
   Modelo               varchar(50)          not null,
   Observacion          nvarchar(255)        null,
   Marca                numeric(18, 0)       not null,
   TipoArticulo         numeric(18, 0)       not null,
   Categoria            numeric(18, 0)       not null,
   PrecioGarantia       numeric(18, 0)       null,
   Linea                numeric(18, 0)       null,
   constraint PK_Articulo primary key (Id)
)
go

/*==============================================================*/
/* Table: Categoria                                             */
/*==============================================================*/
create table Categoria (
   IdCategoria          numeric(18, 0)       identity,
   Descripcion          varchar(50)          not null,
   IdTipoEspecialidad   numeric(18,0)        null,
   constraint PK_Categoria primary key (IdCategoria)
)
go

/*==============================================================*/
/* Table: Cliente                                               */
/*==============================================================*/
create table Cliente (
   Id                   int                  identity,
   TipoCliente          int                  null,
   Observacion          nvarchar(255)        null,
   IdDireccion          int                  null,
   constraint PK_CLIENTE primary key (Id)
)
go

/*==============================================================*/
/* Table: ClienteComercial                                      */
/*==============================================================*/
create table ClienteComercial (
   Id                   int                  not null,
   Rut                  int                  not null,
   RazonSocial          nvarchar(255)        not null,
   Sucursal             nvarchar(255)        not null,
   constraint PK_CLIENTECOMERCIAL primary key (Id)
)
go

/*==============================================================*/
/* Table: ClienteParticular                                     */
/*==============================================================*/
create table ClienteParticular (
   Id                   int                  not null,
   Rut                  numeric(10, 0)       not null,
   Nombre               varchar(50)          not null,
   ApellidoPaterno      varchar(50)          not null,
   ApellidoMaterno      varchar(50)          null,
   constraint PK_CLIENTEPARTICULAR primary key (Id)
)
go

/*==============================================================*/
/* Table: Comuna                                                */
/*==============================================================*/
create table Comuna (
   Id                   numeric(3, 0)        not null,
   IdProvincia          numeric(3, 0)        not null,
   Nombre               varchar(255)         not null,
   constraint PK_comuna primary key (Id)
)
go

/*==============================================================*/
/* Table: Configuracion                                         */
/*==============================================================*/
create table Configuracion (
   Id                   int                  not null,
   Valor                varchar(Max)         not null,
   Descripcion          varchar(255)         null,
   constraint PK_CONFIGURACION primary key (Id)
)
go

/*==============================================================*/
/* Table: Contacto                                              */
/*==============================================================*/
create table Contacto (
   Id                   numeric              identity,
   ValorContacto        varchar(50)          not null,
   TipoContacto         numeric(18, 0)       null,
   IdCliente            int                  null,
   constraint PK_Contacto primary key (Id)
)
go

/*==============================================================*/
/* Table: Detalle                                               */
/*==============================================================*/
create table Detalle (
   Id                   numeric              identity,
   FechaCreacion        datetime             not null,
   Contenido            varchar(250)         null,
   IdOrden              numeric              null,
   Estado               numeric(18, 0)       not null,
   IdUsuario            int                  null,
   constraint PK_Detalle primary key (Id)
)
go

/*==============================================================*/
/* Table: Direccion                                             */
/*==============================================================*/
create table Direccion (
   Id                   int                  identity,
   Provincia            numeric(3, 0)        not null,
   Comuna               numeric(3, 0)        not null,
   Calle                varchar(250)         not null,
   Numero               varchar(10)          not null,
   Region               numeric(2, 0)        not null,
   TipoDireccion        numeric(18, 0)       not null,
   constraint PK_Direccion primary key (Id)
)
go

/*==============================================================*/
/* Table: Especialidades                                        */
/*==============================================================*/
create table Especialidades (
   Id                   numeric              identity,
   TipoEspecialidad     numeric(18, 0)       not null,
   IdTecnico            int                  null,
   constraint PK_Especialidades_1 primary key (Id)
)
go

/*==============================================================*/
/* Table: Estado                                                */
/*==============================================================*/
create table Estado (
   IdEstado             numeric(18, 0)       identity,
   Descripcion          varchar(20)          not null,
   constraint PK_Estado primary key (IdEstado)
)
go

/*==============================================================*/
/* Table: HistorialModificacionOrden                            */
/*==============================================================*/
create table HistorialModificacionOrden (
   Id                   numeric              identity,
   Usuario              numeric(18, 0)       not null,
   Fecha                datetime             not null,
   Detalle              varchar(100)         null,
   IdOrden              numeric              null,
   constraint PK_Historial_Modificacion_Orden primary key (Id)
)
go

/*==============================================================*/
/* Table: Linea                                                 */
/*==============================================================*/
create table Linea (
   IdLinea              numeric(18, 0)       identity,
   Descripcion          varchar(50)          not null,
   constraint PK_Linea primary key (IdLinea)
)
go

/*==============================================================*/
/* Table: Marca                                                 */
/*==============================================================*/
create table Marca (
   IdMarca              numeric(18, 0)       identity,
   Descripcion          varchar(50)          not null,
   constraint PK_Marca primary key (IdMarca)
)
go

/*==============================================================*/
/* Table: Modulos                                               */
/*==============================================================*/
create table Modulos (
   Id                   int                  identity,
   NombreModulo         nvarchar(255)        not null,
   DescripcionOpcion    nvarchar(255)        not null,
   constraint PK_MODULOS primary key (Id)
)
go

/*==============================================================*/
/* Table: Nivel                                                 */
/*==============================================================*/
create table Nivel (
   IdNivel              numeric(18, 0)       identity,
   Descripcion          varchar(50)          not null,
   constraint PK_Nivel primary key (IdNivel)
)
go

/*==============================================================*/
/* Table: OrdenTrabajo                                          */
/*==============================================================*/
create table OrdenTrabajo (
   IdArticulo           numeric              null,
   Id                   numeric              identity,
   Serie                varchar(50)          not null,
   FechaIngreso         datetime             not null,
   FechaEntrega         datetime             not null,
   Falla                varchar(250)         not null,
   CondicionArticulo    varchar(250)         null,
   Boleta               varchar(50)          null,
   Poliza               varchar(50)          null,
   FechaCompra          datetime             null,
   LugarCompra          varchar(100)         null,
   IdTecnicoAsignado    int                  null,
   Observacion          nvarchar(255)        null,
   TipoOrden            numeric(18, 0)       null,
   IdCliente            int                  null,
   constraint PK_Orden_Trabajo primary key (Id)
)
go

/*==============================================================*/
/* Table: Perfil                                                */
/*==============================================================*/
create table Perfil (
   Id                   int                  identity,
   Descripcion          nvarchar(255)        not null,
   constraint PK_Tipo_Usuario primary key (Id)
)
go

/*==============================================================*/
/* Table: PerfilPermiso                                         */
/*==============================================================*/
create table PerfilPermiso (
   Id                   int                  identity,
   IdPerfil             int                  not null,
   Estado               bit                  not null,
   IdPermiso            int                  null,
   constraint PK_PERFILPERMISO primary key (Id)
)
go

/*==============================================================*/
/* Table: Permisos                                              */
/*==============================================================*/
create table Permisos (
   Id                   int                  identity,
   Mod_Id               int                  null,
   Opcion               nvarchar(255)        not null,
   DescripcionOpcion    nvarchar(255)        not null,
   constraint PK_PERMISOS primary key (Id)
)
go

/*==============================================================*/
/* Table: Porcentaje                                            */
/*==============================================================*/
create table Porcentaje (
   Id                   numeric              identity,
   Porcentaje           numeric(18, 0)       not null,
   IdPrecio             numeric(18, 0)       not null,
   constraint PK_Porcentaje primary key (Id)
)
go

/*==============================================================*/
/* Table: PrecioGarantia                                        */
/*==============================================================*/
create table PrecioGarantia (
   IdPrecioGarantia     numeric(18, 0)       identity,
   ValorRevision        numeric(18, 0)       not null,
   ValorReparacion      numeric(18, 0)       not null,
   constraint PK_Precio_Garantia primary key (IdPrecioGarantia)
)
go

/*==============================================================*/
/* Table: Provincia                                             */
/*==============================================================*/
create table Provincia (
   Id                   numeric(3, 0)        not null,
   nombre               varchar(255)         not null,
   IdRegion             numeric(2, 0)        not null,
   constraint PK_provincia primary key (Id)
)
go

/*==============================================================*/
/* Table: Region                                                */
/*==============================================================*/
create table Region (
   Id                   numeric(2, 0)        not null,
   Nombre               varchar(250)         not null,
   constraint PK__Region__1AD3FDA4 primary key (Id)
)
go

/*==============================================================*/
/* Table: Tecnicos                                              */
/*==============================================================*/
create table Tecnicos (
   Id                   int                  not null,
   Nivel                numeric(18, 0)       not null,
   constraint PK_Tecnicos primary key (Id)
)
go

/*==============================================================*/
/* Table: TipoArticulo                                          */
/*==============================================================*/
create table TipoArticulo (
   IdTipoArticulo       numeric(18, 0)       identity,
   Descripcion          varchar(50)          not null,
   constraint PK_Tipo_Articulo primary key (IdTipoArticulo)
)
go

/*==============================================================*/
/* Table: TipoCliente                                           */
/*==============================================================*/
create table TipoCliente (
   Id                   int                  identity,
   Descripcion          nvarchar(100)        not null,
   constraint PK_TIPOCLIENTE primary key (Id)
)
go

/*==============================================================*/
/* Table: TipoContacto                                          */
/*==============================================================*/
create table TipoContacto (
   IdTipoContacto       numeric(18, 0)       not null,
   Descripcion          varchar(50)          not null,
   constraint PK_Tipo_Contacto primary key (IdTipoContacto)
)
go

/*==============================================================*/
/* Table: TipoDireccion                                         */
/*==============================================================*/
create table TipoDireccion (
   IdTipoDireccion      numeric(18, 0)       not null,
   Descripcion          varchar(50)          not null,
   constraint PK_Tipo_Direccion primary key (IdTipoDireccion)
)
go

/*==============================================================*/
/* Table: TipoEspecialidad                                      */
/*==============================================================*/
create table TipoEspecialidad (
   IdTipoEspecialidad   numeric(18, 0)       identity,
   Descripcion          varchar(255)         not null,
   constraint PK_Tipo_Especialidad primary key (IdTipoEspecialidad)
)
go

/*==============================================================*/
/* Table: TipoOrden                                             */
/*==============================================================*/
create table TipoOrden (
   IdTipoOrden          numeric(18, 0)       identity,
   Descripcion          varchar(50)          not null,
   constraint PK_Tipo_Orden primary key (IdTipoOrden)
)
go

/*==============================================================*/
/* Table: Usuario                                               */
/*==============================================================*/
create table Usuario (
   Id                   int                  identity,
   "User"               nvarchar(255)        not null,
   Password             nvarchar(255)        not null,
   PerfilUsuario        int                  not null,
   Nombres              nvarchar(100)        not null,
   ApellidoPaterno      nvarchar(50)         not null,
   ApellidoMaterno      nvarchar(50)         not null,
   Email                nvarchar(50)         null,
   Rut                  int                  not null,
   Telefono             nvarchar(20)         null,
   Activo               bit                  not null,
   constraint PK_USUARIO primary key (Id)
)
go

/*==============================================================*/
/* Table: UsuarioPermisos                                       */
/*==============================================================*/
create table UsuarioPermisos (
   Id                   int                  identity,
   IdUsuario            int                  not null,
   IdPermiso            int                  null,
   Estado               bit                  not null,
   constraint PK_USUARIOPERMISOS primary key (Id)
)
go

alter table Articulo
   add constraint FK_Articulo_Categoria foreign key (Categoria)
      references Categoria (IdCategoria)
         on update cascade on delete cascade
go

alter table Articulo
   add constraint FK_Articulo_Linea foreign key (Linea)
      references Linea (IdLinea)
         on update cascade on delete cascade
go

alter table Articulo
   add constraint FK_Articulo_Marca foreign key (Marca)
      references Marca (IdMarca)
         on update cascade on delete cascade
go

alter table Articulo
   add constraint FK_Articulo_Precio_Garantia foreign key (PrecioGarantia)
      references PrecioGarantia (IdPrecioGarantia)
         on update cascade on delete cascade
go

alter table Articulo
   add constraint FK_Articulo_Tipo_Articulo foreign key (TipoArticulo)
      references TipoArticulo (IdTipoArticulo)
         on update cascade on delete cascade
go

alter table Categoria
   add constraint FK_CATEGORI_REFERENCE_TIPOESPE foreign key (IdTipoEspecialidad)
      references TipoEspecialidad (IdTipoEspecialidad)
go

alter table Cliente
   add constraint FKCliente740984 foreign key (TipoCliente)
      references TipoCliente (Id)
go

alter table Cliente
   add constraint FK_CLIENTE_REFERENCE_DIRECCIO foreign key (IdDireccion)
      references Direccion (Id)
go

alter table ClienteComercial
   add constraint FK_CLIENTEC_REFERENCE_CLIENTE foreign key (Id)
      references Cliente (Id)
go

alter table ClienteParticular
   add constraint FK_CLIENTEP_REFERENCE_CLIENTE foreign key (Id)
      references Cliente (Id)
go

alter table Contacto
   add constraint FK_Contacto_Tipo_Contacto foreign key (TipoContacto)
      references TipoContacto (IdTipoContacto)
         on update cascade on delete cascade
go

alter table Contacto
   add constraint FK_CONTACTO_REFERENCE_CLIENTE foreign key (IdCliente)
      references Cliente (Id)
go

alter table Detalle
   add constraint FK_Detalle_Estado foreign key (Estado)
      references Estado (IdEstado)
         on update cascade on delete cascade
go

alter table Detalle
   add constraint FK_Detalle_Orden_Trabajo foreign key (IdOrden)
      references OrdenTrabajo (Id)
         on update cascade on delete cascade
go

alter table Detalle
   add constraint FK_DETALLE_REFERENCE_USUARIO foreign key (IdUsuario)
      references Usuario (Id)
go

alter table Direccion
   add constraint FK_Direccion_Comuna foreign key (Comuna)
      references Comuna (Id)
         on update cascade on delete cascade
go

alter table Direccion
   add constraint FK_Direccion_Region foreign key (Region)
      references Region (Id)
         on update cascade on delete cascade
go

alter table Direccion
   add constraint FK_Direccion_Tipo_Direccion foreign key (TipoDireccion)
      references TipoDireccion (IdTipoDireccion)
         on update cascade on delete cascade
go

alter table Direccion
   add constraint FK_DIRECCIO_REFERENCE_PROVINCI foreign key (Provincia)
      references Provincia (Id)
go

alter table Especialidades
   add constraint FKEspecialid71056 foreign key (IdTecnico)
      references Tecnicos (Id)
go

alter table Especialidades
   add constraint FK_Especialidades_Tipo_Especialidad foreign key (TipoEspecialidad)
      references TipoEspecialidad (IdTipoEspecialidad)
         on update cascade on delete cascade
go

alter table HistorialModificacionOrden
   add constraint FK_Historial_Modificacion_Orden_Orden_Trabajo foreign key (IdOrden)
      references OrdenTrabajo (Id)
         on update cascade on delete cascade
go

alter table OrdenTrabajo
   add constraint FKOrdenTraba317573 foreign key (IdCliente)
      references Cliente (Id)
go

alter table OrdenTrabajo
   add constraint FK_Orden_Trabajo_Articulo foreign key (IdArticulo)
      references Articulo (Id)
         on update cascade on delete cascade
go

alter table OrdenTrabajo
   add constraint FK_Orden_Trabajo_Tipo_Orden foreign key (TipoOrden)
      references TipoOrden (IdTipoOrden)
         on update cascade on delete cascade
go

alter table OrdenTrabajo
   add constraint FK_ORDENTRA_REFERENCE_TECNICOS foreign key (IdTecnicoAsignado)
      references Tecnicos (Id)
go

alter table PerfilPermiso
   add constraint FKPerfilPerm618277 foreign key (IdPermiso)
      references Permisos (Id)
go

alter table PerfilPermiso
   add constraint FKPerfilPerm713727 foreign key (IdPerfil)
      references Perfil (Id)
go

alter table Permisos
   add constraint FKPermisos544499 foreign key (Mod_Id)
      references Modulos (Id)
go

alter table Porcentaje
   add constraint FK_Porcentaje_Precio_Garantia foreign key (IdPrecio)
      references PrecioGarantia (IdPrecioGarantia)
         on update cascade on delete cascade
go

alter table Provincia
   add constraint FK_provincia_region foreign key (IdRegion)
      references Region (Id)
         on update cascade on delete cascade
go

alter table Tecnicos
   add constraint FK_Tecnicos_Nivel foreign key (Nivel)
      references Nivel (IdNivel)
         on update cascade on delete cascade
go

alter table Tecnicos
   add constraint FK_TECNICOS_REFERENCE_USUARIO foreign key (Id)
      references Usuario (Id)
go

alter table Usuario
   add constraint "Usuario-TipoUsuario" foreign key (PerfilUsuario)
      references Perfil (Id)
go

alter table UsuarioPermisos
   add constraint FK_USUARIOP_REFERENCE_USUARIO foreign key (IdUsuario)
      references Usuario (Id)
go

alter table UsuarioPermisos
   add constraint FK_USUARIOP_REFERENCE_PERMISOS foreign key (IdPermiso)
      references Permisos (Id)
go

SET IDENTITY_INSERT [dbo].[TipoCliente] ON
GO
INSERT INTO [dbo].[TipoCliente]([Id], [Descripcion])
  VALUES(1, N'Cliente Particular')
GO
INSERT INTO [dbo].[TipoCliente]([Id], [Descripcion])
  VALUES(2, N'Cliente Comercial')
GO
SET IDENTITY_INSERT [dbo].[TipoCliente] OFF
GO


SET IDENTITY_INSERT [dbo].TipoOrden ON
GO
INSERT INTO TipoOrden(IdTipoOrden, Descripcion)
  VALUES(1, 'Garantia')
GO
INSERT INTO TipoOrden(IdTipoOrden, Descripcion)
  VALUES(2, 'Reparación Particular')
GO
INSERT INTO TipoOrden(IdTipoOrden, Descripcion)
  VALUES(3, 'Reingreso')
GO
SET IDENTITY_INSERT [dbo].TipoOrden OFF
GO


set IDENTITY_INSERT Perfil ON

INSERT INTO Perfil(Id, Descripcion)
  VALUES(1, 'Técnico')
GO
INSERT INTO Perfil(Id, Descripcion)
  VALUES(2, 'Recepcionista')
GO
INSERT INTO Perfil(Id, Descripcion)
  VALUES(3, 'Administrativo')
GO
INSERT INTO Perfil(Id, Descripcion)
  VALUES(4, 'Administrador')
GO
INSERT INTO Perfil(Id, Descripcion)
  VALUES(5, 'Gerente')
GO
INSERT INTO Perfil(Id, Descripcion)
  VALUES(6, 'Super Usuario')
GO
set IDENTITY_INSERT Perfil OFF
GO

set IDENTITY_INSERT TipoEspecialidad ON
GO
INSERT INTO TipoEspecialidad(IdTipoEspecialidad, Descripcion)
  VALUES(1, 'Televisión')
GO
INSERT INTO TipoEspecialidad(IdTipoEspecialidad, Descripcion)
  VALUES(2, 'Audio')
GO
INSERT INTO TipoEspecialidad(IdTipoEspecialidad, Descripcion)
  VALUES(3, 'Camaras')
GO
INSERT INTO TipoEspecialidad(IdTipoEspecialidad, Descripcion)
  VALUES(4, 'Video')
GO
INSERT INTO TipoEspecialidad(IdTipoEspecialidad, Descripcion)
  VALUES(5, 'Computación')
GO
INSERT INTO TipoEspecialidad(IdTipoEspecialidad, Descripcion)
  VALUES(6, 'Electrodomésticos')
GO

set IDENTITY_INSERT TipoEspecialidad OFF
GO

--*******************************************+


INSERT INTO TipoDireccion(IdTipoDireccion, Descripcion)
  VALUES(1, 'Casa')
GO
INSERT INTO TipoDireccion(IdTipoDireccion, Descripcion)
  VALUES(2, 'Trabajo')
GO
INSERT INTO TipoDireccion(IdTipoDireccion, Descripcion)
  VALUES(3, 'Otro')
GO



--*************************************************



INSERT INTO TipoContacto(IdTipoContacto, Descripcion)
  VALUES(1, 'Telefono')
GO
INSERT INTO TipoContacto(IdTipoContacto, Descripcion)
  VALUES(2, 'Celular')
GO
INSERT INTO TipoContacto(IdTipoContacto, Descripcion)
  VALUES(3, 'Correo Electrónico')
GO



--*************************************************

set IDENTITY_INSERT TipoArticulo ON
GO

INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(1, 'Televisión')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(2, 'Reproductor Dvd')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(3, 'Reproductor Video')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(4, 'Equipo Audio')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(5, 'Discman')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(6, 'Reproductor Mp3')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(7, 'Reproductor Mp4')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(8, 'Batidora')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(9, 'Juguera')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(10, 'Tostadora')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(11, 'Notebook')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(12, 'Mini Componente')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(13, 'Parlantes')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(14, 'Radio de Auto')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(15, 'Home Theater')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(16, 'Plasma')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(17, 'LCD')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(18, 'Alisador de Pelo')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(19, 'Secador de Pelo')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(20, 'Camara Digital')
GO
INSERT INTO TipoArticulo(IdTipoArticulo, Descripcion)
  VALUES(21, 'Camara Video')
GO

SET IDENTITY_INSERT TipoArticulo OFF
GO

--*************************************************

set IDENTITY_INSERT PrecioGarantia ON
GO

INSERT INTO PrecioGarantia(IdPrecioGarantia, ValorRevision, ValorReparacion)
  VALUES(1, 10500, 18000)
GO
INSERT INTO PrecioGarantia(IdPrecioGarantia, ValorRevision, ValorReparacion)
  VALUES(2, 11600, 20000)
GO
INSERT INTO PrecioGarantia(IdPrecioGarantia, ValorRevision, ValorReparacion)
  VALUES(3, 7000, 10000)
GO
INSERT INTO PrecioGarantia(IdPrecioGarantia, ValorRevision, ValorReparacion)
  VALUES(4, 6900, 12000)
GO
SET IDENTITY_INSERT PrecioGarantia OFF
GO

--*************************************************

SET IDENTITY_INSERT Estado ON
GO

INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(1, 'Ingresado')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(2, 'Asignado')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(3, 'En Revisión')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(4, 'En Reparación')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(5, 'Reparado')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(6, 'Entregado')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(7, 'Pendiente ')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(8, 'Sin Garantia')
GO
INSERT INTO Estado(IdEstado, Descripcion)
  VALUES(9, 'Anulado')
GO


SET IDENTITY_INSERT Estado OFF
GO

--*************************************************

SET IDENTITY_INSERT Categoria ON
GO

INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(1, 'Fotografia/Video')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(2, 'Audio Mayor')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(3, 'Audio Menor')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(4, 'Audio Medio')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(5, 'Televisión 14''''')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(6, 'Televisión 21''''')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(7, 'Pantalla 32''''')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(8, 'Video Juegos')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(9, 'Computación')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(10, 'Televisión 29''''')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(11, 'Pantalla 42''''')
GO
INSERT INTO Categoria(IdCategoria, Descripcion)
  VALUES(12, 'Electrodoméstico Pequeño')
GO

SET IDENTITY_INSERT Categoria OFF
GO

--*************************************************

SET IDENTITY_INSERT Nivel ON
GO

INSERT INTO Nivel(IdNivel, Descripcion)
  VALUES(1, 'Básico')
GO
INSERT INTO Nivel(IdNivel, Descripcion)
  VALUES(2, 'Medio')
GO
INSERT INTO Nivel(IdNivel, Descripcion)
  VALUES(3, 'Avanzado')
GO

SET IDENTITY_INSERT Nivel OFF
GO
--*************************************************

SET IDENTITY_INSERT Marca ON
GO

INSERT INTO Marca(IdMarca, Descripcion)
  VALUES(1, 'Sony ')
GO
INSERT INTO Marca(IdMarca, Descripcion)
  VALUES(2, 'Philips')
GO
INSERT INTO Marca(IdMarca, Descripcion)
  VALUES(3, 'Lg')
GO
INSERT INTO Marca(IdMarca, Descripcion)
  VALUES(4, 'Samsung')
GO
INSERT INTO Marca(IdMarca, Descripcion)
  VALUES(5, 'Recco')
GO

SET IDENTITY_INSERT Marca OFF
GO

--*************************************************

SET IDENTITY_INSERT Linea ON
GO

INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(1, 'Bravia')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(2, 'Walkman')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(3, 'Festa')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(4, 'Googear')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(5, 'Genezis')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(6, 'Cyber Shot')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(7, 'Handycam')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(8, 'Vaio')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(9, 'Xplod')
GO
INSERT INTO Linea(IdLinea, Descripcion)
  VALUES(10, 'Trinitron')
GO

SET IDENTITY_INSERT Linea OFF
GO

INSERT INTO dbo.Region(Id, Nombre)
  VALUES(1, 'Región de Tarapacá')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(2, 'Región de Antofagasta')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(3, 'Región de Atacama')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(4, 'Región de Coquimbo')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(5, 'Región de Valparaiso')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(6, 'Región del Libertador General Bernardo O Higgins')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(7, 'Región del Maule')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(8, 'Región del Bío-Bío')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(9, 'Región del Araucanía')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(10, 'Región de los Lagos')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(11, 'Región de Aysén del General Carlos Ibáñez del Campo')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(12, 'Región de Magallanes y la Antartica Chilena')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(13, 'Región Metropolitana')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(14, 'Región de los Ríos')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(15, 'Región de Arica y Parinacota')
GO


INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(1, 1, 'Iquique')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(2, 2, 'Tocopilla')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(3, 2, 'El Loa')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(4, 2, 'Antofagasta')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(5, 3, 'Chañaral')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(6, 3, 'Copiapó')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(7, 3, 'Huasco')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(8, 4, 'Elqui')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(9, 4, 'Limarí')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(10, 4, 'Choapa')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(11, 5, 'Valparaiso')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(12, 5, 'Petorca')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(13, 5, 'Los Andes')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(14, 5, 'San Felipe de Aconcagua')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(15, 5, 'Quillota')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(16, 5, 'San Antonio')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(17, 5, 'Isla de Pascua')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(18, 6, 'Cachapoal')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(19, 6, 'Colchagua')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(20, 6, 'Cardenal Caro')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(21, 7, 'Curicó')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(22, 7, 'Talca')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(23, 7, 'Linares')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(24, 7, 'Cauquenes')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(25, 8, 'Ñuble')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(26, 8, 'Bio Bio')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(27, 8, 'Concepción')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(28, 8, 'Arauco')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(29, 9, 'Malleco')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(30, 9, 'Cautin')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(31, 10, 'Valdivia')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(32, 10, 'Osorno')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(33, 10, 'Llanquihue')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(34, 10, 'Chiloé')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(35, 10, 'Palena')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(36, 11, 'Capitán Prat')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(37, 11, 'Aysen')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(38, 11, 'Coihaique')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(39, 11, 'General Carrera')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(40, 12, 'Ultima Esperanza')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(41, 12, 'Magallanes')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(42, 12, 'Tierra del Fuego')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(43, 12, 'Antartica Chilena')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(44, 13, 'Cordillera')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(45, 13, 'Chacabuco')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(46, 13, 'Maipo')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(47, 13, 'Melipilla')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(48, 13, 'Santiago')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(49, 13, 'Talagante')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(50, 14, 'Valdivia')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(51, 14, 'Ranco')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(52, 15, 'Arica')
GO
INSERT INTO dbo.Provincia(Id, IdRegion, nombre)
  VALUES(53, 15, 'Parinacota')
GO





INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(1, 1, 'Iquique')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(2, 1, 'Alto Hospicio')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(3, 1, 'Huara')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(4, 1, 'Camiña')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(5, 1, 'Colchane')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(6, 1, 'Pica')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(7, 1, 'Pozo Almonte')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(8, 2, 'Tocopilla')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(9, 2, 'Maria Elena')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(10, 3, 'Calama')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(11, 3, 'Ollague')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(12, 3, 'San Pedro de Atacama')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(13, 4, 'Antofagasta')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(14, 4, 'Mejillones')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(15, 4, 'Sierra Gorda')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(16, 4, 'Taltal')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(17, 5, 'Chañaral')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(18, 5, 'Diego de Almagro')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(19, 6, 'Copiapó')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(20, 6, 'Caldera')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(21, 6, 'Tierra Amarilla')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(22, 7, 'Vallenar')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(23, 7, 'Freirina')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(24, 7, 'Huasco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(25, 7, 'Alto del Carmen')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(26, 8, 'La Serena')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(27, 8, 'La Higuera')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(28, 8, 'Coquimbo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(29, 8, 'Andacollo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(30, 8, 'Vicuña')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(31, 8, 'Paihuano')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(32, 9, 'Ovalle')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(33, 9, 'Riio Hurtado')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(34, 9, 'Monte Patria')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(35, 9, 'Combarbalá')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(36, 9, 'Punitaqui')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(37, 10, 'Illapel')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(38, 10, 'Salamanca')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(39, 10, 'Los Vilos')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(40, 10, 'Canela')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(41, 11, 'Valparaíso')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(42, 11, 'Casablanca')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(43, 11, 'Concon')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(44, 11, 'Juan Fernández')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(45, 11, 'Puchuncavi')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(46, 11, 'Quilpué')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(47, 11, 'Quintero')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(48, 11, 'Viña del Mar')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(49, 12, 'Petorca')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(50, 12, 'La Ligua')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(51, 12, 'Cabildo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(52, 12, 'Papudo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(53, 12, 'Zapallar')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(54, 13, 'Los Andes')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(55, 13, 'San Esteban')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(56, 13, 'Calle Larga')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(57, 13, 'Rinconada')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(58, 14, 'San Felipe')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(59, 14, 'Catemu')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(60, 14, 'Llay Llay')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(61, 14, 'Panquehue')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(62, 14, 'Putaendo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(63, 14, 'Santa Maria')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(64, 15, 'Quillota')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(65, 15, 'Calera')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(66, 15, 'Hijuelas')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(67, 15, 'Limache')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(68, 15, 'La Cruz')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(69, 15, 'Nogales')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(70, 15, 'Olmué')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(71, 16, 'San Antonio')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(72, 16, 'Algarrobo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(73, 16, 'Cartagena')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(74, 16, 'El Quisco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(75, 16, 'El Tabo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(76, 16, 'Santo Domingo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(77, 17, 'Isla de Pascua')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(78, 18, 'Rancagua')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(79, 18, 'Codegua')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(80, 18, 'Coinco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(81, 18, 'Coltauco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(82, 18, 'Doñihue')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(83, 18, 'Graneros')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(84, 18, 'Las Cabras')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(85, 18, 'Mostazal')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(86, 18, 'Machali')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(87, 18, 'Malloa')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(88, 18, 'Olivar')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(89, 18, 'Peumo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(90, 18, 'Pichidegua')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(91, 18, 'Quinta de Tilcoco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(92, 18, 'Rengo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(93, 18, 'Requinoa')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(94, 18, 'San Vicente')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(95, 19, 'San Fernando')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(96, 19, 'Chépica')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(97, 19, 'Chimbarongo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(98, 19, 'Lolol')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(99, 19, 'Nancagua')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(100, 19, 'Palmilla')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(101, 19, 'Peralillo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(102, 19, 'Placilla')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(103, 19, 'Pumanque')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(104, 19, 'Santa Cruz')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(105, 20, 'Pichilemu')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(106, 20, 'La Estrella')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(107, 20, 'Litueche')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(108, 20, 'Marchihue')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(109, 20, 'Navidad')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(110, 20, 'Paredones')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(111, 21, 'Curicó')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(112, 21, 'Teno')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(113, 21, 'Romeral')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(114, 21, 'Molina')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(115, 21, 'Sagrada Familia')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(116, 21, 'Hualañé')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(117, 21, 'Licantén')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(118, 21, 'Vichuquén')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(119, 21, 'Rauco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(120, 22, 'Talca')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(121, 22, 'Pelarco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(122, 22, 'Rio Claro')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(123, 22, 'San Clemente')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(124, 22, 'Maule')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(125, 22, 'San Rafael')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(126, 22, 'Empedrado')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(127, 22, 'Pencahue')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(128, 22, 'Constitucion')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(129, 22, 'Curepto')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(130, 23, 'Linares')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(131, 23, 'Yerbas Buenas')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(132, 23, 'Colbún')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(133, 23, 'Longavi')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(134, 23, 'Parral')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(135, 23, 'Retiro')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(136, 23, 'Villa Alegre')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(137, 23, 'San Javier')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(138, 24, 'Cauquenes')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(139, 24, 'Pelluhue')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(140, 24, 'Chanco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(141, 25, 'Chillán')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(142, 25, 'Bulnes')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(143, 25, 'Chillan Viejo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(144, 25, 'Cobquecura')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(145, 25, 'Coelemu')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(146, 25, 'Coihueco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(147, 25, 'El Carmen')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(148, 25, 'Ninhue')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(149, 25, 'Ñiquén')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(150, 25, 'Pemuco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(151, 25, 'Pinto')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(152, 25, 'Portezuelo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(153, 25, 'Quillón')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(154, 25, 'Quirihue')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(155, 25, 'Ranquil')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(156, 25, 'San Carlos')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(157, 25, 'San Fabián')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(158, 25, 'San Ignacio')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(159, 25, 'San Nicolás')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(160, 25, 'Trehuaco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(161, 25, 'Yungay')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(162, 26, 'Los Angeles')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(163, 26, 'Alto Bio Bio')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(164, 26, 'Antuco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(165, 26, 'Cabrero')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(166, 26, 'Laja')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(167, 26, 'Mulchén')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(168, 26, 'Nacimiento')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(169, 26, 'Negrete')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(170, 26, 'Quilaco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(171, 26, 'Quilleco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(172, 26, 'Santa Bárbara')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(173, 26, 'San Rosendo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(174, 26, 'Tucapel')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(175, 26, 'Yumbel')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(176, 27, 'Concepción')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(177, 27, 'Chiguayante')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(178, 27, 'Coronel')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(179, 27, 'Florida')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(180, 27, 'Hualpén')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(181, 27, 'Hualqui')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(182, 27, 'Lota')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(183, 27, 'Penco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(184, 27, 'San Pedro de la Paz')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(185, 27, 'Santa Juana')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(186, 27, 'Talcahuano')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(187, 27, 'Tomé')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(188, 28, 'Arauco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(189, 28, 'Cañete')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(190, 28, 'Contulmo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(191, 28, 'Curanilahue')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(192, 28, 'Lebu')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(193, 28, 'Los Alamos')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(194, 28, 'Tirua')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(195, 29, 'Angol')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(196, 29, 'Collipulli')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(197, 29, 'Curacautin')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(198, 29, 'Ercilla')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(199, 29, 'Lonquimay')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(200, 29, 'Los Sauces')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(201, 29, 'Lumaco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(202, 29, 'Purén')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(203, 29, 'Renaico')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(204, 29, 'Traiguén')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(205, 29, 'Victoria')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(206, 30, 'Temuco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(207, 30, 'Carahue')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(208, 30, 'Cholchol')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(209, 30, 'Cunco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(210, 30, 'Curarrehue')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(211, 30, 'Freire')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(212, 30, 'Galvarino')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(213, 30, 'Gorbea')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(214, 30, 'Lautaro')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(215, 30, 'Loncoche')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(216, 30, 'Melipeuco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(217, 30, 'Nueva Imperial')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(218, 30, 'Padre las Casas')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(219, 30, 'Perquenco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(220, 30, 'Pitrufquén')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(221, 30, 'Pucón')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(222, 30, 'Saavedra')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(223, 30, 'Teodoro Schmidt')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(224, 30, 'Toltén')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(225, 30, 'Vilcún')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(226, 30, 'Villarrica')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(227, 31, 'Valdivia')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(228, 31, 'Corral')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(229, 31, 'Futrono')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(230, 31, 'La Unión')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(231, 31, 'Lago Ranco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(232, 31, 'Lanco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(233, 31, 'Los Lagos')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(234, 31, 'Máfil')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(235, 31, 'Mariquina')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(236, 31, 'Paillaco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(237, 31, 'Panguipulli')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(238, 31, 'Rio Bueno')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(239, 32, 'Osorno')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(240, 32, 'Puerto Octay')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(241, 32, 'Purranque')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(242, 32, 'Puyehue')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(243, 32, 'Rio Negro')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(244, 32, 'San Juan de la Costa')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(245, 33, 'San Pablo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(246, 33, 'Calbuco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(247, 33, 'Cochamó')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(248, 33, 'Fresia')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(249, 33, 'Frutillar')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(250, 33, 'Los Muermos')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(251, 33, 'Llanquihue')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(252, 33, 'Maullin')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(253, 33, 'Puerto Montt')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(254, 33, 'Puerto Varas')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(255, 34, 'Ancud')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(256, 34, 'Castro')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(257, 34, 'Curaco de Vélez')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(258, 34, 'Chonchi')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(259, 34, 'Dalcahue')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(260, 34, 'Puqueldón')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(261, 34, 'Queilén')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(262, 34, 'Quellón')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(263, 34, 'Quemchi')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(264, 34, 'Quinchao')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(265, 35, 'Chaitén')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(266, 35, 'Futaleufú')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(267, 35, 'Hualaihué')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(268, 35, 'Palena')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(269, 36, 'Cachrane')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(270, 36, 'O''Higgins')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(271, 36, 'Tortel')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(272, 37, 'Aysén')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(273, 37, 'Cisnes')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(274, 37, 'Guaitecas')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(275, 38, 'Coyhaique')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(276, 38, 'Lago Verde')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(277, 39, 'Chile Chico')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(278, 39, 'Rio Ibañez')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(279, 40, 'Natales')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(280, 40, 'Torres del Paine')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(281, 41, 'Punta Arenas')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(282, 41, 'Rio Verde')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(283, 41, 'Laguna Blanca')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(284, 41, 'San Gregorio')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(285, 42, 'Porvenir')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(286, 42, 'Primavera')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(287, 42, 'Timaukel')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(288, 43, 'Navarino')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(289, 43, 'Antartica')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(290, 44, 'Pirque')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(291, 44, 'San José de Maipo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(292, 44, 'Puente Alto')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(293, 45, 'Colina')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(294, 45, 'Lampa')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(295, 45, 'Til-Til')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(296, 46, 'Paine')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(297, 46, 'Buín')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(298, 46, 'San Bernardo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(299, 46, 'Calera de Tango')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(300, 47, 'Alhué')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(301, 47, 'Curacaví')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(302, 47, 'San Pedro')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(303, 47, 'María Pinto')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(304, 47, 'Melipilla')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(305, 48, 'Cerrillos')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(306, 48, 'Cerro Navia')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(307, 48, 'Estación Central')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(308, 48, 'Conchalí')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(309, 48, 'El Bosque')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(310, 48, 'Huechuraba')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(311, 48, 'Independencia')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(312, 48, 'La Cisterna')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(313, 48, 'La Granja')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(314, 48, 'La Florida')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(315, 48, 'La Pintana')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(316, 48, 'Las Condes')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(317, 48, 'Lo Barnechea')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(318, 48, 'La Reina')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(319, 48, 'Lo Espejo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(320, 48, 'Lo Prado')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(321, 48, 'Maipú')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(322, 48, 'Macul')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(323, 48, 'Pedro Aguirre Cerda')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(324, 48, 'Ñuñoa')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(325, 48, 'Peñalolén')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(326, 48, 'Providencia')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(327, 48, 'Pudahuel')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(328, 48, 'Quilicura')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(329, 48, 'Renca')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(330, 48, 'Recoleta')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(331, 48, 'Quinta Normal')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(332, 48, 'San Ramón')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(333, 48, 'San Joaquín')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(334, 48, 'San Miguel')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(335, 48, 'Santiago')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(336, 48, 'Vitacura')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(337, 49, 'Isla de Maipo')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(338, 49, 'Padre Hurtado')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(339, 49, 'Peñaflor')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(340, 49, 'El Monte')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(341, 49, 'Talagante')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(342, 50, 'Valdivia')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(343, 50, 'Corral')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(344, 50, 'Lanco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(345, 50, 'Los Lagos')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(346, 50, 'Mafil')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(347, 50, 'Mariquina')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(348, 50, 'Paillaco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(349, 50, 'Panguipulli')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(350, 51, 'La Union')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(351, 51, 'Futrono')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(352, 51, 'Lago Ranco')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(353, 51, 'Rio Bueno')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(354, 52, 'Arica')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(355, 52, 'Camarones')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(356, 53, 'Putre')
GO
INSERT INTO dbo.Comuna(Id, IdProvincia, Nombre)
  VALUES(357, 53, 'General Lagos')

SET IDENTITY_INSERT [dbo].[Modulos] ON
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(1, 'OrdenTrabajo', 'Orden de Trabajo')
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(2, 'Admin', 'Administración de Sistema')
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(3, 'AreaTecnica','Area Tecnica')
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(4, 'Administrativos', 'Administrativos')
GO
INSERT INTO [dbo].[Modulos]([Id], [NombreModulo], [DescripcionOpcion])
  VALUES(5, 'Gerencia', 'Informes')
GO
SET IDENTITY_INSERT [dbo].[Modulos] OFF
SET IDENTITY_INSERT [dbo].[Permisos] ON
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(1, 1, 'ordenes_crear', 'Crear')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(2, 1, 'ordenes_consulta', 'Consulta')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(3, 1, 'ordenes_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(4, 1, 'clientes_crear', 'Crear')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(5, 1, 'clientes_consulta', 'Consulta')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(6, 1, 'clientes_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(7, 1, 'articulo_crear', 'Crear')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(8, 1, 'articulo_consulta', 'Consulta')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(9, 1, 'articulo_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(10, 4, 'ordenes_ingresadas', 'Ingresadas')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(11, 4, 'ordenes_pendientes', 'Pendientes')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(12, 4, 'ordenes_consulta', 'Consulta')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(13, 4, 'asignacion_manual', 'Manual')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(14, 4, 'asignacion_automatica', 'Automatica')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(15, 3, 'ordenes_asignadas', 'Asignadas')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(16, 3, 'ordenes_pendientes', 'Pendientes')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(17, 3, 'ordenes_consulta', 'Consulta')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(18, 3, 'articulo_consulta', 'Consulta')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(19, 3, 'articulo_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(20, 5, 'informes_ordenes', 'Ordenes')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(21, 5, 'informes_tecnicos', 'Tecnicos')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(22, 2, 'usuarios_crear', 'Crear')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(23, 2, 'usuarios_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(24, 2, 'permisos_crear', 'Crear')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(25, 2, 'permisos_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(26, 2, 'perfiles_listar', 'Listar')
GO
INSERT INTO [dbo].[Permisos]("Id", "Mod_Id", "Opcion", "DescripcionOpcion")
  VALUES(27, 2, 'sistema_configuracio', 'Configuracion')
GO
SET IDENTITY_INSERT [dbo].[Permisos] OFF
GO

--*******************************PERFILPERMISO ********************************

SET IDENTITY_INSERT [dbo].[PerfilPermiso] ON
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(1, 1, 1, 15)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(2, 1, 1, 16)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(3, 1, 1, 17)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(4, 1, 1, 18)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(5, 1, 1, 19)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(6, 2, 1, 1)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(7, 2, 1, 2)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(8, 2, 1, 3)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(9, 2, 1, 4)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(10, 2, 1, 5)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(11, 2, 1, 6)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(12, 2, 1, 7)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(13, 2, 1, 8)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(14, 2, 1, 9)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(15, 3, 1, 1)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(16, 3, 1, 2)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(17, 3, 1, 3)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(18, 3, 1, 4)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(19, 3, 1, 5)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(20, 3, 1, 6)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(21, 3, 1, 7)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(22, 3, 1, 8)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(23, 3, 1, 9)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(24, 3, 1, 10)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(25, 3, 1, 11)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(26, 3, 1, 12)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(27, 3, 1, 13)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(28, 3, 1, 14)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(29, 4, 1, 27)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(30, 4, 1, 26)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(31, 4, 1, 25)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(32, 4, 1, 24)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(33, 4, 1, 23)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(34, 4, 1, 22)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(35, 5, 1, 1)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(36, 5, 1, 2)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(37, 5, 1, 3)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(38, 5, 1, 4)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(39, 5, 1, 5)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(40, 5, 1, 6)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(41, 5, 1, 7)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(42, 5, 1, 9)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(43, 5, 1, 8)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(44, 5, 1, 11)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(45, 5, 1, 10)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(46, 5, 1, 12)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(47, 5, 1, 14)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(48, 5, 1, 13)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(49, 5, 1, 13)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(50, 5, 1, 15)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(51, 5, 1, 16)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(52, 5, 1, 16)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(53, 5, 1, 17)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(54, 5, 1, 18)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(55, 5, 1, 18)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(56, 5, 1, 19)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(57, 5, 1, 20)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(58, 5, 1, 21)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(59, 5, 1, 22)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(60, 5, 1, 22)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(61, 5, 1, 23)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(62, 5, 1, 24)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(63, 5, 1, 25)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(64, 5, 1, 26)
GO
INSERT INTO [dbo].[PerfilPermiso]("Id", "IdPerfil", "Estado", "IdPermiso")
  VALUES(65, 5, 1, 27)
GO
SET IDENTITY_INSERT [dbo].[PerfilPermiso] OFF
GO

CREATE PROCEDURE [dbo].[PermisosDispPerfil]
@idPerfil int

AS

select *
from Permisos where  not Id  in( select IdPermiso from PerfilPermiso
where IdPerfil = @idPerfil)
GO

CREATE PROCEDURE [dbo].[PermisosDispUsuario]
@idPerfil int,@idUsusario int

AS

select *
from Permisos where  not Id  in( select IdPermiso from PerfilPermiso
where IdPerfil = @idPerfil) and not Id in (select IdPermiso from UsuarioPermisos where IdUsuario = @idUsusario)  


GO

SET IDENTITY_INSERT [dbo].[Usuario] ON
GO
INSERT INTO [dbo].[Usuario]([Id], [User], [Password], [PerfilUsuario], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Email], [Rut], [Telefono], [Activo])
  VALUES(1, N'sistema', N'sistema', 6, N'sistema', N'sistema', N'sistema', N'sistema', 0, N'0', 1)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO

INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(1, 'SERVICIO TÉCNICO', 'Nombre de empresa')
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
  VALUES(6, '10', 'Asignación Automatica: Número maximo de ordenes en estado reparacion')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(7, 'true,false', 'Asignación Automatica: Selecciona por mejor nivel')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(8, 'true', 'Asignación Automatica: Solo seleccionar tecnicos especialistas')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(9, 'true,false', 'Asignación Automatica: Seleccionar a más desocupado si no existe ningun tecnico segun el criterio o dejar sin asignacion')
GO
INSERT INTO [dbo].[Configuracion]([Id], [Valor], [Descripcion])
  VALUES(10, 'true,false', 'Mostrar Logo')
GO

CREATE VIEW [dbo].[OrdenTrabajoVista]
AS
SELECT     o.Id, (CASE c.TipoCliente WHEN 1 THEN
                          (SELECT     cp.Nombre + ' ' + cp.ApellidoPaterno
                            FROM          ClienteParticular AS cp
                            WHERE      cp.Id = c.Id) WHEN 2 THEN
                          (SELECT     cc.RazonSocial + ' ' + cc.Sucursal
                            FROM          ClienteComercial AS cc
                            WHERE      cc.RazonSocial = c.Id) END) AS Nombre, (CASE c.TipoCliente WHEN 1 THEN
                          (SELECT     cp.Rut
                            FROM          ClienteParticular AS cp
                            WHERE      cp.Id = c.Id) WHEN 2 THEN
                          (SELECT     cc.Rut
                            FROM          ClienteComercial AS cc
                            WHERE      cc.RazonSocial = c.Id) END) AS Rut, a.Modelo,
                          (SELECT     Descripcion
                            FROM          dbo.Marca
                            WHERE      (IdMarca = a.Marca)) AS Marca,
                          (SELECT     Descripcion
                            FROM          dbo.Linea
                            WHERE      (IdLinea = a.Linea)) AS Linea,
                          (SELECT     Descripcion
                            FROM          dbo.TipoArticulo
                            WHERE      (IdTipoArticulo = a.TipoArticulo)) AS TipoArticulo,
                          (SELECT     Descripcion
                            FROM          dbo.Categoria
                            WHERE      (IdCategoria = a.Categoria)) AS Categoria,
                          (SELECT     ValorReparacion
                            FROM          dbo.PrecioGarantia
                            WHERE      (IdPrecioGarantia = a.PrecioGarantia)) AS ValorReparacion,
                          (SELECT     ValorRevision
                            FROM          dbo.PrecioGarantia AS PrecioGarantia_1
                            WHERE      (IdPrecioGarantia = a.PrecioGarantia)) AS ValorRevision, o.Serie, o.Falla, o.CondicionArticulo, o.FechaIngreso, o.FechaEntrega, o.TipoOrden,
                          (SELECT     Descripcion
                            FROM          dbo.TipoOrden
                            WHERE      (IdTipoOrden = o.TipoOrden)) AS DescripTipoOrden, o.Boleta, o.Poliza, o.FechaCompra, o.LugarCompra, o.Observacion,
                          (SELECT     RTRIM(LTRIM(Valor)) AS Expr1
                            FROM          dbo.Configuracion
                            WHERE      (Id = 1)) AS NombreEmpresa
FROM         dbo.OrdenTrabajo AS o INNER JOIN
                      dbo.Cliente AS c ON c.Id = o.IdCliente INNER JOIN
                      dbo.Articulo AS a ON o.IdArticulo = a.Id

GO


/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     17-11-2009 14:03:08					    	*/
/* User DataBase										 		*/	
/*==============================================================*/


USE [master]
GO
CREATE LOGIN [dba_sigset] WITH PASSWORD=N'sigset', DEFAULT_DATABASE=[sigset], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'bulkadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'dbcreator'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'diskadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'processadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'securityadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'serveradmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'setupadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'sysadmin'
GO
USE [sigset]
GO
CREATE USER [dba_sigset] FOR LOGIN [dba_sigset]
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_accessadmin', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_backupoperator', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_datareader', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_datawriter', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_ddladmin', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_denydatareader', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_denydatawriter', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_owner', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_securityadmin', N'dba_sigset'
GO
