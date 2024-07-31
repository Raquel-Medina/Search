<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ME-Case-Search.aspx.cs" Inherits="Search.ME_Case_Search" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pinal County Medical Examiner Case Search</title>
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
                <a href="https://www.pinal.gov/634/Medical-Examiner"><asp:Image CssClass="header-image img-fluid" runat="server" ImageUrl="./images/Logo.png" /></a>
                <h4 class="header-title">Medical Examiner</h4>
                <hr class="header-title" />
                <h2 class="header-title mb-5">Case Search</h2>
            </div>
            <form runat="server">
                <!-- select search -->
                <div class="mb-5">
                    <h5 class="header-title">SEARCH BY</h5>
                    <asp:DropDownList ID="ddlSearchType" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlSearchType_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem>SEARCH BY</asp:ListItem>
                        <asp:ListItem>NAME</asp:ListItem>
                        <asp:ListItem>CASE NUMBER</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <!-- start of form search by NAME code -->
                <div id="searchName" runat="server" visible="false">
                    <h5 class="header-title">NAME</h5>
                    <div class="row">
                        <div class="col-lg-5 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtFirstName" CssClass="form-control" placeholder="FIRST NAME" runat="server" />
                        </div>
                        <div class="col-lg-5 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtLastName" CssClass="form-control" placeholder="LAST NAME" runat="server" />
                        </div>
                        <div class="col-2 align-self-center pb-2">
                            <asp:Button ID="btnName" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="ml-2">
                                <asp:Label ID="lblNameWarning" CssClass="alert-light" runat="server"></asp:Label>
                            </div>
                            <asp:GridView ID="gvName" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="CASE NUMBER" DataNavigateUrlFields="CaseNum" DataNavigateUrlFormatString="ME-Case-Details.aspx?casenum={0}" DataTextField="CaseNum" />
                                    <asp:BoundField HeaderText="NAME" DataField="" />
                                    <asp:BoundField HeaderText="DATE OF DEATH" DataField="DOD" />
                                </Columns>
                                <HeaderStyle CssClass="grid-header" />
                                <PagerStyle CssClass="grid-pager" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <!-- start of form search by CASE NUMBER code -->
                <div id="searchCase" runat="server" visible="false">
                    <h5 class="header-title">CASE NUMBER</h5>
                    <div class="row">
                        <div class="col-lg-10 col-sm-12 align-self-center pb-2">
                            <asp:TextBox ID="txtCaseNum" CssClass="form-control" placeholder="CASE NUMBER" runat="server" />
                        </div>
                        <div class="col-2 align-self-center pb-2">
                            <asp:Button ID="btnCaseNum" Text="Search" CssClass="btn button-primary button-responsive" OnClick="btn_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <div class="ml-2">
                                <asp:Label ID="lblCaseNumWarning" CssClass="alert-light" runat="server"></asp:Label>
                            </div>
                            <asp:GridView ID="gvCaseNum" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="CASE NUMBER" DataNavigateUrlFields="CaseNum" DataNavigateUrlFormatString="ME-Case-Details.aspx?casenum={0}" DataTextField="CaseNum" />
                                    <asp:BoundField HeaderText="NAME" DataField="" />
                                    <asp:BoundField HeaderText="DATE OF DEATH" DataField="DOD" />
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
