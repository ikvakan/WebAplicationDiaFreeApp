<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="CreateMealPage.aspx.cs" Inherits="WebFormsApp_AdminSite.CreateMealPage" %>
<%@ MasterType VirtualPath="~/Admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/CreateMealPage.css" rel="stylesheet" />






</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container w-25  ">

        <div class="row ">
            <div class="col-md-12 ">
                <div class="form-group">
                    <label class="badge w-100">Obrok</label>
                    <asp:DropDownList runat="server" ID="ddlObrok" CssClass="form-control">
                        
                        <asp:ListItem>Doručak</asp:ListItem>
                        <asp:ListItem>Ručak</asp:ListItem>
                        <asp:ListItem>Večera</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="badge w-100">Tip namirnice</label>
                    <asp:DropDownList runat="server" ID="ddlTipNamirnice" CssClass="form-control"  AutoPostBack="True"  >
                        <asp:ListItem Value="sve">Sve</asp:ListItem>
                        <asp:ListItem Value="bjelančevine">Bjelančevine</asp:ListItem>
                        <asp:ListItem Value="ugljikohidrati">Ugljikohidrati</asp:ListItem>
                        <asp:ListItem Value="masti">Masti</asp:ListItem>
                    </asp:DropDownList>
                </div>

            </div>
        </div>

       <div class="row justify-content-center ">

                <asp:GridView ID="gvNamirnice" runat="server" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Width="900px" DataKeyNames="IDNamirnice" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" AllowPaging="True" CssClass="table table-borderless" OnPageIndexChanging="gvNamirnice_PageIndexChanging" OnRowCancelingEdit="gvNamirnice_RowCancelingEdit" OnRowEditing="gvNamirnice_RowEditing" OnRowUpdating="gvNamirnice_RowUpdating" OnRowDeleting="gvNamirnice_RowDeleting"  >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="NazivNamirnice" HeaderText="NAMIRNICA" ControlStyle-Width="150" >

<ControlStyle Width="150px"></ControlStyle>

                        </asp:BoundField>
                        <asp:BoundField DataField="Energija_kJ" HeaderText="ENERGIJA [kJ]" >

                        </asp:BoundField>
                        <asp:BoundField DataField="Energija_kcal" HeaderText="ENERGIJA [kcal]" >

                        </asp:BoundField>
                        <asp:BoundField DataField="Grami" HeaderText="Grami" NullDisplayText="---" />
                        <asp:BoundField DataField="Komad" HeaderText="Komad" NullDisplayText="---" />
                        <asp:BoundField DataField="Zlica" HeaderText="Žlica" NullDisplayText="---" />
                        <asp:BoundField DataField="Salica" HeaderText="Šalica" NullDisplayText="---" />
                        <asp:TemplateField HeaderText="TIP NAMIRNICE">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEdit" runat="server" Text='<%# Bind("TipNamirnice") %>'>
                                    <asp:ListItem>Masti</asp:ListItem>
                                    <asp:ListItem>Bjelančevine</asp:ListItem>
                                    <asp:ListItem>Ugljikohidrati</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("TipNamirnice") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="120px" />
                        </asp:TemplateField>
                        <asp:CommandField CancelText="Odustani" DeleteText="Obriši" EditText="Uredi" ShowEditButton="True" ShowDeleteButton="True" InsertText="Umetni" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6c757d" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />

                </asp:GridView>
              
       </div>

        <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Size="12px" ForeColor="Red"></asp:Label>



    </div>


    </asp:Content>
