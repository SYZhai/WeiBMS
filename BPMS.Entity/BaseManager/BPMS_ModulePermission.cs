using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BPMS.Entity
{
    /// <summary>
    /// 模块（菜单）权限
    /// </summary>
    public class BPMS_ModulePermission
    {
        /// <summary>
        /// 用户主键
        /// </summary>
        public string UserId { get; set; }
        /// <summary>
        /// 模块菜单主键
        /// </summary>
        public string MenuId { get; set; }
        /// <summary>
        /// 父节点
        /// </summary>
        public string ParentId { get; set; }
        /// <summary>
        /// 模块菜单名称
        /// </summary>
        public string FullName { get; set; }
        /// <summary>
        /// 描述
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// 图标
        /// </summary>
        public string Img { get; set; }
        /// <summary>
        /// 链接WEB URL
        /// </summary>
        public string NavigateUrl { get; set; }
        /// <summary>
        /// Winfrom 链接地址
        /// </summary>
        public string FormName { get; set; }
        /// <summary>
        /// 链接目标
        /// </summary>
        public string Target { get; set; }
        /// <summary>
        /// 是否展开
        /// </summary>
        public string IsUnfold { get; set; }
    }
}
