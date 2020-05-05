using ClassLibrary.DAL;
using ClassLibrary.Models;

using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public enum CreateCellByType
{
    namirnice,
    grami,
    komad,
    zlica,
    salica,
    tipNamirnice
   
}


namespace WebFormsApp_AdminSite
{
    public partial class MealsListPage : System.Web.UI.Page
    {
        private static IObrok repoObrok = RepoFactory.GetObrokRepo();
        private static INamirnica repoNamirnica = RepoFactory.GetNamirnicaRepo();
        public string Language { 
            get 
            {
                if (Request.Cookies["languageOptions"] != null)
                {
                    if (Request.Cookies["languageOptions"]["language"]!=null)
                    {
                        return Request.Cookies["languageOptions"]["language"];
                    }
                }
                return "";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["admin"] == null)
            {
                Response.Redirect("~/LoginPage.aspx");
            }

            if (Language != "en" || Language != "0")
            {
                Master.ShowLabel("Popis obroka");
            }
            else
                Master.ShowLabel("Meals");

            //if (!IsPostBack)
            //{

            //    CreateMeal();
            //}

            CreateMeal();

        }





        private void CreateMeal()
        {


            foreach (var item in repoObrok.GetMealList())
            {

                CreateElement(item);
            }

        }

        private void CreateElement(ObrokModel item)
        {


            Table tbl = new Table();
            tbl.ID = $"tbl{item.IDObrok}";
            tbl.CssClass = "table table-stripped border border-secondary";
            TableCell nazivObrokaHeader = new TableCell();
            nazivObrokaHeader.CssClass = "font-weight-bold";
            TableCell namirniceCellHeader = new TableCell();
            namirniceCellHeader.CssClass = "font-weight-bold";
            TableCell gramiCellHeader = new TableCell();
            gramiCellHeader.CssClass = "font-weight-bold";
            TableCell komadCellHeader = new TableCell();
            komadCellHeader.CssClass = "font-weight-bold";
            TableCell zlicaCellHeader = new TableCell();
            zlicaCellHeader.CssClass = "font-weight-bold";
            TableCell salicaCellHeader = new TableCell();
            salicaCellHeader.CssClass = "font-weight-bold";
            TableCell tipNamirniceCellHeader = new TableCell();
            tipNamirniceCellHeader.CssClass = "font-weight-bold";
            TableCell btnCellHeader = new TableCell(); //?? za button



                nazivObrokaHeader.Text = "Obrok";
                namirniceCellHeader.Text = "Namirnice";
                gramiCellHeader.Text = "Grami";
                komadCellHeader.Text = "Komad";
                zlicaCellHeader.Text = "Žlica";
                salicaCellHeader.Text = "Šalica";
                tipNamirniceCellHeader.Text = "Tip namirnice"; 
          
            

            //header
            TableHeaderRow tblHeaderRow = new TableHeaderRow();
            tblHeaderRow.CssClass = "bg-secondary text-white";
            tblHeaderRow.Cells.Add(nazivObrokaHeader);
            tblHeaderRow.Cells.Add(namirniceCellHeader);
            tblHeaderRow.Cells.Add(gramiCellHeader);
            tblHeaderRow.Cells.Add(komadCellHeader);
            tblHeaderRow.Cells.Add(zlicaCellHeader);
            tblHeaderRow.Cells.Add(salicaCellHeader);
            tblHeaderRow.Cells.Add(tipNamirniceCellHeader);
            tbl.Controls.Add(tblHeaderRow);


            //1. row
            TableRow row = new TableRow();
            

            TableCell obrokCell = new TableCell();
            obrokCell.VerticalAlign = VerticalAlign.Middle;
            obrokCell.Text = item.NazivObroka;

            
            TableCell namirnicaCell = CreateCells(item.IDObrok,CreateCellByType.namirnice);
            namirnicaCell.Width = 250;
            TableCell gramiCell = CreateCells(item.IDObrok, CreateCellByType.grami);
            TableCell komadCell = CreateCells(item.IDObrok, CreateCellByType.komad);
            TableCell zlicaCell = CreateCells(item.IDObrok, CreateCellByType.zlica);
            TableCell salicaCell = CreateCells(item.IDObrok, CreateCellByType.salica);
            TableCell tipNamirniceCell = CreateCells(item.IDObrok, CreateCellByType.tipNamirnice);

           


            row.Cells.Add(obrokCell);
            row.Cells.Add(namirnicaCell);
            row.Cells.Add(gramiCell);
            row.Cells.Add(komadCell);
            row.Cells.Add(zlicaCell);
            row.Cells.Add(salicaCell);
            row.Cells.Add(tipNamirniceCell);
            tbl.Controls.Add(row);

            //row2
            TableRow rowButton = new TableRow();

            var id = item.IDObrok;
            
            TableCell emptyCell = new TableCell();
            emptyCell.ColumnSpan = 6;
            TableCell btnObrisi = CreateButton(id);
            rowButton.Cells.Add(emptyCell);
            rowButton.Cells.Add(btnObrisi);
            tbl.Controls.Add(rowButton);


            phcontainer.Controls.Add(tbl);
        }

