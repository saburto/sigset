﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI;
using Web.Seguridad;
using xVal.ServerSide;

namespace Web.Controllers
{

    [Web.Seguridad.ManejadorErrores]
    public class AccountController : Controller
    {

        // This constructor is used by the MVC framework to instantiate the controller using
        // the default forms authentication and membership providers.

        public AccountController()
            : this(null, null)
        {
        }

        // This constructor is not used by the MVC framework but is instead provided for ease
        // of unit testing this type. See the comments at the end of this file for more
        // information.
        public AccountController(IFormsAuthenticationService formsAuth, IMembershipService service)
        {
            FormsAuth = formsAuth ?? new FormsAuthenticationService();
            MembershipService = service ?? new AccountMembershipService();
        }

        public IFormsAuthenticationService FormsAuth
        {
            get;
            private set;
        }

        public IMembershipService MembershipService
        {
            get;
            private set;
        }

        public ActionResult LogOn()
        {
            Session["ModuloActual"] = null;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1054:UriParametersShouldNotBeStrings",
            Justification = "Needs to take same parameter type as Controller.Redirect()")]
        public ActionResult LogOn(string User, string Password, bool rememberMe, string returnUrl)
        {

            if (!ValidateLogOn(User, Password))
            {
                return View();
            }

            FormsAuth.SignIn(User, rememberMe);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        public ActionResult LogOff()
        {
            Session["ModuloActual"] = null;
            FormsAuth.SignOut();

            return RedirectToAction("Index", "Home");
        }

        private bool ValidateLogOn(string userName, string password)
        {
            try
            {
                if (!MembershipService.ValidateUser(userName, password))
                {
                    ModelState.AddModelError("_FORM", "El usuario y/o contraseña son incorrectos.");
                }

            }
            catch (RulesException ex )
            {
                ex.AddModelStateErrors(ModelState,"");
            }

            return ModelState.IsValid;
        }

    }
}
