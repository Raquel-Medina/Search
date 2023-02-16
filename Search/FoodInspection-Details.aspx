<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FoodInspection-Details.aspx.cs" Inherits="Search.FoodInspection_Details" %>

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
                    <!-- FOODBORNE Details -->
                    <div>
                        <div class="row text-center mt-5">
                        <div class="col">
                            <div class="details-section-title">FOODBORNE ILLNESS RISK FACTORS AND PUBLIC HEALTH INTERVENTIONS</div>
                        </div>
                    </div>
                    <div class="details-section">
                        <!-- Inspection Description and Key -->
                        <div class="row">
                            <div class="col">
                                <p>
                                    Risk Factors are improper practices or procedures identified as the most prevalent contributing factors of foodborne illness or injury. 
                                    Public health interventions are control measures to prevent foodborne illness or injury.
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                IN = In Compliance<br />
                                OUT = Not In Compliance<br />
                                N/O = Not Observed<br />
                                N/A = Not Applicable
                            </div>
                            <div class="col text-right">
                                COS = Corrected On Site during inspection<br />
                                R = Repeat Violation
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col-12 col-md-6">
                                <div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="details-title">COMPLIANCE STATUS</div>
                                        </div>
                                        <div class="col-1">
                                            <div class="details-title">COS</div>
                                        </div>
                                        <div class="col-1">
                                            <div class="details-title">R</div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row text-center mb-4">
                                        <div class="col">
                                            <div class="details-title">SUPERVISION</div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance6" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Person in charge presents, demonstrates knowledge, and performs duties</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS6" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat6" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance7" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Certified Food Protection Manager</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS7" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat7" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div>
                                    <div class="row text-center mb-4">
                                        <div class="col">
                                            <div class="details-title">Employee Health</div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance8" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Management, food employee knowledge and conditional employee; responsibilities and reporting</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS8" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat8" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance11" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Proper use of reporting, restriction & exclusion</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS11" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat11" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance12" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Procedure for responding to vomiting and diarrheal events</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS12" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat12" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div>
                                    <div class="row text-center mb-4">
                                        <div class="col">
                                            <div class="details-title">Good Hygienic Practices</div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance15" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Proper eating, tasting, drinking, or tobacco use</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS15" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat15" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance16" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>No discharge from eyes, nose, and mouth</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS16" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat16" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div>
                                    <div class="row text-center mb-4">
                                        <div class="col">
                                            <div class="details-title">Preventing Contamination by Hands</div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance19" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Hands clean and properly washed</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS19" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat19" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance21" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>No bare hand contact with RTE foods or approved alternate method properly followed</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS21" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat21" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance24" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Adequate handwashing facilities supplied & accessible</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS24" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat24" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div>
                                    <div class="row text-center mb-4">
                                        <div class="col">
                                            <div class="details-title">Approved Source</div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance25" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Food obtained from approved source</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS25" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat25" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance27" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Food received at proper temperature</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS27" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat27" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance28" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Food in good condition, safe & unadulterated</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS28" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat28" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance29" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Required records available: shellstock tags, parasite destruction</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS29" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat29" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                            </div>
                            <div class="col-12 col-md-6">
                                <div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="details-title">COMPLIANCE STATUS</div>
                                        </div>
                                        <div class="col-1">
                                            <div class="details-title">COS</div>
                                        </div>
                                        <div class="col-1">
                                            <div class="details-title">R</div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div>
                                        <div class="row text-center mb-4">
                                            <div class="col">
                                                <div class="details-title">Protection from Contamination</div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance33" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Food Separated & Protected</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS33" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat33" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance34" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Food-contact sufaces: cleaned & santized</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS34" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat34" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance36" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Proper disposition of returned, previously served, reconditioned, & unsafe food</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS36" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat36" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row text-center mb-4">
                                        <div class="col">
                                            <div class="details-title">Time/Temperature Control for Safety</div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance39" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Proper cooking time & temperature</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS39" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat39" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance40" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Proper reheating procedures for hot holding</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS40" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat40" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance41" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Proper cooling time & temperature</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS41" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat41" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance42" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Proper cooling time & temperature</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS42" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat42" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance43" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Proper cold holding temperatures</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS43" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat43" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance44" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Proper date marking & disposition</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS44" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat44" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance45" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Time as a public health control; procedures and record</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS45" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat45" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div>
                                    <div class="row text-center mb-4">
                                        <div class="col">
                                            <div class="details-title">Consumer Advisory</div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance48" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Consumer advisory provided for raw or uncooked foods</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS48" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat48" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div>
                                    <div class="row text-center mb-4">
                                        <div class="col">
                                            <div class="details-title">Highly Susceptible Populations</div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance51" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Pasteurized foods used; prohibited foods not offered</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS51" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat51" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div>
                                    <div class="row text-center mb-4">
                                        <div class="col">
                                            <div class="details-title">Food/Color Additives and Toxic Substances</div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance54" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Food additives; approved & properly used</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS54" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat54" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance55" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Toxic substanced properly identified; stored & used</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS55" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat55" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div>
                                    <div class="row text-center mb-4">
                                        <div class="col">
                                            <div class="details-title">Conformance with Approved Procedures</div>
                                        </div>
                                    </div>
                                    <div class="row mb-5">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCompliance59" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <p>Compliance with variance, specialized process, & HACCP Plan</p>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblCOS59" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-1">
                                                    <div class="detail">
                                                        <asp:Label ID="lblRepeat59" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <!-- GOOD RETAIL PRACTICES Details -->
                    <div>
                        <div class="row text-center mt-5">
                            <div class="col">
                                <div class="details-section-title">GOOD RETAIL PRACTICES</div>
                            </div>
                        </div>
                        <div class="details-section">
                            <!-- Inspection Description and Key -->
                            <div class="row mb-4">
                                <div class="col">
                                    Good Retail Practices are preventative measures to control the addition of pathogens, chemicals, and physical objects into foods.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    IN = In Compliance<br />
                                    OUT = Not In Compliance<br />
                                    N/O = Not Observed<br />
                                    N/A = Not Applicable
                                </div>
                                <div class="col text-right">
                                    COS = Corrected On Site during inspection<br />
                                    R = Repeat Violation
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-12 col-md-6">
                                    <div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="details-title">COMPLIANCE STATUS</div>
                                            </div>
                                            <div class="col-1">
                                                <div class="details-title">COS</div>
                                            </div>
                                            <div class="col-1">
                                                <div class="details-title">R</div>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row text-center mb-4">
                                            <div class="col">
                                                <div class="details-title">Safe Food & Water</div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance62" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Pasteurized eggs used where required</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS62" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat62" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance63" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Water & Ice from approved source</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS63" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat63" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance65" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Variance obtained for specialized processing methods</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS65" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat65" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div>
                                        <div class="row text-center mb-4">
                                            <div class="col">
                                                <div class="details-title">Food Temperature Control</div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance68" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Proper Cooling methods used; adequate equipment for temperature control</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS68" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat68" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance69" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Plant food properly cooked for hot holding</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS69" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat69" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance70" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Approved thawing methods used</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS70" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat70" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance71" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Thermometers used and accurate</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS71" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat71" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div>
                                        <div class="row text-center mb-4">
                                            <div class="col">
                                                <div class="details-title">Food Identification</div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance74" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Food properly labeled; original container</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS74" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat74" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div>
                                        <div class="row text-center mb-4">
                                            <div class="col">
                                                <div class="details-title">Prevention of Food Contamination</div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance78" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Insects, rodents, & animals not present; no unauthorized persons</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS78" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat78" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance79" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Contamination prevented during food preparation, storage & display</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS79" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat79" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance80" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Personal cleanliness</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS80" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat80" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance81" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Wiping cloths; properly used & stored</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS81" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat81" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance82" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Washing fruits & vegetables</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS82" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat82" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="details-title">COMPLIANCE STATUS</div>
                                            </div>
                                            <div class="col-1">
                                                <div class="details-title">COS</div>
                                            </div>
                                            <div class="col-1">
                                                <div class="details-title">R</div>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row text-center mb-4">
                                            <div class="col">
                                                <div class="details-title">Proper Use of Utensils</div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance85" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>In-use utensils; properly stored</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS85" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat85" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance86" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Utensils, equipment & linens; properly stored & used</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS86" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat86" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance87" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Single-use & single service articles; properly stored & used</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS87" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat87" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance89" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Gloves used properly</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS89" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat89" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div>
                                        <div class="row text-center mb-4">
                                            <div class="col">
                                                <div class="details-title">Utensils, Equipment and Vending</div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance91" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Food & non-food contact surfaces cleanable, properly designed, constructed & used</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS91" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat91" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance93" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Food & non-food contact surfaces cleanable, properly designed, constructed & used</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS93" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat93" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance94" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Warewashing facilities: installed, maintained & used; test strips</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS94" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat94" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance95" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Non-food contact surfaces clean</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS95" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat95" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div>
                                        <div class="row text-center mb-4">
                                            <div class="col">
                                                <div class="details-title">Physical Facilities</div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance98" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Hot & cold water available; adequate pressure</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS98" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat98" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance100" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Plumbing installed; proper backflow devices</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS100" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat100" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance102" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Sewage and wastewater properly disposed</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS102" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat102" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance104" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Toilet facilties: properly constructed, supplied & cleaned</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS104" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat104" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance106" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Garbage & refuse properly disposed: facilites maintained</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS106" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat106" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance107" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Physical facilities installed, maintained & clean</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS107" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat107" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCompliance109" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <p>Adequate ventilation & lighting; designated areas used</p>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblCOS109" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="col-1">
                                                        <div class="detail">
                                                            <asp:Label ID="lblRepeat109" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- COMMENTS -->
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
                                <hr />
                            </div>
                            <!-- Temp Observation -->
                            <div id="tempObs" visible="false" runat="server">
                                <div class="row text-center mt-5">
                                    <div class="col">
                                        <div class="details-title">TEMPERATURE OBSERVATIONS (Item/Locations/Temps)</div>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="lblTempObs" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- VIOLATIONS -->
                    <div>
                        <div class="row text-center mt-5">
                            <div class="col">
                                <div class="details-section-title">VIOLATIONS</div>
                            </div>
                        </div>
                        <div class="details-section">
                            <div class="row">
                                <div class="col">
                                    <p>
                                        Violations cited in this report must be corrected within the time frames below, or as stated in sections 8-405.11 of the food code.
                                    </p>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="co1">
                                    <asp:GridView ID="gvObsCorActions" CssClass="table table-responsive" GridLines="None" ShowHeader="true" CellPadding="10" runat="server"></asp:GridView>
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
