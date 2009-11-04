using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Data.Modelo;
using System.Collections.Generic;

namespace Web.ViewModel
{
    public class PermisosUsuariosView
    {
        public IList<PerfilPermiso> ListaPerfilPermiso { get; set; }
        public IList<UsuarioPermiso> ListaUsuarioPermiso { get; set; }
    }
}
