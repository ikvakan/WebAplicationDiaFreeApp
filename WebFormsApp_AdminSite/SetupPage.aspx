<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="SetupPage.aspx.cs" Inherits="WebFormsApp_AdminSite.SetupPage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ MasterType VirtualPath="~/Admin.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <style>
        .badge {
            background: #007bff;
            color: white;
            padding: 10px;
            font-size: 1em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container w-25">
        <div class="row ">
            <div class="col-md-12 ">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblJezik" CssClass="badge w-100 " meta:resourcekey="lblJezikResource1">Odaberi jezik</asp:Label>
                    <asp:DropDownList runat="server" ID="ddlJezik" CssClass="form-control" meta:resourcekey="ddlJezikResource1" AutoPostBack="true" OnSelectedIndexChanged="ddlJezik_SelectedIndexChanged">
                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource4">--- odaberi ---</asp:ListItem>
                        <asp:ListItem Value="hr" meta:resourcekey="ListItemResource1">HR</asp:ListItem>
                        <asp:ListItem Value="en" meta:resourcekey="ListItemResource2">ENG</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>

    </div>


</asp:Content>
