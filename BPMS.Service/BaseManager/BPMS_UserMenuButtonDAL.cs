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
using System.Threading;
using System;

namespace BPMS.Service
{
    /// <summary>
    /// 用户菜单按钮关系
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.27</date>
    /// </author>
    /// </summary>
    public class BPMS_UserMenuButtonDAL
    {
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public DataTable GetList(string UserId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"SELECT  B.ButtonId ,
                                    B.FullName ,
                                    B.Img ,
                                    B.Description ,
                                    MB.MenuId ,
                                    B.Category ,
                                    UMB.UserMenuButtonId AS IsExist
                            FROM    BPMS_SysMenuButton MB
                                    LEFT JOIN BPMS_Button B ON B.ButtonId = MB.ButtonId
                                    LEFT JOIN BPMS_UserMenuButton UMB ON UMB.ButtonId = B.ButtonId
                            AND UMB.MenuId = MB.MenuId AND 1=1
							AND UMB.UserId = @UserId ");
            strSql.Append(" ORDER BY B.SortCode");
            SqlParam[] param = {
                                         new SqlParam("@UserId",UserId)};
            return DataFactory.SqlHelper().GetDataTableBySQL(strSql, param);
        }
        /// <summary>
        /// 分配用户按钮权限
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="UserId">用户主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        public int AddButtonPermission(string[] KeyValue, string UserId, string CreateUserId, string CreateUserName)
        {
            StringBuilder[] sqls = new StringBuilder[KeyValue.Length + 1];
            object[] objs = new object[KeyValue.Length + 1];
            sqls[0] = DbCommon.DeleteSql("BPMS_UserMenuButton", "UserId");
            objs[0] = new SqlParam[] { new SqlParam("@UserId", UserId) };
            int index = 1;
            foreach (string item in KeyValue)
            {
                if (item.Length > 0)
                {
                    Thread.Sleep(10);////延迟10毫秒
                    string[] stritem = item.Split('|');
                    BPMS_UserMenuButton entity = new BPMS_UserMenuButton();
                    entity.UserMenuButtonId = CommonHelper.GetGuid;
                    entity.UserId = UserId;
                    entity.ButtonId = stritem[0];
                    entity.MenuId = stritem[1];
                    entity.CreateDate = DateTime.Now;
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