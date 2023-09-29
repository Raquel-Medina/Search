<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MH-Details.aspx.cs" Inherits="Search.MH_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>MH Details</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="robots" content="noindex" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    
    <!-- Project CSS files -->
    <link rel="stylesheet" href="css/site.css" type="text/css" />
    <link rel="stylesheet" media="print" href="css/print.css" />

    <!-- Tooltips (i) -->
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

    <!-- Copy assessor parcel link to clipboard (Share this parcel) and redirect -->
    <script type="text/javascript">
        function CopyToClipboard(myID) {
            /* Get the text field */
            var copyText = document.getElementById(myID).value;

            var listener = function (ev) {
                ev.clipboardData.setData("text/plain", copyText);
                ev.preventDefault();
            };

            document.addEventListener("copy", listener);
            document.execCommand("copy");
            document.removeEventListener("copy", listener);

            confirm("Link copied to clipboard");
        }

        function Redirect() {
            location.href = 'MH-Search.aspx';
        }
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
                <a href="https://www.pinal.gov/486/Assessor"><asp:Image CssClass="header-image img-fluid" runat="server" ImageUrl="./images/Logo.png" /></a>
                <h4 class="header-title">Assessor</h4>
                <hr class="header-title" />
                <h2 class="header-title">Manufactured Housing (MH)<br />Search</h2>
            </div>
            <form id="form1" runat="server">
                <div class="header-buttons">
                    <div class="col text-right">
                        <asp:Button ID="btnBack" CssClass="btn button-primary button-responsive" runat="server" Text="New Search" OnClick="btnBack_Click" />
                    </div>
                </div>
                <div class="content">
                    <h5 class="header-title">MH DETAILS</h5>
                    <div class="details-section header-info">
                        <!-- Links -->
                        <div class="row mb-2">
                            <div class="col-lg-4 col-sm-12 pb-2 tax-information">
                                <asp:HyperLink ID="hlTaxInfo" CssClass="tax-information" Target="_blank" runat="server">Tax Information</asp:HyperLink>
                            </div>
                            <div class="col-lg-4 col-sm-12 pb-2 assessor-parcel-viewer">
                                <asp:HyperLink ID="hlParcelViewer" CssClass="assessor-parcel-viewer" Target="_blank" runat="server">Assessor Parcel Viewer</asp:HyperLink>
                            </div>
                            <div class="col-lg-4 col-sm-12 pb-2 tax-chart">
                                <asp:HyperLink ID="hlTaxChart" CssClass="tax-chart" Target="_blank" runat="server">Tax Year Chart</asp:HyperLink>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-sm-12 pb-2 prop-address">
                                <asp:HyperLink ID="hlAddressLocation" CssClass="prop-address" Target="_blank" runat="server">Property Address Location</asp:HyperLink>
                            </div>
                            <div class="col-lg-4 col-sm-12 pb-2 share-parcel">
                                <asp:LinkButton ID="lbShareParcel" CssClass="share-parcel" runat="server" OnClientClick="CopyToClipboard('hfCopy')">Share this Tax Payer ID</asp:LinkButton>
                                <asp:HiddenField ID="hfCopy" runat="server" />
                            </div>
                            <div class="col-lg-3 col-sm-12 pb-2 print-details">
                                <asp:LinkButton ID="lbPrintDetails" CssClass="print-details" runat="server" OnClientClick="javascript:window.print();">Print Details</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <!-- Property Information -->
                    <div class="row text-center mt-5 details-header">
                        <div class="col">
                            <div class="details-section-title">PROPERTY INFORMATION</div>
                        </div>
                    </div>
                    <div class="details-section">
                        <div class="row">
                            <div class="col">
                                <div class="details-title">Tax Payer ID</div>
                                <div class="detail"><asp:Label ID="lblTaxPayerID" runat="server" /></div>
                            </div>
                            <div class="col pb-2">
                                <div class="details-title">Parcel Number</div>
                                <div class="detail"><asp:Label ID="lblParcelNum" runat="server" /></div>
                            </div>
                            <div class="col">
                                <div class="details-title">
                                    PROPERTY DESCRIPTION
                                    <a data-toggle="tooltip" data-placement="top" id="ttPropDesc" runat="server">
                                        <i class="icon-info-sign"></i>
                                    </a>
                                </div>
                                <div class="detail"><asp:Label ID="lblPropDesc" runat="server" /></div>
                            </div>
                        </div>
                    </div>
                    <!-- Owner Information -->
                    <div class="row text-center mt-5 details-header">
                        <div class="col">
                            <div class="details-section-title">OWNER INFORMATION</div>
                        </div>
                    </div>
                    <div class="details-section">
                        <div class="row mb-4">
                            <div class="col-lg-6 col-sm-12 pb-2">
                                <div class="details-title">TAX PAYER NAME</div>
                                <div class="detail"><asp:Label ID="lblOwner1" runat="server" /></div>
                            </div>
                            <div class="col-lg-6 col-sm-12 pb-2">
                                <div class="details-title">IN C/O</div>
                                <div class="detail"><asp:Label ID="lblCareof" runat="server" /></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-sm-12 pb-2">
                                <div class="details-title">TAX BILL MAILING ADDRESS</div>
                                <div class="detail"><asp:Label ID="lblMailingAddress" runat="server" /></div>
                            </div>
                            <div class="col-lg-6 col-sm-12 pb-2">
                                <div class="details-title">
                                    PROPERTY ADDRESS(LOCATION)
                                    <a data-toggle="tooltip" data-placement="top" id="ttPropAddress" runat="server">
                                        <i class="icon-info-sign"></i>
                                    </a>
                                </div>
                                <div class="detail"><asp:Label ID="lblPropAddress" runat="server" /></div>
                            </div>
                        </div>
                    </div>
                    <!-- Valuation Information -->
                    <div class="row text-center mt-5 details-header">
                        <div class="col">
                            <div class="details-section-title">VALUATION INFORMATION</div>
                        </div>
                    </div>
                    <div class="details-section">
                        <div class="row">
                            <div class="col">
                                <p>Previous year valuations are subject to change as prescribed in the Arizona Revised Statutes. All changes in value may not be reflected in this data. 
                                For updated/correct figures, please refer to the <a href="https://treasurer.pinal.gov" target="_block">Treasurer's Office website</a>.</p>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-4 col-sm-12 pb-2 font-weight-bold">
                                Tax Area Code: <u><asp:HyperLink ID="hlTaxAreaCode" runat="server" /></u>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col-lg-3 col-sm-12 pb-2">
                                <div class="details-title">SERIAL NUMBER</div>
                                <div class="detail"><asp:Label ID="lblSerialNum" runat="server" /></div>
                            </div>
                            <div class="col-lg-3 col-sm-12 pb-2">
                                <div class="details-title">MODEL YEAR</div>
                                <div class="detail"><asp:Label ID="lblModelYr" runat="server" /></div>
                            </div>
                            <div class="col-lg-3 col-sm-12 pb-2">
                                <div class="details-title">SIZE</div>
                                <div class="detail"><asp:Label ID="lblSize" runat="server" /></div>
                            </div>
                            <div class="col-lg-3 col-sm-12 pb-2">
                                <div class="details-title">PROPERTY CLASS</div>
                                <div class="detail"><asp:Label ID="lblPropClass" runat="server" /></div>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col-lg-3 col-sm-6 pb-2">
                                <div class="details-title">LAND LEGAL CLASS</div>
                                <div class="detail"><asp:Label ID="lblLandLegalClass" runat="server" /></div>
                            </div>
                            <div class="col-lg-3 col-sm-6 pb-2">
                                <div class="details-title">FULL CASH VALUE</div>
                                <div class="detail"><asp:Label ID="lblFCV" runat="server" /></div>
                            </div>
                            <div class="col-lg-3 col-sm-6 pb-2">
                                <div class="details-title">LIMITED VALUE</div>
                                <div class="detail"><asp:Label ID="lblLVP" runat="server" /></div>
                            </div>
                            <div class="col-lg-3 col-sm-6 pb-2">
                                <div class="details-title">EXEMPT CODE</div>
                                <div class="detail"><asp:Label ID="lblExemptCode" runat="server" /></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-sm-12 pb-2">
                                <div class="details-title">FCV EXEMPT</div>
                                <div class="detail"><asp:Label ID="lblFCVExempt" runat="server" /></div>
                            </div>
                            <div class="col-lg-3 col-sm-12 pb-2">
                                <div class="details-title">LPV EXEMPT</div>
                                <div class="detail"><asp:Label ID="lblLPVExempt" runat="server" /></div>
                            </div>
                        </div>
                    </div>

                    <!-- Disclaimer -->
                    <div class="disclaimer mt-5">
                        <div>DISCLAIMER</div>
                        <p>
                            The data presented on this website is deemed reliable but not guaranteed. This information should be used for informational use only and does not constitute a legal document for the description of these properties. The Pinal County Assessor's Office disclaims any responsibility or liability for any direct or indirect damages resulting from the use of this data.
                        </p>
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
