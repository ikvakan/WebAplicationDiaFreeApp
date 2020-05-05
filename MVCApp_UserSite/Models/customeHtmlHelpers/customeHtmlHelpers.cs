using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCApp_UserSite.Models.customeHtmlHelpers
{
    public static class customeHtmlHelpers
    {
        public static MvcHtmlString DDLDatumi(this HtmlHelper html, List<ObrokModel> kolekcijaObroka)
        {
            TagBuilder selectTag = new TagBuilder("select");
            selectTag.MergeAttribute("id", "datumDDL");
            selectTag.MergeAttribute("name", "datumDDL");
            selectTag.AddCssClass("form-control");
            


            foreach (var item in kolekcijaObroka)
            {
                TagBuilder optionTag = new TagBuilder("option");
                optionTag.MergeAttribute("value", item.DatumIzrade.Value.ToShortDateString());
                optionTag.SetInnerText(item.DatumIzrade.Value.ToShortDateString());
                selectTag.InnerHtml += optionTag.ToString();
            }

            return new MvcHtmlString(selectTag.ToString());
        }
    }
}