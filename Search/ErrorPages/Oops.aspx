<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Oops.aspx.cs" Inherits="Search.ErrorPages.Oops" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>An Error Has Occured</h2>
            <p>An unexpected error has occured on our website. The website administrator has been notified.</p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Return to Home Page</asp:HyperLink>
        </div>
    </form>
</body>
</html>
