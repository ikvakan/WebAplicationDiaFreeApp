<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserListPage.aspx.cs" Inherits="WebFormsApp_AdminSite.UserListPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Repeater ID="repeaterPopisKorisnika" runat="server">
        <HeaderTemplate>
            <table class="table table-striped tblPopisKorisnika">
                <tr class="">
                    <th>IME:</th>
                    <th>PREZIME:</th>
                    <th>EMAIL:</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("Ime") %></td>
                <td><%# Eval("Prezime") %></td>
                <td><a href="mailto:<%#("Email") %>"><%#("Email") %></a></td>
                <td><asp:LinkButton OnClick="lbUredi_Click" id="lbUredi"   CommandArgument='<%#Eval("IDKorisnik") %>' runat="server">Uredi</asp:LinkButton></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            <tr>
                <td>
                    <asp:Label ID="lblInfo" CssClass="alert-danger" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            </table>
        </FooterTemplate>



    </asp:Repeater>

</asp:Content>
