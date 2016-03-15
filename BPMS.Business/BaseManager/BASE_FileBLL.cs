//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using DotNet.Utilities;
using BPMS.Entity;
using BPMS.Service;
using BPMS.IBusiness;
using System.Collections;
using System.Text;

namespace BPMS.Business
{
    /// <summary>
    /// 文件表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.29</date>
    /// </author>
    /// </summary>
    public class BASE_FileBLL : BASE_FileIBLL
    {
        private readonly BASE_FileDAL dal = new BASE_FileDAL();

        #region Method
        /// <summary>
        /// 获取最大编号
        /// </summary>
        /// <returns></returns>
        public object GetMaxCode()
        {
            return dal.GetMaxCode();
        }
        /// <summary>
        /// 获取记录总数
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <returns></returns>
        public int GetRecordCount(string KeyValue)
        {
            return dal.GetRecordCount(KeyValue);
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Insert(BASE_File entity)
        {
            return dal.Insert(entity) >= 0 ? true : false;
        }
        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public bool Delete(string KeyValue)
        {
            return dal.Delete(KeyValue) >= 0 ? true : false;
        }
        /// <summary>
        /// 批量删除数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public bool BatchDelete(string[] KeyValue)
        {
            return dal.BatchDelete(KeyValue) >= 0 ? true : false;
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BASE_File GetEntity(string KeyValue)
        {
            return dal.GetEntity(KeyValue);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <returns></returns>
        public IList GetList()
        {
            return dal.GetListWhere(null, null);
        }
        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        public IList GetListWhere(StringBuilder where, SqlParam[] param)
        {
            return dal.GetListWhere(where, param);
        }
        #endregion
    }
}