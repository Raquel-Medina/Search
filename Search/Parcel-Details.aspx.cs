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
using System.Windows.Forms;

namespace Search
{
    public partial class Parcel_Details : System.Web.UI.Page
    {
        // *** Connection Strings *** //
        string connectionString = ConfigurationManager.ConnectionStrings["AssessorConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Populate the Tax Year dropdown list
            if (ddlTaxYear.Items.Count == 0)
            {
                PopulateDdl();
            }

            // Get the parcel information
            GetParcelInfo();
        }

        protected void ddlTaxYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Request.QueryString["ty"] != null)
            {
                Request.QueryString.Remove("ty");
            }

            // When tax year is changed in dropdown list get the parcel information
            GetParcelInfo();
        }

        private void GetParcelInfo()
        {
            string parcelID = Request.QueryString["parcel_ID"];
            string book = "";
            string map = "";
            string parcel = "";
            string split = "";
            string taxYear;

            if (parcelID.Length == 9)
            {
                book = parcelID.Substring(0, 3);
                map = parcelID.Substring(3, 2);
                parcel = parcelID.Substring(5, 3);
                split = parcelID.Substring(8, 1);

                if (Request.QueryString["ty"] != null)
                {
                    taxYear = Request.QueryString["ty"];
                    ddlTaxYear.SelectedValue = taxYear;
                }
                else
                {
                    taxYear = ddlTaxYear.Text;
                }

                GetDetails(parcelID, book, map, parcel, split, taxYear);
                GetDocuments(parcelID, book, map, parcel, split);
                GetExemptions(parcelID, book, map, parcel, split, taxYear);
                GetImprovements(parcelID, book, map, parcel, split, taxYear);
            }
            else
            {
                Response.Redirect("Parcel-Details-Error.aspx");
            }
        }

        private void GetDetails(string parcelID, string book, string map, string parcel, string split, string taxYear)
        {
            string parcelnum = book + "-" + map + "-" + parcel + split;     // parcelnum is parcelID with dashes
            string copyText = "https://app1.pinal.gov/Search/Parcel-Details.aspx?parcel_ID=" + parcelID;

            hfCopy.Value = copyText;        // link for Share this parcel
            hlCompProp.NavigateUrl = "https://app1.pinal.gov/Comparables/index.html?APN=" + parcelID;
            hlTaxInfo.NavigateUrl = "https://treasurer.pinal.gov/ParcelInquiry?parcelnumber=" + parcelID;
            hlParcelViewer.NavigateUrl = "https://experience.arcgis.com/experience/f19af3d40ed54a979ecb678ee4980a3c/#data_s=where%3AdataSource_1-TaxParcels_8963%3APARCELID%3D%27" + parcelID + "%27&zoom_to_selection=true";
            hlTaxChart.NavigateUrl = "https://www.pinal.gov/DocumentCenter/View/11053/VALYRCHART";

            // *** Stored Procedure *** //
            string detailsProcedure = "[dbo].[Sp_search_detailsinfobyparcelyear_cama]";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmdDetails = new SqlCommand(detailsProcedure, con);
                SqlDataReader drDetails;

                // parcel details
                cmdDetails.CommandType = CommandType.StoredProcedure;
                cmdDetails.Parameters.Add("@BookNumber", SqlDbType.VarChar).Value = book;
                cmdDetails.Parameters.Add("@MapNumber", SqlDbType.VarChar).Value = map;
                cmdDetails.Parameters.Add("@ParcelNumber", SqlDbType.VarChar).Value = parcel;
                cmdDetails.Parameters.Add("@SplitNumber", SqlDbType.VarChar).Value = split;
                cmdDetails.Parameters.Add("@Year", SqlDbType.VarChar).Value = taxYear;

                drDetails = cmdDetails.ExecuteReader();

                if (drDetails.HasRows)
                {
                    while (drDetails.Read())
                    {
                        string city = drDetails["p_city"].ToString();
                        string propAddress = drDetails["p_stnm"].ToString() + " " + drDetails["p_dir"] + " " + drDetails["p_stna"] + " " + drDetails["p_sfx"] + " " + drDetails["p_city"].ToString() + ", " + drDetails["p_stat"].ToString() + " " + drDetails["p_zipc"].ToString();
                        string owner2 = drDetails["owner_na2"].ToString();
                        string careOf = drDetails["care_of"].ToString();
                        string sub = drDetails["sub_div"].ToString();
                        string unit = drDetails["unit"].ToString();
                        string block = drDetails["BLOCK"].ToString();
                        string lot = drDetails["lot"].ToString();
                        string phase = drDetails["phase"].ToString();
                        string cabinet = drDetails["cabinet"].ToString();
                        string slide = drDetails["slide"].ToString();
                        string recDate = drDetails["dkt_month"].ToString() + "/" + drDetails["dkt_day"].ToString() + "/" + drDetails["dkt_year"].ToString();
                        decimal saleAmount = decimal.Parse(drDetails["docket_prc"].ToString());

                        hlAddressLocation.NavigateUrl = "https://www.google.com/maps?q=" + propAddress;

                        // *** Property Details *** //
                        lblParcelNum.Text = parcelnum;
                        hlTaxAreaCode.Text = drDetails["tax_area_c"].ToString();
                        hlTaxAreaCode.NavigateUrl = "https://treasurer.pinal.gov/ParcelInquiry/Main/AreaCodeRates?taxyear=" + taxYear + "&areacode=" + drDetails["tax_area_c"].ToString();
                        ttUseCode.Title = "ASSESSOR USE CODE   Primary Use: " + drDetails["primaryuse"].ToString() + "  Category: " + drDetails["category"].ToString() + "  Sub-Category: " + drDetails["subcategory"].ToString();
                        lblUseCode.Text = drDetails["use_code"].ToString();
                        lblSTR.Text = drDetails["section"].ToString() + "/" + drDetails["township"].ToString() + "/" + drDetails["range"].ToString();
                        lblPropDesc.Text = drDetails["legal_text"].ToString();
                        ttPropDesc.Title = "This property description may be condensed and/or abbreviated for Assessor purposes. This description should not be used for transference of property. Please refer to official recorded documents for complete legal descriptions.";
                        lblOwner1.Text = drDetails["owner_na1"].ToString();

                        if (owner2 != "")
                        {
                            lblOwner2.Text = owner2;
                        }
                        else { lblOwner2.Text = "N/A"; }

                        if (careOf != "")
                        {
                            lblCareof.Text = careOf;
                        }
                        else { lblCareof.Text = "N/A"; }

                        lblMailingAddress.Text = drDetails["address"].ToString() + " " + drDetails["city"].ToString() + ", " + drDetails["state"].ToString() + " " + drDetails["zip_code"].ToString();

                        if (city != "")
                        {
                            lblPropAddress.Text = propAddress;
                        }
                        else { lblPropAddress.Text = ""; }

                        ttPropAddress.Title = "Property Address refers to a geographical location: it may not match the mailing address city or zip code.";

                        if (sub != "")
                        {
                            lblSubdivision.Text = sub;
                        }
                        else { lblSubdivision.Text = "N/A"; }

                        if (unit != "")
                        {
                            lblUnit.Text = unit;
                        }
                        else { lblUnit.Text = "N/A"; }

                        if (block != "")
                        {
                            lblBlock.Text = block;
                        }
                        else { lblBlock.Text = "N/A"; }

                        if (lot != "")
                        {
                            lblLot.Text = lot;
                        }
                        else { lblLot.Text = "N/A"; }

                        if (phase != "")
                        {
                            lblPhase.Text = phase;
                        }
                        else { lblPhase.Text = "N/A"; }

                        if (cabinet != "")
                        {
                            lblCabinet.Text = cabinet;
                        }
                        else { lblCabinet.Text = "N/A"; }

                        if (slide != "")
                        {
                            lblSlide.Text = slide;
                        }
                        else { lblSlide.Text = "N/A"; }

                        if (recDate != "0/0/0")
                        {
                            lblRecDate.Text = recDate;
                        }
                        else { lblRecDate.Text = "Not Given"; }

                        if (saleAmount > 0)
                        {
                            lblSaleAmt.Text = string.Format("{0:C}", saleAmount);
                        }
                        else { lblSaleAmt.Text = "Not Given"; }

                        // *** Parcel Details *** //
                        decimal parcelSize = decimal.Parse(drDetails["prcl_size"].ToString());
                        string llc = drDetails["land_lg_cl"].ToString();
                        string ilc = drDetails["impr_lg_cl"].ToString();
                        decimal fcvMoney = decimal.Parse(drDetails["total_fcv"].ToString());
                        decimal lvpMoney = decimal.Parse(drDetails["total_lpv"].ToString());
                        decimal afcvMoney = decimal.Parse(drDetails["t_fcv_av"].ToString());
                        decimal alpvMoney = decimal.Parse(drDetails["t_lpv_av"].ToString());

                        lblParcelSize.Text = Math.Round(parcelSize, 2).ToString();
                        lblSizeIndicator.Text = drDetails["land_ind"].ToString();

                        if (llc != "")
                        {
                            lblLandLegalClass.Text = drDetails["land_lg_cl"].ToString() + "-" + drDetails["land_descr"].ToString();
                        }
                        else { lblLandLegalClass.Text = "Not Given"; }

                        if (ilc == "")
                        {
                            lblImprLegalClass.Text = drDetails["impr_lg_cl"].ToString() + "-" + drDetails["impr_descr"].ToString();
                        }
                        else { lblImprLegalClass.Text = "Not Given"; }

                        lblFCV.Text = String.Format("{0:C}", fcvMoney);
                        lblLVP.Text = String.Format("{0:C}", lvpMoney);
                        lblAssessedFCV.Text = String.Format("{0:C}", afcvMoney);
                        lblAssessedLPV.Text = String.Format("{0:C}", alpvMoney);

                        // *** Attached Personal Property *** //
                        string attachedProp = drDetails["mhcheck"].ToString();
                        if (attachedProp != "0")
                        {
                            hlAttachedProp.Text = "View Personal Property Attached to This Parcel";
                            hlAttachedProp.NavigateUrl = "MH-Details.aspx?id=" + drDetails["accountno"].ToString();
                        }
                        else lblAttachedProp.Text = "No Personal Property Listed";
                    }
                    lblValInfoMessage.Visible = false;
                    valInfo.Visible = true;
                }
                else
                {
                    lblValInfoMessage.Visible = true;
                    valInfo.Visible = false;
                }

                drDetails.Close();
            }
        }

        private void GetDocuments(string parcelID, string book, string map, string parcel, string split)
        {
            // *** Stored Procedure *** //
            string documentsProcedure = "[dbo].[Sp_search_ParcelFeeNumbers]";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmdDocs = new SqlCommand(documentsProcedure, con);
                SqlDataReader drDocs;

                // parcel documents
                cmdDocs.CommandType = CommandType.StoredProcedure;
                cmdDocs.Parameters.Add("@BookNumber", SqlDbType.VarChar).Value = book;
                cmdDocs.Parameters.Add("@MapNumber", SqlDbType.VarChar).Value = map;
                cmdDocs.Parameters.Add("@ParcelNumber", SqlDbType.VarChar).Value = parcel;
                cmdDocs.Parameters.Add("@SplitNumber", SqlDbType.VarChar).Value = split;

                // *** Documents *** //
                drDocs = cmdDocs.ExecuteReader();
                var dataTable = new DataTable();
                dataTable.Columns.Add("", typeof(System.String));

                if (drDocs.HasRows)
                {
                    while (drDocs.Read())
                    {
                        string feeNumber = drDocs["FeeNumber"].ToString();
                        string docNum = feeNumber.Substring(0, 4) + "-" + feeNumber.Substring(4, 6);

                        dataTable.Rows.Add(docNum);
                    }

                    gvDocuments.DataSource = dataTable;
                    gvDocuments.ShowHeader = false;
                    gvDocuments.DataBind();

                    for (int i = 0; i < gvDocuments.Rows.Count; i++)
                    {
                        HyperLink hlDocument = new HyperLink();
                        hlDocument.NavigateUrl = "https://acclaim.pinalcountyaz.gov/AcclaimWeb/Details/GetDocumentbyInstrumentNumber/DOC/" + gvDocuments.Rows[i].Cells[0].Text;
                        hlDocument.Text = gvDocuments.Rows[i].Cells[0].Text;
                        hlDocument.Target = "_blank";
                        gvDocuments.Rows[i].Cells[0].Controls.Add(hlDocument);
                    }
                }

                drDocs.Close();
            }
        }

        private void GetExemptions(string parcelID, string book, string map, string parcel, string split, string taxYear)
        {
            // *** Stored Procedure *** //
            string exemptionsProcedure = "[dbo].[Sp_search_imprdetails_cama]";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmdExemptions = new SqlCommand(exemptionsProcedure, con);
                SqlDataReader drExemptions;

                // parcel exemptions
                cmdExemptions.CommandType = CommandType.StoredProcedure;
                cmdExemptions.Parameters.Add("@BookNumber", SqlDbType.VarChar).Value = book;
                cmdExemptions.Parameters.Add("@MapNumber", SqlDbType.VarChar).Value = map;
                cmdExemptions.Parameters.Add("@ParcelNumber", SqlDbType.VarChar).Value = parcel;
                cmdExemptions.Parameters.Add("@SplitNumber", SqlDbType.VarChar).Value = split;
                cmdExemptions.Parameters.Add("@TaxYear", SqlDbType.VarChar).Value = taxYear;

                // *** Exemptions *** //
                try
                {
                    drExemptions = cmdExemptions.ExecuteReader();
                    string exemptType;

                    while (drExemptions.Read())
                    {
                        exemptType = drExemptions["exempt_typ"].ToString();
                        if (exemptType.Contains("W-FCV") || exemptType.Contains("W-LPV"))
                        {
                            lblWidow.Text = "Yes";
                        }
                        else lblWidow.Text = "No";

                        if (exemptType.Contains("R-FCV") || exemptType.Contains("R-LPV"))
                        {
                            lblWidower.Text = "Yes";
                        }
                        else lblWidower.Text = "No";

                        if (exemptType.Contains("D-FCV") || exemptType.Contains("D-LPV"))
                        {
                            lblDisabled.Text = "Yes";
                        }
                        else lblDisabled.Text = "No";

                        if (exemptType.Contains("8"))
                        {
                            lblSrFreeze.Text = "Yes";
                        }
                        else lblSrFreeze.Text = "No";
                    }

                    drExemptions.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void GetImprovements(string parcelID, string book, string map, string parcel, string split, string taxYear)
        {
            // *** Stored Procedure *** //
            string improvementsProcedure = "[dbo].[sp_Search_ImprDetailsTop_cama]";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmdImprovements = new SqlCommand(improvementsProcedure, con);
                SqlDataReader drImprovements;

                //parcel improvements
                cmdImprovements.CommandType = CommandType.StoredProcedure;
                cmdImprovements.Parameters.Add("@BookNumber", SqlDbType.VarChar).Value = book;
                cmdImprovements.Parameters.Add("@MapNumber", SqlDbType.VarChar).Value = map;
                cmdImprovements.Parameters.Add("@ParcelNumber", SqlDbType.VarChar).Value = parcel;
                cmdImprovements.Parameters.Add("@SplitNumber", SqlDbType.VarChar).Value = split;
                cmdImprovements.Parameters.Add("@TaxYear", SqlDbType.VarChar).Value = taxYear;

                // *** Improvements *** //
                try
                {
                    drImprovements = cmdImprovements.ExecuteReader();

                    var dataTable = new DataTable();
                    dataTable.Columns.Add("IMP", typeof(System.String));
                    dataTable.Columns.Add("ITEM", typeof(System.String));
                    dataTable.Columns.Add("CONST YEAR", typeof(System.String));
                    dataTable.Columns.Add("GRND FLR PERIM", typeof(System.String));
                    dataTable.Columns.Add("STORIES", typeof(System.String));
                    dataTable.Columns.Add("TOTAL SQ. FT.", typeof(System.String));
                    int count = 0;

                    while (drImprovements.Read())
                    {
                        string des = drImprovements["description"].ToString();
                        string constYr = drImprovements["const_year"].ToString();
                        string grndPer = drImprovements["ground_per"].ToString();
                        string tFlr = drImprovements["total_flr"].ToString();
                        int impID = Convert.ToInt32(drImprovements["impr_id"]);
                        int storiesNum = Convert.ToInt32(drImprovements["story_cnt"]);

                        if (count < 4)
                        {
                            dataTable.Rows.Add(impID, des, constYr, grndPer, storiesNum, tFlr);
                        }
                        count++;
                    }
                    gvImps.DataSource = dataTable;
                    gvImps.ShowHeader = true;
                    gvImps.DataBind();

                    drImprovements.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void PopulateDdl()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmdTaxYear = con.CreateCommand();
                cmdTaxYear.CommandType = CommandType.StoredProcedure;
                cmdTaxYear.CommandText = "[dbo].[Sp_search_getcurrenttaxyear_cama]";
                SqlDataReader drTaxYear = cmdTaxYear.ExecuteReader();

                while (drTaxYear.Read())
                {
                    int getYear = Convert.ToInt32(drTaxYear[0].ToString());
                    DateTime setYear = new DateTime(getYear, 1, 1);

                    ddlTaxYear.Items.Insert(0, setYear.Year.ToString());
                    ddlTaxYear.Items.Insert(1, setYear.AddYears(-1).Year.ToString());
                    ddlTaxYear.Items.Insert(2, setYear.AddYears(-2).Year.ToString());
                    ddlTaxYear.Items.Insert(3, setYear.AddYears(-3).Year.ToString());
                    ddlTaxYear.Items.Insert(4, setYear.AddYears(-4).Year.ToString());
                    ddlTaxYear.Items.Insert(5, setYear.AddYears(-5).Year.ToString());
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Parcel-Search.aspx");
        }
    }
}
