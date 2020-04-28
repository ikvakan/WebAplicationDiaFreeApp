<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditUserPage.aspx.cs" Inherits="WebFormsApp_AdminSite.EditUserPage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ MasterType VirtualPath="~/Admin.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    
            <asp:HiddenField id="hfkorisnikID" runat="server"  />
   
    <div class="container">
       
        <div class="row  justify-content-center" style="margin-bottom: 20px;">
           <asp:Label runat="server" ID="lblEditUser" meta:resourcekey="lblEditUserResource1" CssClass="badge badge-danger" Font-Size="2em">Uredi korisnika</asp:Label>
        </div>


        <div class="row ">
            <div class="col-md-6 ">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblIme" meta:resourcekey="lblImeResource1">Ime:</asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtImeEdit" meta:resourcekey="txtImeEditResource1"></asp:TextBox>

                </div>

                <div class="form-group">
                    <asp:Label runat="server" ID="lblPrezime" meta:resourcekey="lblPrezimeResource1">Prezime:</asp:Label>

                    <asp:TextBox runat="server" CssClass="form-control" ID="txtPrezimeEdit" meta:resourcekey="txtPrezimeEditResource1"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" ID="lblDatum" meta:resourcekey="lblDatumResource1">Datum rođenja:</asp:Label>
                    <asp:CompareValidator ID="CompareValidator2"
                        runat="server"
                        ControlToValidate="txtDatumRodenjaEdit"
                        Operator="DataTypeCheck"
                        Type="Date"
                        ErrorMessage="Nepravilan datum."  Display="Dynamic" ForeColor="Red" meta:resourcekey="CompareValidator2Resource1"></asp:CompareValidator>
                    <asp:TextBox ID="txtDatumRodenjaEdit"
                        CssClass="form-control"
                        runat="server"
                        TabIndex="1"
                        placeholder="dd.mm.gggg."
                        autocomplete="off"
                        MaxLength="10" meta:resourcekey="txtDatumRodenjaEditResource1" TextMode="SingleLine"></asp:TextBox>
                   
                </div>

                <div class="form-group">
                    <asp:Label runat="server" ID="lblEmail" meta:resourcekey="lblEmailResource1">E-mail:</asp:Label>

                    <asp:TextBox runat="server" CssClass="form-control" ID="txtEmailEdit" TextMode="Email" meta:resourcekey="txtEmailEditResource1"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" ID="lblKorime" meta:resourcekey="lblKorimeResource1">Korisničko ime:</asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtKorisnickoImeEdit" meta:resourcekey="txtKorisnickoImeEditResource1"></asp:TextBox>
                </div>


            </div>


            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblTezina" meta:resourcekey="lblTezinaResource1">Tezina:</asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtTezinaEdit" meta:resourcekey="txtTezinaEditResource1"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" ID="lblFizAkt" meta:resourcekey="lblFizAktResource1">Razina fizičke aktivnosti:</asp:Label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlRazinaFizAktivEdit" meta:resourcekey="ddlRazinaFizAktivEditResource1" >
                        <asp:ListItem Text="Slaba" Value="Slaba" meta:resourcekey="ListItemResource1"></asp:ListItem>
                        <asp:ListItem Text="Umjerena" Value="Umjerena" meta:resourcekey="ListItemResource2"></asp:ListItem>
                        <asp:ListItem Text="Intenzivna" Value="Intenzivna" meta:resourcekey="ListItemResource3"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" ID="lblVisina" meta:resourcekey="lblVisinaResource1">Visina:</asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtVisinaEdit" meta:resourcekey="txtVisinaEditResource1"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" ID="lblTipDija" meta:resourcekey="lblTipDijaResource1">Tip dijabetesa:</asp:Label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlTipDijabetesaEdit" meta:resourcekey="ddlTipDijabetesaEditResource1">
                        <asp:ListItem Value="Tip1" meta:resourcekey="ListItemResource4">Tip1</asp:ListItem>
                        <asp:ListItem Value="Tip2" meta:resourcekey="ListItemResource5">Tip2</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group ">
                    <asp:Label runat="server" ID="lblSpol" meta:resourcekey="lblSpolResource1">Spol:</asp:Label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlSpolEdit" meta:resourcekey="ddlSpolEditResource1">
                        <asp:ListItem Text="M" Value="M" meta:resourcekey="ListItemResource6">M</asp:ListItem>
                        <asp:ListItem  Text="Ž" Value="Ž" meta:resourcekey="ListItemResource7">Ž</asp:ListItem>
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
            <asp:LinkButton runat="server"
                ID="btnUredi"
                Text="Uredi"
                CssClass="btn btn-primary w-25 mr-1" OnClick="btnUredi_Click" meta:resourcekey="btnUrediResource1"   />
            <asp:LinkButton runat="server" ID="lbPovratak" Text="Odustani" CssClass="btn btn-danger w-25  " OnClick="lbPovratak_Click" meta:resourcekey="lbPovratakResource1"></asp:LinkButton>

        </div>
    </div>

</asp:Content>
