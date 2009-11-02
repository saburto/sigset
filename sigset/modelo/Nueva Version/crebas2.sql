/*
Script generado por Aqua Data Studio 8.0.1 en nov-02-2009 04:52:46 PM
Base de datos: sigset
Esquema: dbo
Objetos: TABLE, PROCEDURE
*/
ALTER TABLE "dbo"."UsuarioPermisos"
	DROP CONSTRAINT "FK_USUARIOP_REFERENCE_USUARIO"
GO
ALTER TABLE "dbo"."UsuarioPermisos"
	DROP CONSTRAINT "FK_USUARIOP_REFERENCE_PERMISOS"
GO
ALTER TABLE "dbo"."Usuario"
	DROP CONSTRAINT "Usuario-TipoUsuario"
GO
ALTER TABLE "dbo"."Tecnicos"
	DROP CONSTRAINT "FK_Tecnicos_Nivel"
GO
ALTER TABLE "dbo"."Tecnicos"
	DROP CONSTRAINT "FK_TECNICOS_REFERENCE_USUARIO"
GO
ALTER TABLE "dbo"."Provincia"
	DROP CONSTRAINT "FK_provincia_region"
GO
ALTER TABLE "dbo"."Porcentaje"
	DROP CONSTRAINT "FK_Porcentaje_Precio_Garantia"
GO
ALTER TABLE "dbo"."Permisos"
	DROP CONSTRAINT "FKPermisos544499"
GO
ALTER TABLE "dbo"."PerfilPermiso"
	DROP CONSTRAINT "FKPerfilPerm713727"
GO
ALTER TABLE "dbo"."PerfilPermiso"
	DROP CONSTRAINT "FKPerfilPerm618277"
GO
ALTER TABLE "dbo"."OrdenTrabajo"
	DROP CONSTRAINT "FK_Orden_Trabajo_Tipo_Orden"
GO
ALTER TABLE "dbo"."OrdenTrabajo"
	DROP CONSTRAINT "FK_Orden_Trabajo_Articulo"
GO
ALTER TABLE "dbo"."OrdenTrabajo"
	DROP CONSTRAINT "FK_ORDENTRA_REFERENCE_TECNICOS"
GO
ALTER TABLE "dbo"."OrdenTrabajo"
	DROP CONSTRAINT "FKOrdenTraba317573"
GO
ALTER TABLE "dbo"."HistorialModificacionOrden"
	DROP CONSTRAINT "FK_Historial_Modificacion_Orden_Orden_Trabajo"
GO
ALTER TABLE "dbo"."Especialidades"
	DROP CONSTRAINT "FK_Especialidades_Tipo_Especialidad"
GO
ALTER TABLE "dbo"."Especialidades"
	DROP CONSTRAINT "FKEspecialid71056"
GO
ALTER TABLE "dbo"."Direccion"
	DROP CONSTRAINT "FK_Direccion_Tipo_Direccion"
GO
ALTER TABLE "dbo"."Direccion"
	DROP CONSTRAINT "FK_Direccion_Region"
GO
ALTER TABLE "dbo"."Direccion"
	DROP CONSTRAINT "FK_Direccion_Comuna"
GO
ALTER TABLE "dbo"."Direccion"
	DROP CONSTRAINT "FK_DIRECCIO_REFERENCE_PROVINCI"
GO
ALTER TABLE "dbo"."Detalle"
	DROP CONSTRAINT "FK_Detalle_Orden_Trabajo"
GO
ALTER TABLE "dbo"."Detalle"
	DROP CONSTRAINT "FK_Detalle_Estado"
GO
ALTER TABLE "dbo"."Detalle"
	DROP CONSTRAINT "FK_DETALLE_REFERENCE_USUARIO"
GO
ALTER TABLE "dbo"."Contacto"
	DROP CONSTRAINT "FK_Contacto_Tipo_Contacto"
GO
ALTER TABLE "dbo"."Contacto"
	DROP CONSTRAINT "FK_CONTACTO_REFERENCE_CLIENTE"
GO
ALTER TABLE "dbo"."ClienteParticular"
	DROP CONSTRAINT "FK_CLIENTEP_REFERENCE_CLIENTE"
GO
ALTER TABLE "dbo"."ClienteComercial"
	DROP CONSTRAINT "FK_CLIENTEC_REFERENCE_CLIENTE"
GO
ALTER TABLE "dbo"."Cliente"
	DROP CONSTRAINT "FK_CLIENTE_REFERENCE_DIRECCIO"
