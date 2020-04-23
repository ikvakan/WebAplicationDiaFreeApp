<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddMealPage.aspx.cs" Inherits="WebFormsApp_AdminSite.AddMealPage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ MasterType VirtualPath="~/Admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/CreateMealPage.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container w-25 ">

        <div class="row  ">
            <div class="col-md-12 ">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblObrok" CssClass="badge w-100" meta:resourcekey="lblObrokResource1">Obrok</asp:Label>
                    <asp:DropDownList runat="server" ID="ddlObrok" CssClass="form-control" meta:resourcekey="ddlObrokResource1">
                        <asp:ListItem meta:resourcekey="ListItemResource1">Doručak</asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemResource2">Ručak</asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemResource3">Večera</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="col-md-12 ">
                <div class="form-group">
                    <asp:Label runat="server" ID="lblDatum" CssClass="badge w-100" meta:resourcekey="lblDatumResource1">Datum</asp:Label>
                    <asp:TextBox ID="txtDatum" runat="server" CssClass="form-control" TextMode="Date" meta:resourcekey="txtDatumResource1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Datum je obavezan" ForeColor="Red" ControlToValidate="txtDatum" meta:resourcekey="RequiredFieldValidator1Resource1">Datum je obavezan.</asp:RequiredFieldValidator>
                </div>
            </div>



        </div>

        <div class="row justify-content-center">

            <asp:GridView ID="gvPopisNamirnica" runat="server" CssClass="table table-borderless" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="IDNamirnice" Width="900px" OnRowDeleting="gvPopisNamirnica_RowDeleting" meta:resourcekey="gvPopisNamirnicaResource1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="NAMIRNICA" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NazivNamirnice") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNaziv" runat="server" Text='<%# Bind("NazivNamirnice") %>' meta:resourcekey="lblNazivResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ENERGIJA [kJ]" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Energija_kJ") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEnergija_kJ" runat="server" Text='<%# Bind("Energija_kJ") %>' meta:resourcekey="lblEnergija_kJResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ENERGIJA [kcal]" meta:resourcekey="TemplateFieldResource3">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Energija_kcal") %>' meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEnergija_kcal" runat="server" Text='<%# Bind("Energija_kcal") %>' meta:resourcekey="lblEnergija_kcalResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Grami" meta:resourcekey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Grami") %>' meta:resourcekey="TextBox4Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblGrami" runat="server" Text='<%# Bind("Grami") %>' meta:resourcekey="lblGramiResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Komad" meta:resourcekey="TemplateFieldResource5">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Komad") %>' meta:resourcekey="TextBox5Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblKomad" runat="server" Text='<%# Bind("Komad") %>' meta:resourcekey="lblKomadResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Žlica" meta:resourcekey="TemplateFieldResource6">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Zlica") %>' meta:resourcekey="TextBox6Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblZlica" runat="server" Text='<%# Bind("Zlica") %>' meta:resourcekey="lblZlicaResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Šalica" meta:resourcekey="TemplateFieldResource7">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Salica") %>' meta:resourcekey="TextBox7Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSalica" runat="server" Text='<%# Bind("Salica") %>' meta:resourcekey="lblSalicaResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TIP NAMIRNICE" meta:resourcekey="TemplateFieldResource8">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("TipNamirnice") %>' meta:resourcekey="TextBox8Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTipNamirnice" runat="server" Text='<%# Bind("TipNamirnice") %>' meta:resourcekey="lblTipNamirniceResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Odaberi" meta:resourcekey="TemplateFieldResource9">
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="cbOdaberi" meta:resourcekey="cbOdaberiResource1" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField DeleteText="Obriši" ShowDeleteButton="True" meta:resourcekey="CommandFieldResource1" />
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


                <div class="form-group ">
                    <asp:Button runat="server" ID="btnKreirajObrok" Text="Kreiraj obrok" CssClass="btn btn-block btn-primary " OnClick="btnKreirajObrok_Click" meta:resourcekey="btnKreirajObrokResource1" />
                </div>
                <div class="form-group">
                    <asp:Button runat="server" ID="btnPonisti" CssClass="btn btn-block btn-danger" Visible="False" Text="Poništi odabir" OnClick="btnPonisti_Click" meta:resourcekey="btnPonistiResource1" />
                </div>
                <asp:Label runat="server" ID="lblInfo" ForeColor="Red" meta:resourcekey="lblInfoResource1"></asp:Label>

    </div>
</asp:Content>
