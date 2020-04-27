<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="WebFormsApp_AdminSite.RegisterPage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/RegisterPage.css" rel="stylesheet" />
</head>
<body>
   
    <form id="formRegister" runat="server"  >

        <div class="container">
            <div class="form-group text-center">
                <asp:Label runat="server" ID="lblRegistracija" meta:resourcekey="lblRegistracijaResource1"><span class="spanReg">Registracija</span></asp:Label>
            </div>

            <div class="row">

                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblIme" meta:resourcekey="lblImeResource1">Ime:</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ime obavezno." ControlToValidate="txtIme" CssClass="validatorColor" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1">*</asp:RequiredFieldValidator>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtIme" meta:resourcekey="txtImeResource1"></asp:TextBox>

                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" ID="lblPrezime" meta:resourcekey="lblPrezimeResource1">Prezime:</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Prezime obavezno." ControlToValidate="txtPrezime" CssClass="validatorColor" Display="Dynamic" meta:resourcekey="RequiredFieldValidator2Resource1">*</asp:RequiredFieldValidator>

                        <asp:TextBox runat="server" CssClass="form-control" ID="txtPrezime" meta:resourcekey="txtPrezimeResource1"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" ID="lblSurname" meta:resourcekey="lblSurnameResource1">Datum rođenja:</asp:Label>
                        <asp:CompareValidator ID="CompareValidator4"
                            runat="server"
                            ControlToValidate="txtDatumRodenja"
                            Operator="DataTypeCheck"
                            Type="Date"
                            ErrorMessage="Nepravilan datum." Display="Dynamic" ForeColor="Red" meta:resourcekey="CompareValidator4Resource1"></asp:CompareValidator>
                       
                        <asp:TextBox ID="txtDatumRodenja" runat="server" CssClass="form-control" TextMode="Date" meta:resourcekey="txtDatumRodenjaResource1"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblEmail" meta:resourcekey="lblEmailResource1">E-mail:</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email obavezan." ControlToValidate="txtEmail" CssClass="validatorColor" Display="Dynamic" meta:resourcekey="RequiredFieldValidator3Resource1">*</asp:RequiredFieldValidator>

                        <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" TextMode="Email" meta:resourcekey="txtEmailResource1"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblUserName" meta:resourcekey="lblUserNameResource1">Korisničko ime:</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Korisničko ime obavezno." ControlToValidate="txtKorisnickoIme" CssClass="validatorColor" Display="Dynamic" meta:resourcekey="RequiredFieldValidator4Resource1">*</asp:RequiredFieldValidator>

                        <asp:CustomValidator ID="CheckForUserName" runat="server" ControlToValidate="txtKorisnickoIme" CssClass="validatorColor" Display="Dynamic" ErrorMessage="Korisničko ime već postoji." OnServerValidate="CheckForUserName_ServerValidate">*</asp:CustomValidator>

                        <asp:TextBox runat="server" CssClass="form-control" ID="txtKorisnickoIme" meta:resourcekey="txtKorisnickoImeResource1"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblZaporka" meta:resourcekey="lblZaporkaResource1">Zaporka:</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Zaporka obavezna." ControlToValidate="txtZaporka" CssClass="validatorColor" Display="Dynamic" meta:resourcekey="RequiredFieldValidator5Resource1">*</asp:RequiredFieldValidator>

                        <asp:TextBox runat="server" CssClass="form-control" ID="txtZaporka" TextMode="Password" meta:resourcekey="txtZaporkaResource1"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblProvjera" meta:resourcekey="lblProvjeraResource1">Potvrda zaporke:</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Provjera zaporke obavezna." ControlToValidate="txtProjveraZaporke" CssClass="validatorColor" Display="Dynamic" meta:resourcekey="RequiredFieldValidator7Resource1">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Lozinke se ne poklapaju." CssClass="validatorColor" ControlToCompare="txtZaporka" ControlToValidate="txtProjveraZaporke" Display="Dynamic" meta:resourcekey="CompareValidator2Resource1">*</asp:CompareValidator>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtProjveraZaporke" TextMode="Password" meta:resourcekey="txtProjveraZaporkeResource1"></asp:TextBox>
                    </div>
                </div>


                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblTezina" meta:resourcekey="lblTezinaResource1">Tezina:</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Tezina obavezna." ControlToValidate="txtTezina" CssClass="validatorColor" Display="Dynamic" meta:resourcekey="RequiredFieldValidator8Resource1">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Tezina mora biti broj." ControlToValidate="txtTezina" CssClass="validatorColor" Display="Dynamic" Operator="DataTypeCheck" Type="Double" meta:resourcekey="CompareValidator3Resource1">*</asp:CompareValidator>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Neispravan unos tezine." ControlToValidate="txtTezina" CssClass="validatorColor" Display="Dynamic" MaximumValue="250" MinimumValue="1" Type="Double" meta:resourcekey="RangeValidator2Resource1">*</asp:RangeValidator>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtTezina" meta:resourcekey="txtTezinaResource1"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" ID="lblRazinaFizAkt" meta:resourcekey="lblRazinaFizAktResource1">Razina fizičke aktivnosti:</asp:Label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlRazinaFizAktiv" meta:resourcekey="ddlRazinaFizAktivResource1">
                            <asp:ListItem meta:resourcekey="ListItemResource1">Slaba</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource2">Umjerena</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource3">Intenzivna</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" ID="lblVisina" meta:resourcekey="lblVisinaResource1">Visina:</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Visina obavezna." ControlToValidate="txtVisina" CssClass="validatorColor" Display="Dynamic" meta:resourcekey="RequiredFieldValidator6Resource1">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Visina mora biti broj." ControlToValidate="txtVisina" CssClass="validatorColor" Display="Dynamic" Operator="DataTypeCheck" Type="Integer" meta:resourcekey="CompareValidator1Resource1">*</asp:CompareValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Neispravan unos visine." ControlToValidate="txtVisina" CssClass="validatorColor" Display="Dynamic" MaximumValue="250" MinimumValue="100" Type="Integer" meta:resourcekey="RangeValidator1Resource1">*</asp:RangeValidator>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtVisina" meta:resourcekey="txtVisinaResource1"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" ID="lblDijabetes" meta:resourcekey="lblDijabetesResource1">Vrsta dijabetesa:</asp:Label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlTipDijabetesa" meta:resourcekey="ddlTipDijabetesaResource1">
                            <asp:ListItem meta:resourcekey="ListItemResource4">Tip1</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource5">Tip2</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group ">
                        <asp:Label runat="server" ID="lblSpol" meta:resourcekey="lblSpolResource1">Spol:</asp:Label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlSpol" meta:resourcekey="ddlSpolResource1">
                            <asp:ListItem meta:resourcekey="ListItemResource6">M</asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource7">Ž</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group ">
                        <asp:Button runat="server"
                            ID="btnPotvrdi"
                            Text="Spremi"
                            CssClass="btn btn-primary btn-block " OnClick="btnPotvrdi_Click" meta:resourcekey="btnPotvrdiResource1" />
                        
                        <%--<a href="LoginPage.aspx" class="btn btn-danger btn-block "><< Povratak na Login</a>--%>
                        <asp:HyperLink runat="server" ID="hpPovratak" CssClass="btn btn-danger btn-block " NavigateUrl="LoginPage.aspx" meta:resourcekey="hpPovratakResource1"><< Povratak na Login</asp:HyperLink>
                    </div>

                    <div class="form-group">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validatorColor" meta:resourcekey="ValidationSummary1Resource1" />
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
