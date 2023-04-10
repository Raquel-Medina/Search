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
    public partial class WebForm1_Details : System.Web.UI.Page
    {
        // *** Connection String *** //
        string connectionString = ConfigurationManager.ConnectionStrings["EnvironmentalHealthConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the inspection details
            GetInspectionDetails();
            GetItemDetails();
            GetObservations();
        }

        private void GetInspectionDetails()
        {
            string inspID = Request.QueryString["id"];

            hlFullReport.NavigateUrl = "https://app1.pinal.gov/Search/FoodInspection-Details.aspx?id=" + inspID;

            // *** Stored Procedure *** //
            string inspDetailsProcedure = "[dbo].[spEHInsp_NewDetailsByIDNew]";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(inspDetailsProcedure, con);
                SqlDataReader dr;

                //inspection details 
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@g6_act_num", SqlDbType.Money).Value = inspID;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    string startTime = Convert.ToDateTime(dr["StartTime"].ToString()).ToString("h:mm tt");
                    string endTime = Convert.ToDateTime(dr["EndTime"].ToString()).ToString("h:mm tt");
                    string pn = dr["ApplicantPhone"].ToString();
                    string phone;
                    string tempObservations = dr["guide_item_comment"].ToString();

                    if (pn != "")
                    {
                        phone = "(" + pn.Substring(0, 3) + ") " + pn.Substring(3, 3) + "-" + pn.Substring(6, 4);
                    }
                    else phone = "0";

                    // Top portion of form
                    lblRating.Text = dr["guide_item_status"].ToString();
                    lblDate.Text = dr["InspDate"].ToString();
                    lblTimeIn.Text = startTime.ToString();
                    lblTimeOut.Text = endTime.ToString();
                    lblEstablishment.Text = dr["B1_Special_Text"].ToString();
                    lblAddress.Text = dr["PropertyAddress"].ToString() + " " + dr["PropertyAddressCity"].ToString() + " " + dr["PropertyAddressZip"].ToString();
                    lblPhone.Text = phone;
                    lblPermitNum.Text = dr["B1_ALT_ID"].ToString();
                    lblPermitHolder.Text = dr["BusinessOwnerFullName"].ToString();
                    lblPurpose.Text = dr["InspType"].ToString();
                    lblEstType.Text = dr["PermitType"].ToString();
                    lblRiskCategory.Text = dr["RiskClassification"].ToString();

                    if (tempObservations != "")
                    {
                        tempObs.Visible = true;
                        lblTempObs.Text = tempObservations;
                    }
                    else { tempObs.Visible = false; }
                }
            }
        }

        protected void GetItemDetails()
        {
            string inspID = Request.QueryString["id"];
            int sum = 0;

            // *** Stored Procedure *** //
            string itemDetailsProcedure = "[dbo].[spEHInsp_NewItemDetailsByIDNew]";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(itemDetailsProcedure, con);
                SqlDataReader dr;

                //inspection details 
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@g6_act_num", SqlDbType.Money).Value = inspID;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    string itemStatus = dr["guide_item_status"].ToString();
                    string itemDisplayOrder = dr["guide_item_display_order"].ToString();
                    string itemCount = dr["Count"].ToString();
                    string resultComment = dr["ResultComment"].ToString();

                    if ((itemStatus == "Corrected" || itemStatus == "Out" || itemStatus == "No") && (int.Parse(itemDisplayOrder) < 60))
                    {
                        sum = sum + 1;
                        lblRiskViolations.Text = sum.ToString();
                    }

                    if (((itemStatus == "Corrected" || itemStatus == "Out" || itemStatus == "No") && itemCount != "0") && (int.Parse(itemDisplayOrder) < 60))
                    {
                        sum = sum + 1;
                        lblRepeatViolations.Text = sum.ToString();
                    }
                    else { lblRepeatViolations.Text = "0"; }

                    // Set Compliance items
                    string labelID = "lblCompliance" + itemDisplayOrder; // Set lable ID
                    Label lbl = (Label)FindControl(labelID);

                    // Set COS items
                    string labelCosID = "lblCOS" + itemDisplayOrder; // Set lable ID
                    Label lblCos = (Label)FindControl(labelCosID);
                    if (itemStatus == "Corrected")
                    {
                        lblCos.Text = "X";
                    }

                    // Set Repeat items
                    string labelRepeatID = "lblRepeat" + itemDisplayOrder; // Set lable ID
                    Label lblRepeat = (Label)FindControl(labelRepeatID);
                    if (itemStatus == "Corrected")
                    {
                        lblRepeat.Text = "X";
                    }

                    // Comments Section
                    if (resultComment != "")
                    {
                        lblComments.Text = resultComment;
                        comments.Visible = true;
                    }
                    else { comments.Visible = false; }
                }
            }
        }

        private void GetObservations()
        {
            string inspID = Request.QueryString["id"];

            // *** Stored Procedure *** //
            string obsProcedure = "[dbo].[spEHInsp_ObservationsIDNew]";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(obsProcedure, con);
                SqlDataReader dr;

                // observations
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@g6_act_num", SqlDbType.VarChar).Value = inspID;
                dr = cmd.ExecuteReader();

                var dataTable = new DataTable();
                dataTable.Columns.Add("Item#", typeof(System.String));
                dataTable.Columns.Add("Violation Description", typeof(System.String));

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        string git = dr["guide_item_text"].ToString();
                        string gic = dr["guide_item_comment"].ToString();

                        dataTable.Rows.Add(git, gic);
                    }

                    gvObsCorActions.DataSource = dataTable;
                    gvObsCorActions.ShowHeader = true;
                    gvObsCorActions.DataBind();

                    dr.Close();
                    con.Close();
                }
                else
                {
                    lblViolations.Text = "No violations were found during this inspection.";
                    lblViolations.Visible = true;
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
    }
}