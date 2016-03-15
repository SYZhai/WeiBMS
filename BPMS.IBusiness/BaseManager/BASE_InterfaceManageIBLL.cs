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
    /// 动态接口配置 - 接口
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.03</date>
    /// </author>
    /// </summary>
    public interface BASE_InterfaceManageIBLL
    {
        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        bool Delete(string KeyValue);
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        BASE_InterfaceManage GetEntity(string KeyValue);
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="Code">接口编号</param>
        /// <returns></returns>
        BASE_InterfaceManage GetEntityByCode(string Code);
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
        /// <summary>
        /// 接口参数列表
        /// </summary>
        /// <param name="InterfaceId">接口主键</param>
        /// <returns></returns>
        IList GetListDetails(string InterfaceId);
        /// <summary>
        /// 批量新增 接口，接口参数
        /// </summary>
        /// <param name="InterfaceFrom">接口配置</param>
        /// <param name="InterfaceDetailsFrom">接口参数明细</param>
        /// <param name="key">主键</param>
        /// <returns></returns>
        int AddInterfaceManage(object[] InterfaceFrom, object[] InterfaceDetailsFrom, string key);
    }
}