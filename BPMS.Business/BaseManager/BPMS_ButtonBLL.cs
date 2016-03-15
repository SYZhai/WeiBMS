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
using System.Collections.Generic;

namespace BPMS.Business
{
    /// <summary>
    /// 操作按钮
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.19</date>
    /// </author>
    /// </summary>
    public class BPMS_ButtonBLL : BPMS_ButtonIBLL
    {
        private readonly BPMS_ButtonDAL dal = new BPMS_ButtonDAL();

        #region Method
        /// <summary>
        /// 获取最大编号
        /// </summary>
        /// <param name="KeyValue">主键值</param>
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
        public bool Insert(BPMS_Button entity)
        {
            return dal.Insert(entity) >= 0 ? true : false;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Update(BPMS_Button entity)
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
        public BPMS_Button GetEntity(string KeyValue)
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
        /// <param name="Parm_Key_Value">搜索条件键值</param>
        /// <returns></returns>
        public IList GetListWhere(Hashtable Parm_Key_Value)
        {
            StringBuilder SqlWhere = new StringBuilder();
            List<SqlParam> ListParam = new List<SqlParam>();
            //编号
            if (Parm_Key_Value["Control_ID"] != null && !string.IsNullOrEmpty(Parm_Key_Value["Control_ID"].ToString()))
            {
                SqlWhere.Append(" AND Control_ID like @Control_ID");
                ListParam.Add(new SqlParam("@Control_ID", '%' + Parm_Key_Value["Control_ID"].ToString() + '%'));
            }
            //名称
            if (Parm_Key_Value["FullName"] != null && !string.IsNullOrEmpty(Parm_Key_Value["FullName"].ToString()))
            {
                SqlWhere.Append(" AND FullName like @FullName");
                ListParam.Add(new SqlParam("@FullName", '%' + Parm_Key_Value["FullName"].ToString() + '%'));
            }
            return dal.GetListWhere(SqlWhere, ListParam.ToArray());
        }
        #endregion
    }
}