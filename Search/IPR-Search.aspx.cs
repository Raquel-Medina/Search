using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Data;
using System.Data.Entity;
using System.Net;
using System.Text;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Data.SqlClient;

namespace Search
{
    public partial class IPR_Search : System.Web.UI.Page
    {
        // *** Connection String *** //
        string connectionString = "Data Source=10.50.1.165; Initial Catalog=Assessor; User ID=toystory; Password=pixar";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearOwner();
                ClearAddress();
                ClearParcel();
                ClearTaxID();
            }
        }

        protected void ddlSearchType_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = ddlSearchType.SelectedIndex;

            switch (selectedIndex)
            {
                case 0:
                    ClearOwner();
                    ClearAddress();
                    ClearParcel();
                    ClearTaxID();
                    break;
                case 1:
                    searchName.Visible = true;
                    ClearAddress();
                    ClearParcel();
                    ClearTaxID();
                    break;
                case 2:
                    ClearOwner();
                    searchAddress.Visible = true;
                    ClearParcel();
                    ClearTaxID();
                    break;
                case 3:
                    ClearOwner();
                    ClearAddress();
                    searchParcel.Visible = true;
                    ClearTaxID();
                    break;
                case 4:
                    ClearOwner();
                    ClearAddress();
                    ClearParcel();
                    searchTaxID.Visible = true;
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
            int parsedValue;

            switch (btn)
            {
                case "btnSearchOwner":
                    gvSearchName.DataSource = null;
                    gvSearchName.DataBind();

                    if (txtOwner.Text.Length == 0)
                    {
                        lblSearchOwnerWarning.Text = "The LAST/FIRST NAME field is required.";
                        lblSearchOwnerWarning.Visible = true;
                        gvSearchName.Visible = false;
                    }
                    else if (txtOwner.Text.Length < 2)
                    {
                        lblSearchOwnerWarning.Text = "A minimum of 2 or more letters are needed for this search";
                        lblSearchOwnerWarning.Visible = true;
                        gvSearchName.Visible = false;
                    }
                    else
                    {
                        lblSearchOwnerWarning.Visible = false;

                        PopulateGridView_owner();
                        gvSearchName.Visible = true;
                    }

                    ClearAddress();
                    ClearParcel();
                    ClearTaxID();
                    break;
                        
                case "btnSearchAddress":
                    gvSearchAddress.DataSource = null;
                    gvSearchAddress.DataBind();

                    if (txtNumber.Text.Length == 0 || ddlDirection.SelectedIndex == 0 || txtStreetName.Text.Length == 0 || ddlSuffix.SelectedIndex == 0)
                    {
                        lblSearchAddressWarning.Text = "All fields are mandatory";
                        lblSearchAddressWarning.Visible = true;
                        gvSearchAddress.Visible = false;
                    }
                    else if (!int.TryParse(txtNumber.Text, out parsedValue))
                    {
                        lblSearchAddressWarning.Text = "Number must be numeric";
                        lblSearchAddressWarning.Visible = true;
                        gvSearchAddress.Visible = false;
                    }
                    else
                    {
                        lblSearchAddressWarning.Visible = false;
                        PopulateGridView_address();
                        gvSearchAddress.Visible = true;
                    }

                    ClearOwner();
                    ClearParcel();
                    ClearTaxID();
                    break;

                case "btnSearchParcel":
                    gvSearchParcel.DataSource = null;
                    gvSearchParcel.DataBind();

                    if (txtBook.Text.Length == 0 || txtMap.Text.Length == 0 || txtParcel.Text.Length == 0 || ddlSplit.SelectedIndex == 0)
                    {
                        lblSearchParcelWarning.Text = "All fields are mandatory";
                        lblSearchParcelWarning.Visible = true;
                        gvSearchParcel.Visible = false;
                    }
                    else if (!int.TryParse(txtBook.Text, out parsedValue) || !int.TryParse(txtMap.Text, out parsedValue) || !int.TryParse(txtParcel.Text, out parsedValue))
                    {
                        lblSearchParcelWarning.Text = "Book, Map and Parcel must be numeric";
                        lblSearchParcelWarning.Visible = true;
                        gvSearchParcel.Visible = false;
                    }
                    else
                    {
                        lblSearchParcelWarning.Visible = false;
                        PopulateGridView_parcel();
                        gvSearchParcel.Visible = true;
                    }

                    ClearOwner();
                    ClearAddress();
                    ClearTaxID();
                    break;

                case "btnTaxID":
                    gvSearchTaxID.DataSource = null;
                    gvSearchTaxID.DataBind();

                    if (txtTaxID.Text.Length == 0)
                    {
                        lblSearchTaxIDWarning.Text = "The TAX PAYER ID field is mandatory";
                        lblSearchTaxIDWarning.Visible = true;
                        gvSearchTaxID.Visible = false;
                    }
                    else if (txtTaxID.Text.Length < 2)
                    {
                        lblSearchTaxIDWarning.Text = "A minimum of 2 or more letters are needed for this search";
                        lblSearchTaxIDWarning.Visible = true;
                        gvSearchTaxID.Visible = false;
                    }
                    else
                    {
                        lblSearchTaxIDWarning.Visible = false;
                        PopulateGridView_TaxID();
                        gvSearchTaxID.Visible = true;
                    }

                    ClearOwner();
                    ClearAddress();
                    ClearParcel();
                    break;
            }
        }

        private void PopulateGridView_owner()
        {
            string owner = txtOwner.Text.ToString().Trim();

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("IAccountByOwner", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OwnerName", SqlDbType.VarChar).Value = owner;

            DataTable dt = new DataTable();
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            adpt.Fill(dt);

            if (dt.Rows.Count <= 0)
            {
                lblSearchOwnerWarning.Text = "No Results Found";
                lblSearchOwnerWarning.Visible = true;
            }
            else
            {
                gvSearchName.DataSource = dt;
                gvSearchName.DataBind();
            }
        }

        private void PopulateGridView_address()
        {
            string addressNbr = txtNumber.Text.ToString().Trim();
            string addressDir = ddlDirection.SelectedItem.Text.ToString();
            string addressName = txtStreetName.Text.ToString().Trim();
            string addressSuf = ddlSuffix.Text.ToString();

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("IAccountInfolistBySitus", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@sNbr", SqlDbType.VarChar).Value = addressNbr;
            cmd.Parameters.Add("@sDir", SqlDbType.VarChar).Value = addressDir;
            cmd.Parameters.Add("@sNam", SqlDbType.VarChar).Value = addressName;
            cmd.Parameters.Add("@sSuf", SqlDbType.VarChar).Value = addressSuf;

            cmd.CommandTimeout = 0;
            DataTable dt = new DataTable();
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            adpt.Fill(dt);

            if (dt.Rows.Count <= 0)
            {
                lblSearchAddressWarning.Text = "No Results Found";
                lblSearchAddressWarning.Visible = true;
            }
            else
            {
                gvSearchAddress.DataSource = dt;
                gvSearchAddress.DataBind();
            }
        }

        private void PopulateGridView_parcel()
        {
            string book = txtBook.Text.ToString().Trim();
            string map = txtMap.Text.ToString().Trim();
            string parcel = txtParcel.Text.ToString().Trim();
            string split = ddlSplit.SelectedValue.ToString();

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("IAccountInfolistByParcel", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@BookNumber", SqlDbType.VarChar).Value = book;
            cmd.Parameters.Add("@MapNumber", SqlDbType.VarChar).Value = map;
            cmd.Parameters.Add("@ParcelNumber", SqlDbType.VarChar).Value = parcel;
            cmd.Parameters.Add("@SplitNumber", SqlDbType.VarChar).Value = split;

            DataTable dt = new DataTable();
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            adpt.Fill(dt);

            if (dt.Rows.Count <= 0)
            {
                lblSearchParcelWarning.Text = "No Results Found";
                lblSearchParcelWarning.Visible = true;
            }
            else
            {
                gvSearchParcel.DataSource = dt;
                gvSearchParcel.DataBind();
            }
        }

        private void PopulateGridView_TaxID()
        {
            string sub = txtTaxID.Text.ToString().Trim();

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("IAccountInfolistByTaxPayerID", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TPayerID", SqlDbType.VarChar).Value = sub;

            DataTable dt = new DataTable();
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            adpt.Fill(dt);

            if (dt.Rows.Count <= 0)
            {
                lblSearchTaxIDWarning.Text = "No Results Found";
                lblSearchTaxIDWarning.Visible = true;
            }
            else
            {
                gvSearchTaxID.DataSource = dt;
                gvSearchTaxID.DataBind();
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
                case "gvSearchName":
                    gvSearchName.PageIndex = e.NewPageIndex;
                    PopulateGridView_owner();
                    break;
                case "gvSearchAddress":
                    gvSearchAddress.PageIndex = e.NewPageIndex;
                    PopulateGridView_address();
                    break;
                case "gvSearchParcel":
                    gvSearchParcel.PageIndex = e.NewPageIndex;
                    PopulateGridView_parcel();
                    break;
                case "gvSearchTaxID":
                    gvSearchTaxID.PageIndex = e.NewPageIndex;
                    PopulateGridView_TaxID();
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
                // Parcel number ex. 123-45-6780
                e.Row.Cells[0].Text = string.Format("{0}-{1}-{2}{3}", DataBinder.Eval(e.Row.DataItem, "Book"), DataBinder.Eval(e.Row.DataItem, "Map"), DataBinder.Eval(e.Row.DataItem, "Parcel"), DataBinder.Eval(e.Row.DataItem, "Split"));

                // Link parcel number to the parcel details page
                string LeadID = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
                string Location = ResolveUrl("~/IPR-Details.aspx") + "?id=" + LeadID;
                e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
                e.Row.Style["cursor"] = "pointer";

                // Mailing City & State Column
                e.Row.Cells[2].Text = string.Format("{0}, {1}", DataBinder.Eval(e.Row.DataItem, "City"), DataBinder.Eval(e.Row.DataItem, "State"));
            }
        }

        private void ClearOwner()
        {
            txtOwner.Text = String.Empty;
            searchName.Visible = false;
            lblSearchOwnerWarning.Visible = false;
            gvSearchName.DataSource = null;
            gvSearchName.DataBind();
            gvSearchName.Visible = false;
        }

        private void ClearAddress()
        {
            txtNumber.Text = String.Empty;
            ddlDirection.ClearSelection();
            txtStreetName.Text = String.Empty;
            ddlSuffix.ClearSelection();
            searchAddress.Visible = false;
            lblSearchAddressWarning.Visible = false;
            gvSearchAddress.DataSource = null;
            gvSearchAddress.DataBind();
            gvSearchAddress.Visible = false;
        }

        private void ClearParcel()
        {
            txtBook.Text = String.Empty;
            txtMap.Text = String.Empty;
            txtParcel.Text = String.Empty;
            ddlSplit.ClearSelection();
            searchParcel.Visible = false;
            lblSearchParcelWarning.Visible = false;
            gvSearchParcel.DataSource = null;
            gvSearchParcel.DataBind();
            gvSearchParcel.Visible = false;
        }

        private void ClearTaxID()
        {
            txtTaxID.Text = String.Empty;
            searchTaxID.Visible = false;
            lblSearchTaxIDWarning.Visible = false;
            gvSearchTaxID.DataSource = null;
            gvSearchTaxID.DataBind();
            gvSearchTaxID.Visible = false;
        }
    }
}