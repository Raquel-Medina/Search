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
    public partial class Mugshot_Details : System.Web.UI.Page
    {
        // *** Connection Strings *** //
        string connectionString = ConfigurationManager.ConnectionStrings["AdultDetentionConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GetInmateInfo();
        }

        private void GetInmateInfo()
        {
            string inmateID = Request.QueryString["id"];

            GetDetails(inmateID);
            GetOffenses(inmateID);
        }

        private void GetDetails(string id)
        {
            string subFolder = id.Substring(id.Length - 2, 2);

            // *** Stored Procedure *** //
            string detailsProcedure = "[dbo].[spGetInmateDetails]";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
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
                    int weight = int.Parse(dr["Weight"].ToString());
                    if (weight > 0)
                    {
                        lblWeight.Text = weight.ToString();
                    }
                    else { lblWeight.Text = ""; }
                    string height = dr["Height"].ToString();
                    if (height.Contains("  "))
                    {
                        lblHeight.Text = "";
                    }
                    else { lblHeight.Text = height.ToString(); }

                }

                dr.Close();
            }
        }

        private void GetOffenses(string id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spGetBookingInfo", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@InmateID", SqlDbType.VarChar).Value = id;

                DataTable dt = new DataTable();

                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                dt.Columns.Add(" ", typeof(System.String));

                while (dr.Read())
                {
                    string offense = dr["statutedesc"].ToString();

                    dt.Rows.Add(offense);
                }

                gvOffenses.DataSource = dt;
                gvOffenses.DataBind();

                dr.Close();
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mugshot-Search.aspx");
        }
    }
}
