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
    public partial class ME_Case_Search : System.Web.UI.Page
    {
        // *** Connection String *** //
        string connectionString = ConfigurationManager.ConnectionStrings["MedicalExaminerConnectionString"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblNameWarning.Visible = false;
                gvName.Visible = false;

                lblCaseNumWarning.Visible = false;
                gvCaseNum.Visible = false;
            }
        }

        protected void ddlSearchType_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = ddlSearchType.SelectedIndex;

            switch (selectedIndex)
            {
                case 0:
                    searchName.Visible = false;
                    txtFirstName.Text = String.Empty;
                    txtLastName.Text = String.Empty;
                    gvName.DataSource = null;
                    gvName.DataBind();
                    searchCase.Visible = false;
                    txtCaseNum.Text = String.Empty;
                    gvCaseNum.DataSource = null;
                    gvCaseNum.DataBind();
                    break;
                case 1:
                    searchName.Visible = true;
                    searchCase.Visible = false;
                    txtCaseNum.Text = String.Empty;
                    gvCaseNum.DataSource = null;
                    gvCaseNum.DataBind();
                    break;
                case 2:
                    searchName.Visible = false;
                    txtFirstName.Text = String.Empty;
                    txtLastName.Text = String.Empty;
                    gvName.DataSource = null;
                    gvName.DataBind();
                    searchCase.Visible = true;
                    break;
            }
        }

        private void PopulateGridView_Name()
        {
            string fname = txtFirstName.Text.ToString().Trim();
            string lname = txtLastName.Text.ToString().Trim();

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmdName = new SqlCommand("spGetCaseByFirstLast", con);

            cmdName.CommandType = CommandType.StoredProcedure;
            cmdName.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = fname;
            cmdName.Parameters.Add("@LastName", SqlDbType.VarChar).Value = lname;

            DataTable dt = new DataTable();
            SqlDataAdapter adpt = new SqlDataAdapter(cmdName);
            adpt.Fill(dt);

            if (dt.Rows.Count <= 0)
            {
                lblNameWarning.Text = "No Results Found";
                lblNameWarning.Visible = true;
                gvName.Visible = false;
            }
            else
            {
                gvName.DataSource = dt;
                gvName.DataBind();
                gvName.Visible = true;
            }
        }

        private void PopulateGridView_CaseNum()
        {
            string caseNumber = txtCaseNum.Text.ToString().Trim();

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmdNum = new SqlCommand("spGetCaseByNumber", con);

            cmdNum.CommandType = CommandType.StoredProcedure;
            cmdNum.Parameters.Add("@CaseNum", SqlDbType.VarChar).Value = caseNumber;

            DataTable dt = new DataTable();
            SqlDataAdapter adpt = new SqlDataAdapter(cmdNum);
            adpt.Fill(dt);

            if (dt.Rows.Count <= 0)
            {
                lblCaseNumWarning.Text = "No Results Found";
                lblCaseNumWarning.Visible = true;
                gvCaseNum.Visible = false;
            }
            else
            {
                gvCaseNum.DataSource = dt;
                gvCaseNum.DataBind();
                gvCaseNum.Visible = true;
            }

            gvCaseNum.DataSource = dt;
            gvCaseNum.DataBind();
            gvCaseNum.Visible = true;
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
                case "btnName":
                    gvName.DataSource = null;
                    gvName.DataBind();

                    if (txtFirstName.Text.Length == 0 && txtLastName.Text.Length == 0)
                    {
                        lblNameWarning.Text = "The FIRST NAME or LAST NAME field is mandatory.";
                        lblNameWarning.Visible = true;
                        gvName.Visible = false;
                    }
                    else
                    {
                        lblNameWarning.Visible = false;
                        PopulateGridView_Name();
                        gvName.Visible = true;
                    }
                    break;

                case "btnCaseNum":
                    gvCaseNum.DataSource = null;
                    gvCaseNum.DataBind();

                    if (txtCaseNum.Text.Length == 0)
                    {
                        lblCaseNumWarning.Text = "The CASE NUMBER field is mandatory.";
                        lblCaseNumWarning.Visible = true;
                        gvCaseNum.Visible = false;
                    }
                    else
                    {
                        lblCaseNumWarning.Visible = false;
                        PopulateGridView_CaseNum();
                        gvCaseNum.Visible = true;
                    }
                    break;
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
                case "gvName":
                    gvName.PageIndex = e.NewPageIndex;
                    PopulateGridView_Name();
                    break;
                case "gvCaseNum":
                    gvCaseNum.PageIndex = e.NewPageIndex;
                    PopulateGridView_CaseNum();
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
                // Link case number to the case details page
                string LeadID = DataBinder.Eval(e.Row.DataItem, "CaseNum").ToString();
                string Location = ResolveUrl("~/ME-Case-Details.aspx") + "?cn=" + LeadID;
                e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
                e.Row.Style["cursor"] = "pointer";
                // Case number as string instead of hyperlink
                e.Row.Cells[0].Text = LeadID;

                // Name Column
                e.Row.Cells[1].Text = string.Format("{0} {1}", DataBinder.Eval(e.Row.DataItem, "FName"), DataBinder.Eval(e.Row.DataItem, "LName"));
            }
        }
    }
}