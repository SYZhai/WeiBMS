using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using System.Data;
using System.Text.RegularExpressions;

namespace QY.API
{
    public class myCommFun
    {
        public DataTable postFun(string _apiUrl,string postData) //post请求方式
        {
            string apiUrl = _apiUrl;
            HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create(apiUrl);
            UTF8Encoding encoding = new UTF8Encoding();
            byte[] postdata = encoding.GetBytes(postData);
            myRequest.Method = "POST";
            myRequest.ContentLength = postdata.Length;
            Stream Stream = myRequest.GetRequestStream();
            Stream.Write(postdata, 0, postdata.Length);
            Stream.Close();
            HttpWebResponse myResponse = (HttpWebResponse)myRequest.GetResponse();
            StreamReader reader = new StreamReader(myResponse.GetResponseStream(), Encoding.UTF8);
            string result = reader.ReadToEnd();//得到json结果
            DataTable resultDt = TODT(result);
            return resultDt;
        }
        /// <summary>
        ///  //更新access_token值
        /// </summary>
        /// <param name="_id"></param>
        /// <param name="AppId"></param>
        /// <param name="AppSecret"></param>
        private void UpdateAccess_Token(string AppId, string AppSecret)
        {
            try
            {
               
                string newToken = "";

                try
                {
                    var result = Senparc.Weixin.MP.CommonAPIs.CommonApi.GetToken(AppId, AppSecret);
                    newToken = result.access_token;

                }
                catch (Exception ex)
                {
                    

                }
                finally
                {
                    //更新到数据库里
                   
                }
            }
            catch (Exception ex)
            {

            }


        }
        public static DataTable TODT(string strJson) ///将json解析成datatable
        {
            DataTable tb = null;
            //获取数据  
            Regex rg = new Regex(@"(?<={)[^}]+(?=})");
            MatchCollection mc = rg.Matches(strJson);
            for (int i = 0; i < mc.Count; i++)
            {
                string strRow = mc[i].Value;
                string[] strRows = strRow.Split(',');

                //创建表  
                if (tb == null)
                {
                    tb = new DataTable();
                    foreach (string str in strRows)
                    {
                        DataColumn dc = new DataColumn();
                        string[] strCell = str.Split(':');
                        dc.ColumnName = strCell[0].ToString();
                        tb.Columns.Add(dc);
                    }
                    tb.AcceptChanges();
                }

                //增加内容  
                DataRow dr = tb.NewRow();
                for (int r = 0; r < strRows.Length; r++)
                {
                    string s = strRows[r].Split(':')[1].Trim();
                    dr[r] = strRows[r].Split(':')[1].Trim().Replace("，", ",").Replace("：", ":").Replace("/“", "").Replace("\"", "");
                }
                tb.Rows.Add(dr);
                tb.AcceptChanges();
            }

            return tb;
        }
    }
}
