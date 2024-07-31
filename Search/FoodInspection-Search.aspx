<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FoodInspection-Search.aspx.cs" Inherits="Search.FoodInspection_Search" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pinal County Food Inspection Search</title>
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
                <a href="https://www.pinal.gov/870/Environmental-Health"><asp:Image CssClass="header-image img-fluid" runat="server" ImageUrl="./images/Logo.png" /></a>
                <h4 class="header-title">Environmental Health</h4>
                <hr class="header-title" />
                <h2 class="header-title mb-5">Food Inspection Search</h2>
            </div>
            <form runat="server">
                <!-- select search -->
                <div class="mb-5">
                    <h5 class="header-title">SEARCH BY</h5>
                    <asp:DropDownList ID="ddlSearchType" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlSearchType_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem>SEARCH BY</asp:ListItem>
                        <asp:ListItem>ESTABLISHMENT NAME</asp:ListItem>
                        <asp:ListItem>PERMIT NUMBER</asp:ListItem>
                        <asp:ListItem>RATING CLASS</asp:ListItem>
                        <asp:ListItem>CITY/TOWN</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <!-- start of form search by ESTABLISHMENT NAME code -->
                <div id="searchName" runat="server" visible="false">
                    <h5 class="header-title">ESTABLISHMENT NAME</h5>
                    <div class="row">
                        <div class="col-lg-7 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtEstName" CssClass="form-control" placeholder="ESTABLISHMENT NAME" runat="server" />
                        </div>
                        <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                            <asp:DropDownList ID="ddlEstNameYear" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-2 align-self-center pb-2">
                            <asp:Button ID="btnEstName" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="ml-2">
                                <asp:Label ID="lblEstNameWarning" CssClass="alert-light" runat="server"></asp:Label>
                            </div>
                            <asp:GridView ID="gvEstName" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="ESTABLISHMENT" DataNavigateUrlFields="activityid" DataNavigateUrlFormatString="FoodInspection-Details.aspx?id={0}" DataTextField="sitename" />
                                    <asp:BoundField HeaderText="DATE" DataField="datecreated" />
                                    <asp:BoundField HeaderText="RATING" DataField="rating" />
                                    <asp:BoundField HeaderText="ADDRESS" DataField="prettyaddress" />
                                    <asp:BoundField HeaderText="CITY" DataField="addrcity" />
                                </Columns>
                                <HeaderStyle CssClass="grid-header" />
                                <PagerStyle CssClass="grid-pager" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <!-- start of search by PERMIT NUMBER code -->
                <div id="searchPermitNum" runat="server" visible="false">
                    <h5 class="header-title">PERMIT NUMBER</h5>
                    <div class="row">
                        <div class="col-lg-7 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtPermitNum" CssClass="form-control" placeholder="PERMIT NUMBER" runat="server" />
                        </div>
                        <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                            <asp:DropDownList ID="ddlPermitNumYear" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-2 align-self-center pb-2">
                            <asp:Button ID="btnPermitNum" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="ml-2">
                                <asp:Label ID="lblPermitNumWarning" CssClass="alert-light" runat="server"></asp:Label>
                            </div>
                            <asp:GridView ID="gvPermitNum" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="ESTABLISHMENT" DataNavigateUrlFields="activityid" DataNavigateUrlFormatString="FoodInspection-Details.aspx?id={0}" DataTextField="sitename" />
                                    <asp:BoundField HeaderText="DATE" DataField="datecreated" />
                                    <asp:BoundField HeaderText="RATING" DataField="rating" />
                                    <asp:BoundField HeaderText="ADDRESS" DataField="prettyaddress" />
                                    <asp:BoundField HeaderText="CITY" DataField="addrcity" />
                                </Columns>
                                <HeaderStyle CssClass="grid-header" />
                                <PagerStyle CssClass="grid-pager" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <!-- start of form search by RATING CLASS code -->
                <div id="searchRating" runat="server" visible="false">
                    <h5 class="header-title">RATING CLASS</h5>
                    <div class="row">
                        <div class="col-lg-7 col-sm-12 align-self-center pb-2">
                            <asp:DropDownList ID="ddlRatingClass" CssClass="form-control" runat="server">
                                <asp:ListItem Value="E">E - Excellent</asp:ListItem>
                                <asp:ListItem Value="S">S - Satisfactory</asp:ListItem>
                                <asp:ListItem Value="N">N - Needs Improvement</asp:ListItem>
                                <asp:ListItem Value="U">U - Unacceptable</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                            <asp:DropDownList ID="ddlRatingClassYear" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-2 align-self-center pb-2">
                            <asp:Button ID="btnRatingClass" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="ml-2">
                                <asp:Label ID="lblRatingClassWarning" CssClass="alert-light" runat="server"></asp:Label>
                            </div>
                            <asp:GridView ID="gvRatingClass" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="ESTABLISHMENT" DataNavigateUrlFields="activityid" DataNavigateUrlFormatString="FoodInspection-Details.aspx?id={0}" DataTextField="sitename" />
                                    <asp:BoundField HeaderText="DATE" DataField="datecreated" />
                                    <asp:BoundField HeaderText="RATING" DataField="rating" />
                                    <asp:BoundField HeaderText="ADDRESS" DataField="prettyaddress" />
                                    <asp:BoundField HeaderText="CITY" DataField="addrcity" />
                                </Columns>
                                <HeaderStyle CssClass="grid-header" />
                                <PagerStyle CssClass="grid-pager" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <!-- start of form search by CITY/TOWN code -->
                <div id="searchCity" runat="server" visible="false">
                    <h5 class="header-title">CITY/TOWN</h5>
                    <div class="row">
                        <div class="col-lg-4 col-sm-12 align-self-center pb-2">
                            <asp:DropDownList ID="ddlCityTown" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                            <asp:DropDownList ID="ddlCityTownYear" CssClass="form-control" runat="server" />
                        </div>
                        <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                            <asp:DropDownList ID="ddlCityTownMonth" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0">All Months</asp:ListItem>
                                <asp:ListItem Value="1">January</asp:ListItem>
                                <asp:ListItem Value="2">February</asp:ListItem>
                                <asp:ListItem Value="3">March</asp:ListItem>
                                <asp:ListItem Value="4">April</asp:ListItem>
                                <asp:ListItem Value="5">May</asp:ListItem>
                                <asp:ListItem Value="6">June</asp:ListItem>
                                <asp:ListItem Value="7">July</asp:ListItem>
                                <asp:ListItem Value="8">August</asp:ListItem>
                                <asp:ListItem Value="9">September</asp:ListItem>
                                <asp:ListItem Value="10">October</asp:ListItem>
                                <asp:ListItem Value="11">November</asp:ListItem>
                                <asp:ListItem Value="12">December</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-2 align-self-center pb-2">
                            <asp:Button ID="btnCityTown" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="ml-2">
                                <asp:Label ID="lblCityTownWarning" CssClass="alert-light" runat="server"></asp:Label>
                            </div>
                            <asp:GridView ID="gvCityTown" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="ESTABLISHMENT" DataNavigateUrlFields="activityid" DataNavigateUrlFormatString="FoodInspection-Details.aspx?id={0}" DataTextField="sitename" />
                                    <asp:BoundField HeaderText="DATE" DataField="datecreated" />
                                    <asp:BoundField HeaderText="RATING" DataField="rating" />
                                    <asp:BoundField HeaderText="ADDRESS" DataField="prettyaddress" />
                                    <asp:BoundField HeaderText="CITY" DataField="addrcity" />
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
