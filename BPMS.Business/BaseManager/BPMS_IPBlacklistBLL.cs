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
using System;
using System.Net;
using System.Text.RegularExpressions;

namespace BPMS.Business
{
    /// <summary>
    /// IP黑名单
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.31</date>
    /// </author>
    /// </summary>
    public class BPMS_IPBlacklistBLL : BPMS_IPBlacklistIBLL
    {
        private readonly BPMS_IPBlacklistDAL dal = new BPMS_IPBlacklistDAL();

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
        /// 增加一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Insert(BPMS_IPBlacklist entity)
        {
            return dal.Insert(entity) >= 0 ? true : false;
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns></returns>
        public bool Update(BPMS_IPBlacklist entity)
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
        public BPMS_IPBlacklist GetEntity(string KeyValue)
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

        /// <summary>
        /// 登录系统IP限制，是否允许登录该系统
        /// </summary>
        /// <returns></returns>
        public bool TheIpIsRange(string ip)
        {
            bool IsOk = false;
            if (CommonHelper.GetBool(ConfigHelper.GetValue("CheckIPAddress")))
            {
                foreach (BPMS_IPBlacklist item in dal.GetIPBlacklist())
                {
                    long start = IP2Long(item.StartIp);
                    long end = IP2Long(item.EndIp);
                    long ipAddress = IP2Long(ip);
                    IsOk = (ipAddress >= start && ipAddress <= end);
                    if (IsOk)
                    {
                        throw new Exception(MessageHelper.MSG0030);
                    }
                }
            }
            else
            {
                IsOk = true;
            }
            return IsOk;
        }
        private long IP2Long(string ip)
        {
            string[] ipBytes;
            double num = 0;
            if (!string.IsNullOrEmpty(ip))
            {
                ipBytes = ip.Split('.');
                for (int i = ipBytes.Length - 1; i >= 0; i--)
                {
                    num += ((int.Parse(ipBytes[i]) % 256) * Math.Pow(256, (3 - i)));
                }
            }
            return (long)num;
        }
    }
}