﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddIngredientPage.aspx.cs" Inherits="WebFormsApp_AdminSite.AddIngredientPage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ MasterType VirtualPath="~/Admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/AddIngredientPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container justify-content-center w-50 ">
        <div class="row  ">
            <div class="col-md-12">
                <table class="table table-borderless ">
                    <tr>
                        <td class="text-right  ">
                            <asp:Label runat="server" id="lblNaziv" class="badge badge-primary " meta:resourcekey="lblNazivResource1">Naziv</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" CssClass="form-control" Width="200px" ID="txtNaziv" meta:resourcekey="txtNazivResource1"></asp:TextBox>
                        </td>
                        <td class="text-left w-25">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*" ErrorMessage="Naziv obavezan." ControlToValidate="txtNaziv" Display="Dynamic" ForeColor="Red" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="text-right ">
                            <asp:Label runat="server" ID="lblEnergija_kJ" class="badge badge-primary " meta:resourcekey="lblEnergija_kJResource1">Energija kJ</asp:Label></td>

                        <td>
                            <asp:TextBox runat="server" CssClass="form-control" Width="200px" ID="txtEnergija_kJ" TextMode="Number" meta:resourcekey="txtEnergija_kJResource1"></asp:TextBox>
                        </td>

                    </tr>
                    <tr>
                        <td class="text-right  ">
                            <asp:Label runat="server" ID="lblEnergij_kcal" class="badge badge-primary " meta:resourcekey="lblEnergij_kcalResource1">Energija kcal</asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" CssClass="form-control" Width="200px" ID="txtEnergija_kcal" TextMode="Number" meta:resourcekey="txtEnergija_kcalResource1"></asp:TextBox>
                        </td>

                    </tr>
                    <tr>
                        <td class="text-right  ">
                            <asp:Label runat="server" ID="lblTipNamirnice" class="badge badge-primary " meta:resourcekey="lblTipNamirniceResource1">Tip namirnice</asp:Label></td>
                        <td>
                            <asp:DropDownList runat="server" CssClass="form-control" Width="200px" ID="ddlTipNamirnice" meta:resourcekey="ddlTipNamirniceResource1">
                                <asp:ListItem Value="Bjelančevine" meta:resourcekey="ListItemResource1">Bjelančevine</asp:ListItem>
                                <asp:ListItem Value="Ugljikohidrati" meta:resourcekey="ListItemResource2">Ugljikohidrati</asp:ListItem>
                                <asp:ListItem Value="Masti" meta:resourcekey="ListItemResource3">Masti</asp:ListItem>

                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="text-center">
                            <asp:Button ID="Button1" runat="server" Text="Unesi" CssClass="btn btn-danger" Width="200px" OnClick="btUnos_Click" meta:resourcekey="btUnosResource1" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td  class="text-center">
                            <asp:Label runat="server" ID="lblInfo" ForeColor="#007BFF" meta:resourcekey="lblInfoResource1"></asp:Label>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="justify-content-center" ForeColor="Red" DisplayMode="SingleParagraph" meta:resourcekey="ValidationSummary1Resource1" />

                        </td>
                        
                    </tr>


                </table>
            </div>
        </div>
         

    </div>




</asp:Content>
