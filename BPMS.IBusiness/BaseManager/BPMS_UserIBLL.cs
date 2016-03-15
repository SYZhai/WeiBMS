//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using BPMS.Entity;
using System.Collections;
using System.Text;
using System.Data;

namespace BPMS.IBusiness
{
    /// <summary>
    /// 用户、帐户 - 接口
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.21</date>
    /// </author>
    /// </summary>
    public interface BPMS_UserIBLL
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
        bool Insert(BPMS_User entity);
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        bool Update(BPMS_User entity);
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
        BPMS_User GetEntity(string KeyValue);
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
        IList GetPageList(Hashtable Parm_Key_Value, string orderField, string orderType, int pageIndex, int pageSize, ref int count);
        #endregion

        /// <summary>
        /// 登陆验证
        /// </summary>
        /// <param name="Account">账户</param>
        /// <param name="Password">密码</param>
        /// <param name="msg">消息</param>
        /// <returns></returns>
        BPMS_User UserLogin(string Account, string Password, out string msg);
        /// <summary>
        /// 根据机构查询用户列表
        /// </summary>
        /// <param name="Category">分类</param>
        /// <param name="OrganizationId">机构主键</param>
        /// <returns></returns>
        IList GetDataTableByOrganizationId(string Category, string OrganizationId);
        /// <summary>
        /// 得到一个对象IList
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        IList GetIListById(string KeyValue);
        /// <summary>
        /// 自动补全(显示20行)
        /// </summary>
        /// <param name="Search">条件:编号，名称</param>
        /// <returns></returns>
        IList autocomplete(string Search);
    }
}