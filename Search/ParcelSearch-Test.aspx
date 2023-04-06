<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParcelSearch-Test.aspx.cs" Inherits="Search.ParcelSearch_Test" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Parcel Search</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="robots" content="noindex" />

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

    <!-- Parcel textbox auto tab -->
    <script type="text/javascript">
        function moveFocus(fromTextBox, toTextBox) {
            var length = fromTextBox.value.length;
            var maxLength = fromTextBox.getAttribute("maxLength");

            if (length == maxLength) {
                document.getElementById(toTextBox).focus();
            }
        }
    </script>
</head>

<body>
    <div class="search-page">
        <div class="container">
            <div class="header-banner">
                <a href="https://www.pinal.gov/486/Assessor"><asp:Image CssClass="image-header img-fluid" runat="server" ImageUrl="./images/Logo.png" /></a>
                <h4 class="header-title">Assessor</h4>
                <hr class="header-title" />
                <h2 class="header-title mb-5">Parcel Search</h2>
            </div>
            <form runat="server">
                <!-- start of form search by OWNER code -->
                <div class="search-form mt-4">
                    <h5 class="header-title">OWNERS NAME</h5>
                    <asp:Panel ID="pnlOwner" DefaultButton="btnSearchOwner" runat="server">
                    <div class="row">
                        <div class="col-10">
                            <asp:TextBox ID="txtOwner" CssClass="form-control" placeholder="LAST/FIRST NAME" runat="server" />
                        </div>
                        <div class="col-2">
                            <asp:Button ID="btnSearchOwner" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    </asp:Panel>
                    <div class="row">
                        <div class="col-10">
                            <asp:Label ID="lblSearchOwnerWarning" CssClass="alert-light" runat="server"></asp:Label>
                            <asp:GridView ID="gvSearchName" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="PARCEL NUMBER" DataNavigateUrlFields="parcel_id" DataNavigateUrlFormatString="Parcel-Details.aspx?parcel_id={0}" DataTextField="parcel_id" />
                                    <asp:BoundField HeaderText="OWNER NAME" DataField="owner_na1" />
                                    <asp:BoundField HeaderText="MAILING CITY & STATE" DataField="" />
                                </Columns>
                                <HeaderStyle CssClass="grid-header" />
                                <PagerStyle CssClass="grid-pager" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <hr class="mt-5" />

                <!-- start of search by ADDRESS code -->
                <div class="search-form mt-4">
                    <h5 class="header-title">PROPERTY ADDRESS</h5>
                    <asp:Panel ID="pnlAddress" DefaultButton="btnSearchAddress" runat="server">
                    <div class="row">
                        <div class="col-2">
                            <asp:TextBox ID="txtNumber" CssClass="form-control" placeholder="STREET NUMBER" runat="server" />
                        </div>
                        <div class="col-2">
                            <asp:DropDownList ID="ddlDirection" CssClass="form-control" runat="server">
                                <asp:ListItem Value="">DIRECTION</asp:ListItem>
                                <asp:ListItem Value="N">North</asp:ListItem>
                                <asp:ListItem Value="S">South</asp:ListItem>
                                <asp:ListItem Value="E">East</asp:ListItem>
                                <asp:ListItem Value="W">West</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-4">
                            <asp:TextBox ID="txtStreetName" CssClass="form-control" placeholder="STREET NAME" runat="server" />
                        </div>
                        <div class="col-2">
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
                        <div class="col-2">
                            <asp:Button ID="btnSearchAddress" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    </asp:Panel>
                    <div class="row">
                        <div class="col-10">
                            <asp:Label ID="lblSearchAddressWarning" CssClass="alert-light" runat="server" Text="All fields are mandatory"></asp:Label>
                            <asp:GridView ID="gvSearchAddress" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="PARCEL NUMBER" DataNavigateUrlFields="parcel_id" DataNavigateUrlFormatString="Parcel-Details.aspx?parcel_id={0}" DataTextField="parcel_id" />
                                    <asp:BoundField HeaderText="OWNER NAME" DataField="owner_na1" />
                                    <asp:BoundField HeaderText="MAILING CITY & STATE" DataField="" />
                                </Columns>
                                <HeaderStyle CssClass="grid-header" />
                                <PagerStyle CssClass="grid-pager" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <hr class="mt-5" />

                <!-- start of form search by PARCEL NUMBER code -->
                <div class="search-form mt-4">
                    <h5 class="header-title">PARCEL NUMBER</h5>
                    <asp:Panel ID="pnlParcel" DefaultButton="btnSearchParcel" runat="server">
                    <div class="row">
                        <div class="col-3">
                            <asp:TextBox ID="txtBook" CssClass="form-control" placeholder="BOOK" MaxLength="3" onkeyup="moveFocus(this, 'txtMap')" runat="server" />
                        </div>
                        <div class="col-2">
                            <asp:TextBox ID="txtMap" CssClass="form-control" placeholder="MAP" MaxLength="2" onkeyup="moveFocus(this, 'txtParcel')" runat="server" />
                        </div>
                        <div class="col-3">
                            <asp:TextBox ID="txtParcel" CssClass="form-control" placeholder="PARCEL" MaxLength="3" onkeyup="moveFocus(this, 'ddlSplit')" runat="server" />
                        </div>
                        <div class="col-2">
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
                        <div class="col-2">
                            <asp:Button ID="btnSearchParcel" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    </asp:Panel>
                    <div class="row">
                        <div class="col-10">
                            <asp:Label ID="lblSearchParcelWarning" CssClass="alert-light" runat="server" Text="All fields are mandatory"></asp:Label>
                            <asp:GridView ID="gvSearchParcel" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="PARCEL NUMBER" DataNavigateUrlFields="parcel_id" DataNavigateUrlFormatString="Parcel-Details.aspx?parcel_id={0}" DataTextField="parcel_id" />
                                    <asp:BoundField HeaderText="OWNER NAME" DataField="owner_na1" />
                                    <asp:BoundField HeaderText="MAILING CITY & STATE" DataField="" />
                                </Columns>
                                <HeaderStyle CssClass="grid-header" />
                                <PagerStyle CssClass="grid-pager" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <hr class="mt-5" />

                <!-- start of form search by SUBDIVISION code -->
                <div class="search-form mt-4">
                    <h5 class="header-title">SUBDIVISION NAME</h5>
                    <asp:Panel ID="pnlSubdivision" DefaultButton="btnSearchSubdivision" runat="server">
                    <div class="row">
                        <div class="col-10">
                            <asp:TextBox ID="txtSubdivision" CssClass="form-control" placeholder="SUBDIVISION NAME" runat="server" />
                        </div>
                        <div class="col-2">
                            <asp:Button ID="btnSearchSubdivision" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    </asp:Panel>
                    <div class="row">
                        <div class="col-10">
                                <asp:Label ID="lblSearchSubdivisionWarning" CssClass="alert-light" runat="server" Text="Subdivision is mandatory"></asp:Label>
                            <asp:GridView ID="gvSearchSubdivision" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="PARCEL NUMBER" DataNavigateUrlFields="parcel_id" DataNavigateUrlFormatString="Parcel-Details.aspx?parcel_id={0}" DataTextField="parcel_id" />
                                    <asp:BoundField HeaderText="OWNER NAME" DataField="owner_na1" />
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
