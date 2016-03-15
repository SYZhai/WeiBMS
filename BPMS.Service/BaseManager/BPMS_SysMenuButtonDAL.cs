//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using DotNet.Utilities;
using BPMS.Entity;
using System.Collections;
using System.Text;
using BPMS.Service;
using System.Data;
using System;
using System.Threading;

namespace BPMS.Service
{
    /// <summary>
    /// 菜单导航操作按钮关系表
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.24</date>
    /// </author>
    /// </summary>
    public class BPMS_SysMenuButtonDAL
    {
        /// <summary>
        /// 获得数据列表(带条件)
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        public DataTable GetListWhere(StringBuilder where, SqlParam[] param)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  
                            B.ButtonId ,
                            B.FullName ,
                            B.Img ,
                            B.Category,
                            B.Description,
                            ISNULL(S.CreateDate,GETDATE()+1)  AS IsExist
                            FROM    BPMS_Button B
                            LEFT JOIN BPMS_SysMenuButton S ON B.ButtonId = S.ButtonId AND 1=1");
            strSql.Append(where);
            strSql.Append(" ORDER BY IsExist,S.SortCode ,B.SortCode");
            return DataFactory.SqlHelper().GetDataTableBySQL(strSql, param);
        }

        /// <summary>
        /// 设批量添加，菜单导航操作按钮关系
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="MenuId">模块菜单主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        public int BatchAddMenuButton(string[] KeyValue, string MenuId, string CreateUserId, string CreateUserName)
        {
            StringBuilder[] sqls = new StringBuilder[KeyValue.Length + 1];
            object[] objs = new object[KeyValue.Length + 1];
            sqls[0] = DbCommon.DeleteSql("BPMS_SysMenuButton", "MenuId");
            objs[0] = new SqlParam[] { new SqlParam("@MenuId", MenuId) };
            int index = 1;
            foreach (string item in KeyValue)
            {
                if (item.Length > 0)
                {
                    BPMS_SysMenuButton entity = new BPMS_SysMenuButton();
                    entity.SysMenuButtonId = CommonHelper.GetGuid;
                    entity.MenuId = MenuId;
                    entity.ButtonId = item;
                    entity.SortCode = index;
                    entity.CreateUserId = CreateUserId;
                    entity.CreateUserName = CreateUserName;
                    sqls[index] = DbCommon.InsertSql(entity);
                    objs[index] = DbCommon.GetParameter(entity);
                    index++;
                }
            }
            return DataFactory.SqlHelper().BatchExecuteBySql(sqls, objs);
        }
    }
}