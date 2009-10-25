using System;
namespace Data.Repositorios.Perfiles
{
    interface IPerfilRepositorio
    {
        void BorrarTipoCargo(int id);
        int ContarEmpleadoSegunTipoCargo(global::Data.Modelo.Perfil tipo);
        Data.Modelo.Perfil EditarTipoCargo(int id, global::Data.Modelo.Perfil tipo);
        System.Linq.IQueryable<global::Data.Modelo.Perfil> GetPerfil();
        global::Data.Modelo.Perfil GetPerfilById(int id);
        void GuardarNuevoTipoCargo(global::Data.Modelo.Perfil tipo);
    }
}
