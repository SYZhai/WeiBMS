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
    /// 模块列表表头定义
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.19</date>
    /// </author>
    /// </summary>
    public class BPMS_TableColumnsDAL
    {
        #region Method
        /// <summary>
        /// 获取最大编号
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <returns></returns>
        public object GetMaxCode()
        {
            return DataFactory.DbUtils().GetMax("BPMS_TableColumns", "SortCode");
        }
        /// <summary>
        /// 获取记录总数
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <returns></returns>
        public int GetRecordCount(string KeyValue)
        {
            return DataFactory.DbUtils().RecordCount("BPMS_TableColumns", "TableColumnsId", KeyValue);
        }
        /// <summary>
        /// 获取记录总数（带条件）
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        public int GetRecordCount(StringBuilder where, SqlParam[] param)
        {
            return DataFactory.DbUtils().RecordCount("BPMS_TableColumns", where, param);
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Insert(BPMS_TableColumns entity)
        {
            entity.SortCode = CommonHelper.GetInt(this.GetMaxCode());
            int IsOk = DataFactory.DbUtils().Insert(entity);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.AddTaskLog<BPMS_TableColumns>(entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public int Update(BPMS_TableColumns entity)
        {
            #region 获取旧值
            var oldEntity = this.GetEntity(BPMS_SysLogDAL.Instance.GetKeyFieldValue<BPMS_TableColumns>(entity).ToString());
            #endregion
            int IsOk = DataFactory.DbUtils().Update(entity, "TableColumnsId");
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.UpdateTaskLog<BPMS_TableColumns>(oldEntity, entity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
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
            int IsOk = DataFactory.DbUtils().Delete("BPMS_TableColumns", "TableColumnsId", KeyValue);
            #region 写日操作日志
            if (IsOk > 0)
            {
                BPMS_SysLogDAL.Instance.DeleteTaskLog<BPMS_TableColumns>(oldEntity, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName);
            }
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 批量删除数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public int BatchDelete(string[] KeyValue)
        {
            return DataFactory.DbUtils().BatchDelete("BPMS_TableColumns", "TableColumnsId", KeyValue);
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <returns></returns>
        public BPMS_TableColumns GetEntity(string KeyValue)
        {
            return DataFactory.DbUtils().GetModelById<BPMS_TableColumns>("TableColumnsId", KeyValue);
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
            strSql.Append("SELECT * FROM BPMS_TableColumns WHERE 1=1");
            strSql.Append(where);
            strSql.Append(" Order BY SortCode");
            return DataFactory.SqlHelper().GetDataListBySQL<BPMS_TableColumns>(strSql, param);
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        /// <param name="orderField">排序字段</param>
        /// <param name="orderType">排序类型</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">页大小</param>
        /// <param name="count">总条数</param>
        /// <returns></returns>
        public IList GetPageList(string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            return this.GetPageListWhere(null, null, orderField, orderType, pageIndex, pageSize, ref  count);
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
        public IList GetPageListWhere(StringBuilder where, SqlParam[] param, string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM BPMS_TableColumns WHERE 1=1");
            strSql.Append(where);
            return DataFactory.SqlHelper().GetPageList<BPMS_TableColumns>(strSql.ToString(), param, CommonHelper.ToOrderField("SortCode", orderField), orderType, pageIndex, pageSize, ref count);
        }
        #endregion

        /// <summary>
        /// 设置表头定义批量公开
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="MenuId">模块菜单主键</param>
        /// <returns></returns>
        public int BatchIsPublic(string[] KeyValue, string MenuId)
        {
            StringBuilder[] sqls = new StringBuilder[KeyValue.Length + 1];
            object[] objs = new object[KeyValue.Length + 1];
            BPMS_TableColumns entity = new BPMS_TableColumns();
            entity.MenuId = MenuId;
            entity.IsPublic = 0;
            sqls[0] = DbCommon.UpdateSql(entity, "MenuId");
            objs[0] = DbCommon.GetParameter(entity);
            int index = 1;
            foreach (string item in KeyValue)
            {
                if (item.Length > 0)
                {
                    BPMS_TableColumns entityitem = new BPMS_TableColumns();
                    entityitem.TableColumnsId = item;
                    entityitem.IsPublic = 1;
                    entityitem.SortCode = index;
                    sqls[index] = DbCommon.UpdateSql(entityitem, "TableColumnsId");
                    objs[index] = DbCommon.GetParameter(entityitem);
                    index++;
                }
            }
            return DataFactory.SqlHelper().BatchExecuteBySql(sqls, objs);
        }
    }
}