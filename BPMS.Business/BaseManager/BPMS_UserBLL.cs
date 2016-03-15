//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using DotNet.Utilities;
using BPMS.Entity;
using BPMS.Service;
using BPMS.IBusiness;
using System.Collections;
using System.Text;
using System.Collections.Generic;
using System;
using System.Data;

namespace BPMS.Business
{
    /// <summary>
    /// 用户、帐户
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.21</date>
    /// </author>
    /// </summary>
    public class BPMS_UserBLL : BPMS_UserIBLL
    {
        private readonly BPMS_UserDAL dal = new BPMS_UserDAL();

        #region Method
        /// <summary>
        /// 获取记录总数
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <returns></returns>
        public int GetRecordCount(string KeyValue)
        {
            return dal.GetRecordCount(KeyValue);
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Insert(BPMS_User entity)
        {
            return dal.Insert(entity) >= 0 ? true : false;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Update(BPMS_User entity)
        {
            return dal.Update(entity) >= 0 ? true : false;
        }
        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public bool Delete(string KeyValue)
        {
            return dal.Delete(KeyValue) >= 0 ? true : false;
        }
        /// <summary>
        /// 批量删除数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public bool BatchDelete(string[] KeyValue)
        {
            return dal.BatchDelete(KeyValue) >= 0 ? true : false;
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BPMS_User GetEntity(string KeyValue)
        {
            return dal.GetEntity(KeyValue);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <returns></returns>
        public IList GetList()
        {
            return dal.GetListWhere(null, null);
        }
        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        public IList GetListWhere(StringBuilder where, SqlParam[] param)
        {
            return dal.GetListWhere(where, param);
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        /// <param name="Parm_Key_Value">搜索条件键值</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="orderType">排序类型</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">页大小</param>
        /// <param name="count">总条数</param>
        /// <returns></returns>
        public IList GetPageList(Hashtable Parm_Key_Value, string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder SqlWhere = new StringBuilder();
            List<SqlParam> ListParam = new List<SqlParam>();
            //显示有效、无效
            if (Parm_Key_Value["Enabled"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Enabled"].ToString()))
            {
                SqlWhere.Append(" AND U.Enabled = @Enabled");
                ListParam.Add(new SqlParam("@Enabled", Parm_Key_Value["Enabled"].ToString()));
            }
            //编号
            if (Parm_Key_Value["Code"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Code"].ToString()))
            {
                SqlWhere.Append(" AND U.Code like @Code");
                ListParam.Add(new SqlParam("@Code", '%' + Parm_Key_Value["Code"].ToString() + '%'));
            }
            //账户
            if (Parm_Key_Value["Account"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Account"].ToString()))
            {
                SqlWhere.Append(" AND U.Account like @Account");
                ListParam.Add(new SqlParam("@Account", '%' + Parm_Key_Value["Account"].ToString() + '%'));
            }
            //名称
            if (Parm_Key_Value["RealName"] != null && !string.IsNullOrEmpty(Parm_Key_Value["RealName"].ToString()))
            {
                SqlWhere.Append(" AND (U.RealName like @RealName");
                SqlWhere.Append(" OR U.Spell like @Spell)");
                ListParam.Add(new SqlParam("@RealName", '%' + Parm_Key_Value["RealName"].ToString() + '%'));
                ListParam.Add(new SqlParam("@Spell", '%' + Parm_Key_Value["RealName"].ToString() + '%'));
            }
            //手机
            if (Parm_Key_Value["Mobile"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Mobile"].ToString()))
            {
                SqlWhere.Append(" AND U.Mobile like @Mobile");
                ListParam.Add(new SqlParam("@Mobile", '%' + Parm_Key_Value["Mobile"].ToString() + '%'));
            }
            //部门
            if (Parm_Key_Value["DepartmentId"] != null && !string.IsNullOrEmpty(Parm_Key_Value["DepartmentId"].ToString()))
            {
                SqlWhere.Append(" AND ORG.FullName like @DepartmentId");
                ListParam.Add(new SqlParam("@DepartmentId", '%' + Parm_Key_Value["DepartmentId"].ToString() + '%'));
            }
            return dal.GetPageListWhere(SqlWhere, ListParam.ToArray(), orderField, orderType, pageIndex, pageSize, ref  count);
        }
        #endregion

        /// <summary>
        /// 登陆验证
        /// </summary>
        /// <param name="Account">账户</param>
        /// <param name="Password">密码</param>
        /// <param name="msg">消息</param>
        /// <returns></returns>
        public BPMS_User UserLogin(string Account, string Password, out string msg)
        {
            BPMS_User entity = dal.GetEntityByAccount(Account);
            if (entity.Account != "")
            {
                string dbPassword = Md5Helper.MD5(DESEncrypt.Encrypt(Password, entity.Secretkey), 32);
                if (dbPassword == entity.Password)
                {
                    DateTime PreviousVisit = CommonHelper.GetDateTime(entity.LastVisit);
                    DateTime LastVisit = DateTime.Now;
                    int LogOnCount = CommonHelper.GetInt(entity.LogOnCount) + 1;
                    entity.PreviousVisit = PreviousVisit;
                    entity.LastVisit = LastVisit;
                    entity.LogOnCount = LogOnCount;
                    dal.UpdateNotLog(entity);
                    msg = "succeed";
                    return entity;
                }
                else
                {
                    msg = "error";
                    return entity;
                }
            }
            msg = "-1";
            return null;
        }
        /// <summary>
        /// 根据机构查询用户列表
        /// </summary>
        /// <param name="Category">分类</param>
        /// <param name="OrganizationId">机构主键</param>
        /// <returns></returns>
        public IList GetDataTableByOrganizationId(string Category, string OrganizationId)
        {
            return dal.GetDataTableByOrganizationId(Category, OrganizationId);
        }
        /// <summary>
        /// 得到一个对象IList
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public IList GetIListById(string KeyValue)
        {
            return dal.GetIListById(KeyValue);
        }
        /// <summary>
        /// 自动补全(显示20行)
        /// </summary>
        /// <param name="Search">条件:编号，名称</param>
        /// <returns></returns>
        public IList autocomplete(string Search)
        {
            StringBuilder strSql = new StringBuilder();
            if (!string.IsNullOrEmpty(Search))
            {
                strSql.Append(" AND (RealName like @RealName OR Spell like @Spell");
                strSql.Append(" OR Code like @Code)");
                SqlParam[] para = {
                                        new SqlParam("@RealName", '%' +Search.Trim() + '%'),
                                        new SqlParam("@Spell", '%' +Search.Trim() + '%'),
                                        new SqlParam("@Code", '%' + Search.Trim() + '%')};
                return dal.autocomplete(strSql, para);
            }
            else
            {
                return dal.autocomplete(strSql, null);
            }
        }
    }
}