<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Parcel-Details-Invalid.aspx.cs" Inherits="Search.Parcel_Details_Invalid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pinal County Search Error</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="robots" content="noindex" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

    <!-- Project CSS files -->
    <link rel="stylesheet" href="css/site.css" type="text/css" />
</head>
<body>
    <div class="search-page">
        <div class="container">
            <div class="header-banner">
                <a href="https://www.pinal.gov/486/Assessor"><asp:Image CssClass="header-image img-fluid" runat="server" ImageUrl="./images/Logo.png" /></a>
                <h4 class="header-title">Assessor</h4>
                <hr class="header-title" />
            </div>
            <div class="text-center">
                <h5 class="header-title">Message</h5>
                <p>Invalid parcel number.</p>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Parcel-Search.aspx">Return to Search Page</asp:HyperLink>
            </div>
        </div>
    </div>
</body>
</html>
