using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using System.Data;
using System.Text.RegularExpressions;
using Senparc.Weixin.QY.AdvancedAPIs;
using Senparc.Weixin.QY.CommonAPIs;
using Senparc.Weixin.QY.Entities;
using Senparc.Weixin.QY.AdvancedAPIs.MailList;
using BPMS.Entity;
using DotNet.Kernel;

namespace QY.API
{
    public class myCommFun
    {
        /// <summary>
        /// post请求方式
        /// </summary>
        /// <param name="_apiUrl">接口链接</param>
        /// <param name="postData">数据</param>
        /// <returns></returns>
        public DataTable postFun(string _apiUrl,string postData)
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
        public static QYConfigInfo GetQYConfig()
        {
            QYConfigInfo config = new QYConfigInfo();
            config.QYName = ConfigHelper.GetValue("QYName");
            config.QYCorpId = ConfigHelper.GetValue("corpId");
            config.QYSecret = ConfigHelper.GetValue("corpSecret");
            return config;
        }
        /// <summary>
        /// 创建部门
        /// </summary>
        /// <param name="_id"></param>
        /// <param name="_name"></param>
        /// <param name="_parentid"></param>
        /// <param name="_order"></param>
        /// <param name="_access_token"></param>
        /// <returns></returns>
        public static bool CreateDepartment(int _id,string _name,int _parentid,int _order)
        {
            AccessTokenResult access_token_result = new AccessTokenResult();
            QYConfigInfo config = GetQYConfig();
            access_token_result = CommonApi.GetToken(config.QYCorpId, config.QYSecret);
            //调用接口
            var result= MailListApi.CreateDepartment(access_token_result.access_token, _name,_parentid,_order,_id);
            if (result.errmsg == "created")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 更新部门信息
        /// </summary>
        /// <param name="_id"></param>
        /// <param name="_name"></param>
        /// <param name="_parentid"></param>
        /// <param name="_order"></param>
        /// <returns></returns>
        public static bool UpdateDepartment(int _id, string _name, int _parentid, int _order)
        {
            AccessTokenResult access_token_result = new AccessTokenResult();
            QYConfigInfo config = GetQYConfig();
            access_token_result = CommonApi.GetToken(config.QYCorpId, config.QYSecret);
            //调用接口
            var result = MailListApi.UpdateDepartment(access_token_result.access_token,_id.ToString(), _name, _parentid, _order);
            if (result.errmsg == "updated")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 删除部门信息
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        public static bool DeleteDepartment(int _id)
        {
            AccessTokenResult access_token_result = new AccessTokenResult();
            QYConfigInfo config = GetQYConfig();
            access_token_result = CommonApi.GetToken(config.QYCorpId, config.QYSecret);
            //调用接口
            var result = MailListApi.DeleteDepartment(access_token_result.access_token, _id.ToString());
            if (result.errmsg == "deleted")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 获取部门列表
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        public static List<DepartmentList> GetDepartmentList(int _id)
        {
            AccessTokenResult access_token_result = new AccessTokenResult();
            QYConfigInfo config = GetQYConfig();
            access_token_result = CommonApi.GetToken(config.QYCorpId, config.QYSecret);
            //调用接口
            var result = MailListApi.GetDepartmentList(access_token_result.access_token,_id);
            if (result.errmsg == "ok")
            {
                return result.department;
            }
            else
            {
                return null;
            }
        }
        ///将json解析成datatable
        public static DataTable TODT(string strJson) 
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
