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
    /// 组织机构、部门 - 接口
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.20</date>
    /// </author>
    /// </summary>
    public interface BPMS_OrganizationIBLL
    {
        #region Method
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
        bool Insert(BPMS_Organization entity);
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        bool Update(BPMS_Organization entity);
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
        BPMS_Organization GetEntity(string KeyValue);
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <returns></returns>
        IList GetList();
        /// <summary>
        /// 获得数据列表（后台管理）
        /// </summary>
        /// <returns></returns>
        IList GetListSys();
        #endregion

        /// <summary>
        /// 根据组织机构主键，判断是否有下级节点
        /// </summary>
        /// <param name="KeyValue"></param>
        /// <returns></returns>
        bool IsBelowMenu(string KeyValue);
    }
}