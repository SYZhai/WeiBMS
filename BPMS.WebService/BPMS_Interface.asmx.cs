using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace BPMS.WebService
{
    /// <summary>
    /// 权限系统开放给外部系统公共接口
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    // [System.Web.Script.Services.ScriptService]
    public class BPMS_Interface : System.Web.Services.WebService
    {
        BPMS_PermissionIBLL bpms_permissionibll = new BPMS_PermissionBLL();
        BPMS_InterfaceAccessIBLL bpms_interfaceaccessibll = new BPMS_InterfaceAccessBLL();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        #region 权限接口
        /// <summary>
        /// 模块菜单权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        [WebMethod(EnableSession = true, Description = "获取模块菜单权限（返回JSON格式），参数 UserId:用户主键")]
        public string GetModulePermission(string UserId)
        {
            //验证是否有权访问    
            if (!bpms_interfaceaccessibll.IsEnabled(UserId))
            {
                return MessageHelper.MSG0027;
            }
            IList ModulePermissionList = bpms_permissionibll.GetModulePermission(UserId);
            return JsonHelper.ListToJson<BPMS_ModulePermission>(ModulePermissionList, "BPMS");
        }
        /// <summary>
        /// 操作按钮权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        [WebMethod(EnableSession = true, Description = "操作按钮权限（返回JSON格式），参数 UserId:用户主键")]
        public string GetButtonPermission(string UserId)
        {
            //验证是否有权访问    
            if (!bpms_interfaceaccessibll.IsEnabled(UserId))
            {
                return MessageHelper.MSG0027;
            }
            IList ButtonPermissionList = bpms_permissionibll.GetButtonPermission(UserId);
            return JsonHelper.ListToJson<BPMS_ButtonPermission>(ButtonPermissionList, "BPMS");
        }
        /// <summary>
        /// 角色数据权限
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        [WebMethod(EnableSession = true, Description = "角色数据权限（返回XML格式），参数 UserId:用户主键")]
        public string GetDataPermission(string UserId)
        {
            //验证是否有权访问    
            if (!bpms_interfaceaccessibll.IsEnabled(UserId))
            {
                return MessageHelper.MSG0027;
            }
            Hashtable DataPermissionList = bpms_permissionibll.GetDataPermission(UserId);
            return HashtableHelper.HashtableToXml(DataPermissionList);
        }
        #endregion

    }
}
