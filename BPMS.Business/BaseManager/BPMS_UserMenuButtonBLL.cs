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
using System.Data;

namespace BPMS.Business
{
    /// <summary>
    /// 用户菜单按钮关系
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.27</date>
    /// </author>
    /// </summary>
    public class BPMS_UserMenuButtonBLL : BPMS_UserMenuButtonIBLL
    {
        private readonly BPMS_UserMenuButtonDAL dal = new BPMS_UserMenuButtonDAL();

        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public DataTable GetList(string UserId)
        {
            return dal.GetList(UserId);
        }
        /// <summary>
        /// 分配用户按钮权限
        /// </summary>
        /// <param name="KeyValue">主键值</param>
        /// <param name="UserId">用户主键</param>
        /// <param name="CreateUserId">操作用户主键</param>
        /// <param name="CreateUserName">操作用户</param>
        /// <returns></returns>
        public bool AddButtonPermission(string[] KeyValue, string UserId, string CreateUserId, string CreateUserName)
        {
            return dal.AddButtonPermission(KeyValue, UserId, CreateUserId, CreateUserName) >= 0 ? true : false;
        }
    }
}