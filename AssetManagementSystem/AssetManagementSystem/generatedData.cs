using AssetManagementSystem.Credentials;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AssetManagementSystem
{
    public class generatedData
    {
        public void GeneratedData()
        {
            SqlConnection conn = new SqlConnection(
                "server=" + Credential.SERVER + "; " +
                "database=" + Credential.DATABASE + "; " +
                "uid=" + Credential.UID + "; " +
                "password=" + Credential.PASSWORD + ";");

            SqlCommand cmd;

            for (int i = 1; i <= 9; ++i)
            {
                for (int j = 1; j <= 12; ++j)
                {
                    cmd = new SqlCommand(
                     " insert into Time(ClassroomID,ClassroomDate,ClassroomTime)" +
                     "Values(@CID,@CD,@CT)", conn);
                    cmd.Parameters.Add("@CID", SqlDbType.Int, 100).Value = i;
                    cmd.Parameters.Add("@CD", SqlDbType.Date, 100).Value = DateTime.Today.AddDays(23).ToString("yyyy-MM-dd"); //23 now --> till to 22/12 now

                    if (j == 1)
                        cmd.Parameters.Add("@CT", SqlDbType.VarChar, 100).Value = "9.00am-10.00am";
                    else if (j == 2)
                        cmd.Parameters.Add("@CT", SqlDbType.VarChar, 100).Value = "10.00am-11.00am";
                    else if (j == 3)
                        cmd.Parameters.Add("@CT", SqlDbType.VarChar, 100).Value = "11.00am-12.00pm";
                    else if (j == 4)
                        cmd.Parameters.Add("@CT", SqlDbType.VarChar, 100).Value = "12.00am-1.00pm";
                    else if (j == 5)
                        cmd.Parameters.Add("@CT", SqlDbType.VarChar, 100).Value = "1.00pm-2.00pm";
                    else if (j == 6)
                        cmd.Parameters.Add("@CT", SqlDbType.VarChar, 100).Value = "2.00pm-3.00pm";
                    else if (j == 7)
                        cmd.Parameters.Add("@CT", SqlDbType.VarChar, 100).Value = "3.00pm-4.00pm";
                    else if (j == 8)
                        cmd.Parameters.Add("@CT", SqlDbType.VarChar, 100).Value = "4.00pm-5.00pm";
                    else if (j == 9)
                        cmd.Parameters.Add("@CT", SqlDbType.VarChar, 100).Value = "5.00pm-6.00pm";
                    else if (j == 10)
                        cmd.Parameters.Add("@CT", SqlDbType.VarChar, 100).Value = "6.00pm-7.00pm";
                    else if (j == 11)
                        cmd.Parameters.Add("@CT", SqlDbType.VarChar, 100).Value = "7.00pm-8.00pm";
                    else if (j == 12)
                        cmd.Parameters.Add("@CT", SqlDbType.VarChar, 100).Value = "8.00pm-9.00pm";

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();

                }
                
            }
            
            

        }
    }
}