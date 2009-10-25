using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using Services.Autorizacion;

namespace Web.Seguridad
{
    public class TipoUsuarioProvider : RoleProvider
    {
        private IAutorizacionService _auto;

        public TipoUsuarioProvider()
            : this(new AutorizacionService())
        {

        }

        public TipoUsuarioProvider(IAutorizacionService auto)
        {
            _auto = auto;
        }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            return;
        }

        string _app;
        public override string ApplicationName
        {
            get { return _app; }
            set{ _app = value;}
        }

        public override void CreateRole(string roleName)
        {
            _auto.CrearTipo_Usuario(roleName);
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            return false;
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            return GetUsersInRole(roleName);
        }

        public override string[] GetAllRoles()
        {
           return _auto.GetPerfiless().ToArray();
        }

        public override string[] GetRolesForUser(string username)
        {
            return _auto.GetPerfilesByUsuario(username).ToArray();
        }

        public override string[] GetUsersInRole(string roleName)
        {
            return _auto.GetUsuariosTipo_Usuario(roleName).ToArray() ;
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            return _auto.EsUsuarioTipo_Usuario(username, roleName);
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            return;
        }

        public override bool RoleExists(string roleName)
        {
            return _auto.ExisteTipo_Usuario(roleName);
        }
    }
}
