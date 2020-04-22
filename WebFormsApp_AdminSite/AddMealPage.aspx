<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddMealPage.aspx.cs" Inherits="WebFormsApp_AdminSite.AddMealPage" %>

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
                    <label class="badge w-100">Obrok</label>
                    <asp:DropDownList runat="server" ID="ddlObrok" CssClass="form-control">
                        <asp:ListItem>Doručak</asp:ListItem>
                        <asp:ListItem>Ručak</asp:ListItem>
                        <asp:ListItem>Večera</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="col-md-12 ">
                <div class="form-group">
                    <label class="badge w-100">Datum</label>
                    <asp:TextBox ID="txtDatum" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Datum je obavezan" ForeColor="Red" ControlToValidate="txtDatum">Datum je obavezan.</asp:RequiredFieldValidator>
                </div>
            </div>



        </div>

        <div class="row justify-content-center">

            <asp:GridView ID="gvPopisNamirnica" runat="server" CssClass="table table-borderless" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="IDNamirnice" Width="900px" OnRowDeleting="gvPopisNamirnica_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="NAMIRNICA">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NazivNamirnice") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNaziv" runat="server" Text='<%# Bind("NazivNamirnice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ENERGIJA [kJ]">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Energija_kJ") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEnergija_kJ" runat="server" Text='<%# Bind("Energija_kJ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ENERGIJA [kcal]">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Energija_kcal") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEnergija_kcal" runat="server" Text='<%# Bind("Energija_kcal") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Grami">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Grami") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblGrami" runat="server" Text='<%# Bind("Grami") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Komad">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Komad") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblKomad" runat="server" Text='<%# Bind("Komad") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Žlica">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Zlica") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblZlica" runat="server" Text='<%# Bind("Zlica") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Šalica">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Salica") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSalica" runat="server" Text='<%# Bind("Salica") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TIP NAMIRNICE">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("TipNamirnice") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTipNamirnice" runat="server" Text='<%# Bind("TipNamirnice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Odaberi">
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="cbOdaberi" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField DeleteText="Obriši" ShowDeleteButton="True" />
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
                    <asp:Button runat="server" ID="btnKreirajObrok" Text="Kreiraj obrok" CssClass="btn btn-block btn-primary " OnClick="btnKreirajObrok_Click" />
                </div>
                <div class="form-group">
                    <asp:Button runat="server" ID="btnPonisti" CssClass="btn btn-block btn-danger" Visible="false" Text="Poništi odabir" OnClick="btnPonisti_Click" />
                </div>
                <asp:Label runat="server" ID="lblInfo" ForeColor="Red"></asp:Label>

    </div>
</asp:Content>
