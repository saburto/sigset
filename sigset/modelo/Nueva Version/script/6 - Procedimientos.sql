Use sigset
go
CREATE PROCEDURE [dbo].[PermisosDispPerfil]
@idPerfil int

AS

select *
from Permisos where  not Id  in( select IdPermiso from PerfilPermiso
where IdPerfil = @idPerfil)

Go

CREATE PROCEDURE [dbo].[PermisosDispUsuario]
@idPerfil int,
@idUsuario int

AS

select *
from Permisos where  not Id  in( select IdPermiso from PerfilPermiso
where IdPerfil = @idPerfil) and not Id in (select IdPermiso from UsuarioPermisos where IdUsuario = @idUsuario)  



