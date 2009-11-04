CREATE PROCEDURE [dbo].[PermisosDispPerfil]
@idPerfil int

AS

select *
from Permisos
where  not Id  in(
select IdPermiso
from PerfilPermiso
where IdPerfil = @idPerfil
)