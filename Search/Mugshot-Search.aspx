<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mugshot-Search.aspx.cs" Inherits="Search.Mugshot_Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pinal County Sheriff Mugshot Search</title>
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
                <h2 class="header-title mb-1">Mugshot Search</h2>
                <h6 class="header-title mb-5">Individuals booked within the last 3 days</h6>
            </div>
            <form runat="server">
                <!-- start of form search by INMATE code -->
                <div justify-content-center">
                    <div class="row">
                        <div class="col">
                            <div>
                                <asp:TextBox ID="txtSearch" CssClass="form-control col-lg-4 col-sm-12" placeholder="SEARCH" onkeyup="Search_Gridview(this, 'gvInmates')" runat="server" />
                            </div>
                            <asp:GridView ID="gvInmates" CssClass="table table-condensed" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" HeaderStyle-HorizontalAlign="Center" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" runat="server">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="inmateImage" Width="80" runat="server" />   
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="BOOKING NUMBER" DataField="BOOKINGNO" />
                                    <asp:BoundField HeaderText="FIRST NAME" DataField="FIRSTNAME" />
                                    <asp:BoundField HeaderText="LAST NAME" DataField="LASTNAME" />
                                    <%--<asp:BoundField HeaderText="AGE" DataField="AGE" />
                                    <asp:BoundField HeaderText="DESCRIPTION" DataField="STATUTEDESC" />--%>
                                    <asp:BoundField HeaderText="BOOKING DATE" DataField="BOOKINGDATE" />
                                </Columns>
                                <HeaderStyle CssClass="grid-header" />
                                <PagerStyle CssClass="grid-pager" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <!-- Disclaimer -->
                            <div class="disclaimer">
                                <p>
                                    Use the <a href="https://app1.pinal.gov/search/inmate-search.aspx">inmate search</a> when searching for all inmates currently in the county jail
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript">
        function Search_Gridview(strKey) {
            var strData = strKey.value.toLowerCase().split(" ");
            var Grid="<%=gvInmates.ClientID%>";
            var tblData = document.getElementById(Grid);
            var rowData;
            for (var i = 1; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerHTML;
                var styleDisplay = 'none';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';
                    else {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }
        }
    </script>

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/125e3f2ff2.js"></script>
</body>
</html>
