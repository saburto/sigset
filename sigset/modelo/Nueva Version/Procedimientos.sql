CREATE PROCEDURE [dbo].[PermisosDispUsuario]
@idPerfil int

AS

select *
from Permisos where  not Id  in( select IdPermiso from PerfilPermiso
where IdPerfil = @idPerfil) and not Id in (select IdPermiso from UsuarioPermisos where IdUsuario =2)  


-- Para agregar los permisos que no tiene el usuario--
CREATE PROCEDURE [dbo].[PermisosDispUsuarioPermiso]
@idPerfil int,@idUsusario int

AS

select *
from Permisos where  not Id  in( select IdPermiso from PerfilPermiso
where IdPerfil = @idPerfil) and not Id in (select IdPermiso from UsuarioPermisos where IdUsuario = @idUsusario)  



