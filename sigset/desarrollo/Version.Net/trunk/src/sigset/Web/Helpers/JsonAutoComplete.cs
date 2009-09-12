using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace Web.Helpers
{
    public static class JsonAutoCompleteHelper
    {
        public static IList<IJsonAutoComplete> ToAutoCompleteJson<T>(this IList<T> lista, string campoValue, string campoDisplay)
        {
            return ToAutoCompleteJson<T>(lista,campoValue,campoDisplay,"");
        }

        public static IList<IJsonAutoComplete> ToAutoCompleteJson<T>(this IList<T> lista, string campoValue,params string[] campoDisplay)
        {
            List<IJsonAutoComplete> listaJson = new List<IJsonAutoComplete>();
            foreach (var item in lista)
            {
                var jsonItem =new JsonAutoComplete();
                jsonItem.value = item.GetType().GetProperty(campoValue).GetValue(item, null).ToString();

                foreach (var campo in campoDisplay)
                {
                    if (!string.IsNullOrEmpty(campo))
                    {
                        jsonItem.display = item.GetType().GetProperty(campo).GetValue(item, null).ToString();
                    }
                }
                listaJson.Add(jsonItem);
            }
            return listaJson;
        }
    }

    public class JsonAutoComplete : IJsonAutoComplete
    {
        public string value { get; set; }

        private string _display;
        public string display { 
            get
            {
                return _display ?? string.Empty;
            }
            set
            {
                if (string.IsNullOrEmpty(_display))
                {
                    _display = value;
                }
                else
                {
                    _display += value;
                }
            }
        }
    }
}
