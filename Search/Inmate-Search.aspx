<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inmate-Search.aspx.cs" Inherits="Search.Inmate_Search" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Inmate Search</title>
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
                <a href="https://www.pinal.gov/772/Sheriffs-Office"><asp:Image CssClass="header-image img-fluid" runat="server" ImageUrl="./images/Logo.png" /></a>
                <h4 class="header-title">Sheriff's Office</h4>
                <hr class="header-title" />
                <h2 class="header-title mb-5">Inmate Search</h2>
            </div>
            <form runat="server">
                <h5 class="header-title">INMATE</h5>
                <div class="row">
                    <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                        <asp:TextBox ID="txtLastName" CssClass="form-control" placeholder="LAST NAME" runat="server" />
                    </div>
                    <div class="col-lg-3 col-sm-12 align-self-center pb-2">
                        <asp:TextBox ID="txtFirstName" CssClass="form-control" placeholder="FIRST NAME" runat="server" />
                    </div>
                    <div class="col-lg-4 col-sm-12 align-self-center pb-2">
                        <asp:TextBox ID="txtInmateID" CssClass="form-control" placeholder="INMATE ID" runat="server" />
                    </div>
                    <div class="col-2 align-self-center pb-2">
                        <asp:Button ID="btnSearch" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-10">
                        <div class="ml-2">
                            <asp:Label ID="lblWarning" CssClass="alert-light" runat="server"></asp:Label>
                        </div>
                        <asp:GridView ID="gvInmates" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                            <Columns>
                                <asp:HyperLinkField HeaderText="INMATE ID" DataNavigateUrlFields="INMATEID" DataNavigateUrlFormatString="Inmate-Details.aspx?id={0}" DataTextField="INMATEID" />
                                <asp:BoundField HeaderText="LAST NAME" DataField="LASTNAME" />
                                <asp:BoundField HeaderText="FIRST NAME" DataField="FIRSTNAME" />
                            </Columns>
                            <HeaderStyle CssClass="grid-header" />
                            <PagerStyle CssClass="grid-pager" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                        </asp:GridView>
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