GO
ALTER TABLE "dbo"."Cliente"
	DROP CONSTRAINT "FKCliente740984"
GO
ALTER TABLE "dbo"."Articulo"
	DROP CONSTRAINT "FK_Articulo_Tipo_Articulo"
GO
ALTER TABLE "dbo"."Articulo"
	DROP CONSTRAINT "FK_Articulo_Precio_Garantia"
GO
ALTER TABLE "dbo"."Articulo"
	DROP CONSTRAINT "FK_Articulo_Marca"
GO
ALTER TABLE "dbo"."Articulo"
	DROP CONSTRAINT "FK_Articulo_Linea"
GO
ALTER TABLE "dbo"."Articulo"
	DROP CONSTRAINT "FK_Articulo_Categoria"
GO
ALTER TABLE "dbo"."sysdiagrams"
	DROP CONSTRAINT "UK_principal_name"
GO
DROP PROCEDURE "dbo"."PermisosDispPerfil"
GO
DROP TABLE "dbo"."UsuarioPermisos"
GO
DROP TABLE "dbo"."Usuario"
GO
DROP TABLE "dbo"."TipoOrden"
GO
DROP TABLE "dbo"."TipoEspecialidad"
GO
DROP TABLE "dbo"."TipoDireccion"
GO
DROP TABLE "dbo"."TipoContacto"
GO
DROP TABLE "dbo"."TipoCliente"
GO
DROP TABLE "dbo"."TipoArticulo"
GO
DROP TABLE "dbo"."Tecnicos"
GO
DROP TABLE "dbo"."sysdiagrams"
GO
DROP TABLE "dbo"."Region"
GO
DROP TABLE "dbo"."Provincia"
GO
DROP TABLE "dbo"."PrecioGarantia"
GO
DROP TABLE "dbo"."Porcentaje"
GO
DROP TABLE "dbo"."Permisos"
GO
DROP TABLE "dbo"."PerfilPermiso"
GO
DROP TABLE "dbo"."Perfil"
GO
DROP TABLE "dbo"."OrdenTrabajo"
GO
DROP TABLE "dbo"."Nivel"
GO
DROP TABLE "dbo"."Modulos"
GO
DROP TABLE "dbo"."Marca"
GO
DROP TABLE "dbo"."Linea"
GO
DROP TABLE "dbo"."HistorialModificacionOrden"
GO
DROP TABLE "dbo"."Estado"
GO
DROP TABLE "dbo"."Especialidades"
GO
DROP TABLE "dbo"."Direccion"
GO
DROP TABLE "dbo"."Detalle"
GO
DROP TABLE "dbo"."Contacto"
GO
DROP TABLE "dbo"."Comuna"
GO
DROP TABLE "dbo"."ClienteParticular"
GO
DROP TABLE "dbo"."ClienteComercial"
GO
DROP TABLE "dbo"."Cliente"
GO
DROP TABLE "dbo"."Categoria"
GO
DROP TABLE "dbo"."Articulo"
GO

