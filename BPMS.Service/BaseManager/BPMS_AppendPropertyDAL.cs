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
    /// 附加属性信息
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.30</date>
    /// </author>
    /// </summary>
    public class BPMS_AppendPropertyDAL
    {
        #region Method
        /// <summary>
        /// 获取最大编号
        /// </summary>
        /// <returns></returns>
        public object GetMaxCode()
        {
            return DataFactory.DbUtils().GetMax("BPMS_AppendProperty", "SortCode");
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Insert(BPMS_AppendProperty entity)
        {
            int IsOk = DataFactory.DbUtils().Insert(entity);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.AddTaskLog<BPMS_AppendProperty>(entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Update(BPMS_AppendProperty entity)
        {
            #region 获取旧值
            var oldEntity = this.GetEntity(BPMS_SysLogDAL.Instance.GetKeyFieldValue<BPMS_AppendProperty>(entity).ToString());
            #endregion
            int IsOk = DataFactory.DbUtils().Update(entity, "PropertyId");
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.UpdateTaskLog<BPMS_AppendProperty>(oldEntity, entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public int Delete(string KeyValue)
        {
            #region 获取旧值
            var oldEntity = this.GetEntity(KeyValue);
            #endregion
            int IsOk = DataFactory.DbUtils().Delete("BPMS_AppendProperty", "PropertyId", KeyValue);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.DeleteTaskLog<BPMS_AppendProperty>(oldEntity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BPMS_AppendProperty GetEntity(string KeyValue)
        {
            return DataFactory.DbUtils().GetModelById<BPMS_AppendProperty>("PropertyId", KeyValue);
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <returns></returns>
        public IList GetList(string ParentId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM BPMS_AppendProperty WHERE 1=1");
            strSql.Append(" AND ParentId = @ParentId");
            SqlParam[] param = {
                                         new SqlParam("@ParentId",ParentId)};
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_AppendProperty>(strSql, param);

        }
        #endregion
    }
}