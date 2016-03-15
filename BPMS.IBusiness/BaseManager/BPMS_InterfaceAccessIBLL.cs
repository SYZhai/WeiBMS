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
    /// 系统接口访问 - 接口
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.02</date>
    /// </author>
    /// </summary>
    public interface BPMS_InterfaceAccessIBLL
    {
        #region Method
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        bool Insert(BPMS_InterfaceAccess entity);
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        bool Update(BPMS_InterfaceAccess entity);
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
        BPMS_InterfaceAccess GetEntity(string KeyValue);
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <returns></returns>
        IList GetList();
        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="Parm_Key_Value">搜索条件键值</param>
        /// <returns></returns>
        IList GetListWhere(Hashtable Parm_Key_Value);
        #endregion

        /// <summary>
        /// 验证是否有效用户可以访问接口
        /// </summary>
        /// <param name="AuthorizationUserId">用户主键</param>
        /// <returns></returns>
        bool IsEnabled(string AuthorizationUserId);
    }
}