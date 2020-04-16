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
                    <asp:DropDownList runat="server" ID="ddlTipNamirnice" CssClass="form-control" AutoPostBack="True">
                        <asp:ListItem Value="sve">Sve</asp:ListItem>
                        <asp:ListItem Value="bjelančevine">Bjelančevine</asp:ListItem>
                        <asp:ListItem Value="ugljikohidrati">Ugljikohidrati</asp:ListItem>
                        <asp:ListItem Value="masti">Masti</asp:ListItem>
                    </asp:DropDownList>

                </div>

                <%--<div class="form-group">

                    <label class="badge w-100">Odaberite datum</label>
                    <asp:Calendar ID="calendar" runat="server">
                        <SelectedDayStyle BackColor="Yellow" ForeColor="Black" />
                    </asp:Calendar>
                    
                </div>--%>
                <div class="form-group">

                    <asp:Button runat="server" ID="Button1" Text="Generiraj obrok" CssClass="btn btn-block btn-primary" OnClick="btnGeneriraj_Click" />
                </div>
            </div>
        </div>

          

        <div class="row justify-content-center ">


            <asp:GridView ID="gvNamirnice" runat="server" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Width="1000px" DataKeyNames="IDNamirnice" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CssClass="table table-borderless" OnPageIndexChanging="gvNamirnice_PageIndexChanging" OnRowCancelingEdit="gvNamirnice_RowCancelingEdit" OnRowEditing="gvNamirnice_RowEditing" OnRowUpdating="gvNamirnice_RowUpdating" OnRowDeleting="gvNamirnice_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="NAMIRNICA">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NazivNamirnice") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNaziv" runat="server" Text='<%# Bind("NazivNamirnice") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ENERGIJA [kJ]">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Energija_kJ") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEnergija_kJ" runat="server" Text='<%# Bind("Energija_kJ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ENERGIJA [kcal]">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Energija_kcal") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEnergija_kcal" runat="server" Text='<%# Bind("Energija_kcal") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Grami">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Grami") %>' CssClass="form-control" Width="100"></asp:TextBox>
                            
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblGrami" runat="server" Text='<%# Bind("Grami") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Komad">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Komad") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblKomad" runat="server" Text='<%# Bind("Komad") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Žlica">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Zlica") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblZlica" runat="server" Text='<%# Bind("Zlica") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Šalica">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Salica") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSalica" runat="server" Text='<%# Bind("Salica") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TIP NAMIRNICE">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEdit" runat="server" Text='<%# Bind("TipNamirnice") %>' Width="200" CssClass="form-control">
                                <asp:ListItem>Masti</asp:ListItem>
                                <asp:ListItem>Bjelančevine</asp:ListItem>
                                <asp:ListItem>Ugljikohidrati</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTipNamirnice" runat="server" Text='<%# Bind("TipNamirnice") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:CommandField CancelText="Odustani" DeleteText="Obriši" EditText="Uredi" ShowEditButton="True" ShowDeleteButton="True" InsertText="Umetni" />

                    <%--CheckBox--%>
                    <asp:TemplateField HeaderText="Odaberi">

                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="cbOdaberi" />

                        </ItemTemplate>

                    </asp:TemplateField>

                    <%--CheckBox--%>
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
