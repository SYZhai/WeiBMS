//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using DotNet.Utilities;
using BPMS.Entity;
using System.Collections;
using System.Text;
using BPMS.Service;

namespace BPMS.Service
{
    /// <summary>
    /// 新闻表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.28</date>
    /// </author>
    /// </summary>
    public class BASE_NewsDAL
    {
        #region Method
        /// <summary>
        /// 获取最大编号
        /// </summary>
        /// <returns></returns>
        public object GetMaxCode()
        {
            return DataFactory.DbUtils().GetMax("BASE_News", "SortCode");
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Insert(BASE_News entity)
        {
            entity.SortCode = CommonHelper.GetInt(this.GetMaxCode());
            return DataFactory.DbUtils().Insert(entity);
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Update(BASE_News entity)
        {
            return DataFactory.DbUtils().Update(entity, "NewsId");
        }
        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public int Delete(string KeyValue)
        {
            return DataFactory.DbUtils().Delete("BASE_News", "NewsId", KeyValue);
        }
        /// <summary>
        /// 批量删除数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public int BatchDelete(string[] KeyValue)
        {
            return DataFactory.DbUtils().BatchDelete("BASE_News", "NewsId", KeyValue);
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BASE_News GetEntity(string KeyValue)
        {
            return DataFactory.DbUtils().GetModelById<BASE_News>("NewsId", KeyValue);
        }
        /// <summary>
        /// 分页获取数据列表(带条件)
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <param name="orderField">排序字段</param>
        /// <param name="orderType">排序类型</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">页大小</param>
        /// <param name="count">总条数</param>
        /// <returns></returns>
        public IList GetPageListWhere(StringBuilder where, SqlParam[] param,string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM BASE_News WHERE 1=1");
            strSql.Append(where);
            return DataFactory.SqlHelper().GetPageList<BASE_News>(strSql.ToString(), param, CommonHelper.ToOrderField("SortCode", orderField), orderType, pageIndex, pageSize, ref count);
        }
        #endregion
    }
}