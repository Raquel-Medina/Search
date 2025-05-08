    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Parcel-Details.aspx.cs" Inherits="Search.Parcel_Details" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Parcel Details</title>

    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="robots" content="noindex" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    

    <!-- Project CSS files -->
    <link rel="stylesheet" href="css/site.css" type="text/css" />

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
            location.href = 'Parcel-Search.aspx';
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
                <h2 class="header-title">Parcel Search</h2>
            </div>
            <form id="form1" runat="server">
                <div class="header-buttons">
                    <div class="col text-right">
                        <asp:Button ID="btnBack" CssClass="btn button-primary button-responsive" runat="server" Text="New Search" OnClick="btnBack_Click" />
                    </div>
                </div>
                <div class="content">
                    <h5 class="header-title">PARCEL DETAILS</h5>
                    <!-- Parcel Details Header Info -->
                    <div class="details-section header-info">
                        <!-- Links -->
                        <div class="link-section">
                            <div class="row mb-2">
                                <div class="col-lg-3 col-sm-12 pb-2 compare-parcel">
                                    <asp:HyperLink ID="hlCompProp" CssClass="compare-parcel" Target="_blank" runat="server">Comparable properties</asp:HyperLink>
                                </div>
                                <div class="col-lg-3 col-sm-12 pb-2 tax-information">
                                    <asp:HyperLink ID="hlTaxInfo" CssClass="tax-information" Target="_blank" runat="server">Tax Information</asp:HyperLink>
                                </div>
                                <div class="col-lg-3 col-sm-12 pb-2 assessor-parcel-viewer">
                                    <asp:HyperLink ID="hlParcelViewer" CssClass="assessor-parcel-viewer" Target="_blank" runat="server">Parcel Map Viewer</asp:HyperLink>
                                </div>
                                <div class="col-lg-3 col-sm-12 pb-2 tax-chart">
                                    <asp:HyperLink ID="hlTaxChart" CssClass="tax-chart" Target="_blank" runat="server">Tax Year Chart</asp:HyperLink>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-sm-12 pb-2 prop-address">
                                    <asp:HyperLink ID="hlAddressLocation" CssClass="prop-address" Target="_blank" runat="server">Property Address Location</asp:HyperLink>
                                </div>
                                <div class="col-lg-3 col-sm-12 pb-2 share-parcel">
                                    <asp:LinkButton ID="lbShareParcel" CssClass="share-parcel" runat="server" OnClientClick="CopyToClipboard('hfCopy')">Share this parcel</asp:LinkButton>
                                    <asp:HiddenField ID="hfCopy" runat="server" />
                                </div>
                                <div class="col-lg-3 col-sm-12 pb-2 print-details">
                                    <asp:LinkButton ID="lbPrintDetails" CssClass="print-details" runat="server" OnClientClick="javascript:window.print();">Print Details</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Property Information -->
                    <div class="prop-info">
                        <div class="row text-center mt-5 details-header">
                            <div class="col">
                                <div class="details-section-title">PROPERTY INFORMATION</div>
                            </div>
                        </div>
                    <div class="details-section">
                        <div class="row mb-4">
                            <div class="col">
                                <div class="details-title">Parcel NUMBER</div>
                                <div><asp:Label ID="lblParcelNum" runat="server" Text="Parcel Number" /></div>
                            </div>
                            <div class="col">
                                <div class="details-title">S/T/R</div>
                                <div><asp:Label ID="lblSTR" runat="server" /></div>
                            </div>
                        </div>
                        
                        <div class="row mb-4">
                            <div class="col">
                                <div class="details-title">
                                    PROPERTY DESCRIPTION
                                    <a data-toggle="tooltip" data-placement="top" id="ttPropDesc" runat="server">
                                        <i class="icon-info-sign"></i>
                                    </a>
                                </div>
                                <div><asp:Label ID="lblPropDesc" runat="server" /></div>
                            </div>
                        </div>
                        <hr />
                        <div class="row mb-4">
                            <div class="col-lg-3 col-sm-12 pb-2">
                                <div class="details-title">SUBDIVISION</div>
                                <div><asp:Label ID="lblSubdivision" runat="server" /></div>
                            </div>
                            <div class="col-3">
                                <div class="details-title">UNIT</div>
                                <div><asp:Label ID="lblUnit" runat="server" /></div>
                            </div>
                            <div class="col-3">
                                <div class="details-title">BLOCK</div>
                                <div><asp:Label ID="lblBlock" runat="server" /></div>
                            </div>
                            <div class="col-3">
                                <div class="details-title">LOT</div>
                                <div><asp:Label ID="lblLot" runat="server" /></div>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col-3">
                                <div class="details-title">PHASE</div>
                                <div><asp:Label ID="lblPhase" runat="server" /></div>
                            </div>
                            <div class="col-3">
                                <div class="details-title">CABINET</div>
                                <div><asp:Label ID="lblCabinet" runat="server" /></div>
                            </div>
                            <div class="col-3">
                                <div class="details-title">SLIDE</div>
                                <div><asp:Label ID="lblSlide" runat="server" /></div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <!-- Owner Information -->
                    <div class="owner-info">
                        <div class="row text-center mt-5 details-header">
                            <div class="col">
                                <div class="details-section-title">OWNER INFORMATION</div>
                            </div>
                        </div>
                        <div class="details-section">
                            <div class="row mb-4 d-print-block">
                                <div class="col-lg-4 col-sm-12 pb-2">
                                    <div class="details-title">PRIMARY OWNER</div>
                                    <div><asp:Label ID="lblOwner1" runat="server" /></div>
                                </div>
                                <div class="col-lg-4 col-sm-12 pb-2">
                                    <div class="details-title">NAME 2</div>
                                    <div><asp:Label ID="lblOwner2" runat="server" /></div>
                                </div>
                                <div class="col-lg-4 col-sm-12 pb-2">
                                    <div class="details-title">IN C/O</div>
                                    <div><asp:Label ID="lblCareof" runat="server" /></div>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col-lg-4 col-sm-12 pb-2">
                                    <div class="details-title">TAX BILL MAILING ADDRESS</div>
                                    <div><asp:Label ID="lblMailingAddress" runat="server" /></div>
                                </div>
                                <div class="col">
                                    <div class="details-title">
                                        PROPERTY ADDRESS(LOCATION)
                                        <a data-toggle="tooltip" data-placement="top" id="ttPropAddress" runat="server">
                                            <i class="icon-info-sign"></i>
                                        </a>
                                    </div>
                                    <div><asp:Label ID="lblPropAddress" runat="server" /></div>
                                </div>
                                <div class="col">
                                    <div class="details-title">
                                        PARCEL ALERT LIST
                                    </div>
                                    <div><asp:Label ID="lblParcelAlertList" runat="server" /></div>
                                </div>
                            </div>
                            <hr />
                            <div class="row mb-4">
                                <div class="col-lg-3 col-sm-12 pb-2">
                                    <div class="details-title">DATE OF RECORDING</div>
                                    <div><asp:Label ID="lblRecDate" runat="server" /></div>
                                </div>
                                <div class="col-lg-9 col-sm-12">
                                    <div class="details-title">SALE AMOUNT</div>
                                    <div><asp:Label ID="lblSaleAmt" runat="server" /></div>
                                </div>
                            </div>
                            
                            <!-- Documents -->
                            <div class="documents">
                                <hr />
                                <div class="row mb-4">
                                    <div class="col">
                                        <div class="details-title">DOCUMENT(S)</div>
                                        <div><asp:Label ID="lblDocs" runat="server" /></div>
                                        <asp:HyperLink ID="hlDocs" runat="server" />
                                        <asp:GridView ID="gvDocuments" CssClass="table-plain" runat="server"></asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Valuation Information -->
                    <div class="valuation-info">
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
                                <div class="col-12 pb-2 font-weight-bold">
                                    Tax Year:
                                    <asp:DropDownList ID="ddlTaxYear" runat="server" OnSelectedIndexChanged="ddlTaxYear_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                                <div class="col pb-2">
                                    <asp:Label ID="lblValInfoMessage" runat="server" Text="There is no Valuation Information available for the selected year." Visible="false" />
                                </div>
                            </div>
                            <div id="valInfo" runat="server">
                                <div class="row mb-4">
                                    <div class="col-lg-3 pb-2">
                                        <div class="details-title">Tax Area Code: </div><asp:HyperLink ID="hlTaxAreaCode" runat="server" />
                                    </div>
                                    <div class="col-lg-3 pb-2">
                                        <div class="details-title">
                                            Use Code:
                                            <a data-toggle="tooltip" data-placement="top" id="ttUseCode" runat="server">
                                                <i class="icon-info-sign"></i>
                                            </a>
                                        </div>
                                        <asp:Label ID="lblUseCode" runat="server" />
                                    </div>
                                    <div class="col-lg-3 col-sm-12 pb-2">
                                        <div class="details-title">PARCEL SIZE</div>
                                        <div><asp:Label ID="lblParcelSize" runat="server" /></div>
                                    </div>
                                    <div class="col-lg-3 col-sm-12 pb-2">
                                        <div class="details-title">SIZE INDICATOR</div>
                                        <div><asp:Label ID="lblSizeIndicator" runat="server" /></div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col-lg-3 col-sm-12 col-xs-3 pb-2">
                                        <div class="details-title">FULL CASH VALUE</div>
                                        <div><asp:Label ID="lblFCV" runat="server" /></div>
                                    </div>
                                    <div class="col-lg-3 col-sm-12 col-xs-3 pb-2">
                                        <div class="details-title">LIMITED VALUE(LVP)</div>
                                        <div><asp:Label ID="lblLVP" runat="server" /></div>
                                    </div>
                                    <div class="col-lg-3 col-sm-12 col-xs-3 pb-2">
                                        <div class="details-title">ASSESSED FCV</div>
                                        <div><asp:Label ID="lblAssessedFCV" runat="server" /></div>
                                    </div>
                                    <div class="col-lg-3 col-sm-12 col-xs-3">
                                        <div class="details-title">ASSESSED LPV</div>
                                        <div><asp:Label ID="lblAssessedLPV" runat="server" /></div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col-lg-3 col-sm-12 pb-2">
                                        <div class="details-title">LAND LEGAL CLASS</div>
                                        <div><asp:Label ID="lblLandLegalClass" runat="server" /></div>
                                    </div>
                                    <div class="col-lg-3 col-sm-12 pb-2">
                                        <div class="details-title">IMPR. LEGAL CLASS</div>
                                        <div><asp:Label ID="lblImprLegalClass" runat="server" /></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Improvements -->
                    <div class="imps">
                        <div class="row text-center mt-5 details-header">
                            <div class="col">
                                <div class="details-section-title">IMPROVEMENTS</div>
                            </div>
                        </div>
                        <div class="details-section">
                            <div class="row mb-3">
                                <div class="col">
                                    <asp:HyperLink ID="hlImps" runat="server" />
                                    <div style="border: none">
                                        <asp:GridView ID="gvImps" CssClass="table table-responsive" GridLines="None" HorizontalAlign="Left" ShowHeader="true" runat="server"></asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <!-- Attached Personal Property -->
                            <div class="row">
                                <div class="col-10">
                                    <div class="details-title">Attached Personal Property</div>
                                    <div>
                                        <asp:Label ID="lblAttachedProp" runat="server" />
                                        <asp:HyperLink ID="hlAttachedProp" runat="server"></asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Exemptions -->
                    <div class="exemptions">
                        <div class="row text-center mt-5 details-header">
                            <div class="col">
                                <div class="details-section-title">EXEMPTIONS</div>
                            </div>
                        </div>
                        <div class="details-section">
                            <div class="row mb-4">
                                <div class="col-lg-3 col-sm-12 pb-2">
                                    <div class="details-title">WIDOW</div>
                                    <div><asp:Label ID="lblWidow" runat="server" /></div>
                                </div>
                                <div class="col-lg-3 col-sm-12 pb-2">
                                    <div class="details-title">WIDOWER</div>
                                    <div><asp:Label ID="lblWidower" runat="server" /></div>
                                </div>
                                <div class="col-lg-3 col-sm-12">
                                    <div class="details-title">SENIOR FREEZE</div>
                                    <div><asp:Label ID="lblSrFreeze" runat="server" /></div>
                                </div>
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
