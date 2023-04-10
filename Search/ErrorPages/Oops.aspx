<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Oops.aspx.cs" Inherits="Search.ErrorPages.Oops" %>

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
    <link rel="stylesheet" href="/css/site.css" type="text/css" />
</head>
<body>
    <div class="search-page">
        <div class="container">
            <div class="header-banner">
                <a href="https://www.pinal.gov"><asp:Image CssClass="header-image img-fluid" runat="server" ImageUrl="~/images/Logo.png" /></a>
                <hr class="header-title" />
                <h2 class="header-title mb-5">Searches</h2>
            </div>
            <div>
                <h5 class="header-title">An Error Has Occured</h5>
                <p>An unexpected error has occured on our website. The website administrator has been notified.</p>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Return to Home Page</asp:HyperLink>
            </div>
        </div>
    </div>
</body>
</html>
