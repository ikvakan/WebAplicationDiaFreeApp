<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddIngredientPage.aspx.cs" Inherits="WebFormsApp_AdminSite.AddIngredientPage" %>

<%@ MasterType VirtualPath="~/Admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/AddIngredientPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container justify-content-center w-50 ">
        <div class="row  ">
            <table class="table table-borderless ">
                <tr>
                    <td class="text-right  ">
                        <label class="badge badge-primary ">Naziv</label></td>
                    <td>
                        <asp:TextBox runat="server" CssClass="form-control" Width="200" ID="txtNaziv"></asp:TextBox>
                    </td>
                    <td class="text-left w-25">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="Naziv obavezan." ErrorMessage="Naziv obavezan." ControlToValidate="txtNaziv" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td class="text-right ">
                        <label class="badge badge-primary ">Energija kJ</label></td>
                    <td>
                        <asp:TextBox runat="server" CssClass="form-control" Width="200" ID="txtEnergija_kJ" TextMode="Number"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="text-right  ">
                        <label class="badge badge-primary ">Energija kcal</label></td>
                    <td>
                        <asp:TextBox runat="server" CssClass="form-control" Width="200" ID="txtEnergija_kcal" TextMode="Number"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td class="text-right  ">
                        <label class="badge badge-primary ">Tip namirnice</label></td>
                    <td>
                        <asp:DropDownList runat="server" CssClass="form-control" Width="200" ID="ddlTipNamirnice">
                            <asp:ListItem Value="Bjelančevine">Bjelančevine</asp:ListItem>
                            <asp:ListItem Value="Ugljikohidrati">Ugljikohidrati</asp:ListItem>
                            <asp:ListItem Value="Masti">Masti</asp:ListItem>

                        </asp:DropDownList>
                    </td>
                </tr>

            </table>
            <table class="table table-borderless ">
                <tr class="text-center">

                    <th><label class="badge badge-info">Grami</label></th>
                    <th><label class="badge badge-info">Komad</label></th>
                    <th ><label class="badge badge-info">Žlica</label></th>
                    <th><label class="badge badge-info">Šalica</label></th>
                </tr>
                <tr>
                    <td class="text-center">
                        <asp:TextBox runat="server" Width="50" TextMode="Number" ID="txtGrami"></asp:TextBox>
                    </td>
                    <td class="text-center">
                        <asp:TextBox runat="server" Width="50" TextMode="Number" ID="txtKomad"></asp:TextBox>
                    </td>
                    <td class="text-center">
                        <asp:TextBox runat="server" Width="50" TextMode="Number" ID="txtZlica"></asp:TextBox>
                    </td>
                    <td class="text-center">
                        <asp:TextBox runat="server" Width="50" TextMode="Number" ID="txtSalica"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2" class="text-center">
                        <asp:Button ID="btUnos" runat="server" Text="Unesi" CssClass="btn btn-danger" Width="200" OnClick="btUnos_Click"/>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
               
                
            </table>
        </div>
        <div class="row ">
            <div class="col-md-12">

            <div class="form-group text-center">
                <asp:Label runat="server" ID="lblInfo" ForeColor="Red"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="justify-content-center" ForeColor="Red" />


            </div>
            </div>
        </div>



    </div>

   


</asp:Content>
