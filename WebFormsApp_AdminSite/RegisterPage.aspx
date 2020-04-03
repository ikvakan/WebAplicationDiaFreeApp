<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="WebFormsApp_AdminSite.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/RegisterPage.css" rel="stylesheet" />
</head>
<body>
   
    <form id="formRegister" runat="server"  action="LoginPage.aspx">

        <div class="container">
            <div class="form-group text-center">
                <label><span class="spanReg">Registracija</span></label>
            </div>

            <div class="row">

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Ime:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ime obavezno." ControlToValidate="txtIme" CssClass="validatorColor" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtIme"></asp:TextBox>

                    </div>

                    <div class="form-group">
                        <label>Prezime:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Prezime obavezno." ControlToValidate="txtPrezime" CssClass="validatorColor" Display="Dynamic">*</asp:RequiredFieldValidator>

                        <asp:TextBox runat="server" CssClass="form-control" ID="txtPrezime"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Datum rođenja:</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtDatumRodenja" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email obavezan." ControlToValidate="txtEmail" CssClass="validatorColor" Display="Dynamic">*</asp:RequiredFieldValidator>

                        <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Korisničko ime:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Korisničko ime obavezno." ControlToValidate="txtKorisnickoIme" CssClass="validatorColor" Display="Dynamic">*</asp:RequiredFieldValidator>

                        <asp:TextBox runat="server" CssClass="form-control" ID="txtKorisnickoIme"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Zaporka:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Zaporka obavezna." ControlToValidate="txtZaporka" CssClass="validatorColor" Display="Dynamic">*</asp:RequiredFieldValidator>

                        <asp:TextBox runat="server" CssClass="form-control" ID="txtZaporka" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Provjera zaporke:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Provjera zaporke obavezna." ControlToValidate="txtProjveraZaporke" CssClass="validatorColor" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Lozinke se ne poklapaju." CssClass="validatorColor" ControlToCompare="txtZaporka" ControlToValidate="txtProjveraZaporke" Display="Dynamic">*</asp:CompareValidator>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtProjveraZaporke" TextMode="Password"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Razina fizičke aktivnosti:</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlRazinaFizAktiv">
                            <asp:ListItem>Slaba</asp:ListItem>
                            <asp:ListItem>Umjerena</asp:ListItem>
                            <asp:ListItem>Intenzivna</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label>Visina:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Visina obavezna." ControlToValidate="txtVisina" CssClass="validatorColor" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Visina mora biti broj." ControlToValidate="txtVisina" CssClass="validatorColor" Display="Dynamic" Operator="DataTypeCheck" Type="Integer">*</asp:CompareValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Neispravan unos visine." ControlToValidate="txtVisina" CssClass="validatorColor" Display="Dynamic" MaximumValue="250" MinimumValue="100" Type="Integer">*</asp:RangeValidator>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtVisina"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Tip dijabetesa:</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlTipDijabetesa">
                            <asp:ListItem>Tip1</asp:ListItem>
                            <asp:ListItem>Tip2</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group ">
                        <label>Spol:</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlSpol">
                            <asp:ListItem>M</asp:ListItem>
                            <asp:ListItem>Ž</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group ">
                        <asp:Button runat="server"
                            ID="btnPotvrdi"
                            Text="Spremi"
                            CssClass="btn btn-primary btn-block " OnClick="btnPotvrdi_Click" />
                        
                        <a href="LoginPage.aspx" class="btn btn-danger btn-block "><< Povratak na Login</a>
                    </div>

                    <div class="form-group">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validatorColor" />
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
