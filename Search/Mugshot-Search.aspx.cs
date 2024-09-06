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
using System.Text;
using System.Text.RegularExpressions;
using System.IO;

namespace Search
{
    public partial class Mugshot_Search : System.Web.UI.Page
    {
        // *** Connection Strings *** //
        //string connectionString = ConfigurationManager.ConnectionStrings["AdultDetentionConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Request.Browser.IsMobileDevice)
                //{
                //    gvInmates.Columns[4].Visible = false;
                //}

                //PopulateGridView();
            }
        }

        //protected void btnClose_Click(object sender, EventArgs e)
        //{
        //    gvInmates.Visible = true;
        //}

        //private void PopulateGridView()
        //{
        //    using (SqlConnection con = new SqlConnection(connectionString))
        //    {
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("spGetMugShotInfo", con);

        //        DataTable dt = new DataTable();
        //        SqlDataAdapter adpt = new SqlDataAdapter(cmd);
        //        adpt.Fill(dt);

        //        gvInmates.DataSource = dt;
        //        gvInmates.DataBind();
        //    }
        //}

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
        //        Image img1 = (Image)e.Row.FindControl("inmateImage");
        //        img1.ImageUrl = String.Concat("http://app1.pinal.gov/Files/MugShots/", DataBinder.Eval(e.Row.DataItem, "INMATEID").ToString().ToString().Substring(7, 2), "/", DataBinder.Eval(e.Row.DataItem, "INMATEID").ToString(), ".jpg");

        //        // Link inmate id number to the inmate details page
        //        string LeadID = DataBinder.Eval(e.Row.DataItem, "INMATEID").ToString();
        //        string Location = ResolveUrl("~/Mugshot-Details.aspx") + "?id=" + LeadID;
        //        e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
        //        e.Row.Style["cursor"] = "pointer";
        //    }
        //}
    }
}
