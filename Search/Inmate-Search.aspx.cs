using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data;
using System.Text;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Search
{
    public partial class Inmate_Search : System.Web.UI.Page
    {
        // *** Connection Strings *** //
        //string connectionString = ConfigurationManager.ConnectionStrings["AdultDetentionConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ClearForm();
            }
        }

        ///<Summary>
        /// Button click event for each search
        ///</Summary>
        //protected void btn_Click(object sender, EventArgs e)
        //{
        //    gvInmates.DataSource = null;
        //    gvInmates.DataBind();

        //    if (txtLastName.Text.Length == 0 && txtFirstName.Text.Length == 0 && txtInmateID.Text.Length == 0)
        //    {
        //        lblWarning.Text = "The LAST NAME, FIRST NAME or INMATE ID field is required.";
        //        lblWarning.Visible = true;
        //        gvInmates.Visible = false;
        //    }
        //    else
        //    {
        //        lblWarning.Visible = false;
        //        PopulateGridView();
        //    }
        //}

        //private void PopulateGridView()
        //{
        //    string firstName = txtFirstName.Text.ToString().Trim();
        //    string lastName = txtLastName.Text.ToString().Trim();
        //    string inmateID = txtInmateID.Text.ToString().Trim();

        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    {
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("GetInmateByFirstLast", con);

        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = lastName;
        //        cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = firstName;
        //        cmd.Parameters.Add("@InmateID", SqlDbType.VarChar).Value = inmateID;

        //        DataTable dt = new DataTable();
        //        SqlDataAdapter adpt = new SqlDataAdapter(cmd);
        //        adpt.Fill(dt);

        //        if (dt.Rows.Count <= 0)
        //        {
        //            lblWarning.Text = "No Results Found";
        //            lblWarning.Visible = true;
        //            gvInmates.Visible = false;
        //        }
        //        else
        //        {
        //            gvInmates.DataSource = dt;
        //            gvInmates.DataBind();
        //            gvInmates.Visible = true;
        //        }
        //    }
        //}

        ///<Summary>
        /// Add pager to each gridview
        ///</Summary>
        //protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    gvInmates.PageIndex = e.NewPageIndex;
        //    PopulateGridView();
        //}

        ///<Summary>
        /// Format binded data in row
        ///</Summary>
        //protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        // Link inmate id number to the inmate details page
        //        string LeadID = DataBinder.Eval(e.Row.DataItem, "INMATEID").ToString();
        //        string Location = ResolveUrl("~/Inmate-Details.aspx") + "?id=" + LeadID;
        //        e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
        //        e.Row.Style["cursor"] = "pointer";
        //    }
        //}

        //private void ClearForm()
        //{
        //    txtFirstName.Text = String.Empty;
        //    txtLastName.Text = String.Empty;
        //    txtInmateID.Text = String.Empty;
        //    lblWarning.Visible = false;
        //    gvInmates.Visible = false;
        //}
    }
}
