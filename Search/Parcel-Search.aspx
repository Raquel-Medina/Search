<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Parcel-Search.aspx.cs" Inherits="Search.Parcel_Search" MaintainScrollPositionOnPostback="true" %>

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
                <!-- select search -->
                <div class="mb-5">
                    <h5 class="header-title">SEARCH BY</h5>
                    <asp:DropDownList ID="ddlSearchType" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlSearchType_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem>SEARCH BY</asp:ListItem>
                        <asp:ListItem>OWNERS NAME</asp:ListItem>
                        <asp:ListItem>PROPERTY ADDRESS</asp:ListItem>
                        <asp:ListItem>PARCEL NUMBER</asp:ListItem>
                        <asp:ListItem>SECTION/TOWNSHIP/RANGE</asp:ListItem>
                        <asp:ListItem>CABINET/SLIDE/LOT</asp:ListItem>
                        <asp:ListItem>SUBDIVISION NAME</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <!-- start of form search by OWNER code -->
                <div id="searchName" runat="server" visible="false">
                    <h5 class="header-title">OWNERS NAME</h5>
                    <div class="row">
                        <div class="col-lg-10 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtOwner" CssClass="form-control" placeholder="LAST/FIRST NAME" datalpignore="true" runat="server" />
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
                            <asp:GridView ID="gvSearchName" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" ViewStateMode="Disabled" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
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

                <!-- start of search by ADDRESS code -->
                <div id="searchAddress" runat="server" visible="false">
                    <h5 class="header-title">PROPERTY ADDRESS</h5>
                    <div class="row">
                        <div class="col-lg-2 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtNumber" CssClass="form-control" placeholder="STREET NUMBER" datalpignore="true" runat="server" />
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
                            <asp:TextBox ID="txtStreetName" CssClass="form-control" placeholder="STREET NAME" datalpignore="true" runat="server" />
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

                <!-- start of form search by PARCEL NUMBER code -->
                <div id="searchParcel" runat="server" visible="false">
                    <h5 class="header-title">PARCEL NUMBER</h5>
                    <div class="row">
                        <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtBook" CssClass="form-control" placeholder="BOOK" datalpignore="true" runat="server" />
                        </div>
                        <div class="col-lg-2 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtMap" CssClass="form-control" placeholder="MAP" datalpignore="true" runat="server" />
                        </div>
                        <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtParcel" CssClass="form-control" placeholder="PARCEL" datalpignore="true" runat="server" />
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

                <!-- start of form search by SEC TWN RNG code -->
                <div id="searchSTR" runat="server" visible="false">
                    <h5 class="header-title">SECTION/TOWNSHIP/RANGE</h5>
                    <div class="row">
                        <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                            <asp:DropDownList ID="ddlSection" CssClass="form-control" runat="server">
                                <asp:ListItem>SECTION</asp:ListItem>
                                <asp:ListItem>01</asp:ListItem>
                                <asp:ListItem>02</asp:ListItem>
                                <asp:ListItem>03</asp:ListItem>
                                <asp:ListItem>04</asp:ListItem>
                                <asp:ListItem>05</asp:ListItem>
                                <asp:ListItem>06</asp:ListItem>
                                <asp:ListItem>07</asp:ListItem>
                                <asp:ListItem>08</asp:ListItem>
                                <asp:ListItem>09</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem>
                                <asp:ListItem>17</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem>19</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem>
                                <asp:ListItem>22</asp:ListItem>
                                <asp:ListItem>23</asp:ListItem>
                                <asp:ListItem>24</asp:ListItem>
                                <asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem>
                                <asp:ListItem>27</asp:ListItem>
                                <asp:ListItem>28</asp:ListItem>
                                <asp:ListItem>29</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                                <asp:ListItem>31</asp:ListItem>
                                <asp:ListItem>32</asp:ListItem>
                                <asp:ListItem>33</asp:ListItem>
                                <asp:ListItem>34</asp:ListItem>
                                <asp:ListItem>35</asp:ListItem>
                                <asp:ListItem>36</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                            <asp:DropDownList ID="ddlTownship" CssClass="form-control" runat="server">
                                <asp:ListItem>TOWNSHIP</asp:ListItem>
                                <asp:ListItem>01N</asp:ListItem>
                                <asp:ListItem>01S</asp:ListItem>
                                <asp:ListItem>02S</asp:ListItem>
                                <asp:ListItem>03S</asp:ListItem>
                                <asp:ListItem>04S</asp:ListItem>
                                <asp:ListItem>05S</asp:ListItem>
                                <asp:ListItem>06S</asp:ListItem>
                                <asp:ListItem>07S</asp:ListItem>
                                <asp:ListItem>08S</asp:ListItem>
                                <asp:ListItem>09S</asp:ListItem>
                                <asp:ListItem>10S</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-4 col-sm-12 align-self-center pb-2">
                            <asp:DropDownList ID="ddlRange" CssClass="form-control" runat="server">
                                <asp:ListItem>RANGE</asp:ListItem>
                                <asp:ListItem>02E</asp:ListItem>
                                <asp:ListItem>03E</asp:ListItem>
                                <asp:ListItem>04E</asp:ListItem>
                                <asp:ListItem>05E</asp:ListItem>
                                <asp:ListItem>06E</asp:ListItem>
                                <asp:ListItem>07E</asp:ListItem>
                                <asp:ListItem>08E</asp:ListItem>
                                <asp:ListItem>09E</asp:ListItem>
                                <asp:ListItem>10E</asp:ListItem>
                                <asp:ListItem>11E</asp:ListItem>
                                <asp:ListItem>12E</asp:ListItem>
                                <asp:ListItem>13E</asp:ListItem>
                                <asp:ListItem>14E</asp:ListItem>
                                <asp:ListItem>15E</asp:ListItem>
                                <asp:ListItem>16E</asp:ListItem>
                                <asp:ListItem>17E</asp:ListItem>
                                <asp:ListItem>18E</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-2 align-self-center pb-2">
                            <asp:Button ID="btnSearchSTR" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="ml-2">
                                <asp:Label ID="lblSearchSTRWarning" CssClass="alert-light" runat="server" Text="All fields are mandatory"></asp:Label>
                            </div>
                            <asp:GridView ID="gvSearchSTR" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
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

                <!-- start of form search by CABINET SLIDE LOT code -->
                <div id="searchCSL" runat="server" visible="false">
                    <h5 class="header-title">CABINET/SLIDE/LOT</h5>
                    <div class="row">
                        <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtCabinet" CssClass="form-control" placeholder="CABINET" datalpignore="true" runat="server" />
                        </div>
                        <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtSlide" CssClass="form-control" placeholder="SLIDE" datalpignore="true" runat="server" />
                        </div>
                        <div class="col-lg-4 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtLot" CssClass="form-control" placeholder="LOT" datalpignore="true" runat="server" />
                        </div>
                        <div class="col-2 align-self-center pb-2">
                            <asp:Button ID="btnSearchCabSlideLot" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="ml-2">
                                <asp:Label ID="lblSearchCabSlideLotWarning" CssClass="alert-light" runat="server" Text="All fields are mandatory"></asp:Label>
                            </div>
                            <asp:GridView ID="gvSearchCabSlideLot" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
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

                <!-- start of form search by SUBDIVISION code -->
                <div id="searchSub" runat="server" visible="false">
                    <h5 class="header-title">SUBDIVISION NAME</h5>
                    <div class="row">
                        <div class="col-lg-10 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtSubdivision" CssClass="form-control" placeholder="SUBDIVISION NAME" datalpignore="true" runat="server" />
                        </div>
                        <div class="col-2 align-self-center pb-2">
                            <asp:Button ID="btnSearchSubdivision" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="ml-2">
                                <asp:Label ID="lblSearchSubdivisionWarning" CssClass="alert-light" runat="server"></asp:Label>
                            </div>
                            <asp:GridView ID="gvSearchSubdivision" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="PARCEL NUMBER" DataNavigateUrlFields="parcel_id" DataNavigateUrlFormatString="Parcel-Details.aspx?parcel_id={0}" DataTextField="parcel_id" />
                                    <asp:BoundField HeaderText="OWNER NAME" DataField="owner_na1" />
                                    <asp:BoundField HeaderText="MAILING CITY & STATE" DataField="" />
                                    <asp:BoundField HeaderText="SUBDIVISION NAME" DataField="sub_name" />
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
