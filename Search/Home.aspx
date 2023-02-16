<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Search.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pinal County Searches</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="robots" content="noindex" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

    <!-- Project CSS files -->
    <link rel="stylesheet" href="css/site.css" type="text/css" />
</head>
<body>
    <div class="search-page">
        <div class="container">
            <div class="header-banner">
                <a href="https://www.pinal.gov"><asp:Image CssClass="header-image img-fluid" runat="server" ImageUrl="./images/Logo.png" /></a>
                <hr class="header-title" />
                <h2 class="header-title mb-5">Searches</h2>
            </div>
            <div class="mb-5">
                <h5 class="header-title">ADULT DETENTION SEARCHES</h5>
                <div>
                    <p>
                        The Pinal County Jail confines individuals who have been arrested, charged with criminal offenses and are awaiting disposition of their cases within 
                    the criminal justice system. The Jail also houses those individuals who have been sentenced to serve their respective sentence in the county jail.
                    </p>
                </div>
                <!-- Links -->
                <div class="row mb-2">
                    <div class="col pl-5">
                        <asp:HyperLink NavigateUrl="https://app1.pinal.gov/search/mugshot-search.aspx" Target="_blank" runat="server">Mugshots Search</asp:HyperLink><br />
                        <asp:HyperLink NavigateUrl="https://app1.pinal.gov/search/inmate-search.aspx" Target="_blank" runat="server">Inmate Search</asp:HyperLink>
                    </div>
                </div>
            </div>
            <div class="mb-5">
                <h5 class="header-title">ASSESSOR SEARCHES</h5>
                <div>
                    <p>
                        The Assessor’s Office maintains the ownership information for each parcel and updates the records when property is sold, transferred, combined or split. 
                    The office also administers the widows, widower and disability exemptions and the Senior Valuation Freeze. 
                    The Assessor’s Office is also responsible for the valuation of manufactured housing and business personal property.
                    </p>
                </div>
                <!-- Links -->
                <div class="row mb-2">
                    <div class="col pl-5">
                        <asp:HyperLink NavigateUrl="https://app1.pinal.gov/search/parcel-search.aspx" Target="_blank" runat="server">Parcel Search</asp:HyperLink><br />
                        <asp:HyperLink NavigateUrl="https://app1.pinal.gov/search/mh-search.aspx" Target="_blank" runat="server">Manufactured Housing Search</asp:HyperLink><br />
                        <asp:HyperLink NavigateUrl="https://app1.pinal.gov/search/ipr-search.aspx" Target="_blank" runat="server">Improvements on Possessory Rights Search</asp:HyperLink>
                    </div>
                </div>
            </div>
            <div class="mb-5">
                <h5 class="header-title">ENVIRONMENTAL HEALTH SEARCH</h5>
                <div>
                    <p>
                        The mission of the Pinal County Division of Public Health is to protect the health of all Pinal County residents and visitors alike. 
                    It is our goal to insure that all food produced, prepared and offered to the public is wholesome, honestly presented and safe for consumption. 
                    To fulfill our mission and goal, we conduct a consumer food protection and safety program that includes requirements for food establishment 
                    plan review and approval, permit to operate, ongoing inspection, and investigation of complaints of foodborne illness. This Internet website 
                    provides the public with another opportunity and avenue to obtain information on food establishment inspection results in Pinal County. 
                    We have developed this website as part of our continuing effort to educate and inform the public on matters related to food safety and Pinal 
                    County food establishment sanitation.
                    </p>
                </div>
                <!-- Links -->
                <div class="row mb-2">
                    <div class="col pl-5">
                        <asp:HyperLink NavigateUrl="https://app1.pinal.gov/search/foodinspection-search.aspx" Target="_blank" runat="server">Food Inspections Search</asp:HyperLink>
                    </div>
                </div>
            </div>
            <div class="mb-5">
                <h5 class="header-title">MEDICAL EXAMINER SEARCH</h5>
                <div>
                    <p>
                        We provide accurate, timely, compassionate and professional death investigation services for citizens.
                    </p>
                </div>
                <!-- Links -->
                <div class="row mb-2">
                    <div class="col pl-5">
                        <asp:HyperLink NavigateUrl="https://app1.pinal.gov/search/me-case-search.aspx" Target="_blank" runat="server">Case Search</asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
