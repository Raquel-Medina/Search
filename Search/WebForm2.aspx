<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Search.WebForm2" MaintainScrollPositionOnPostback="true" %>

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
                <!-- start of form search by OWNER code -->
                <div id="searchName" runat="server" visible="false">
                    <h5 class="header-title">OWNERS NAME</h5>
                    <div class="row">
                        <div class="col-lg-10 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtOwner" CssClass="form-control" placeholder="SEARCH FOR ADDRESSES, OWNERS AND PARCELS" runat="server" />
                        </div>
                        <div class="col-lg-2 col-sm-12 align-self-center pb-2">
                            <asp:Button ID="btnSearch" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
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
