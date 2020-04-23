<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserListPage.aspx.cs" Inherits="WebFormsApp_AdminSite.UserListPage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ MasterType VirtualPath="~/Admin.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

  
    
    <div class="row  justify-content-center" style="margin-bottom: 20px;">
       
        <asp:Label runat="server" ID="lblPopisKor" CssClass="badge badge-danger" Font-Size="2em" meta:resourcekey="lblPopisKorResource1" >Popis korisnika [spremi korisnike]</asp:Label>
    </div>

    <div class="row justify-content-center">

    <asp:Repeater ID="repeaterPopisKorisnika" runat="server"  >
        <FooterTemplate>
            
           <hr />
            </table>
        
</FooterTemplate>
        <HeaderTemplate>
            <table class="table table-striped w-75">
                <thead class="thead-dark">
                    <th><asp:Label runat="server" ID="lblIme" meta:resourcekey="lblImeResource1">IME</asp:Label> </th>
                    <th>
                        <asp:Label runat="server" ID="Label1" meta:resourcekey="Label1Resource1">PREZIME</asp:Label>
                    </th>
                    <th>
                        <asp:Label runat="server" ID="Label2" meta:resourcekey="Label2Resource1">E-MAIL</asp:Label>
                    </th>
                    <th></th>
                    <th></th>

                </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("Ime") %></td>
                <td><%# Eval("Prezime") %></td>
                <td><a href='mailto:<%# Eval("Email") %>'><%#Eval("Email") %></a></td>

                <td style="padding-right:0;"><asp:LinkButton OnClick="lbUredi_Click"   id="lbUredi" CssClass="btn btn-sm btn-block btn-primary"  CommandArgument='<%# Eval("IDKorisnik") %>' runat="server" meta:resourcekey="lbUrediResource1">Uredi</asp:LinkButton></td>
                <td style="padding-left:0;"><asp:LinkButton OnClick="lbObrisi_Click"  ID="lbObrisi" CssClass="btn btn-sm btn-block btn-danger" CommandArgument='<%# Eval("IDKorisnik") %>' runat="server" meta:resourcekey="lbObrisiResource1" >Obriši</asp:LinkButton></td>
               
            </tr
          
        </ItemTemplate>
        <FooterTemplate>
            
           <hr />
            </table>
        </FooterTemplate>



        </asp:Repeater>
    <asp:Label runat="server" ID="lblInfo" meta:resourcekey="lblInfoResource1"></asp:Label>

    </div>
</div>
    
</asp:Content>
