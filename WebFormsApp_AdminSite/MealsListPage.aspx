<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MealsListPage.aspx.cs" Inherits="WebFormsApp_AdminSite.MealsListPage" %>
<%@ MasterType VirtualPath="~/Admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        


        <asp:Panel ID="pnlPlaceHolder" runat="server">

        </asp:Panel>

    </div>

</asp:Content>
