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

namespace BPMS.Business
{
    /// <summary>
    /// 员工、职员
    /// <author>
    ///		<name>SYZhai</name>
    ///		<date>2016.03.18</date>
    /// </author>
    /// </summary>
    public class BPMS_EmployeeBLL : BPMS_EmployeeIBLL
    {
        private readonly BPMS_EmployeeDAL dal = new BPMS_EmployeeDAL();

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
        public bool Insert(BPMS_Employee entity)
        {
            return dal.Insert(entity) >= 0 ? true : false;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Update(BPMS_Employee entity)
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
        public BPMS_Employee GetEntity(string KeyValue)
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
                SqlWhere.Append(" AND Enabled = @Enabled");
                ListParam.Add(new SqlParam("@Enabled", Parm_Key_Value["Enabled"].ToString()));
            }
            //机构查询
            if (!string.IsNullOrEmpty(Parm_Key_Value["Category"].ToString()))
            {
                if (Parm_Key_Value["Category"].ToString() == "公司")
                {
                    SqlWhere.Append(" AND CompanyId = @OrganizationId");
                }
                else if (Parm_Key_Value["Category"].ToString() == "部门")
                {
                    SqlWhere.Append(" AND DepartmentId = @OrganizationId");
                }
                else if (Parm_Key_Value["Category"].ToString() == "工作组")
                {
                    SqlWhere.Append(" AND WorkgroupId = @OrganizationId");
                }
                ListParam.Add(new SqlParam("@OrganizationId", Parm_Key_Value["OrganizationId"].ToString()));
            }
            //工号
            if (Parm_Key_Value["Code"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Code"].ToString()))
            {
                SqlWhere.Append(" AND Code like @Code");
                ListParam.Add(new SqlParam("@Code", '%' + Parm_Key_Value["Code"].ToString() + '%'));
            }
            //名称
            if (Parm_Key_Value["RealName"] != null && !string.IsNullOrEmpty(Parm_Key_Value["RealName"].ToString()))
            {
                SqlWhere.Append(" AND (RealName like @RealName");
                SqlWhere.Append(" OR Spell like @Spell)");
                ListParam.Add(new SqlParam("@RealName", '%' + Parm_Key_Value["RealName"].ToString() + '%'));
                ListParam.Add(new SqlParam("@Spell", '%' + Parm_Key_Value["RealName"].ToString() + '%'));
            }
            //手机
            if (Parm_Key_Value["Mobile"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Mobile"].ToString()))
            {
                SqlWhere.Append(" AND Mobile like @Mobile");
                ListParam.Add(new SqlParam("@Mobile", '%' + Parm_Key_Value["Mobile"].ToString() + '%'));
            }
            return dal.GetPageListWhere(SqlWhere, ListParam.ToArray(), orderField, orderType, pageIndex, pageSize, ref  count);
        }
        #endregion

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