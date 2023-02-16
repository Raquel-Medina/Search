<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ME-Case-Details.aspx.cs" Inherits="Search.ME_Case_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Case Details</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="robots" content="noindex" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

    <!-- Project CSS files -->
    <link rel="stylesheet" href="css/site.css" type="text/css" />
    <link rel="stylesheet" media="print" href="css/print.css" />

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
    <div class="details-page">
        <div class="container">
            <div class="header-banner">
                <a href="https://www.pinal.gov/634/Medical-Examiner"><asp:Image CssClass="header-image img-fluid" runat="server" ImageUrl="./images/Logo.png" /></a>
                <h4 class="header-title">Medical Examiner</h4>
                <hr class="header-title" />
                <h2 class="header-title">Case Search</h2>
            </div>
            <form id="form1" runat="server">
                <div class="header-buttons">
                    <div class="col text-right">
                        <asp:Button ID="btnBack" CssClass="btn button-primary button-responsive" runat="server" Text="New Search" OnClick="btnBack_Click" />
                    </div>
                </div>
                <div class="content">
                    <h5 class="header-title">CASE DETAILS</h5>
                    <div class="details-section">
                        <!-- Case Details -->
                        <div class="row mb-4">
                            <div class="col">
                                <div class="details-title">CASE NUMBER</div>
                                <div class="detail"><asp:Label ID="lblCaseNum" runat="server" /></div>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col">
                                <div class="details-title">NAME</div>
                                <div class="detail"><asp:Label ID="lblName" runat="server" /></div>
                            </div>
                            <div class="col">
                                <div class="details-title">AGE</div>
                                <div class="detail"><asp:Label ID="lblAge" runat="server" /></div>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col">
                                <div class="details-title">RACE</div>
                                <div class="detail"><asp:Label ID="lblRace" runat="server" /></div>
                            </div>
                            <div class="col">
                                <div class="details-title">Ethnicity</div>
                                <div class="detail"><asp:Label ID="lblEthnicity" runat="server" /></div>
                            </div>
                        </div>
                        <hr />
                        <div class="row mb-4">
                            <div class="col-lg-6 col-sm-12 pb-2">
                                <div class="details-title">Date of Death</div>
                                <div class="detail"><asp:Label ID="lblDod" runat="server" /></div>
                            </div>
                            <div class="col-lg-6 col-sm-12">
                                <div class="details-title">Cause of Death</div>
                                <div class="detail"><asp:Label ID="lblCod" runat="server" /></div>
                            </div>
                        </div> 
                        <div class="row mb-4">
                            <div class="col-lg-6 col-sm-12 pb-2">
                                <div class="details-title">Manner of Death</div>
                                <div class="detail"><asp:Label ID="lblMod" runat="server" /></div>
                            </div>
                            <div class="col-lg-6 col-sm-12 pb-2">
                                <div class="details-title">OTHER</div>
                                <div class="detail"><asp:Label ID="lblOther" runat="server" /></div>
                            </div>
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
