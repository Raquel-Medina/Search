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
    public partial class ME_Case_Details : System.Web.UI.Page
    {
        // *** Connection String *** //]
        string connectionString = "Data Source=10.50.1.165; Initial Catalog=MedicalExaminer; User ID=toystory; Password=pixar";
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the case information
            GetCaseInfo();
        }

        private void GetCaseInfo()
        {
            string caseNum = Request.QueryString["cn"];
            string queryDetails = "SELECT * FROM CaseSearch WHERE CaseNum LIKE '" + caseNum + "' ORDER BY [CaseNum] DESC";
            
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmdDetails = new SqlCommand(queryDetails, con);
            SqlDataAdapter adpt = new SqlDataAdapter(cmdDetails);

            DataSet ds = new DataSet();
            adpt.Fill(ds);
            object[] rowVals = new object[3];

            foreach (DataRow dr in ds.Tables[0].Rows) 
            {
                string other = dr["Other"].ToString();

                lblCaseNum.Text = dr["CaseNum"].ToString();
                lblName.Text = dr["FName"].ToString() + " " + dr["LName"].ToString();
                lblRace.Text = dr["Race"].ToString();
                lblEthnicity.Text = dr["Ethnicity"].ToString();
                lblDod.Text = dr["DOD"].ToString();
                lblAge.Text = dr["Age"].ToString();
                lblCod.Text = dr["COD"].ToString();

                if (other != "")
                {
                    lblOther.Text = other;
                }
                else { lblOther.Text = "Not Given"; }
                
                lblMod.Text = dr["MOD"].ToString();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ME-Case-Search.aspx");
        }
    }
}