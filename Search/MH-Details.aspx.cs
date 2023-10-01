using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Search
{
    public partial class MH_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the mh information
            GetMHInfo();
        }

        private void GetMHInfo()
        {
            string taxID = Request.QueryString["id"];

            // *** Connection Strings *** //
            string connectionString = ConfigurationManager.ConnectionStrings["AssessorConnectionString"].ConnectionString;
            string detailsProcedure = "[dbo].[Mhdetails_cama]";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmdDetails = new SqlCommand(detailsProcedure, con);
                SqlDataReader drDetails;

                cmdDetails.CommandType = CommandType.StoredProcedure;
                cmdDetails.Parameters.Add("@TPID", SqlDbType.VarChar).Value = taxID;

                drDetails = cmdDetails.ExecuteReader();
                while (drDetails.Read())
                {
                    string parcelID = drDetails["parcel_ID"].ToString();
                    string book = drDetails["book"].ToString();
                    string map = drDetails["map"].ToString(); ;
                    string parcel = drDetails["parcel"].ToString(); ;
                    string split = drDetails["split"].ToString(); ;
                    string assessorParcelLink = "https://app1.pinal.gov/Search/MH-Details.aspx?id=" + taxID;
                    string propAddress = drDetails["prop_addr"].ToString();
                    string propDescription = drDetails["prop_desc"].ToString();
                    string careOf = drDetails["co_name"].ToString();
                    string buildDate = drDetails["builddateid"].ToString();

                    // *** Links *** //
                    // TAX INFORMATION
                    hlTaxInfo.NavigateUrl = "https://treasurer.pinal.gov/ParcelInquiry?parcelnumber=" + parcelID;
                    //TAX AREA CODE
                    hlTaxAreaCode.Text = drDetails["area_code"].ToString();
                    hlTaxAreaCode.NavigateUrl = "https://treasurer.pinal.gov/ParcelInquiry/Main/AreaCodeRates?taxyear=" + buildDate + "&areacode=" + drDetails["area_code"].ToString();
                    // ASSESSOR PARCEL VIEWER
                    hlParcelViewer.NavigateUrl = "https://pinal.maps.arcgis.com/apps/webappviewer/index.html?id=d92bad11160e425ca191f048ef6ca556&find=" + parcelID;
                    // PROPERTY ADDRESS LOCATION
                    hlAddressLocation.NavigateUrl = "https://www.google.com/maps?q=" + propAddress;
                    // TAX YEAR CHART
                    hlTaxChart.NavigateUrl = "https://www.pinal.gov/DocumentCenter/View/11053/VALYRCHART";
                    // SHARE THIS
                    hfCopy.Value = assessorParcelLink;  // link for Share this parcel


                    // *** Property Details *** //

                    // TAXPAYER ID
                    lblTaxPayerID.Text = taxID;
                    // PARCEL NUMBER
                    lblParcelNum.Text = book + "-" + map + "-" + parcel + split;
                    // PROPERTY DESCRIPTION
                    if (propDescription != "")
                    {
                        lblPropDesc.Text = propDescription;
                    }
                    else { lblPropDesc.Text = "Not Given"; }
                    ttPropDesc.Title = "This property description may be condensed and/or abbreviated for Assessor purposes. This description should not be used for transference of property. Please refer to official recorded documents for complete legal descriptions.";
                    // TAXPAYER NAME
                    lblOwner1.Text = drDetails["name"].ToString();
                    // IN CARE OF
                    if (careOf != "")
                    {
                        lblCareof.Text = careOf;
                    }
                    else { lblCareof.Text = "N/A"; }
                    // MAILING ADDRESS
                    lblMailingAddress.Text = drDetails["address"].ToString() + " " + drDetails["city"].ToString() + ", " + drDetails["state"].ToString() + " " + drDetails["zip"].ToString();
                    // PROPERTY ADDRESS
                    lblPropAddress.Text = propAddress;
                    ttPropAddress.Title = "Property Address refers to a geographical location: it may not match the mailing address city or zip code.";


                    // *** Parcel Details *** //

                    // SERIAL NUMBER
                    string serialNum = drDetails["serial_nbr"].ToString();
                    if (serialNum != "")
                    {
                        lblSerialNum.Text = serialNum;
                    }
                    else { lblSerialNum.Text = "Not Given"; }
                    // MODEL YEAR
                    lblModelYr.Text = drDetails["model_yr"].ToString();
                    // SIZE
                    string width = drDetails["width"].ToString();
                    string length = drDetails["length"].ToString();
                    if (width != "0" || length != "0")
                    {
                        lblSize.Text = width + " x " + length;
                    }
                    else { lblSize.Text = "Not Given"; }
                    // PROPERTY CLASS
                    string propClass = drDetails["pers_p_cls"].ToString();
                    switch (propClass)
                    {
                        case "72":
                            lblPropClass.Text = "Manufactured Home";
                            break;
                        case "721":
                            lblPropClass.Text = "Travel Trailer";
                            break;
                        case "722":
                            lblPropClass.Text = "Mobile Office undersized";
                            break;
                        case "723":
                            lblPropClass.Text = "Mobile Office oversized";
                            break;
                        case "724":
                            lblPropClass.Text = "Park Model undersized";
                            break;
                        case "725":
                            lblPropClass.Text = "Park Model oversized";
                            break;
                        default:
                            lblPropClass.Text = "Not Given";
                            break;
                    }
                    // FULL CASH VALUE
                    decimal fcvMoney = decimal.Parse(drDetails["fcv"].ToString());
                    lblFCV.Text = String.Format("{0:C}", fcvMoney);
                    // LIMITED VALUE
                    decimal lvpMoney = decimal.Parse(drDetails["lpv"].ToString());
                    lblLVP.Text = String.Format("{0:C}", lvpMoney);
                    // LAND LEGAL CLASS
                    lblLandLegalClass.Text = drDetails["lgl_cls_cd"].ToString() + "-" + drDetails["descr"].ToString();
                    // EXEMPT CODE
                    string exemptCode = drDetails["exempt_typ"].ToString();
                    if (string.IsNullOrEmpty(exemptCode))
                    {
                        lblExemptCode.Text = "Not Given";
                    }
                    else
                    {
                        lblExemptCode.Text = exemptCode;
                    }
                    // FCV EXEMPT
                    decimal afcvMoney = decimal.Parse(drDetails["exempt_fcv"].ToString());
                    if (afcvMoney == 0)
                    {
                        lblFCVExempt.Text = "Not Given";
                    }
                    else
                    {
                        lblFCVExempt.Text = String.Format("{0:C}", afcvMoney);
                    }
                    // LPV EXEMPT
                    decimal alpvMoney = decimal.Parse(drDetails["exempt_lpv"].ToString());
                    if (alpvMoney == 0)
                    {
                        lblLPVExempt.Text = "Not Given";
                    }
                    else
                    {
                        lblLPVExempt.Text = String.Format("{0:C}", alpvMoney);
                    }
                }

                drDetails.Close();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MH-Search.aspx");
        }
    }
}