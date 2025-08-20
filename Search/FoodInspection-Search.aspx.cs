using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace Search
{
    public partial class FoodInspection_Search : System.Web.UI.Page
    {
        // *** Connection String *** //
        string connectionString = ConfigurationManager.ConnectionStrings["EnvironmentalHealthConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateDdl();

                lblEstNameWarning.Visible = false;
                gvEstName.Visible = false;

                lblPermitNumWarning.Visible = false;
                gvPermitNum.Visible = false;

                lblRatingClassWarning.Visible = false;
                gvRatingClass.Visible = false;

                lblCityTownWarning.Visible = false;
                gvCityTown.Visible = false;
            }
        }

        protected void ddlSearchType_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = ddlSearchType.SelectedIndex;

            switch (selectedIndex)
            {
                case 0:
                    searchName.Visible = false;
                    searchPermitNum.Visible = false;
                    searchRating.Visible = false;
                    searchCity.Visible = false;
                    break;
                case 1:
                    searchName.Visible = true;
                    searchPermitNum.Visible = false;
                    searchRating.Visible = false;
                    searchCity.Visible = false;
                    break;
                case 2:
                    searchPermitNum.Visible = true;
                    searchName.Visible = false;
                    searchRating.Visible = false;
                    searchCity.Visible = false;
                    break;
                case 3:
                    searchRating.Visible = true;
                    searchName.Visible = false;
                    searchPermitNum.Visible = false;
                    searchCity.Visible = false;
                    break;
                case 4:
                    searchCity.Visible = true;
                    searchName.Visible = false;
                    searchPermitNum.Visible = false;
                    searchRating.Visible = false;
                    break;
            }
        }

        ///<Summary>
        /// Button click event for each search
        ///</Summary>
        protected void btn_Click(object sender, EventArgs e)
        {
            // Get ID name of button
            WebControl wc = sender as WebControl;
            string btn = wc.ID.ToString();

            switch (btn)
            {
                case "btnEstName":
                    gvEstName.DataSource = null;
                    gvEstName.DataBind();

                    if (txtEstName.Text.Length == 0)
                    {
                        lblEstNameWarning.Text = "The ESTABLISHMENT NAME field is mandatory.";
                        lblEstNameWarning.Visible = true;
                        gvEstName.Visible = false;
                    }
                    else if (txtEstName.Text.Length < 2)
                    {
                        lblEstNameWarning.Text = "A minimum of 2 or more letters are needed for this search";
                        lblEstNameWarning.Visible = true;
                        gvEstName.Visible = false;
                    }
                    else
                    {
                        lblEstNameWarning.Visible = false;
                        PopulateGridView_EstName();
                        gvEstName.Visible = true;
                    }
                    ClearPermitNum();
                    ClearRatingClass();
                    ClearCityTown();
                    break;

                case "btnPermitNum":
                    gvPermitNum.DataSource = null;
                    gvPermitNum.DataBind();

                    if (txtPermitNum.Text.Length == 0)
                    {
                        lblPermitNumWarning.Text = "The PERMIT NUMBER field is mandatory.";
                        lblPermitNumWarning.Visible = true;
                        gvPermitNum.Visible = false;
                    }
                    else
                    {
                        lblPermitNumWarning.Visible = false;
                        PopulateGridView_PermitNum();
                        gvPermitNum.Visible = true;
                    }
                    ClearEstName();
                    ClearRatingClass();
                    ClearCityTown();
                    break;

                case "btnRatingClass":
                    gvRatingClass.DataSource = null;
                    gvRatingClass.DataBind();
                    lblRatingClassWarning.Visible = false;
                    PopulateGridView_RatingClass();
                    gvRatingClass.Visible = true;
                    ClearEstName();
                    ClearPermitNum();
                    ClearCityTown();
                    break;

                case "btnCityTown":
                    gvCityTown.DataSource = null;
                    gvCityTown.DataBind();
                    lblCityTownWarning.Visible = false;
                    PopulateGridView_CityTown();
                    gvCityTown.Visible = true;
                    ClearEstName();
                    ClearPermitNum();
                    ClearRatingClass();
                    break;
            }
        }

        private void PopulateGridView_EstName()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spEHInsp_EstByNameNew", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = "%" + txtEstName.Text.ToString().Trim() + "%";
                cmd.Parameters.Add("@Year", SqlDbType.VarChar).Value = ddlEstNameYear.SelectedValue.ToString();
                cmd.Parameters.Add("@SST", SqlDbType.VarChar).Value = "%";

                DataTable dt = new DataTable();
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                adpt.Fill(dt);

                if (dt.Rows.Count <= 0)
                {
                    lblEstNameWarning.Text = "No Results Found";
                    lblEstNameWarning.Visible = true;
                }
                else
                {
                    gvEstName.DataSource = dt;
                    gvEstName.DataBind();
                }
            }
        }

        private void PopulateGridView_PermitNum()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spEHInsp_EstByPermitNew", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Permit", SqlDbType.VarChar).Value = txtPermitNum.Text.ToString().Trim();
                cmd.Parameters.Add("@Year", SqlDbType.VarChar).Value = ddlPermitNumYear.SelectedValue.ToString();
                cmd.Parameters.Add("@SST", SqlDbType.VarChar).Value = "%";


                cmd.CommandTimeout = 0;
                DataTable dt = new DataTable();
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                adpt.Fill(dt);

                if (dt.Rows.Count <= 0)
                {
                    lblPermitNumWarning.Text = "No Results Found";
                    lblPermitNumWarning.Visible = true;
                }
                else
                {
                    gvPermitNum.DataSource = dt;
                    gvPermitNum.DataBind();
                }
            }
        }

        private void PopulateGridView_RatingClass()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spEHInsp_EstByRatingNew", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Rating", SqlDbType.VarChar).Value = ddlRatingClass.SelectedValue.ToString();
                cmd.Parameters.Add("@Year", SqlDbType.VarChar).Value = ddlRatingClassYear.SelectedValue.ToString();
                cmd.Parameters.Add("@SST", SqlDbType.VarChar).Value = "%";

                DataTable dt = new DataTable();
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                adpt.Fill(dt);

                if (dt.Rows.Count <= 0)
                {
                    lblRatingClassWarning.Text = "No Results Found";
                    lblRatingClassWarning.Visible = true;
                }
                else
                {
                    gvRatingClass.DataSource = dt;
                    gvRatingClass.DataBind();
                }
            }
        }

        private void PopulateGridView_CityTown()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spEHInsp_EstByCityWithMonthNew", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@City", SqlDbType.VarChar).Value = ddlCityTown.SelectedValue.ToString();
                cmd.Parameters.Add("@Year", SqlDbType.VarChar).Value = ddlCityTownYear.SelectedValue.ToString();
                cmd.Parameters.Add("@Month", SqlDbType.VarChar).Value = ddlCityTownMonth.SelectedValue;
                cmd.Parameters.Add("@SST", SqlDbType.VarChar).Value = "%";

                DataTable dt = new DataTable();
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                adpt.Fill(dt);

                if (dt.Rows.Count <= 0)
                {
                    lblCityTownWarning.Text = "No Results Found";
                    lblCityTownWarning.Visible = true;
                }
                else
                {
                    gvCityTown.DataSource = dt;
                    gvCityTown.DataBind();
                }
            }
        }

        ///<Summary>
        /// Add pager to each gridview
        ///</Summary>
        protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            WebControl wc = sender as WebControl;
            string gv = wc.ID.ToString();

            switch (gv)
            {
                case "gvEstName":
                    gvEstName.PageIndex = e.NewPageIndex;
                    PopulateGridView_EstName();
                    break;
                case "gvPermitNum":
                    gvPermitNum.PageIndex = e.NewPageIndex;
                    PopulateGridView_PermitNum();
                    break;
                case "gvRatingClass":
                    gvRatingClass.PageIndex = e.NewPageIndex;
                    PopulateGridView_RatingClass();
                    break;
                case "gvCityTown":
                    gvCityTown.PageIndex = e.NewPageIndex;
                    PopulateGridView_CityTown();
                    break;
            }
        }

        ///<Summary>
        /// Format binded data in row
        ///</Summary>
        protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Link account number to the inspection details page
                string LeadID = DataBinder.Eval(e.Row.DataItem, "activityid").ToString();
                string Location = ResolveUrl("~/FoodInspection-Details.aspx") + "?id=" + LeadID;
                e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
                e.Row.Style["cursor"] = "pointer";
            }
        }

        private void PopulateDdl()
        {
            // Create Years drop down list from database table
            DataSet dsYears = null;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT DISTINCT YEAR(InspDate) AS YEAR FROM [EnvHealth].[dbo].[NewInspData] ORDER BY YEAR DESC", con);

                dsYears = new DataSet();

                adapter.Fill(dsYears);
            }

            ddlEstNameYear.DataSource = dsYears;
            ddlEstNameYear.DataTextField = "YEAR";
            ddlEstNameYear.DataBind();

            ddlPermitNumYear.DataSource = dsYears;
            ddlPermitNumYear.DataTextField = "YEAR";
            ddlPermitNumYear.DataBind();

            ddlRatingClassYear.DataSource = dsYears;
            ddlRatingClassYear.DataTextField = "YEAR";
            ddlRatingClassYear.DataBind();

            ddlCityTownYear.DataSource = dsYears;
            ddlCityTownYear.DataTextField = "YEAR";
            ddlCityTownYear.DataBind();

            // Create City/Town drop down list from database table
            string query = "SELECT DISTINCT PropertyAddressCity FROM [EnvHealth].[dbo].[NewInspData] ORDER BY PropertyAddressCity";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (!reader.IsDBNull(reader.GetOrdinal("PropertyAddressCity")))
                    {
                        string cityTown = reader["PropertyAddressCity"].ToString().ToUpper();
                        ddlCityTown.Items.Add(new ListItem(cityTown, cityTown));
                    }
                }
            }
        }

        private void ClearEstName()
        {
            txtEstName.Text = String.Empty;
            ddlEstNameYear.ClearSelection();
            lblEstNameWarning.Visible = false;
            gvEstName.Visible = false;
        }

        private void ClearPermitNum()
        {
            txtPermitNum.Text = String.Empty;
            ddlPermitNumYear.ClearSelection();
            lblPermitNumWarning.Visible = false;
            gvPermitNum.Visible = false;
        }

        private void ClearRatingClass()
        {
            ddlRatingClass.ClearSelection();
            ddlRatingClassYear.ClearSelection();
            lblRatingClassWarning.Visible = false;
            gvRatingClass.Visible = false;
        }

        private void ClearCityTown()
        {
            ddlCityTown.ClearSelection();
            ddlCityTownYear.ClearSelection(); 
            lblCityTownWarning.Visible = false;
            gvCityTown.Visible = false;
        }
    }
}
