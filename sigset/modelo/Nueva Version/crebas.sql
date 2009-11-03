/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     03-11-2009 15:31:34                          */
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
   Id                   numeric              not null,
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
   IdCategoria          numeric(18, 0)       not null,
   Descripcion          varchar(50)          not null,
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
   Id                   numeric              not null,
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
   Id                   numeric              not null,
   TipoEspecialidad     numeric(18, 0)       not null,
   IdTecnico            int                  null,
   constraint PK_Especialidades_1 primary key (Id)
)
go

/*==============================================================*/
/* Table: Estado                                                */
/*==============================================================*/
create table Estado (
   IdEstado             numeric(18, 0)       not null,
   Descripcion          varchar(20)          not null,
   constraint PK_Estado primary key (IdEstado)
)
go

/*==============================================================*/
/* Table: HistorialModificacionOrden                            */
/*==============================================================*/
create table HistorialModificacionOrden (
   Id                   numeric              not null,
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
   IdLinea              numeric(18, 0)       not null,
   Descripcion          varchar(50)          not null,
   constraint PK_Linea primary key (IdLinea)
)
go

/*==============================================================*/
/* Table: Marca                                                 */
/*==============================================================*/
create table Marca (
   IdMarca              numeric(18, 0)       not null,
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
   IdNivel              numeric(18, 0)       not null,
   Descripcion          varchar(50)          not null,
   constraint PK_Nivel primary key (IdNivel)
)
go

/*==============================================================*/
/* Table: OrdenTrabajo                                          */
/*==============================================================*/
create table OrdenTrabajo (
   IdArticulo           numeric              null,
   Id                   numeric              not null,
   Serie                varchar(50)          not null,
   FechaIngreso         datetime             not null,
   FechaEntrega         datetime             not null,
   Falla                varchar(250)         not null,
   CondicionArticulo    varchar(250)         null,
   Boleta               varchar(50)          null,
   Poliza               varchar(50)          null,
   FechaCompra          datetime             null,
   LugarCompra          varchar(100)         null,
   IdTecnicoAsignado    int                  not null,
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
   Id                   int                  not null,
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
   Id                   numeric              not null,
   Porcentaje           numeric(18, 0)       not null,
   IdPrecio             numeric(18, 0)       not null,
   constraint PK_Porcentaje primary key (Id)
)
go

/*==============================================================*/
/* Table: PrecioGarantia                                        */
/*==============================================================*/
create table PrecioGarantia (
   IdPrecioGarantia     numeric(18, 0)       not null,
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
   IdTipoArticulo       numeric(18, 0)       not null,
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
   IdTipoEspecialidad   numeric(18, 0)       not null,
   Descripcion          varchar(255)         not null,
   constraint PK_Tipo_Especialidad primary key (IdTipoEspecialidad)
)
go

/*==============================================================*/
/* Table: TipoOrden                                             */
/*==============================================================*/
create table TipoOrden (
   IdTipoOrden          numeric(18, 0)       not null,
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
   Id                   int                  not null,
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

