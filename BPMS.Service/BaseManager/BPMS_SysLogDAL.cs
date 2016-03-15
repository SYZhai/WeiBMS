using BPMS.Entity;
using DotNet.Kernel;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;

namespace BPMS.Service
{
    /// <summary>
    /// 系统日志
    /// </summary>
    public class BPMS_SysLogDAL
    {
        private static BPMS_SysLogDAL item;
        public static BPMS_SysLogDAL Instance
        {
            get
            {
                if (item == null)
                {
                    item = new BPMS_SysLogDAL();
                }
                return item;
            }
        }
        public enum OperationType
        {
            Add = 1,//新增
            Update = 2,//修改
            Delete = 3,//删除
            Other = 4,//其他
            Visit = 5,//访问
            Leave = 6,//离开
        }

        #region 写入系统登录日志
        /// <summary>
        /// 添加登录日志
        /// </summary>
        /// <param name="Account">账户</param>
        /// <param name="Status">登录状态</param>
        /// <param name="IPAddress">IP地址</param>
        /// <param name="IPAddressName">IP所在城市地址</param>
        public void AddSysLoginLog(string Account, string Status, string IPAddress, string IPAddressName)
        {
            Hashtable ht = new Hashtable();
            ht["SysLoginLogId"] = CommonHelper.GetGuid;
            ht["Account"] = Account;
            ht["Status"] = Status;
            ht["IPAddress"] = IPAddress;
            ht["IPAddressName"] = IPAddressName;
            DataFactory.DbUtils().Insert("BPMS_SysLoginLog", ht);
        }
        /// <summary>
        /// 登录日志列表(带条件)
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="orderType">排序类型</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">页大小</param>
        /// <param name="count">总条数</param>
        /// <returns></returns>
        public IList GetLoginLogList(StringBuilder where, SqlParam[] param, string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT * FROM BPMS_SysLoginLog WHERE 1=1");
            strSql.Append(where);
            return DataFactory.SqlHelper().GetPageList<BPMS_SysLoginLog>(strSql.ToString(), param, CommonHelper.ToOrderField("CreateDate", orderField), orderType, pageIndex, pageSize, ref count);
        }
        /// <summary>
        /// 统计登录日志，柱状图
        /// </summary>
        /// <returns></returns>
        public DataTable GetHighchartLoginLog()
        {
            StringBuilder strSql = new StringBuilder();
            switch (DataFactory.DbType)
            {
                case SqlSourceType.Oracle:
                    strSql.Append(@"SELECT  to_char(CreateDate,'dd') AS data ,
                                    COUNT(1) AS count
                            FROM    BPMS_SysLoginLog
                            WHERE   to_char(CreateDate,'mm') = to_char(sysdate,'mm')
                            GROUP BY to_char(CreateDate,'dd') ");
                    break;
                case SqlSourceType.SQLServer:
                    strSql.Append(@"SELECT  DAY(CreateDate) AS data ,
                                    COUNT(1) AS count
                            FROM    BPMS_SysLoginLog
                            WHERE   MONTH(CreateDate) = MONTH(GETDATE())
                            GROUP BY DAY(CreateDate) ");
                    break;
                case SqlSourceType.MySql:
                    strSql.Append(@"SELECT  DAY(CreateDate) AS data ,
                                    COUNT(1) AS count
                            FROM    BPMS_SysLoginLog
                            WHERE   MONTH(CreateDate) = MONTH(curdate())
                            GROUP BY DAY(CreateDate) ");
                    break;
                default:
                    break;
            }
            return DataFactory.SqlHelper().GetDataTableBySQL(strSql);
        }
        /// <summary>
        /// 清空操作日志
        /// </summary>
        /// <param name="CreateDate"></param>
        /// <returns></returns>
        public int EmptyLoginLog(DateTime CreateDate)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"DELETE FROM BPMS_SysLoginLog WHERE 1=1");
            strSql.Append(" AND CreateDate <= @CreateDate");
            SqlParam[] param = {
                                         new SqlParam("@CreateDate",CreateDate)};
            return DataFactory.SqlHelper().ExecuteBySql(strSql, param);
        }
        /// <summary>
        /// 清除所有操作日志
        /// </summary>
        public int RemoveAllLoginLog()
        {
            StringBuilder strSql = new StringBuilder("DELETE FROM BPMS_SysLoginLog");
            return DataFactory.SqlHelper().ExecuteBySql(strSql);
        }
        #endregion

        #region 写入操作日志
        /// <summary>
        /// 获取实体类主键字段
        /// </summary>
        /// <param name="obj">业务实体</param>
        /// <returns></returns>
        private object GetKeyField(Type t)
        {
            string _KeyField = "";
            KeyAttribute KeyField;
            var name = t.Name;
            foreach (Attribute attr in t.GetCustomAttributes(true))
            {
                KeyField = attr as KeyAttribute;
                if (KeyField != null)
                    _KeyField = KeyField.Name;
            }
            return _KeyField;
        }
        /// <summary>
        /// 获取实体类主键字段值
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public object GetKeyFieldValue<T>(T entity)
        {
            Type objTye = typeof(T);
            string _KeyField = "";
            KeyAttribute KeyField;
            var name = objTye.Name;
            foreach (Attribute attr in objTye.GetCustomAttributes(true))
            {
                KeyField = attr as KeyAttribute;
                if (KeyField != null)
                    _KeyField = KeyField.Name;
            }
            PropertyInfo property = objTye.GetProperty(_KeyField);
            return property.GetValue(entity, null).ToString();
        }
        /// <summary>
        /// 获取实体类中文名称
        /// </summary>
        /// <param name="obj">业务实体</param>
        /// <returns></returns>
        private string GetBusingessName<T>()
        {
            Type objTye = typeof(T);
            string entityName = "";
            var busingessNames = objTye.GetCustomAttributes(true).OfType<DescriptionAttribute>();
            var descriptionAttributes = busingessNames as DescriptionAttribute[] ?? busingessNames.ToArray();
            if (descriptionAttributes.Any())
                entityName = descriptionAttributes.ToList()[0].Description;
            else
            {
                entityName = objTye.Name;
            }
            return entityName;
        }
        /// <summary>
        /// 获取实体类 字段中文名称
        /// </summary>
        /// <param name="pi">字段属性信息</param>
        /// <returns></returns>
        private string GetFieldText(PropertyInfo pi)
        {
            DescriptionAttribute descAttr;
            string txt = "";
            var descAttrs = pi.GetCustomAttributes(typeof(DescriptionAttribute), true);
            if (descAttrs.Any())
            {
                descAttr = descAttrs[0] as DescriptionAttribute;
                txt = descAttr.Description;
            }
            else
            {
                txt = pi.Name;
            }
            return txt;
        }
        /// <summary>
        /// 写入操作访问页面日志（访问）
        /// </summary>
        /// <param name="CreateUserId">创建用户主键</param>
        /// <param name="CreateUserName">创建用户</param>
        /// <param name="busingessName">业务名称</param>
        /// <param name="Remark">描述</param>
        /// <param name="Result">操作业务把结果记录起来</param>
        /// <returns></returns>
        public void AddVisitLog(string CreateUserId, string CreateUserName, string busingessName, string Remark, string Result = "")
        {
            this.AddTaskLog(CreateUserId, CreateUserName, busingessName, Remark, OperationType.Visit, Result);
        }
        /// <summary>
        /// 写入操作离开页面日志（离开）
        /// </summary>
        /// <param name="CreateUserId">创建用户主键</param>
        /// <param name="CreateUserName">创建用户</param>
        /// <param name="busingessName">业务名称</param>
        /// <param name="Remark">描述</param>
        /// <param name="Result">操作业务把结果记录起来</param>
        /// <returns></returns>
        public void AddLeaveLog(string CreateUserId, string CreateUserName, string busingessName, string Remark, string Result = "")
        {
            this.AddTaskLog(CreateUserId, CreateUserName, busingessName, Remark, OperationType.Leave, Result);
        }
        /// <summary>
        /// 写入操作其它日志（其它）
        /// </summary>
        /// <param name="CreateUserId">创建用户主键</param>
        /// <param name="CreateUserName">创建用户</param>
        /// <param name="busingessName">业务名称</param>
        /// <param name="Remark">描述</param>
        /// <param name="Result">操作业务把结果记录起来</param>
        /// <returns></returns>
        public void AddTaskLog(string CreateUserId, string CreateUserName, string busingessName, string Remark, string Result = "")
        {
            this.AddTaskLog(CreateUserId, CreateUserName, busingessName, Remark, OperationType.Other, Result);
        }
        /// <summary>
        /// 写入操作作业日志
        /// </summary>
        /// <param name="CreateUserId">创建用户主键</param>
        /// <param name="CreateUserName">创建用户</param>
        /// <param name="busingessName">业务名称</param>
        /// <param name="Remark">描述</param>
        /// <param name="Result">操作业务把结果记录起来</param>
        /// <returns></returns>
        public void AddTaskLog(string CreateUserId, string CreateUserName, string busingessName, string Remark, OperationType operationtype, string Result = "")
        {
            try
            {
                List<StringBuilder> ListSql = new List<StringBuilder>();
                List<object> ListParam = new List<object>();
                BPMS_SysLogs SysLog = new BPMS_SysLogs();
                SysLog.SyslogsId = CommonHelper.GetGuid;
                SysLog.BusinessName = busingessName;
                SysLog.OperationIp = RequestHelper.GetIPAddress();
                SysLog.CreateUserId = CreateUserId;
                SysLog.CreateUserName = CreateUserName;
                SysLog.Result = Result;
                SysLog.OperationType = (int)operationtype;
                ListSql.Add(DbCommon.InsertSql(SysLog));
                ListParam.Add(DbCommon.GetParameter(SysLog));
                //添加日志详细信息
                BPMS_SysLogDetails SysLogDetails = new BPMS_SysLogDetails();
                SysLogDetails.SysLogDetailsId = CommonHelper.GetGuid;
                SysLogDetails.SyslogsId = SysLog.SyslogsId;
                SysLogDetails.Remark = Remark;
                ListSql.Add(DbCommon.InsertSql(SysLogDetails));
                ListParam.Add(DbCommon.GetParameter(SysLogDetails));
                DataFactory.SqlHelper().BatchExecuteBySql(ListSql.ToArray(), ListParam.ToArray());
            }
            finally
            {

            }
        }
        /// <summary>
        /// 写入操作作业日志
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <param name="CreateUserId">创建用户主键</param>
        /// <param name="CreateUserName">创建用户</param>
        /// <param name="busingessName">业务名称</param>
        /// <param name="Result">操作业务把结果记录起来</param>
        /// <returns></returns>
        public void AddTaskLog<T>(T entity, string CreateUserId, string CreateUserName, string busingessName = "", string Result = "")
        {
            try
            {
                List<StringBuilder> ListSql = new List<StringBuilder>();
                List<object> ListParam = new List<object>();
                Type objTye = typeof(T);
                BPMS_SysLogs SysLog = new BPMS_SysLogs();
                SysLog.SyslogsId = CommonHelper.GetGuid;
                SysLog.TableName = entity.ToString();
                if (busingessName == "")
                {
                    busingessName = GetBusingessName<T>();
                }
                SysLog.BusinessName = busingessName;
                SysLog.OperationIp = RequestHelper.GetIPAddress();
                SysLog.CreateUserId = CreateUserId;
                SysLog.CreateUserName = CreateUserName;
                SysLog.Result = Result;
                SysLog.OperationType = (int)OperationType.Add;
                PropertyInfo property = objTye.GetProperty(GetKeyField(objTye).ToString());
                SysLog.Object_ID = property.GetValue(entity, null).ToString();
                ListSql.Add(DbCommon.InsertSql(SysLog));
                ListParam.Add(DbCommon.GetParameter(SysLog));
                //添加日志详细信息
                foreach (PropertyInfo pi in objTye.GetProperties())
                {
                    if (pi.GetValue(entity, null) != null)
                    {
                        BPMS_SysLogDetails SysLogDetails = new BPMS_SysLogDetails();
                        SysLogDetails.SysLogDetailsId = CommonHelper.GetGuid;
                        SysLogDetails.SyslogsId = SysLog.SyslogsId;
                        SysLogDetails.FieldName = GetFieldText(pi);
                        SysLogDetails.FieldText = pi.Name;
                        SysLogDetails.NewValue = "" + pi.GetValue(entity, null) + "";
                        ListSql.Add(DbCommon.InsertSql(SysLogDetails));
                        ListParam.Add(DbCommon.GetParameter(SysLogDetails));
                    }
                }
                DataFactory.SqlHelper().BatchExecuteBySql(ListSql.ToArray(), ListParam.ToArray());
            }
            finally
            {

            }
        }
        /// <summary>
        /// 写入更新操作日志
        /// </summary>
        /// <param name="oldObj">旧实体对象</param>
        /// <param name="newObj">新实体对象</param>
        /// <param name="CreateUserId">创建用户主键</param>
        /// <param name="CreateUserName">创建用户</param>
        /// <param name="busingessName">业务名称</param>
        /// <param name="Result">操作业务把结果记录起来</param>
        /// <returns></returns>
        public void UpdateTaskLog<T>(T oldObj, T newObj, string CreateUserId, string CreateUserName, string busingessName = "", string Result = "")
        {
            try
            {
                List<StringBuilder> ListSql = new List<StringBuilder>();
                List<object> ListParam = new List<object>();
                Type objTye = typeof(T);
                BPMS_SysLogs SysLog = new BPMS_SysLogs();
                SysLog.SyslogsId = CommonHelper.GetGuid;
                SysLog.TableName = newObj.ToString();
                if (busingessName == "")
                {
                    busingessName = GetBusingessName<T>();
                }
                SysLog.BusinessName = busingessName;
                SysLog.OperationIp = RequestHelper.GetIPAddress();
                SysLog.CreateUserId = CreateUserId;
                SysLog.CreateUserName = CreateUserName;
                SysLog.Result = Result;
                SysLog.OperationType = (int)OperationType.Update;
                PropertyInfo property = objTye.GetProperty(GetKeyField(objTye).ToString());
                SysLog.Object_ID = property.GetValue(newObj, null).ToString();
                ListSql.Add(DbCommon.InsertSql(SysLog));
                ListParam.Add(DbCommon.GetParameter(SysLog));
                //添加日志详细信息
                foreach (PropertyInfo pi in objTye.GetProperties())
                {
                    object oldVal = pi.GetValue(oldObj, null);
                    object newVal = pi.GetValue(newObj, null);
                    if (!Equals(oldVal, newVal))
                    {
                        if (oldVal != null && newVal != null)
                        {
                            BPMS_SysLogDetails SysLogDetails = new BPMS_SysLogDetails();
                            SysLogDetails.SysLogDetailsId = CommonHelper.GetGuid;
                            SysLogDetails.SyslogsId = SysLog.SyslogsId;
                            SysLogDetails.FieldName = GetFieldText(pi);
                            SysLogDetails.FieldText = pi.Name;
                            SysLogDetails.NewValue = "" + newVal + "";
                            SysLogDetails.OldValue = "" + oldVal + "";
                            ListSql.Add(DbCommon.InsertSql(SysLogDetails));
                            ListParam.Add(DbCommon.GetParameter(SysLogDetails));
                        }
                    }
                }
                DataFactory.SqlHelper().BatchExecuteBySql(ListSql.ToArray(), ListParam.ToArray());
            }
            finally
            {

            }
        }
        /// <summary>
        /// 执行删除的操作日志
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <param name="CreateUserId">创建用户主键</param>
        /// <param name="CreateUserName">创建用户</param>
        /// <param name="busingessName">业务名称</param>
        /// <param name="Result">操作业务把结果记录起来</param>
        /// <returns></returns>
        public void DeleteTaskLog<T>(T entity, string CreateUserId, string CreateUserName, string busingessName = "", string Result = "")
        {
            try
            {
                List<StringBuilder> ListSql = new List<StringBuilder>();
                List<object> ListParam = new List<object>();
                Type objTye = typeof(T);
                BPMS_SysLogs SysLog = new BPMS_SysLogs();
                SysLog.SyslogsId = CommonHelper.GetGuid;
                SysLog.TableName = entity.ToString();
                if (busingessName == "")
                {
                    busingessName = GetBusingessName<T>();
                }
                SysLog.BusinessName = busingessName;
                SysLog.OperationIp = RequestHelper.GetIPAddress();
                SysLog.CreateUserId = CreateUserId;
                SysLog.CreateUserName = CreateUserName;
                SysLog.Result = Result;
                SysLog.OperationType = (int)OperationType.Delete;
                PropertyInfo property = objTye.GetProperty(GetKeyField(objTye).ToString());
                SysLog.Object_ID = property.GetValue(entity, null).ToString();
                ListSql.Add(DbCommon.InsertSql(SysLog));
                ListParam.Add(DbCommon.GetParameter(SysLog));
                //添加日志详细信息
                foreach (PropertyInfo pi in objTye.GetProperties())
                {
                    if (pi.GetValue(entity, null) != null)
                    {
                        BPMS_SysLogDetails SysLogDetails = new BPMS_SysLogDetails();
                        SysLogDetails.SysLogDetailsId = CommonHelper.GetGuid;
                        SysLogDetails.SyslogsId = SysLog.SyslogsId;
                        SysLogDetails.FieldName = GetFieldText(pi);
                        SysLogDetails.FieldText = pi.Name;
                        SysLogDetails.OldValue = "" + pi.GetValue(entity, null) + "";
                        ListSql.Add(DbCommon.InsertSql(SysLogDetails));
                        ListParam.Add(DbCommon.GetParameter(SysLogDetails));
                    }
                }
                DataFactory.SqlHelper().BatchExecuteBySql(ListSql.ToArray(), ListParam.ToArray());
            }
            finally
            {

            }
        }
        /// <summary>
        /// 操作日志列表(带条件)
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="orderType">排序类型</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">页大小</param>
        /// <param name="count">总条数</param>
        /// <returns></returns>
        public IList GetLogList(StringBuilder where, SqlParam[] param, string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT * FROM BPMS_SysLogs WHERE 1=1");
            strSql.Append(where);
            return DataFactory.SqlHelper().GetPageList<BPMS_SysLogs>(strSql.ToString(), param, CommonHelper.ToOrderField("CreateDate", orderField), orderType, pageIndex, pageSize, ref count);
        }
        /// <summary>
        /// 操作日志详细信息列表
        /// </summary>
        /// <param name="SyslogsId">日志主表ID</param>
        /// <returns></returns>
        public IList GetLogDetailList(string SyslogsId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT * FROM BPMS_SysLogDetails WHERE 1=1");
            strSql.Append(" AND SyslogsId = @SyslogsId");
            SqlParam[] param = {
                                         new SqlParam("@SyslogsId",SyslogsId)};
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_SysLogDetails>(strSql, param);
        }
        /// <summary>
        /// 清空操作日志
        /// </summary>
        /// <param name="CreateDate"></param>
        /// <returns></returns>
        public int EmptyLog(DateTime CreateDate)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"DELETE FROM BPMS_SysLogs WHERE 1=1");
            strSql.Append(" AND CreateDate <= @CreateDate");
            SqlParam[] param = {
                                         new SqlParam("@CreateDate",CreateDate)};
            return DataFactory.SqlHelper().ExecuteBySql(strSql, param);
        }
        /// <summary>
        /// 清除所有操作日志
        /// </summary>
        public int RemoveAllLog()
        {
            StringBuilder strSql = new StringBuilder("DELETE FROM BPMS_SysLogs");
            return DataFactory.SqlHelper().ExecuteBySql(strSql);
        }
        #endregion
    }
}
