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
        /// <summary>
        /// 创建人员
        /// </summary>
        /// <param name="_userId">成员UserID。对应管理端的帐号，企业内必须唯一。长度为1~64个字节</param>
        /// <param name="_name">成员名称。长度为1~64个字节</param>
        /// <param name="_departmnet">成员所属部门id列表 [1, 2],</param>
        /// <param name="_position">职位信息。长度为0~64个字节</param>
        /// <param name="_mobile">手机号码。企业内必须唯一，mobile/weixinid/email三者不能同时为空</param>
        /// <param name="_gender">性别。1表示男性，2表示女性</param>
        /// <param name="_email">邮箱。长度为0~64个字节。企业内必须唯一</param>
        /// <param name="_weixinid">微信号。企业内必须唯一。（注意：是微信号，不是微信的名字）</param>
        /// <param name="_avatar_mediaid">成员头像的mediaid，通过多媒体接口上传图片获得的mediaid</param>
        /// <param name="_extattr">扩展属性。扩展属性需要在WEB管理端创建后才生效，否则忽略未知属性的赋值</param>
        /// <returns></returns>
        public static bool CreateMember(string _userId,string _name,int[] _departmnet,string _position,string _mobile,string _gender,string _email,string _weixinid,string _avatar_mediaid,Extattr _extattr)
        {
            AccessTokenResult access_token_result = new AccessTokenResult();
            QYConfigInfo config = GetQYConfig();
            access_token_result = CommonApi.GetToken(config.QYCorpId, config.QYSecret);
            //调用接口
            var result = MailListApi.CreateMember(access_token_result.access_token, _userId, _name, _departmnet, _position, _mobile, _email, _weixinid, _avatar_mediaid, _extattr);
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
        /// 更新人员
        /// </summary>
        /// <param name="_userId">成员UserID。对应管理端的帐号，企业内必须唯一。长度为1~64个字节</param>
        /// <param name="_name">成员名称。长度为1~64个字节</param>
        /// <param name="_departmnet">成员所属部门id列表 [1, 2],</param>
        /// <param name="_position">职位信息。长度为0~64个字节</param>
        /// <param name="_mobile">手机号码。企业内必须唯一，mobile/weixinid/email三者不能同时为空</param>
        /// <param name="_gender">性别。1表示男性，2表示女性</param>
        /// <param name="_email">邮箱。长度为0~64个字节。企业内必须唯一</param>
        /// <param name="_weixinid">微信号。企业内必须唯一。（注意：是微信号，不是微信的名字）</param>
        /// <param name="_enable">启用/禁用成员。1表示启用成员，0表示禁用成员</param>
        /// <param name="_avatar_mediaid">成员头像的mediaid，通过多媒体接口上传图片获得的mediaid</param>
        /// <param name="_extattr">扩展属性。扩展属性需要在WEB管理端创建后才生效，否则忽略未知属性的赋值</param>
        /// <returns></returns>
        public static bool UpdateMember(string _userId, string _name, int[] _departmnet, string _position, string _mobile, string _gender, string _email, string _weixinid,int _enable, string _avatar_mediaid, Extattr _extattr)
        {
            AccessTokenResult access_token_result = new AccessTokenResult();
            QYConfigInfo config = GetQYConfig();
            access_token_result = CommonApi.GetToken(config.QYCorpId, config.QYSecret);
            //调用接口
            var result = MailListApi.UpdateMember(access_token_result.access_token, _userId, _name, _departmnet, _position, _mobile, _email, _weixinid,_enable, _avatar_mediaid, _extattr);
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
        /// 删除人员
        /// </summary>
        /// <param name="_userId"></param>
        /// <returns></returns>
        public static bool DeleteMember(string _userId)
        {
            AccessTokenResult access_token_result = new AccessTokenResult();
            QYConfigInfo config = GetQYConfig();
            access_token_result = CommonApi.GetToken(config.QYCorpId, config.QYSecret);
            //调用接口
            var result = MailListApi.DeleteMember(access_token_result.access_token, _userId);
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
        /// 批量删除成员
        /// </summary>
        /// <param name="_userId"></param>
        /// <returns></returns>
        public static bool BatchDeleteMember(string[] _userIdList)
        {
            AccessTokenResult access_token_result = new AccessTokenResult();
            QYConfigInfo config = GetQYConfig();
            access_token_result = CommonApi.GetToken(config.QYCorpId, config.QYSecret);
            //调用接口
            var result = MailListApi.BatchDeleteMember(access_token_result.access_token, _userIdList);
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
        /// 获取成员
        /// </summary>
        /// <param name="_userId"></param>
        /// <returns></returns>
        public static GetMemberResult GetMember(int _userId)
        {
            AccessTokenResult access_token_result = new AccessTokenResult();
            QYConfigInfo config = GetQYConfig();
            access_token_result = CommonApi.GetToken(config.QYCorpId, config.QYSecret);
            //调用接口
            var result = MailListApi.GetMember(access_token_result.access_token, _userId.ToString());
            if (result.errmsg == "ok")
            {
                return result;
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 获取部门成员
        /// </summary>
        /// <param name="departmentId"></param>
        /// <param name="fetchChild">1/0：是否递归获取子部门下面的成员</param>
        /// <param name="status">0获取全部成员，1获取已关注成员列表，2获取禁用成员列表，4获取未关注成员列表。status可叠加，未填写则默认为4</param>
        /// <returns></returns>
        public static GetDepartmentMemberResult GetDepartmentMember(int departmentId, int fetchChild, int status)
        {
            AccessTokenResult access_token_result = new AccessTokenResult();
            QYConfigInfo config = GetQYConfig();
            access_token_result = CommonApi.GetToken(config.QYCorpId, config.QYSecret);
            //调用接口
            var result = MailListApi.GetDepartmentMember(access_token_result.access_token, departmentId, fetchChild, status);
            if (result.errmsg == "ok")
            {
                return result;
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 获取部门成员(详情)
        /// </summary>
        /// <param name="departmentId">获取的部门id</param>
        /// <param name="fetchChild">1/0：是否递归获取子部门下面的成员</param>
        /// <param name="status">0获取全部成员，1获取已关注成员列表，2获取禁用成员列表，4获取未关注成员列表。status可叠加，未填写则默认为4</param>
        /// <returns></returns>
        public static GetDepartmentMemberInfoResult GetDepartmentMemberInfo(int departmentId, int fetchChild, int status)
        {
            AccessTokenResult access_token_result = new AccessTokenResult();
            QYConfigInfo config = GetQYConfig();
            access_token_result = CommonApi.GetToken(config.QYCorpId, config.QYSecret);
            //调用接口
            var result = MailListApi.GetDepartmentMemberInfo(access_token_result.access_token, departmentId, fetchChild, status);
            if (result.errmsg == "ok")
            {
                return result;
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 邀请成员关注
        /// 认证号优先使用微信推送邀请关注，如果没有weixinid字段则依次对手机号，邮箱绑定的微信进行推送，全部没有匹配则通过邮件邀请关注。 邮箱字段无效则邀请失败。 非认证号只通过邮件邀请关注。邮箱字段无效则邀请失败。 已关注以及被禁用用户不允许发起邀请关注请求。
        /// 测试发现同一个邮箱只发送一封邀请关注邮件，第二次再对此邮箱发送微信会提示系统错误
        /// </summary>
        /// <param name="accessToken">调用接口凭证</param>
        /// <param name="userId">用户的userid</param>
        /// <param name="inviteTips">推送到微信上的提示语（只有认证号可以使用）。当使用微信推送时，该字段默认为“请关注XXX企业号”，邮件邀请时，该字段无效。</param>
        /// <param name="timeOut">代理请求超时时间（毫秒）</param>
        /// <returns></returns>
        public static InviteMemberResult InviteMember(string accessToken, string userId)
        {
            AccessTokenResult access_token_result = new AccessTokenResult();
            QYConfigInfo config = GetQYConfig();
            access_token_result = CommonApi.GetToken(config.QYCorpId, config.QYSecret);
            //调用接口
            var result = MailListApi.InviteMember(access_token_result.access_token, userId);
            if (result.errmsg == "ok")
            {
                return result;
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
