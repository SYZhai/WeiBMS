using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace BPMS.IBusiness
{
    /// <summary>
    ///系统日志
    /// </summary>
    public interface BPMS_SysLogIBLL
    {
        #region 系统登录日志
        /// <summary>
        /// 添加登录日志
        /// </summary>
        /// <param name="Account">账户</param>
        /// <param name="Status">登录状态</param>
        /// <param name="IPAddress">IP地址</param>
        /// <param name="IPAddressName">IP所在城市地址</param>
        void AddSysLoginLog(string Account, string Status, string IPAddress, string IPAddressName);
        /// <summary>
        /// 统计登录日志，柱状图
        /// </summary>
        /// <returns></returns>
        DataTable GetHighchartLoginLog();
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
        IList GetLoginLogList(Hashtable Parm_Key_Value, string orderField, string orderType, int pageIndex, int pageSize, ref int count);

        /// <summary>
        /// 清空操作日志
        /// </summary>
        /// <param name="KeepTime">日志保留时间</param>
        /// <returns></returns>
        bool EmptyLoginLog(string KeepTime);
        #endregion

        #region 系统异常日志
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
        IList GetLogList(Hashtable Parm_Key_Value, string orderField, string orderType, int pageIndex, int pageSize, ref int count);
        /// <summary>
        /// 操作日志详细信息列表
        /// </summary>
        /// <param name="SyslogsId">日志主表ID</param>
        /// <returns></returns>
        IList GetLogDetailList(string SyslogsId);
        /// <summary>
        /// 清空操作日志
        /// </summary>
        /// <param name="KeepTime">日志保留时间</param>
        /// <returns></returns>
        bool EmptyLog(string KeepTime);
        #endregion
    }
}
