<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="CreateMealPage.aspx.cs" Inherits="WebFormsApp_AdminSite.CreateMealPage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ MasterType VirtualPath="~/Admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/CreateMealPage.css" rel="stylesheet" />

    <style>
        html {
            scroll-behavior: smooth;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container w-25  ">

        <div class="row ">
            <div class="col-md-12 ">
                <%--<div class="form-group">
                    <label class="badge w-100">Obrok</label>
                    <asp:DropDownList runat="server" ID="ddlObrok" CssClass="form-control">

                        <asp:ListItem>Doručak</asp:ListItem>
                        <asp:ListItem>Ručak</asp:ListItem>
                        <asp:ListItem>Večera</asp:ListItem>
                    </asp:DropDownList>
                </div>--%>

                <div class="form-group">
                    <asp:Label runat="server" ID="lblTipNamirnice" CssClass="badge w-100" meta:resourcekey="lblTipNamirniceResource1">Tip namirnice</asp:Label>
                    <asp:DropDownList runat="server" ID="ddlTipNamirnice" CssClass="form-control" AutoPostBack="True" meta:resourcekey="ddlTipNamirniceResource1">
                        <asp:ListItem Value="sve" meta:resourcekey="ListItemResource1">Sve</asp:ListItem>
                        <asp:ListItem Text="Bjelančevine" Value="bjelančevine" meta:resourcekey="ListItemResource2">Bjelančevine</asp:ListItem>
                        <asp:ListItem Text="Ugljikohidrati" Value="ugljikohidrati" meta:resourcekey="ListItemResource3">Ugljikohidrati</asp:ListItem>
                        <asp:ListItem Text="Masti" Value="masti" meta:resourcekey="ListItemResource4">Masti</asp:ListItem>
                    </asp:DropDownList>

                </div>

                <%--<div class="form-group">

                    <label class="badge w-100">Odaberite datum</label>
                    <asp:Calendar ID="calendar" runat="server">
                        <SelectedDayStyle BackColor="Yellow" ForeColor="Black" />
                    </asp:Calendar>
                    
                </div>--%>
                <div class="form-group">

                    <asp:Button runat="server" ID="btnOdaberi" Text="Odaberi namirnice" CssClass="btn btn-block btn-primary" OnClick="btnGeneriraj_Click" meta:resourcekey="btnOdaberiResource1" />
                </div>
            </div>
        </div>



        <div class="row justify-content-center ">


            <asp:GridView ID="gvNamirnice" runat="server" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Width="1000px" DataKeyNames="IDNamirnice" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CssClass="table table-borderless" OnPageIndexChanging="gvNamirnice_PageIndexChanging" OnRowCancelingEdit="gvNamirnice_RowCancelingEdit" OnRowEditing="gvNamirnice_RowEditing" OnRowUpdating="gvNamirnice_RowUpdating" OnRowDeleting="gvNamirnice_RowDeleting" meta:resourcekey="gvNamirniceResource1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="NAMIRNICA" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NazivNamirnice") %>' CssClass="form-control" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNaziv" runat="server" Text='<%# Bind("NazivNamirnice") %>' meta:resourcekey="lblNazivResource1"></asp:Label>
                        </ItemTemplate>
                        <ControlStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ENERGIJA [kJ]" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Energija_kJ") %>' CssClass="form-control" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEnergija_kJ" runat="server" Text='<%# Bind("Energija_kJ") %>' meta:resourcekey="lblEnergija_kJResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ENERGIJA [kcal]" meta:resourcekey="TemplateFieldResource3">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Energija_kcal") %>' CssClass="form-control" meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEnergija_kcal" runat="server" Text='<%# Bind("Energija_kcal") %>' meta:resourcekey="lblEnergija_kcalResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="Grami" meta:resourcekey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Grami") %>' CssClass="form-control" Width="100px" meta:resourcekey="TextBox4Resource1"></asp:TextBox>

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblGrami" runat="server" Text='<%# Bind("Grami") %>' meta:resourcekey="lblGramiResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Komad" meta:resourcekey="TemplateFieldResource5">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Komad") %>' CssClass="form-control" meta:resourcekey="TextBox5Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblKomad" runat="server" Text='<%# Bind("Komad") %>' meta:resourcekey="lblKomadResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Žlica" meta:resourcekey="TemplateFieldResource6">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Zlica") %>' CssClass="form-control" meta:resourcekey="TextBox6Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblZlica" runat="server" Text='<%# Bind("Zlica") %>' meta:resourcekey="lblZlicaResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Šalica" meta:resourcekey="TemplateFieldResource7">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Salica") %>' CssClass="form-control" meta:resourcekey="TextBox7Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSalica" runat="server" Text='<%# Bind("Salica") %>' meta:resourcekey="lblSalicaResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="TIP NAMIRNICE" meta:resourcekey="TemplateFieldResource8">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEdit" runat="server" Text='<%# Bind("TipNamirnice") %>' Width="200px" CssClass="form-control" meta:resourcekey="ddlEditResource1">
                                <asp:ListItem meta:resourcekey="ListItemResource5" Selected="True">Masti</asp:ListItem>
                                <asp:ListItem meta:resourcekey="ListItemResource6">Bjelančevine</asp:ListItem>
                                <asp:ListItem meta:resourcekey="ListItemResource7">Ugljikohidrati</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTipNamirnice" runat="server" Text='<%# Bind("TipNamirnice") %>' meta:resourcekey="lblTipNamirniceResource2"></asp:Label>
                        </ItemTemplate>
                        <ControlStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:CommandField CancelText="Odustani" DeleteText="Obriši" EditText="Uredi" ShowEditButton="True" ShowDeleteButton="True" InsertText="Umetni" meta:resourcekey="CommandFieldResource1" />

                    <%--CheckBox--%>
                    <asp:TemplateField HeaderText="Odaberi" meta:resourcekey="TemplateFieldResource9">

                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="cbOdaberi" meta:resourcekey="cbOdaberiResource1" />

                        </ItemTemplate>

                    </asp:TemplateField>
                    <%--CheckBox--%>



                    <asp:HyperLinkField NavigateUrl="#top" Text="Top" meta:resourcekey="HyperLinkFieldResource1">
                        <ControlStyle CssClass="btn btn-primary " />
                    </asp:HyperLinkField>



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

        <asp:Label ID="lblInfo" runat="server" Font-Bold="True" Font-Size="12px" ForeColor="Red" meta:resourcekey="lblInfoResource1"></asp:Label>




    </div>


</asp:Content>
