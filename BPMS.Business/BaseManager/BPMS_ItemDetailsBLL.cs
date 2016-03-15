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
    /// 数据字典明细表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.22</date>
    /// </author>
    /// </summary>
    public class BPMS_ItemDetailsBLL : BPMS_ItemDetailsIBLL
    {
        private readonly BPMS_ItemDetailsDAL dal = new BPMS_ItemDetailsDAL();

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
        public bool Insert(BPMS_ItemDetails entity)
        {
            return dal.Insert(entity) >= 0 ? true : false;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Update(BPMS_ItemDetails entity)
        {
            return dal.Update(entity) >= 0 ? true : false;
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
        public BPMS_ItemDetails GetEntity(string KeyValue)
        {
            return dal.GetEntity(KeyValue);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <returns></returns>
        public IList GetList()
        {
            return dal.GetList();
        }
        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="ItemsId">数据字典主表主键</param>
        /// <returns></returns>
        public IList GetListByItemsId(string ItemsId)
        {
            if (string.IsNullOrEmpty(ItemsId)) return null;
            StringBuilder where = new StringBuilder();
            where.Append(" AND ItemsId = @ItemsId");
            SqlParam[] param = {
                                         new SqlParam("@ItemsId",ItemsId)};
            return dal.GetListWhere(where, param);
        }
        #endregion

        /// <summary>
        /// 自动补全(显示20行)
        /// </summary>
        /// <param name="ItemsId">类别主键</param>
        /// <param name="Search">搜索条件</param>
        /// <returns></returns>
        public IList Autocomplete(string ItemsId, string Search)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" AND ItemsId = '" + ItemsId + "'");
            if (!string.IsNullOrEmpty(Search))
            {
                strSql.Append(" AND (FullName like @FullName");
                strSql.Append(" OR Code like @Code)");
                SqlParam[] para = {
                                        new SqlParam("@FullName", '%' +Search.Trim() + '%'),
                                        new SqlParam("@Code", '%' + Search.Trim() + '%')};
                return dal.Autocomplete(strSql, para);
            }
            else
            {
                return dal.Autocomplete(strSql, null);
            }
        }
    }
}