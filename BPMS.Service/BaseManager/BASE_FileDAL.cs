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
    /// 文件表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.29</date>
    /// </author>
    /// </summary>
    public class BASE_FileDAL
    {
        #region Method
        /// <summary>
        /// 获取最大编号
        /// </summary>
        /// <returns></returns>
        public object GetMaxCode()
        {
            return DataFactory.DbUtils().GetMax("BASE_File", "FileId");
        }
        /// <summary>
        /// 获取记录总数
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <returns></returns>
        public int GetRecordCount(string KeyValue)
        {
            return DataFactory.DbUtils().RecordCount("BASE_File", "FileId", KeyValue);
        }
        /// <summary>
        /// 获取记录总数（带条件）
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        public int GetRecordCount(StringBuilder where, SqlParam[] param)
        {
            return DataFactory.DbUtils().RecordCount("BASE_File", where, param);
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Insert(BASE_File entity)
        {
            return DataFactory.DbUtils().Insert(entity);
        }
        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public int Delete(string KeyValue)
        {
            return DataFactory.DbUtils().Delete("BASE_File", "FileId", KeyValue);
        }
        /// <summary>
        /// 批量删除数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public int BatchDelete(string[] KeyValue)
        {
            return DataFactory.DbUtils().BatchDelete("BASE_File", "FileId", KeyValue);
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BASE_File GetEntity(string KeyValue)
        {
            return DataFactory.DbUtils().GetModelById<BASE_File>("FileId", KeyValue);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <returns></returns>
        public IList GetList()
        {
            return this.GetListWhere(null, null);
        }
        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        public IList GetListWhere(StringBuilder where, SqlParam[] param)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM BASE_File WHERE 1=1");
            strSql.Append(where);
            return DataFactory.SqlHelper().GetDataListBySQL<BASE_File>(strSql, param);
        }
        #endregion
    }
}