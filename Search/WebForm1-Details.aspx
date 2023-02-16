<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1-Details.aspx.cs" Inherits="Search.WebForm1_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Food Inspection Details</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="robots" content="noindex" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

    <!-- Project CSS files -->
    <link rel="stylesheet" href="css/site.css" type="text/css" />
    <link rel="stylesheet" media="print" href="css/print.css" />

    <!-- Tooltips (i)-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
    <script>
        /* Creates tooltip throughout form */
        $(function () {
            $('a[data-toggle="tooltip"]').tooltip({
                animated: 'fade',
            });
        })
    </script>

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
                <a href="https://www.pinal.gov/870/Environmental-Health">
                    <asp:Image CssClass="header-image img-fluid" runat="server" ImageUrl="./images/Logo.png" /></a>
                <h4 class="header-title">Environmental Health</h4>
                <hr class="header-title" />
                <h2 class="header-title">Food Inspection Search</h2>
            </div>
            <form id="form1" runat="server">
                <div class="header-buttons">
                    <div class="col text-right">
                        <asp:Button ID="btnBack" CssClass="btn button-primary button-responsive" runat="server" Text="New Search" OnClick="btnBack_Click" />
                    </div>
                </div>
                <div class="content">
                    <h5 class="header-title">FOOD INSPECTION DETAILS</h5>
                    <div class="details-section">
                        <div class="row mb-4">
                            <div class="col-lg-8 col-sm-12">
                                <div>
                                    As Governed by A.R.S. ºº 36-136(A)(6) and 36-136(D) A.A.C. Title 9, Chapter 8, Article 1
                                </div>
                                <div class="font-weight-light ml-3">
                                    Pinal County Environmental Health Services<br />
                                    31 N. Pinal St., Bldg F<br />
                                    P.O. Box 2517<br />
                                    Florence, AZ 85232<br />
                                    (520) 866-6864
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-12 text-right font-weight-bold">
                                <asp:HyperLink ID="hlFullReport" runat="server"><h6>VIEW FULL REPORT</h6></asp:HyperLink>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                ARIZONA FOOD CODE AVAILABLE AT: <a href="http://www.hs.state.az.us/phs/oeh/fses/foodcode.htm" target="_blank">www.hs.state.az.us/phs/oeh/fses/foodcode.htm</a>
                            </div>
                        </div>
                    </div>
                    <!-- Establishment Information -->
                    <div>
                        <div class="row text-center mt-5">
                            <div class="col">
                                <div class="details-section-title">ESTABLISHMENT INFORMATION</div>
                            </div>
                        </div>
                        <div class="details-section">
                            <div class="row mb-4">
                                <div class="col-lg-4 col-sm-12 pb-2">
                                    <div class="details-title">Establishment</div>
                                    <div class="detail">
                                        <asp:Label ID="lblEstablishment" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-12 pb-2">
                                    <div class="details-title">Address</div>
                                    <div class="detail">
                                        <asp:Label ID="lblAddress" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-12 pb-2">
                                    <div class="details-title">Phone</div>
                                    <div class="detail">
                                        <asp:Label ID="lblPhone" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-sm-12 pb-2">
                                    <div class="details-title">Permit Holder (District)</div>
                                    <div class="detail">
                                        <asp:Label ID="lblPermitHolder" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-12">
                                    <div class="details-title">Establishment Type</div>
                                    <div class="detail">
                                        <asp:Label ID="lblEstType" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Inspection Information -->
                    <div>
                        <div class="row text-center mt-5">
                            <div class="col">
                                <div class="details-section-title">INSPECTION INFORMATION</div>
                            </div>
                        </div>
                        <div class="details-section">
                            <div class="row mb-4">
                                <div class="col-lg-6 col-sm-12 pb-2">
                                    <div class="details-title">No. of Risk Factor/Intervention Violations</div>
                                    <div class="detail">
                                        <asp:Label ID="lblRiskViolations" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-12 pb-2">
                                    <div class="details-title">No. of Repeat Risk Factor/Intervention Violations</div>
                                    <div class="detail">
                                        <asp:Label ID="lblRepeatViolations" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col-lg-6 col-sm-12 pb-2">
                                    <div class="row">
                                        <div class="col">
                                            <div class="details-title">Rating</div>
                                            <div class="detail">
                                                <asp:Label ID="lblRating" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="details-title">Date</div>
                                            <div class="detail">
                                                <asp:Label ID="lblDate" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-12 pb-2">
                                    <div class="row">
                                        <div class="col">
                                            <div class="details-title">Time In</div>
                                            <div class="detail">
                                                <asp:Label ID="lblTimeIn" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="details-title">Time Out</div>
                                            <div class="detail">
                                                <asp:Label ID="lblTimeOut" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-sm-12 pb-2">
                                    <div class="details-title">Permit #</div>
                                    <div class="detail">
                                        <asp:Label ID="lblPermitNum" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-12 pb-2">
                                    <div class="details-title">Purpose of Inspection</div>
                                    <div class="detail">
                                        <asp:Label ID="lblPurpose" runat="server" />
                                    </div>
                                </div>
                            
                                <div class="col-lg-3 col-sm-12 pb-2">
                                    <div class="details-title">Risk Category</div>
                                    <div class="detail">
                                        <asp:Label ID="lblRiskCategory" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>
                    <!--Violation Information -->
                    <div>
                        <div class="row text-center mt-5">
                            <div class="col">
                                <div class="details-section-title">VIOLATION(S) INFORMATION</div>
                            </div>
                        </div>
                        <div class="details-section">
                            <div class="row">
                                <div class="col">
                                    <p>
                                        Violations cited in this report must be corrected within the time frames allowed, or as stated in sections 8-405.11 of the food code.
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="co1">
                                    <asp:Label ID="lblViolations" CssClass="font-weight-light ml-4" Visible="false" runat="server"></asp:Label>
                                    <asp:GridView ID="gvObsCorActions" CssClass="table table-responsive" GridLines="None" ShowHeader="true" CellPadding="10" runat="server"></asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Comments -->
                    <div>
                        <div class="row text-center mt-4">
                            <div class="col">
                                <div class="details-section-title">COMMENTS</div>
                            </div>
                        </div>
                        <div class="details-section">
                            <div id="comments" visible="false" runat="server">
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="lblComments" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <!-- Temp Observation -->
                            <div id="tempObs" visible="false" runat="server">
                                <div class="row text-center mt-5">
                                    <div class="col">
                                        <div class="details-title">TEMPERATURE OBSERVATIONS (Item/Locations/Temps)</div>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="lblTempObs" runat="server" />
                                    </div>
                                </div>
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