CREATE TABLE "dbo"."Articulo"  ( 
	"Id"            	numeric(18,0) NOT NULL,
	"Modelo"        	varchar(50) NOT NULL,
	"Observacion"   	nvarchar(255) NULL,
	"Marca"         	numeric(18,0) NOT NULL,
	"TipoArticulo"  	numeric(18,0) NOT NULL,
	"Categoria"     	numeric(18,0) NOT NULL,
	"PrecioGarantia"	numeric(18,0) NULL,
	"Linea"         	numeric(18,0) NULL,
	CONSTRAINT "PK_Articulo" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."Categoria"  ( 
	"IdCategoria"	numeric(18,0) NOT NULL,
	"Descripcion"	varchar(50) NOT NULL,
	CONSTRAINT "PK_Categoria" PRIMARY KEY("IdCategoria")
)
GO
CREATE TABLE "dbo"."Cliente"  ( 
	"Id"         	int NOT NULL,
	"TipoCliente"	int NULL,
	"Observacion"	nvarchar(255) NULL,
	"IdDireccion"	int NULL,
	CONSTRAINT "PK_CLIENTE" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."ClienteComercial"  ( 
	"Id"         	int NOT NULL,
	"Rut"        	int NOT NULL,
	"RazonSocial"	nvarchar(255) NOT NULL,
	"Sucursal"   	nvarchar(255) NOT NULL,
	CONSTRAINT "PK_CLIENTECOMERCIAL" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."ClienteParticular"  ( 
	"Id"             	int NOT NULL,
	"Rut"            	numeric(10,0) NOT NULL,
	"Nombre"         	varchar(50) NOT NULL,
	"ApellidoPaterno"	varchar(50) NOT NULL,
	"ApellidoMaterno"	varchar(50) NULL,
	CONSTRAINT "PK_CLIENTEPARTICULAR" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."Comuna"  ( 
	"Id"         	numeric(3,0) NOT NULL,
	"IdProvincia"	numeric(3,0) NOT NULL,
	"Nombre"     	varchar(255) NOT NULL,
	CONSTRAINT "PK_comuna" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."Contacto"  ( 
	"Id"           	numeric(18,0) NOT NULL,
	"ValorContacto"	varchar(50) NOT NULL,
	"TipoContacto" 	numeric(18,0) NULL,
	"IdCliente"    	int NULL,
	CONSTRAINT "PK_Contacto" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."Detalle"  ( 
	"Id"           	numeric(18,0) NOT NULL,
	"FechaCreacion"	datetime NOT NULL,
	"Contenido"    	varchar(250) NULL,
	"IdOrden"      	numeric(18,0) NULL,
	"Estado"       	numeric(18,0) NOT NULL,
	"IdUsuario"    	int NULL,
	CONSTRAINT "PK_Detalle" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."Direccion"  ( 
	"Id"           	int NOT NULL,
	"Provincia"    	numeric(3,0) NOT NULL,
	"Comuna"       	numeric(3,0) NOT NULL,
	"Calle"        	varchar(250) NOT NULL,
	"Numero"       	varchar(10) NOT NULL,
	"Region"       	numeric(2,0) NOT NULL,
	"TipoDireccion"	numeric(18,0) NOT NULL,
	CONSTRAINT "PK_Direccion" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."Especialidades"  ( 
	"Id"              	numeric(18,0) NOT NULL,
	"TipoEspecialidad"	numeric(18,0) NOT NULL,
	"IdTecnico"       	int NULL,
	CONSTRAINT "PK_Especialidades_1" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."Estado"  ( 
	"IdEstado"   	numeric(18,0) NOT NULL,
	"Descripcion"	varchar(20) NOT NULL,
	CONSTRAINT "PK_Estado" PRIMARY KEY("IdEstado")
)
GO
CREATE TABLE "dbo"."HistorialModificacionOrden"  ( 
	"Id"     	numeric(18,0) NOT NULL,
	"Usuario"	numeric(18,0) NOT NULL,
	"Fecha"  	datetime NOT NULL,
	"Detalle"	varchar(100) NULL,
	"IdOrden"	numeric(18,0) NULL,
	CONSTRAINT "PK_Historial_Modificacion_Orden" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."Linea"  ( 
	"IdLinea"    	numeric(18,0) NOT NULL,
	"Descripcion"	varchar(50) NOT NULL,
	CONSTRAINT "PK_Linea" PRIMARY KEY("IdLinea")
)
GO
CREATE TABLE "dbo"."Marca"  ( 
	"IdMarca"    	numeric(18,0) NOT NULL,
	"Descripcion"	varchar(50) NOT NULL,
	CONSTRAINT "PK_Marca" PRIMARY KEY("IdMarca")
)
GO
CREATE TABLE "dbo"."Modulos"  ( 
	"Id"               	int NOT NULL,
	"NombreModulo"     	nvarchar(255) NOT NULL,
	"DescripcionOpcion"	nvarchar(255) NOT NULL,
	CONSTRAINT "PK_MODULOS" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."Nivel"  ( 
	"IdNivel"    	numeric(18,0) NOT NULL,
	"Descripcion"	varchar(50) NOT NULL,
	CONSTRAINT "PK_Nivel" PRIMARY KEY("IdNivel")
)
GO
CREATE TABLE "dbo"."OrdenTrabajo"  ( 
	"IdArticulo"       	numeric(18,0) NULL,
	"Id"               	numeric(18,0) NOT NULL,
	"Serie"            	varchar(50) NOT NULL,
	"FechaIngreso"     	datetime NOT NULL,
	"FechaEntrega"     	datetime NOT NULL,
	"Falla"            	varchar(250) NOT NULL,
	"CondicionArticulo"	varchar(250) NULL,
	"Boleta"           	varchar(50) NULL,
	"Poliza"           	varchar(50) NULL,
	"FechaCompra"      	datetime NULL,
	"LugarCompra"      	varchar(100) NULL,
	"IdTecnicoAsignado"	int NOT NULL,
	"Observacion"      	nvarchar(255) NULL,
	"TipoOrden"        	numeric(18,0) NULL,
	"IdCliente"        	int NULL,
	CONSTRAINT "PK_Orden_Trabajo" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."Perfil"  ( 
	"Id"         	int IDENTITY(1,1) NOT NULL,
	"Descripcion"	nvarchar(255) NOT NULL,
	CONSTRAINT "PK_Tipo_Usuario" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."PerfilPermiso"  ( 
	"Id"       	int IDENTITY(1,1) NOT NULL,
	"IdPerfil" 	int NOT NULL,
	"Estado"   	bit NOT NULL,
	"IdPermiso"	int NOT NULL,
	CONSTRAINT "PK_PERFILPERMISO" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."Permisos"  ( 
	"Id"               	int IDENTITY(1,1) NOT NULL,
	"Mod_Id"           	int NULL,
	"Opcion"           	nvarchar(255) NOT NULL,
	"DescripcionOpcion"	nvarchar(255) NOT NULL,
	CONSTRAINT "PK_PERMISOS" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."Porcentaje"  ( 
	"Id"        	numeric(18,0) NOT NULL,
	"Porcentaje"	numeric(18,0) NOT NULL,
	"IdPrecio"  	numeric(18,0) NOT NULL,
	CONSTRAINT "PK_Porcentaje" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."PrecioGarantia"  ( 
	"IdPrecioGarantia"	numeric(18,0) NOT NULL,
	"ValorRevision"   	numeric(18,0) NOT NULL,
	"ValorReparacion" 	numeric(18,0) NOT NULL,
	CONSTRAINT "PK_Precio_Garantia" PRIMARY KEY("IdPrecioGarantia")
)
GO
CREATE TABLE "dbo"."Provincia"  ( 
	"Id"      	numeric(3,0) NOT NULL,
	"nombre"  	varchar(255) NOT NULL,
	"IdRegion"	numeric(2,0) NOT NULL,
	CONSTRAINT "PK_provincia" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."Region"  ( 
	"Id"    	numeric(2,0) NOT NULL,
	"Nombre"	varchar(250) NOT NULL,
	CONSTRAINT "PK__Region__1AD3FDA4" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."sysdiagrams"  ( 
	"name"        	sysname NOT NULL,
	"principal_id"	int NOT NULL,
	"diagram_id"  	int IDENTITY(1,1) NOT NULL,
	"version"     	int NULL,
	"definition"  	varbinary(max) NULL,
	CONSTRAINT "PK__sysdiagrams__656C112C" PRIMARY KEY("diagram_id")
)
GO
CREATE TABLE "dbo"."Tecnicos"  ( 
	"Id"   	int NOT NULL,
	"Nivel"	numeric(18,0) NOT NULL,
	CONSTRAINT "PK_Tecnicos" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."TipoArticulo"  ( 
	"IdTipoArticulo"	numeric(18,0) NOT NULL,
	"Descripcion"   	varchar(50) NOT NULL,
	CONSTRAINT "PK_Tipo_Articulo" PRIMARY KEY("IdTipoArticulo")
)
GO
CREATE TABLE "dbo"."TipoCliente"  ( 
	"Id"         	int IDENTITY(1,1) NOT NULL,
	"Descripcion"	nvarchar(100) NOT NULL,
	CONSTRAINT "PK_TIPOCLIENTE" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."TipoContacto"  ( 
	"IdTipoContacto"	numeric(18,0) NOT NULL,
	"Descripcion"   	varchar(50) NOT NULL,
	CONSTRAINT "PK_Tipo_Contacto" PRIMARY KEY("IdTipoContacto")
)
GO
CREATE TABLE "dbo"."TipoDireccion"  ( 
	"IdTipoDireccion"	numeric(18,0) NOT NULL,
	"Descripcion"    	varchar(50) NOT NULL,
	CONSTRAINT "PK_Tipo_Direccion" PRIMARY KEY("IdTipoDireccion")
)
GO
CREATE TABLE "dbo"."TipoEspecialidad"  ( 
	"IdTipoEspecialidad"	numeric(18,0) NOT NULL,
	"Descripcion"       	varchar(255) NOT NULL,
	CONSTRAINT "PK_Tipo_Especialidad" PRIMARY KEY("IdTipoEspecialidad")
)
GO
CREATE TABLE "dbo"."TipoOrden"  ( 
	"IdTipoOrden"	numeric(18,0) NOT NULL,
	"Descripcion"	varchar(50) NOT NULL,
	CONSTRAINT "PK_Tipo_Orden" PRIMARY KEY("IdTipoOrden")
)
GO
CREATE TABLE "dbo"."Usuario"  ( 
	"Id"             	int IDENTITY(1,1) NOT NULL,
	"User"           	nvarchar(255) NOT NULL,
	"Password"       	nvarchar(255) NOT NULL,
	"PerfilUsuario"  	int NOT NULL,
	"Nombres"        	nvarchar(100) NOT NULL,
	"ApellidoPaterno"	nvarchar(50) NOT NULL,
	"ApellidoMaterno"	nvarchar(50) NOT NULL,
	"Email"          	nvarchar(50) NULL,
	"Rut"            	int NOT NULL,
	"Telefono"       	nvarchar(20) NULL,
	"Activo"         	bit NOT NULL,
	CONSTRAINT "PK_USUARIO" PRIMARY KEY("Id")
)
GO
CREATE TABLE "dbo"."UsuarioPermisos"  ( 
	"Id"       	int NOT NULL,
	"IdUsuario"	int NOT NULL,
	"IdPermiso"	int NULL,
	"Estado"   	bit NOT NULL,
	CONSTRAINT "PK_USUARIOPERMISOS" PRIMARY KEY("Id")
)
GO
CREATE PROCEDURE "dbo"."PermisosDispPerfil"
@idPerfil int

AS

select *
from Permisos
where  not Id  in(
select IdPermiso
from PerfilPermiso
where IdPerfil = @idPerfil
)

GO

ALTER TABLE "dbo"."sysdiagrams"
	ADD CONSTRAINT "UK_principal_name"
	UNIQUE ("principal_id", "name")
GO
ALTER TABLE "dbo"."Articulo"
	ADD CONSTRAINT "FK_Articulo_Tipo_Articulo"
	FOREIGN KEY("TipoArticulo")
	REFERENCES "dbo"."TipoArticulo"("IdTipoArticulo")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Articulo"
	ADD CONSTRAINT "FK_Articulo_Precio_Garantia"
	FOREIGN KEY("PrecioGarantia")
	REFERENCES "dbo"."PrecioGarantia"("IdPrecioGarantia")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Articulo"
	ADD CONSTRAINT "FK_Articulo_Marca"
	FOREIGN KEY("Marca")
	REFERENCES "dbo"."Marca"("IdMarca")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Articulo"
	ADD CONSTRAINT "FK_Articulo_Linea"
	FOREIGN KEY("Linea")
	REFERENCES "dbo"."Linea"("IdLinea")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Articulo"
	ADD CONSTRAINT "FK_Articulo_Categoria"
	FOREIGN KEY("Categoria")
	REFERENCES "dbo"."Categoria"("IdCategoria")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Cliente"
	ADD CONSTRAINT "FK_CLIENTE_REFERENCE_DIRECCIO"
	FOREIGN KEY("IdDireccion")
	REFERENCES "dbo"."Direccion"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."Cliente"
	ADD CONSTRAINT "FKCliente740984"
	FOREIGN KEY("TipoCliente")
	REFERENCES "dbo"."TipoCliente"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."ClienteComercial"
	ADD CONSTRAINT "FK_CLIENTEC_REFERENCE_CLIENTE"
	FOREIGN KEY("Id")
	REFERENCES "dbo"."Cliente"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."ClienteParticular"
	ADD CONSTRAINT "FK_CLIENTEP_REFERENCE_CLIENTE"
	FOREIGN KEY("Id")
	REFERENCES "dbo"."Cliente"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."Contacto"
	ADD CONSTRAINT "FK_Contacto_Tipo_Contacto"
	FOREIGN KEY("TipoContacto")
	REFERENCES "dbo"."TipoContacto"("IdTipoContacto")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Contacto"
	ADD CONSTRAINT "FK_CONTACTO_REFERENCE_CLIENTE"
	FOREIGN KEY("IdCliente")
	REFERENCES "dbo"."Cliente"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."Detalle"
	ADD CONSTRAINT "FK_Detalle_Orden_Trabajo"
	FOREIGN KEY("IdOrden")
	REFERENCES "dbo"."OrdenTrabajo"("Id")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Detalle"
	ADD CONSTRAINT "FK_Detalle_Estado"
	FOREIGN KEY("Estado")
	REFERENCES "dbo"."Estado"("IdEstado")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Detalle"
	ADD CONSTRAINT "FK_DETALLE_REFERENCE_USUARIO"
	FOREIGN KEY("IdUsuario")
	REFERENCES "dbo"."Usuario"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."Direccion"
	ADD CONSTRAINT "FK_Direccion_Tipo_Direccion"
	FOREIGN KEY("TipoDireccion")
	REFERENCES "dbo"."TipoDireccion"("IdTipoDireccion")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Direccion"
	ADD CONSTRAINT "FK_Direccion_Region"
	FOREIGN KEY("Region")
	REFERENCES "dbo"."Region"("Id")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Direccion"
	ADD CONSTRAINT "FK_Direccion_Comuna"
	FOREIGN KEY("Comuna")
	REFERENCES "dbo"."Comuna"("Id")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Direccion"
	ADD CONSTRAINT "FK_DIRECCIO_REFERENCE_PROVINCI"
	FOREIGN KEY("Provincia")
	REFERENCES "dbo"."Provincia"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."Especialidades"
	ADD CONSTRAINT "FK_Especialidades_Tipo_Especialidad"
	FOREIGN KEY("TipoEspecialidad")
	REFERENCES "dbo"."TipoEspecialidad"("IdTipoEspecialidad")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Especialidades"
	ADD CONSTRAINT "FKEspecialid71056"
	FOREIGN KEY("IdTecnico")
	REFERENCES "dbo"."Tecnicos"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."HistorialModificacionOrden"
	ADD CONSTRAINT "FK_Historial_Modificacion_Orden_Orden_Trabajo"
	FOREIGN KEY("IdOrden")
	REFERENCES "dbo"."OrdenTrabajo"("Id")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."OrdenTrabajo"
	ADD CONSTRAINT "FK_Orden_Trabajo_Tipo_Orden"
	FOREIGN KEY("TipoOrden")
	REFERENCES "dbo"."TipoOrden"("IdTipoOrden")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."OrdenTrabajo"
	ADD CONSTRAINT "FK_Orden_Trabajo_Articulo"
	FOREIGN KEY("IdArticulo")
	REFERENCES "dbo"."Articulo"("Id")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."OrdenTrabajo"
	ADD CONSTRAINT "FK_ORDENTRA_REFERENCE_TECNICOS"
	FOREIGN KEY("IdTecnicoAsignado")
	REFERENCES "dbo"."Tecnicos"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."OrdenTrabajo"
	ADD CONSTRAINT "FKOrdenTraba317573"
	FOREIGN KEY("IdCliente")
	REFERENCES "dbo"."Cliente"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."PerfilPermiso"
	ADD CONSTRAINT "FKPerfilPerm713727"
	FOREIGN KEY("IdPerfil")
	REFERENCES "dbo"."Perfil"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."PerfilPermiso"
	ADD CONSTRAINT "FKPerfilPerm618277"
	FOREIGN KEY("IdPermiso")
	REFERENCES "dbo"."Permisos"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."Permisos"
	ADD CONSTRAINT "FKPermisos544499"
	FOREIGN KEY("Mod_Id")
	REFERENCES "dbo"."Modulos"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."Porcentaje"
	ADD CONSTRAINT "FK_Porcentaje_Precio_Garantia"
	FOREIGN KEY("IdPrecio")
	REFERENCES "dbo"."PrecioGarantia"("IdPrecioGarantia")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Provincia"
	ADD CONSTRAINT "FK_provincia_region"
	FOREIGN KEY("IdRegion")
	REFERENCES "dbo"."Region"("Id")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Tecnicos"
	ADD CONSTRAINT "FK_Tecnicos_Nivel"
	FOREIGN KEY("Nivel")
	REFERENCES "dbo"."Nivel"("IdNivel")
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
GO
ALTER TABLE "dbo"."Tecnicos"
	ADD CONSTRAINT "FK_TECNICOS_REFERENCE_USUARIO"
	FOREIGN KEY("Id")
	REFERENCES "dbo"."Usuario"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."Usuario"
	ADD CONSTRAINT "Usuario-TipoUsuario"
	FOREIGN KEY("PerfilUsuario")
	REFERENCES "dbo"."Perfil"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."UsuarioPermisos"
	ADD CONSTRAINT "FK_USUARIOP_REFERENCE_USUARIO"
	FOREIGN KEY("IdUsuario")
	REFERENCES "dbo"."Usuario"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."UsuarioPermisos"
	ADD CONSTRAINT "FK_USUARIOP_REFERENCE_PERMISOS"
	FOREIGN KEY("IdPermiso")
	REFERENCES "dbo"."Permisos"("Id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
