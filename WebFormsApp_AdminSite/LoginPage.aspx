<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WebFormsApp_AdminSite.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LoginPage</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/LoginPage.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.js"></script>

</head>
<body>
    <form id="formLogin" runat="server" >
        <div class="container  ">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group text-center ">
                        <label class="login">Login</label>
                    </div>
                    <div class="form-group">
                        <label>Korisničko ime:</label>
                        <asp:CustomValidator ID="userNameValidator" runat="server" ErrorMessage="Neispravano korisničko ime." CssClass="validatorColor" Display="Dynamic" ControlToValidate="txtUserName">*</asp:CustomValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Obavezno polje." ControlToValidate="txtUserName" Text="*" CssClass="validatorColor" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <asp:TextBox
                            runat="server"
                            ID="txtUserName"
                            CssClass="form-control txtBox"
                            TextMode="SingleLine"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Zaporka:</label>
                        <asp:CustomValidator ID="passwordValidator" runat="server" ErrorMessage="Neispravna zaporka." CssClass="validatorColor" Display="Dynamic" ControlToValidate="txtPassword">*</asp:CustomValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Obavezno polje." ControlToValidate="txtPassword" Text="*" CssClass="validatorColor" Display="Dynamic"></asp:RequiredFieldValidator>

                        <asp:TextBox
                            runat="server"
                            ID="txtPassword"
                            CssClass="form-control txtBox"
                            TextMode="Password"></asp:TextBox>
                    </div>

                    <div class="form-group " >

                        <asp:Button runat="server"
                            ID="btnLogin"
                            Text="Prijava"
                            CssClass="btn btn-primary btn-block " OnClick="btnLogin_Click" />
                        <a href="RegisterPage.aspx" class="btn btn-primary btn-block">Registracija</a>
                    </div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validatorColor" />

                </div>
            </div>
        </div>
    </form>
</body>
</html>
