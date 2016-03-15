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
    /// 首页快捷功能
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.28</date>
    /// </author>
    /// </summary>
    public class BPMS_ShortcutBLL : BPMS_ShortcutIBLL
    {
        private readonly BPMS_ShortcutDAL dal = new BPMS_ShortcutDAL();

        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Insert(BPMS_Shortcut entity)
        {
            entity.ShortcutId = CommonHelper.GetGuid;
            return dal.Insert(entity) >= 0 ? true : false;
        }
        /// <summary>
        /// 删除一条数据
        /// </summary>
        /// <param name="KeyValue">主键</param>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public bool Delete(string KeyValue, string UserId)
        {
            return dal.Delete(KeyValue, UserId) >= 0 ? true : false;
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public IList GetList(string UserId)
        {
            return dal.GetList(UserId);
        }
    }
}