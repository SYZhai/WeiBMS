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
    /// 首页快捷功能 - 接口
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.28</date>
    /// </author>
    /// </summary>
    public interface BPMS_ShortcutIBLL
    {
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        bool Insert(BPMS_Shortcut entity);
        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        bool Delete(string KeyValue, string UserId);
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        IList GetList(string UserId);
    }
}