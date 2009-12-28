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





GO

-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OrdenesSegunTecnico]
-- Add the parameters for the stored procedure here
@tipoEstado int,
@fechaInicio datetime,
@fechaFin datetime
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

-- Insert statements for procedure here
select distinct us.Id, us.Nombres + ' ' + us.ApellidoPaterno as [tecnico],
(
select COUNT(o.Id)
from OrdenTrabajo as o
where o.IdTecnicoAsignado = us.Id
and @tipoEstado = (select top 1 Detalle.Estado from Detalle where Detalle.IdOrden = o.Id order by Detalle.FechaCreacion desc)
and o.FechaIngreso > @fechaInicio and o.FechaIngreso < @fechaFin
group by o.IdTecnicoAsignado
)as[ordenes]
from Usuario as us
where us.PerfilUsuario = 1

END




 

