<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="SetupPage.aspx.cs" Inherits="WebFormsApp_AdminSite.SetupPage" %>

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
                    <label class="badge w-100 ">Odaberi jezik</label>
                    <asp:DropDownList runat="server" ID="ddlJezik" CssClass="form-control">
                        <asp:ListItem>HR</asp:ListItem>
                        <asp:ListItem>ENG</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>

    </div>


</asp:Content>
