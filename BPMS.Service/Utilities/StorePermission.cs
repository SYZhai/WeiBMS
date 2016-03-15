using DotNet.Kernel;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BPMS.Service
{
    /// <summary>
    /// 使用服务器缓存 - 存储权限
    /// </summary>
    public class StorePermission
    {
        private readonly BPMS_PermissionDAL dal = new BPMS_PermissionDAL();

        private static StorePermission item;
        public static StorePermission Instance
        {
            get
            {
                if (item == null)
                {
                    item = new StorePermission();
                }
                return item;
            }
        }
        /// <summary>
        /// 将【模块权限】保存在服务器缓存中，提高性能。这样就不用每次去数据库读
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <param name="list"></param>
        /// <returns></returns>
        public void SetModulePermission(string UserId, IList list)
        {
            CacheHelper.Insert("Module" + UserId, list);
        }
        /// <summary>
        /// 将【操作按钮权限】保存在服务器缓存中，提高性能。这样就不用每次去数据库读
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <param name="list"></param>
        /// <returns></returns>
        public void SetButtonPermission(string UserId, IList list)
        {
            CacheHelper.Insert("Button" + UserId, list);
        }
        /// <summary>
        /// 将【数据权限】保存在服务器缓存中，提高性能。这样就不用每次去数据库读
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <param name="ht"></param>
        /// <returns></returns>
        public void SetDataPermission(string UserId, Hashtable ht)
        {
            CacheHelper.Insert("Data" + UserId, ht);
        }



        /// <summary>
        /// 获取【模块权限】在服务器缓存中，提高性能。这样就不用每次去数据库读
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <param name="list"></param>
        /// <returns></returns>
        public object GetModulePermission(string UserId)
        {
            string strKey = "Module" + UserId;
            if (!CacheHelper.IsExist(strKey))
            {
                if (UserId == ConfigHelper.GetValue("CurrentUserName")) //判断超级管理员
                {
                    this.SetModulePermission(UserId, dal.GetModulePermission());
                }
                else
                {
                    this.SetModulePermission(UserId, dal.GetModulePermission(UserId));
                }
            }
            return CacheHelper.GetCache(strKey);
        }
        /// <summary>
        /// 获取【操作按钮权限】在服务器缓存中，提高性能。这样就不用每次去数据库读
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <param name="list"></param>
        /// <returns></returns>
        public object GetButtonPermission(string UserId)
        {
            string strKey = "Button" + UserId;
            if (!CacheHelper.IsExist(strKey))
            {
                if (UserId == ConfigHelper.GetValue("CurrentUserName")) //判断超级管理员
                {
                    this.SetButtonPermission(UserId, dal.GetButtonPermission());
                }
                else
                {
                    this.SetButtonPermission(UserId, dal.GetButtonPermission(UserId));
                }
            }
            return CacheHelper.GetCache(strKey);
        }
        /// <summary>
        /// 获取【数据权限】在服务器缓存中，提高性能。这样就不用每次去数据库读
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <param name="list"></param>
        /// <returns></returns>
        public object GetDataPermission(string UserId)
        {
            string strKey = "Data" + UserId;
            if (!CacheHelper.IsExist(strKey))
            {
                if (UserId == ConfigHelper.GetValue("CurrentUserName")) //判断超级管理员
                {
                    this.SetDataPermission(UserId, new Hashtable());
                }
                else
                {
                    this.SetDataPermission(UserId, dal.GetDataPermission(UserId));
                }
            }
            return CacheHelper.GetCache(strKey);
        }
    }
}
