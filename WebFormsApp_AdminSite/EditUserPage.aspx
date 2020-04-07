<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditUserPage.aspx.cs" Inherits="WebFormsApp_AdminSite.EditUserPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">


        <div class="row  justify-content-center" style="margin-bottom: 20px;">
            <%--<div class=" w-25 btn btn-lg btn-danger disabled lblUredi">
                <label>Uredi korisnika</label>
            </div>--%>
            <h1><span class="badge badge-danger">Uredi korisnika</span></h1>
        </div>


        <div class="row ">
            <div class="col-md-6 ">
                <div class="form-group">
                    <label>Ime:</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtImeEdit"></asp:TextBox>

                </div>

                <div class="form-group">
                    <label>Prezime:</label>

                    <asp:TextBox runat="server" CssClass="form-control" ID="txtPrezimeEdit"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Datum rođenja:</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtDatumRodenjaEdit" TextMode="Date"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Email:</label>

                    <asp:TextBox runat="server" CssClass="form-control" ID="txtEmailEdit" TextMode="Email"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Korisničko ime:</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtKorisnickoImeEdit"></asp:TextBox>
                </div>


            </div>


            <div class="col-md-6">
                <div class="form-group">
                    <label>Tezina:</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtTezinaEdit"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Razina fizičke aktivnosti:</label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlRazinaFizAktivEdit">
                        <asp:ListItem>Slaba</asp:ListItem>
                        <asp:ListItem>Umjerena</asp:ListItem>
                        <asp:ListItem>Intenzivna</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label>Visina:</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtVisinaEdit"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Tip dijabetesa:</label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlTipDijabetesaEdit">
                        <asp:ListItem>Tip1</asp:ListItem>
                        <asp:ListItem>Tip2</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group ">
                    <label>Spol:</label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlSpolEdit">
                        <asp:ListItem>M</asp:ListItem>
                        <asp:ListItem>Ž</asp:ListItem>
                    </asp:DropDownList>
                </div>

              

                <%--<div class="form-group text-center">
                    <asp:Button runat="server"
                        ID="btnUredi"
                        Text="Uredi"
                        CssClass="btn btn-primary w-25 " />

                    <asp:LinkButton runat="server" ID="lbPovratak" Text="Odustani" CssClass="btn btn-danger w-25  "></asp:LinkButton>

                </div>--%>
            </div>

        </div>

        <div class="row justify-content-center" >
            <asp:Button runat="server"
                ID="btnUredi"
                Text="Uredi"
                CssClass="btn btn-primary w-25 mr-1" OnClick="btnUredi_Click"  />
            <asp:LinkButton runat="server" ID="lbPovratak" Text="Odustani" CssClass="btn btn-danger w-25  " OnClick="lbPovratak_Click"></asp:LinkButton>

        </div>

    </div>

</asp:Content>
