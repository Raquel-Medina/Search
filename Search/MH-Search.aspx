<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MH-Search.aspx.cs" Inherits="Search.MH_Search" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>MH Search</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

    <!-- Project CSS files -->
    <link rel="stylesheet" href="css/site.css" type="text/css" />

    <!-- Google tag (gtag.js) -->
    <script async="async" src="https://www.googletagmanager.com/gtag/js?id=G-7Q6NTBLCK0"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());
        gtag('config', 'G-7Q6NTBLCK0');
    </script>
</head>

<body>
    <div class="search-page">
        <div class="container">
            <div class="header-banner">
                <a href="https://www.pinal.gov/486/Assessor"><asp:Image CssClass="header-image img-fluid" runat="server" ImageUrl="./images/Logo.png" /></a>
                <h4 class="header-title">Assessor</h4>
                <hr class="header-title" />
                <h2 class="header-title mb-5">Manufactured Housing Search</h2>
            </div>
            <form runat="server">
                <!-- select search -->
                <div class="mb-5">
                    <h5 class="header-title">SEARCH BY</h5>
                    <asp:DropDownList ID="ddlSearchType" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlSearchType_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem>SEARCH BY</asp:ListItem>
                        <asp:ListItem>OWNERS NAME</asp:ListItem>
                        <asp:ListItem>PROPERTY ADDRESS</asp:ListItem>
                        <asp:ListItem>PARCEL NUMBER</asp:ListItem>
                        <asp:ListItem>TAX PAYER ID</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <!-- start of form search by OWNER code -->
                <div id="searchName" runat="server" visible="false">
                    <h5 class="header-title">OWNERS NAME</h5>
                    <div class="row">
                        <div class="col-lg-10 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtOwner" CssClass="form-control" placeholder="LAST/FIRST NAME" runat="server" />
                        </div>
                        <div class="col-lg-2 col-sm-12 align-self-center pb-2">
                            <asp:Button ID="btnSearchOwner" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="ml-2">
                                <asp:Label ID="lblSearchOwnerWarning" CssClass="alert-light" runat="server"></asp:Label>
                            </div>
                            <asp:GridView ID="gvSearchName" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="TAX PAYER ID" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="MH-Details.aspx?id={0}" DataTextField="ID" />
                                    <asp:BoundField HeaderText="OWNER NAME" DataField="Name" />
                                    <asp:BoundField HeaderText="MAILING CITY & STATE" DataField="" />
                                </Columns>
                                <HeaderStyle CssClass="grid-header" />
                                <PagerStyle CssClass="grid-pager" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <!-- start of search by ADDRESS code -->
                <div id="searchAddress" runat="server" visible="false">
                    <h5 class="header-title">PROPERTY ADDRESS</h5>
                    <div class="row">
                        <div class="col-lg-2 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtNumber" CssClass="form-control" placeholder="NUMBER" runat="server" />
                        </div>
                        <div class="col-lg-2 col-sm-12 align-self-center pb-2">
                            <asp:DropDownList ID="ddlDirection" CssClass="form-control" runat="server">
                                <asp:ListItem Value="">DIRECTION</asp:ListItem>
                                <asp:ListItem Value="N">North</asp:ListItem>
                                <asp:ListItem Value="S">South</asp:ListItem>
                                <asp:ListItem Value="E">East</asp:ListItem>
                                <asp:ListItem Value="W">West</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-4 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtStreetName" CssClass="form-control" placeholder="NAME" runat="server" />
                        </div>
                        <div class="col-lg-2 col-sm-12 align-self-center pb-2">
                            <asp:DropDownList ID="ddlSuffix" CssClass="form-control" placeholder="SUFFIX" runat="server">
                                <asp:ListItem Value="">SUFFIX</asp:ListItem>
                                <asp:ListItem>AVE</asp:ListItem>
                                <asp:ListItem>BND</asp:ListItem>
                                <asp:ListItem>BLVD</asp:ListItem>
                                <asp:ListItem>CIR</asp:ListItem>
                                <asp:ListItem>CT</asp:ListItem>
                                <asp:ListItem>DR</asp:ListItem>
                                <asp:ListItem>HWY</asp:ListItem>
                                <asp:ListItem>LN</asp:ListItem>
                                <asp:ListItem>LOOP</asp:ListItem>
                                <asp:ListItem>PASS</asp:ListItem>
                                <asp:ListItem>PATH</asp:ListItem>
                                <asp:ListItem>PKWY</asp:ListItem>
                                <asp:ListItem>PL</asp:ListItem>
                                <asp:ListItem>RD</asp:ListItem>
                                <asp:ListItem>ST</asp:ListItem>
                                <asp:ListItem>TRL</asp:ListItem>
                                <asp:ListItem>WAY</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-2 col-sm-12 align-self-center pb-2">
                            <asp:Button ID="btnSearchAddress" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="ml-2">
                                <asp:Label ID="lblSearchAddressWarning" CssClass="alert-light" runat="server"></asp:Label>
                            </div>
                            <asp:GridView ID="gvSearchAddress" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="TAX PAYER ID" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="MH-Details.aspx?id={0}" DataTextField="ID" />
                                    <asp:BoundField HeaderText="OWNER NAME" DataField="Name" />
                                    <asp:BoundField HeaderText="MAILING CITY & STATE" DataField="" />
                                </Columns>
                                <HeaderStyle CssClass="grid-header" />
                                <PagerStyle CssClass="grid-pager" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <!-- start of form search by PARCEL NUMBER code -->
                <div id="searchParcel" runat="server" visible="false">
                    <h5 class="header-title">PARCEL NUMBER</h5>
                    <div class="row">
                        <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtBook" CssClass="form-control" placeholder="BOOK" runat="server" />
                        </div>
                        <div class="col-lg-2 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtMap" CssClass="form-control" placeholder="MAP" runat="server" />
                        </div>
                        <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtParcel" CssClass="form-control" placeholder="PARCEL" runat="server" />
                        </div>
                        <div class="col-lg-2 col-sm-12 align-self-center pb-2">
                            <asp:DropDownList ID="ddlSplit" CssClass="form-control" runat="server">
                                <asp:ListItem>SPLIT</asp:ListItem>
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>A</asp:ListItem>
                                <asp:ListItem>B</asp:ListItem>
                                <asp:ListItem>C</asp:ListItem>
                                <asp:ListItem>D</asp:ListItem>
                                <asp:ListItem>E</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                                <asp:ListItem>G</asp:ListItem>
                                <asp:ListItem>H</asp:ListItem>
                                <asp:ListItem>I</asp:ListItem>
                                <asp:ListItem>J</asp:ListItem>
                                <asp:ListItem>K</asp:ListItem>
                                <asp:ListItem>L</asp:ListItem>
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>N</asp:ListItem>
                                <asp:ListItem>O</asp:ListItem>
                                <asp:ListItem>P</asp:ListItem>
                                <asp:ListItem>Q</asp:ListItem>
                                <asp:ListItem>R</asp:ListItem>
                                <asp:ListItem>S</asp:ListItem>
                                <asp:ListItem>T</asp:ListItem>
                                <asp:ListItem>U</asp:ListItem>
                                <asp:ListItem>V</asp:ListItem>
                                <asp:ListItem>W</asp:ListItem>
                                <asp:ListItem>X</asp:ListItem>
                                <asp:ListItem>Y</asp:ListItem>
                                <asp:ListItem>Z</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-2 align-self-center pb-2">
                            <asp:Button ID="btnSearchParcel" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="ml-2">
                                <asp:Label ID="lblSearchParcelWarning" CssClass="alert-light" runat="server"></asp:Label>
                            </div>
                            <asp:GridView ID="gvSearchParcel" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="TAX PAYER ID" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="MH-Details.aspx?id={0}" DataTextField="ID" />
                                    <asp:BoundField HeaderText="OWNER NAME" DataField="Name" />
                                    <asp:BoundField HeaderText="MAILING CITY & STATE" DataField="" />
                                </Columns>
                                <HeaderStyle CssClass="grid-header" />
                                <PagerStyle CssClass="grid-pager" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <!-- start of form search by TAXPAYER ID code -->
                <div id="searchTaxID" runat="server" visible="false">
                    <h5 class="header-title">TAX PAYER ID</h5>
                    <div class="row">
                        <div class="col-lg-10 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtTaxID" CssClass="form-control" placeholder="TAX PAYER ID" runat="server" />
                        </div>
                        <div class="col-lg-2 col-sm-12 align-self-center pb-2">
                            <asp:Button ID="btnTaxID" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="ml-2">
                                <asp:Label ID="lblSearchTaxIDWarning" CssClass="alert-light" runat="server"></asp:Label>
                            </div>
                            <asp:GridView ID="gvSearchTaxID" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="TAX PAYER ID" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="MH-Details.aspx?id={0}" DataTextField="ID" />
                                    <asp:BoundField HeaderText="OWNER NAME" DataField="Name" />
                                    <asp:BoundField HeaderText="MAILING CITY & STATE" DataField="" />
                                </Columns>
                                <HeaderStyle CssClass="grid-header" />
                                <PagerStyle CssClass="grid-pager" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/125e3f2ff2.js"></script>
</body>
</html>