        private TableCell CreateButton(int id)
        {
            TableCell cell = new TableCell();
            Button btn = new Button();
            if (Language == "hr")
            {
                btn.Text = "Obriši";
            }
            else
                btn.Text = "Delete";

            btn.ID = $"btnObrisi{id}";
            btn.CssClass = "btn btn-danger btn-block";
            btn.Click += Btn_Click;
            btn.CommandArgument = id.ToString();
            btn.UseSubmitBehavior = true;
            cell.Controls.Add(btn);
            return cell;
        }

        private void Btn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            var id=int.Parse(btn.CommandArgument);
            DeleteMealItem(id);
            Response.Redirect("MealsListPage.aspx");
        }

        private TableCell CreateCells(int id,CreateCellByType type)
        {
            TableCell cell = new TableCell();
            StringBuilder sb = new StringBuilder();

            sb.Append($"<table class='table table-borderless'>");

            switch (type)
            {
                case CreateCellByType.namirnice:
                    CreateTrNamirnice(id, sb);
                    break;
                case CreateCellByType.grami:
                    CreateTrGrami(id, sb);
                    break;
                case CreateCellByType.komad:
                    CreateTrKomad(id, sb);
                    break;
                case CreateCellByType.zlica:
                    CreateTrZlica(id, sb);
                    break;
                case CreateCellByType.salica:
                    CreateTrSalica(id, sb);
                    break;
                case CreateCellByType.tipNamirnice:
                    CreateTrTipNamirnice(id, sb);
                    break;
                    
                default:
                    break;
            }

            sb.Append($"</table>");

            
            LiteralControl lc = new LiteralControl(sb.ToString());
            cell.Controls.Add(lc);

            return cell;
        }

     

        private void CreateTrTipNamirnice(int id, StringBuilder sb)
        {
            foreach (var item in repoNamirnica.GetIngredientForMeal(id))
            {
                sb.Append("<tr>");
                sb.Append($"<td style='padding:0;'>{item.TipNamirnice} </td>");
                sb.Append("</tr>");
            }
        }

        private void CreateTrSalica(int id, StringBuilder sb)
        {
            foreach (var item in repoNamirnica.GetIngredientForMeal(id))
            {
                sb.Append("<tr>");
                sb.Append($"<td style='padding:0;'>{item.Salica} </td>");
                sb.Append("</tr>");
            }
        }

        private void CreateTrZlica(int id, StringBuilder sb)
        {
            foreach (var item in repoNamirnica.GetIngredientForMeal(id))
            {
                sb.Append("<tr>");
                sb.Append($"<td style='padding:0;'>{item.Zlica} </td>");
                sb.Append("</tr>");
            }
        }

        private void CreateTrKomad(int id, StringBuilder sb)
        {
            foreach (var item in repoNamirnica.GetIngredientForMeal(id))
            {
                sb.Append("<tr>");
                sb.Append($"<td style='padding:0;'>{item.Komad} </td>");
                sb.Append("</tr>");
            };
        }

        private void CreateTrGrami(int id, StringBuilder sb)
        {
            foreach (var item in repoNamirnica.GetIngredientForMeal(id))
            {
                sb.Append("<tr>");
                sb.Append($"<td style='padding:0;'>{item.Grami} </td>");
                sb.Append("</tr>");
            }
        }

        private static void CreateTrNamirnice(int id, StringBuilder sb)
        {
            foreach (var item in repoNamirnica.GetIngredientForMeal(id))
            {
                sb.Append("<tr >");
                sb.Append($"<td style='padding:0; '>{item.NazivNamirnice} </td>");
                sb.Append("</tr>");
            }
        }

        protected override void InitializeCulture()
        {
            if (Request.Cookies["languageOptions"] != null)
            {
                if (Request.Cookies["languageOptions"]["language"] != null)
                {
                    string kultura = Request.Cookies["languageOptions"]["language"];
                    Thread.CurrentThread.CurrentCulture = new CultureInfo(kultura);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(kultura);
                }
            }
            base.InitializeCulture();
        }


        public void DeleteMealItem(int obrokId)
        {
            repoObrok.DeleteMeasurement(obrokId);
            repoObrok.DelteFromMealIngredients(obrokId);
            repoObrok.DeleteMeal(obrokId);

        }
    }
}