//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using BPMS.Entity;
using System.Collections;
using System.Text;

namespace BPMS.IBusiness
{
    /// <summary>
    /// IP黑名单 - 接口
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.31</date>
    /// </author>
    /// </summary>
    public interface BPMS_IPBlacklistIBLL
    {
        #region Method
        /// <summary>
        /// 获取最大编号
        /// </summary>
        /// <returns></returns>
        object GetMaxCode();
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        bool Insert(BPMS_IPBlacklist entity);
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        bool Update(BPMS_IPBlacklist entity);
        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        bool Delete(string KeyValue);
        /// <summary>
        /// 批量删除数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        bool BatchDelete(string[] KeyValue);
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        BPMS_IPBlacklist GetEntity(string KeyValue);
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <returns></returns>
        IList GetList();
        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        IList GetListWhere(StringBuilder where, SqlParam[] param);
        #endregion

        /// <summary>
        /// 登录系统IP限制，是否允许登录该系统
        /// </summary>
        /// <returns></returns>
        bool TheIpIsRange(string ip);
    }
}