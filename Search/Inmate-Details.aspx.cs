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
    public partial class Inmate_Details : System.Web.UI.Page
    {
        // *** Connection Strings *** //
        string connectionString = ConfigurationManager.ConnectionStrings["AdultDetentionConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GetInmateInfo();
        }

        private void GetInmateInfo()
        {
            string inmatelID = Request.QueryString["id"];

            GetDetails(inmatelID);
            GetCases(inmatelID);
            GetCourtDates(inmatelID);
        }

        private void GetDetails(string id)
        {
            string subFolder = id.Substring(id.Length - 2, 2);

            // *** Stored Procedure *** //
            string detailsProcedure = "[dbo].[spGetInmateDetails]";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(detailsProcedure, con);
            SqlDataReader dr;

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InmateID", SqlDbType.VarChar).Value = id;

            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                // *** Inmate Details *** //
                imgInmate.ImageUrl = "https://app1.pinal.gov/Files/MugShots/" + subFolder + "/" + id + ".jpg";
                lblInmateID.Text = dr["InmateID"].ToString();
                lblName.Text = dr["Name"].ToString();
                lblAge.Text = dr["Age"].ToString();
                lblRace.Text = dr["Race"].ToString();
                lblSex.Text = dr["Sex"].ToString();
                lblHair.Text = dr["Hair"].ToString();
                lblEyes.Text = dr["Eyes"].ToString();
                lblWeight.Text = dr["Weight"].ToString();
                lblHeight.Text = dr["Height"].ToString();
            }
            dr.Close();
            con.Close();
        }

        private void GetCases(string id)
        {
            // *** Stored Procedure *** //
            string CasesProcedure = "[dbo].[spGetBookingInfo]";

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(CasesProcedure, con);
            SqlDataReader dr;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InmateID", SqlDbType.VarChar).Value = id;
            cmd.CommandTimeout = 0;
            dr = cmd.ExecuteReader();

            var dt = new DataTable();
            dt.Columns.Add("CASE NUMBER", typeof(System.String));
            dt.Columns.Add("BOND AMOUNT", typeof(System.String));
            dt.Columns.Add("BOND TYPE", typeof(System.String));
            dt.Columns.Add("STATUTE CODE", typeof(System.String));
            dt.Columns.Add("ARRIVAL DATE", typeof(System.String));

            while (dr.Read())
            {
                string caseNum = dr["casenumber"].ToString();
                string bondAmt = dr["Amount"].ToString();
                string type = dr["type"].ToString();
                string statuteCode = dr["StatuteCode"].ToString();
                string arrivalDate = dr["arrivaldt"].ToString();

                dt.Rows.Add(caseNum, bondAmt, type, statuteCode, arrivalDate);
            }

            gvCases.DataSource = dt;
            gvCases.ShowHeader = true;
            gvCases.DataBind();

            dr.Close();
            con.Close();
        }

        private void GetCourtDates (string id)
        {
            // *** Stored Procedure *** //
            string courtDatesProcedure = "[dbo].[spGetEventInfo]";

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(courtDatesProcedure, con);
            SqlDataReader dr;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@InmateID", SqlDbType.VarChar).Value = id;
            cmd.CommandTimeout = 0;
            dr = cmd.ExecuteReader();

            var dt = new DataTable();
            dt.Columns.Add("COURT DATE", typeof(System.String));
            dt.Columns.Add("HEARING", typeof(System.String));

            while (dr.Read())
            {
                string eventDate = dr["EventDate"].ToString();
                string remarks = dr["Remarks"].ToString();

                dt.Rows.Add(eventDate, remarks);
            }

            gvCourtDates.DataSource = dt;
            gvCourtDates.ShowHeader = true;
            gvCourtDates.DataBind();

            dr.Close();
            con.Close();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inmate-Search.aspx");
        }
    }
}
