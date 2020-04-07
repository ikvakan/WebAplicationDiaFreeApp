<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserListPage.aspx.cs" Inherits="WebFormsApp_AdminSite.UserListPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Repeater ID="repeaterPopisKorisnika" runat="server"  >
        <HeaderTemplate>
            <table class="table table-striped w-75">
                <thead class="thead-dark">
                    <th>IME:</th>
                    <th>PREZIME:</th>
                    <th>EMAIL:</th>
                    <th></th>
                </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("Ime") %></td>
                <td><%# Eval("Prezime") %></td>
                <td><a href="mailto:<%#Eval("Email") %>"><%#Eval("Email") %></a></td>
                <td><asp:LinkButton OnClick="lbUredi_Click"  id="lbUredi" CssClass="btn btn-sm btn-danger"  CommandArgument='<%#Eval("IDKorisnik") %>' runat="server">Uredi</asp:LinkButton></td>
            </tr
          
        </ItemTemplate>
        <FooterTemplate>
            
           <hr />
            </table>
        </FooterTemplate>



    </asp:Repeater>
    <asp:Label runat="server" ID="lblInfo"></asp:Label>
    

    
</asp:Content>
