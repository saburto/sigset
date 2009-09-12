using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Web.Helpers
{
    public interface IJsonAutoComplete
    {
        string value { get; set; }
        string display { get; set; }
    }
}
