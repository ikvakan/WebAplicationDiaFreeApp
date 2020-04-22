<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MealsListPage.aspx.cs" Inherits="WebFormsApp_AdminSite.MealsListPage" %>

<%@ MasterType VirtualPath="~/Admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery-3.4.1.js" type="text/javascript"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/MealPageTableStyle.css" rel="stylesheet" />




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    

    <div class="container" id="divContainer">

        <asp:PlaceHolder runat="server" ID="phcontainer">

        </asp:PlaceHolder>
      

    </div>




</asp:Content>
