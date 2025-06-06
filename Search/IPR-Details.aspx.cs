﻿using System;
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
    public partial class IPR_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the mh information
            GetIPRInfo();
        }

        private void GetIPRInfo()
        {
            string taxID = Request.QueryString["id"];

            // *** Connection Strings *** //
            string connectionString = ConfigurationManager.ConnectionStrings["AssessorConnectionString"].ConnectionString;
            string detailsProcedure = "[dbo].[IAccountMhdetails]";

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
                    string assessorParcelLink = "https://app1.pinal.gov/Search/IPR-Details.aspx?id=" + taxID;
                    string careOf = drDetails["co_name"].ToString();
                    string propAddress = drDetails["prop_addr"].ToString();
                    string propDesc = drDetails["prop_desc"].ToString();
                    string buildDate = drDetails["builddateid"].ToString();

                    // *** Links *** //
                    // TAX INFORMATION
                    hlTaxInfo.NavigateUrl = "https://treasurer.pinal.gov/ParcelInquiry?parcelnumber=" + parcelID;
                    //TAX AREA CODE
                    hlTaxAreaCode.Text = drDetails["area_code"].ToString();
                    hlTaxAreaCode.NavigateUrl = "https://treasurer.pinal.gov/ParcelInquiry/Main/AreaCodeRates?taxyear=" + buildDate + "&areacode=" + drDetails["area_code"].ToString();
                    // ASSESSOR PARCEL VIEWER
                    hlParcelViewer.NavigateUrl = "https://experience.arcgis.com/experience/f19af3d40ed54a979ecb678ee4980a3c/#data_s=where%3AdataSource_1-TaxParcels_8963%3APARCELID%3D%27" + parcelID + "%27&zoom_to_selection=true";
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
                    if (propDesc != "")
                    {
                        lblPropDesc.Text = propDesc;
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
                    // ASSESSED FCV
                    decimal afcvMoney = decimal.Parse(drDetails["fcv_Assessed"].ToString());
                    if (afcvMoney == 0)
                    {
                        lblFCVAssessed.Text = "Not Given";
                    }
                    else
                    {
                        lblFCVAssessed.Text = String.Format("{0:C}", afcvMoney);
                    }
                    // ASSESSED LPV
                    decimal alpvMoney = decimal.Parse(drDetails["lpv_Assessed"].ToString());
                    if (alpvMoney == 0)
                    {
                        lblLPVAssessed.Text = "Not Given";
                    }
                    else
                    {
                        lblLPVAssessed.Text = String.Format("{0:C}", alpvMoney);
                    }
                }

                drDetails.Close();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("IPR-Search.aspx");
        }
    }
}