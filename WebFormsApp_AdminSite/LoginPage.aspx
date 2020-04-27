<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WebFormsApp_AdminSite.LoginPage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LoginPage</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/LoginPage.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.js"></script>

</head>
<body>
    <form id="formLogin" runat="server"  >
        <div class="container  ">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group text-center ">
                        <asp:Label runat="server" ID="lblLogin" CssClass="login" Font-Italic="True" Font-Bold="True" Font-Size="2em" ForeColor="#337AB7" meta:resourcekey="lblLoginResource1" Text="Login"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblUser" meta:resourcekey="lblUserResource1" Text="Korisničko ime:"></asp:Label>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Obavezno polje." ControlToValidate="txtUserName" Text="*" CssClass="validatorColor" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                        <asp:TextBox
                            runat="server"
                            ID="txtUserName"
                            CssClass="form-control txtBox" meta:resourcekey="txtUserNameResource1" ></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="lblPassword" meta:resourcekey="lblPasswordResource1" Text="Zaporka:"></asp:Label>
                       
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Obavezno polje." ControlToValidate="txtPassword" Text="*" CssClass="validatorColor" Display="Dynamic" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>

                        <asp:TextBox
                            runat="server"
                            ID="txtPassword"
                            CssClass="form-control txtBox"
                            TextMode="Password" meta:resourcekey="txtPasswordResource1"></asp:TextBox>
                    </div>

                    <div class="form-group " >

                        <asp:Button runat="server"
                            ID="btnLogin"
                            Text="Prijava"
                            CssClass="btn btn-primary btn-block " OnClick="btnLogin_Click" meta:resourcekey="btnLoginResource1" />
                        <asp:HyperLink runat="server" ID="hlReg" NavigateUrl="RegisterPage.aspx"  CssClass="btn btn-primary btn-block" meta:resourcekey="hlRegResource1">Registracija</asp:HyperLink>
                       
                    </div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validatorColor" meta:resourcekey="ValidationSummary1Resource1" />

                </div>
            </div>
        </div>
    </form>
</body>
</html>
