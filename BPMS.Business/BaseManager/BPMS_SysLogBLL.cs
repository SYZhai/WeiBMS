using BPMS.IBusiness;
using BPMS.Service;
using DotNet.Kernel;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace BPMS.Business
{
    /// <summary>
    /// 系统日志
    /// </summary>
    public class BPMS_SysLogBLL : BPMS_SysLogIBLL
    {
        private static BPMS_SysLogBLL item;
        public static BPMS_SysLogBLL Instance
        {
            get
            {
                if (item == null)
                {
                    item = new BPMS_SysLogBLL();
                }
                return item;
            }
        }
        private readonly BPMS_SysLogDAL dal = new BPMS_SysLogDAL();

        #region 系统登录日志
        /// <summary>
        /// 添加登录日志
        /// </summary>
        /// <param name="Account">账户</param>
        /// <param name="Status">登录状态</param>
        /// <param name="IPAddress">IP地址</param>
        /// <param name="IPAddressName">IP所在城市地址</param>
        public void AddSysLoginLog(string Account, string Status, string IPAddress, string IPAddressName)
        {
            dal.AddSysLoginLog(Account, Status, IPAddress, IPAddressName);
        }
        /// <summary>
        /// 统计登录日志，柱状图
        /// </summary>
        /// <returns></returns>
        public DataTable GetHighchartLoginLog()
        {
            return dal.GetHighchartLoginLog();
        }
        /// <summary>
        /// 登录日志列表(带条件)
        /// </summary>
        /// <param name="Parm_Key_Value">搜索条件键值</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="orderType">排序类型</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">页大小</param>
        /// <param name="count">总条数</param>
        /// <returns></returns>
        public IList GetLoginLogList(Hashtable Parm_Key_Value, string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder SqlWhere = new StringBuilder();
            List<SqlParam> ListParam = new List<SqlParam>();
            //账户
            if (Parm_Key_Value["Account"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Account"].ToString()))
            {
                SqlWhere.Append(" AND Account like @Account");
                ListParam.Add(new SqlParam("@Account", '%' + Parm_Key_Value["Account"].ToString() + '%'));
            }
            //日期
            if (!string.IsNullOrEmpty(Parm_Key_Value["start_Date"].ToString()) || !string.IsNullOrEmpty(Parm_Key_Value["end_Date"].ToString()))
            {
                SqlWhere.Append(" AND CreateDate >= @Start_BillDate");
                SqlWhere.Append(" AND CreateDate <= @End_BillDate");
                ListParam.Add(new SqlParam("@Start_BillDate", CommonHelper.GetDateTime(Parm_Key_Value["start_Date"].ToString())));
                ListParam.Add(new SqlParam("@End_BillDate", CommonHelper.GetDateTime(Parm_Key_Value["end_Date"].ToString())));
            }
            return dal.GetLoginLogList(SqlWhere, ListParam.ToArray(), orderField, orderType, pageIndex, pageSize, ref  count);
        }
        /// <summary>
        /// 清空操作日志
        /// </summary>
        /// <param name="KeepTime">日志保留时间</param>
        /// <returns></returns>
        public bool EmptyLoginLog(string KeepTime)
        {
            DateTime CreateDate = DateTime.Now;
            if (KeepTime == "7")//保留近一周
            {
                CreateDate = DateTime.Now.AddDays(-7);
            }
            else if (KeepTime == "1")//保留近一个月
            {
                CreateDate = DateTime.Now.AddMonths(-1);
            }
            else if (KeepTime == "3")//保留近三个月
            {
                CreateDate = DateTime.Now.AddMonths(-3);
            }
            else if (KeepTime == "0")//不保留，全部删除
            {
                return dal.RemoveAllLoginLog() >= 0 ? true : false;
            }
            return dal.EmptyLoginLog(CreateDate) >= 0 ? true : false;
        }
        #endregion

        #region 系统异常日志
        #endregion

        #region 操作日志
        /// <summary>
        /// 添加操作作业日志
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <param name="CreateUserId">创建用户主键</param>
        /// <param name="CreateUserName">创建用户</param>
        /// <param name="busingessName">业务名称</param>
        /// <returns></returns>
        public void AddTaskLog<T>(T entity, string CreateUserId, string CreateUserName, string busingessName = "")
        {
            dal.AddTaskLog<T>(entity, CreateUserId, CreateUserName, busingessName);
        }
        /// <summary>
        /// 添加更新操作日志
        /// </summary>
        /// <param name="oldObj">旧实体对象</param>
        /// <param name="newObj">新实体对象</param>
        /// <param name="CreateUserId">创建用户主键</param>
        /// <param name="CreateUserName">创建用户</param>
        /// <param name="busingessName">业务名称</param>
        /// <returns></returns>
        public void UpdateTaskLog<T>(T oldObj, T newObj, string CreateUserId, string CreateUserName, string busingessName = "")
        {
            dal.UpdateTaskLog<T>(oldObj, newObj, CreateUserId, CreateUserName, busingessName);
        }
        /// <summary>
        /// 执行删除的操作日志
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <param name="CreateUserId">创建用户主键</param>
        /// <param name="CreateUserName">创建用户</param>
        /// <param name="busingessName">业务名称</param>
        /// <returns></returns>
        public void DeleteTaskLog<T>(T entity, string CreateUserId, string CreateUserName, string busingessName = "")
        {
            dal.DeleteTaskLog<T>(entity, CreateUserId, CreateUserName, busingessName);
        }
        /// <summary>
        /// 操作日志列表(带条件)
        /// </summary>
        /// <param name="Parm_Key_Value">搜索条件键值</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="orderType">排序类型</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">页大小</param>
        /// <param name="count">总条数</param>
        /// <returns></returns>
        public IList GetLogList(Hashtable Parm_Key_Value, string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder SqlWhere = new StringBuilder();
            List<SqlParam> ListParam = new List<SqlParam>();
            //操作用户
            if (Parm_Key_Value["CreateUserName"] != null && !string.IsNullOrEmpty(Parm_Key_Value["CreateUserName"].ToString()))
            {
                SqlWhere.Append(" AND CreateUserName like @CreateUserName");
                ListParam.Add(new SqlParam("@CreateUserName", '%' + Parm_Key_Value["CreateUserName"].ToString() + '%'));
            }
            //操作类型
            if (Parm_Key_Value["OperationType"] != null && !string.IsNullOrEmpty(Parm_Key_Value["OperationType"].ToString()))
            {
                SqlWhere.Append(" AND OperationType = @OperationType");
                ListParam.Add(new SqlParam("@OperationType", Parm_Key_Value["OperationType"].ToString()));
            }
            //操作模块
            if (Parm_Key_Value["BusinessName"] != null && !string.IsNullOrEmpty(Parm_Key_Value["BusinessName"].ToString()))
            {
                SqlWhere.Append(" AND BusinessName like @BusinessName");
                ListParam.Add(new SqlParam("@BusinessName", '%' + Parm_Key_Value["BusinessName"].ToString() + '%'));
            }
            //日期
            if (!string.IsNullOrEmpty(Parm_Key_Value["start_Date"].ToString()) || !string.IsNullOrEmpty(Parm_Key_Value["end_Date"].ToString()))
            {
                SqlWhere.Append(" AND CreateDate >= @Start_BillDate");
                SqlWhere.Append(" AND CreateDate <= @End_BillDate");
                ListParam.Add(new SqlParam("@Start_BillDate", CommonHelper.GetDateTime(Parm_Key_Value["start_Date"].ToString())));
                ListParam.Add(new SqlParam("@End_BillDate", CommonHelper.GetDateTime(Parm_Key_Value["end_Date"].ToString())));
            }
            return dal.GetLogList(SqlWhere, ListParam.ToArray(), orderField, orderType, pageIndex, pageSize, ref  count);
        }
        /// <summary>
        /// 操作日志详细信息列表
        /// </summary>
        /// <param name="SyslogsId">日志主表ID</param>
        /// <returns></returns>
        public IList GetLogDetailList(string SyslogsId)
        {
            return dal.GetLogDetailList(SyslogsId);
        }
        /// <summary>
        /// 清空操作日志
        /// </summary>
        /// <param name="KeepTime">日志保留时间</param>
        /// <returns></returns>
        public bool EmptyLog(string KeepTime)
        {
            DateTime CreateDate = DateTime.Now;
            if (KeepTime == "7")//保留近一周
            {
                CreateDate = DateTime.Now.AddDays(-7);
            }
            else if (KeepTime == "1")//保留近一个月
            {
                CreateDate = DateTime.Now.AddMonths(-1);
            }
            else if (KeepTime == "3")//保留近三个月
            {
                CreateDate = DateTime.Now.AddMonths(-3);
            }
            else if (KeepTime == "0")//不保留，全部删除
            {
                return dal.RemoveAllLog() >= 0 ? true : false;
            }
            return dal.EmptyLog(CreateDate) >= 0 ? true : false;
        }
        #endregion
    }
}
