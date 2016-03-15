using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace BPMS.WCFLibrary
{
    /// <summary>
    /// WCF服务
    /// 版本：1.0
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.02</date>
    /// </author>
    /// </summary>
    [ServiceContract]
    public interface IWCFService
    {
        #region 权限接口
        /// <summary>
        /// 模块菜单权限（返回JSON格式）
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        [OperationContract]
        string GetModulePermission(string UserId);
        /// <summary>
        /// 操作按钮权限（返回JSON格式）
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        [OperationContract]
        string GetButtonPermission(string UserId);
        /// <summary>
        /// 角色数据权限（返回JSON格式）
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        [OperationContract]
        string GetDataPermission(string UserId);
        #endregion

        #region 动态接口
        /// <summary>
        /// 业务接口调用
        /// </summary>
        /// <param name="Xml">XML格式</param>
        /// <param name="DeviceMark">设备号</param>
        /// <param name="Token">记号</param>
        /// <returns></returns>
        [OperationContract]
        string Invoke(string Xml, string DeviceMark, string Token);
        #endregion
    }
}
