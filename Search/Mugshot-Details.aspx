<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mugshot-Details.aspx.cs" Inherits="Search.Mugshot_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Inmate Details</title>
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
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-7Q6NTBLCK0"></script>
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
                <a href="https://www.pinal.gov/772/Sheriffs-Office"><asp:Image CssClass="header-image img-fluid" runat="server" ImageUrl="./images/Logo.png" /></a>
                <h4 class="header-title">Sheriff's Office</h4>
                <hr class="header-title" />
                <h2 class="header-title mb-5">Mugshot Search</h2>
            </div>
            <form id="form1" runat="server">
                <div class="row">
                    <div class="col">
                        <h5 class="header-title">INMATE DETAILS</h5>
                    </div>
                    <div class="col text-right">
                        <asp:ImageButton runat="server" Width="10" OnClick="btnClose_Click" ImageUrl="./images/close.gif" />
                    </div>
                </div>
                <div class="content">
                    <!-- Inmate Details -->
                    <div class="details-section">
                        <div class="row">
                            <div class="col-sm-2">
                                <div class="detail"><asp:Image ID="imgInmate" CssClass="img-thumbnail" runat="server" /></div>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="col-lg-12 col">
                                        <div class="details-title">Inmate ID</div>
                                        <div class="detail mb-1"><asp:Label ID="lblInmateID" runat="server" /></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col">
                                        <div class="details-title">NAME</div>
                                        <div class="detail mb-4"><asp:Label ID="lblName" runat="server" /></div>
                                    </div>
                                    <div class="col-lg-6 col">
                                        <div class="details-title mt-1">Age</div>
                                        <div class="detail mb-4"><asp:Label ID="lblAge" runat="server" /></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="details-title">SEX</div>
                                        <div class="detail mb-4"><asp:Label ID="lblSex" runat="server" /></div>
                                        <div class="details-title">RACE</div>
                                        <div class="detail"><asp:Label ID="lblRace" runat="server" /></div>
                                    </div>
                                    <div class="col">
                                        <div class="details-title">EYES</div>
                                        <div class="detail mb-4"><asp:Label ID="lblEyes" runat="server" /></div>
                                        <div class="details-title">HAIR</div>
                                        <div class="detail"><asp:Label ID="lblHair" runat="server" /></div>
                                    </div>
                                    <div class="col">
                                        <div class="details-title">HEIGHT</div>
                                        <div class="detail mb-4"><asp:Label ID="lblHeight" runat="server" /></div>
                                        <div class="details-title">WEIGHT</div>
                                        <div class="detail"><asp:Label ID="lblWeight" runat="server" /></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Cases -->
                    <div class="offenses">
                        <div class="row text-center mt-5">
                            <div class="col">
                                <div class="details-section-title">OFFENSE(S)</div>
                            </div>
                        </div>
                        <div class="details-section">
                            <div class="row">
                                <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <div style="border: none">
                                                <asp:GridView ID="gvOffenses" CssClass="table table-responsive" GridLines="None" HorizontalAlign="Left" ShowHeader="false" runat="server"></asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Disclaimer -->
                    <div class="disclaimer mt-5">
                        <div>DISCLAIMER</div>
                        <p>
                            The search engine lists individuals who are currently incarcerated in the Pinal County Jail. Inclusion in this search does not indicate guilt, only that the individual is or has been incarcerated.
                        </p>
                        <p>
                            This information is updated every 60 minutes. When an individual's information is entered into the Pinal County Inmate data base, the information will be updated to this listing during the next regularly scheduled update. When an individual is released from jail, they will no longer appear in these listings.
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
