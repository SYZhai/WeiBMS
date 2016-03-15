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
    /// 操作按钮 - 接口
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.19</date>
    /// </author>
    /// </summary>
    public interface BPMS_ButtonIBLL
    {
        #region Method
        /// <summary>
        /// 获取最大编号
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <returns></returns>
        object GetMaxCode();
        /// <summary>
        /// 获取记录总数
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <returns></returns>
        int GetRecordCount(string KeyValue);
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        bool Insert(BPMS_Button entity);
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        bool Update(BPMS_Button entity);
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
        BPMS_Button GetEntity(string KeyValue);
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
    }
}