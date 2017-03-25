using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace QueryTicketSystem.Classes
{
    public class BusinessObjects
    {
        SqlConnection con;
        
        SqlDataAdapter da;
        public string strconstring = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        //public BusinessObject() {
        //    string strconstring = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        //    using (con = new SqlConnection(strconstring))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("sp_GetInstructors", con))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            if (con.State == ConnectionState.Closed)
        //            {
        //                con.Open();
        //            }
        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            ds = new DataSet();
        //            da.Fill(ds, "InstTbl");
        //            //ds.Tables["InstTbl"].Constraints.Add("User ID-PK",ds.Tables["InstTbl"].Columns["User ID"],true);

        //        }
        //    }
        //}
        public DataSet GetDdl()
        {
            DataSet ds;
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_BindDropDown", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                }
            }
                return ds;
        }
        public DataSet GetInst()
        {
            DataSet ds;
            
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetInstructors", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                   
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds, "InstTbl");
                }
            }
          
            return ds;
        }

     
        public bool CreateInst(string strInstID, string strPwd, string strInstName, string strRole, string strDept, string strPhoneNum, string strEmail, string strSex)
        {
            int retVal;
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_CreateUser", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = strInstID ?? "";
                    cmd.Parameters.Add("@Pwd", SqlDbType.NVarChar).Value = strPwd ?? "";
                    cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = strInstName ?? "";
                    cmd.Parameters.Add("@RoleType", SqlDbType.NVarChar).Value = strRole ?? "";
                    cmd.Parameters.Add("@DeptID", SqlDbType.NVarChar).Value = strDept ?? "";
                    cmd.Parameters.Add("@PhNum", SqlDbType.NVarChar).Value = strPhoneNum ?? "";
                    cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = strEmail ?? "";
                    cmd.Parameters.Add("@Sex", SqlDbType.NVarChar).Value = strSex ?? "";

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    retVal = Convert.ToInt16(cmd.ExecuteScalar());
                }
            }
            if (retVal > -1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool UpdateInst(string strInstID, string strInstName, string strDept, string strPhoneNum, string strEmail)
        {
            int retVal;
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_UpdateUser", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = strInstID ?? "";
                    cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = strInstName ?? "";
                    cmd.Parameters.Add("@DeptID", SqlDbType.NVarChar).Value = strDept ?? "";
                    cmd.Parameters.Add("@PhNum", SqlDbType.NVarChar).Value = strPhoneNum ?? "";
                    cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = strEmail ?? "";

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                   retVal= Convert.ToInt16(cmd.ExecuteNonQuery());
                }
            }
            if (retVal > -1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool DeleteInst(string strInstID)
        {
            int retVal;
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_DeleteUser", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = strInstID ?? "";
                   
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    retVal = Convert.ToInt16(cmd.ExecuteNonQuery());
                }
            }
            if (retVal > -1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public int CheckDupUser(string strUserID)
        {
            int retVal;
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_ChkDupUser", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = strUserID;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    retVal = Convert.ToInt16(cmd.ExecuteScalar());
                }
            }
            return retVal;
        }
        public DataSet GetMyTics_Student(string strUserID)
        {
            DataSet ds;

            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetMyTics_Student", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = strUserID;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds, "MyTicsTbl");
                }
            }

            return ds;
        }

        public DataSet GetInstByDept(string strDept)
        {
            DataSet ds;

            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetInstByDept", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Dept", SqlDbType.NVarChar).Value = strDept;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds, "InstByDeptTbl");
                }
            }

            return ds;
        }

        public bool PostTicket(string strTicID,string strTicTitle,string strStudID,string strStatus,string strDesc,string strInstID)
        {
            int retVal;
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_PostTicket", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Ticket_ID", SqlDbType.NVarChar).Value = strTicID ?? "";
                    cmd.Parameters.Add("@Ticket_Title", SqlDbType.NVarChar).Value = strTicTitle ?? "";
                    cmd.Parameters.Add("@Student_ID", SqlDbType.NVarChar).Value = strStudID ?? "";
                    cmd.Parameters.Add("@strStatus", SqlDbType.NVarChar).Value = strStatus ?? "";
                    cmd.Parameters.Add("@Created_dt", SqlDbType.NVarChar).Value = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss") ?? "";
                    cmd.Parameters.Add("@Ticket_Desc", SqlDbType.NVarChar).Value = strDesc ?? "";
                    cmd.Parameters.Add("@Instructor_ID", SqlDbType.NVarChar).Value = strInstID ?? "";

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    retVal = Convert.ToInt16(cmd.ExecuteScalar());
                }
            }
            if (retVal > -1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public DataSet GetTicSummary(string strTic)
        {
            DataSet ds;

            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetTicSummary", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Ticket_ID", SqlDbType.NVarChar).Value = strTic;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds, "TicSum");
                }
            }

            return ds;
        }
        public DataSet GetStudTic_details(string strTic)
        {
            DataSet ds;

            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetStudTic_details", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Ticket_ID", SqlDbType.NVarChar).Value = strTic;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds, "studTic");
                }
            }

            return ds;
        }

        public bool AddTicResponses(string strTicID, string strTicTitle, string strUserID,string strDesc)
        {
            int retVal;
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AddTicResponses", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Ticket_ID", SqlDbType.NVarChar).Value = strTicID ?? "";
                    cmd.Parameters.Add("@Ticket_Title", SqlDbType.NVarChar).Value = strTicTitle ?? "";
                    cmd.Parameters.Add("@User_ID", SqlDbType.NVarChar).Value = strUserID ?? "";
                    cmd.Parameters.Add("@Created_dt", SqlDbType.NVarChar).Value = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss") ?? "";
                    cmd.Parameters.Add("@Ticket_Desc", SqlDbType.NVarChar).Value = strDesc ?? "";
                   
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    retVal = Convert.ToInt16(cmd.ExecuteScalar());
                }
            }
            if (retVal > -1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public DataSet GetTics_Instructor(string strUserID)
        {
            DataSet ds;

            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetTics_Instructor", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = strUserID;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds, "TicsTbl");
                }
            }

            return ds;
        }
        public DataSet GetAllTickets(string strRole,string strCurUser)
        {
            DataSet ds;

            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetAllTickets", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Role", SqlDbType.NVarChar).Value = strRole;
                    cmd.Parameters.Add("@CurUser", SqlDbType.NVarChar).Value = strCurUser;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds, "AllTicsTbl");
                }
            }

            return ds;
        }
        public void DeleteComments(int intDescID)
        {
            //int retVal;
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_DeleteComments", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Desc_ID", SqlDbType.Int).Value = intDescID;

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    cmd.ExecuteNonQuery();
                    //retVal = Convert.ToInt16(cmd.ExecuteNonQuery());
                }
            }
            //if (retVal > -1)
            //{
            //    return true;
            //}
            //else
            //{
            //    return false;
            //}
        }
        public DataTable GetReportData(string strTicID, string strDept,string strStatus)
        {
            DataSet ds;
            DataTable RetDT = new DataTable();
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetReportData", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@TicID", SqlDbType.NVarChar).Value = strTicID;
                    cmd.Parameters.Add("@Dept", SqlDbType.NVarChar).Value = strDept;
                    cmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = strStatus;

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds, "RptTicsTbl");
                    
                    foreach (DataTable dt in ds.Tables)
                    {
                        if (dt.Rows.Count > 0)
                        {
                            RetDT = dt;
                        }
                    }
                }
            }

            return  RetDT;
        }
        public string GetEmailByUser(string strUserID)
        {
            string Emailid = "";
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetEmialByUser", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = strUserID;

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    Emailid=Convert.ToString(cmd.ExecuteScalar());
                    //retVal = Convert.ToInt16(cmd.ExecuteNonQuery());
                }
            }
            return Emailid;
        }
        public string GetUserPwd(string strUserID)
        {
            string strPwd = "";
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetUserPwd", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = strUserID;

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    strPwd = Convert.ToString(cmd.ExecuteScalar());
                    //retVal = Convert.ToInt16(cmd.ExecuteNonQuery());
                }
            }
            return strPwd;
        }
        public string GetEmailByTicID(string strTicID)
        {
            string Emailid = "siva@gmail.com";
            //using (con = new SqlConnection(strconstring))
            //{
            //    using (SqlCommand cmd = new SqlCommand("sp_GetEmailByTickID", con))
            //    {
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        cmd.Parameters.Add("@TicID", SqlDbType.NVarChar).Value = strTicID;

            //        if (con.State == ConnectionState.Closed)
            //        {
            //            con.Open();
            //        }
            //        Emailid = Convert.ToString(cmd.ExecuteScalar());
            //        //retVal = Convert.ToInt16(cmd.ExecuteNonQuery());
            //    }
            //}
            return Emailid;
        }
        public string ForgotPwd(string strUserID, string strEmailID)
        {
            string strPwd = "";
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_ForgotPwd", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = strUserID;
                    cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = strEmailID;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    strPwd = Convert.ToString(cmd.ExecuteScalar());
                   
                }
            }
            return strPwd;
        }
        public int ChkEmailID(string strEmailID)
        {
            int retVal;
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_ChkEmialID", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = strEmailID;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    retVal = Convert.ToInt16(cmd.ExecuteScalar());
                }
            }
            return retVal;
        }
        public bool UpdateStatus(string strTicID, string strStatus, string strflag)
        {
            int retVal;
            using (con = new SqlConnection(strconstring))
            {
                using (SqlCommand cmd = new SqlCommand("sp_UpdateStatus", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Ticket_ID", SqlDbType.NVarChar).Value = strTicID ?? "";
                    cmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = strStatus ?? "";
                    cmd.Parameters.Add("@Flag", SqlDbType.NVarChar).Value = strflag ?? "";

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    retVal = Convert.ToInt16(cmd.ExecuteNonQuery());
                }
            }
            if (retVal > -1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}