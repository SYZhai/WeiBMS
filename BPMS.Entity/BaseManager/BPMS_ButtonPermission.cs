using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BPMS.Entity
{
    /// <summary>
    /// 按钮权限
    /// </summary>
    public class BPMS_ButtonPermission
    {
        /// <summary>
        /// 用户主键
        /// </summary>
        public string UserId { get; set; }
        /// <summary>
        /// 模块主键
        /// </summary>
        public string MenuId { get; set; }
        /// <summary>
        /// 按钮主键
        /// </summary>
        public string ButtonId { get; set; }
        /// <summary>
        /// 按钮名称
        /// </summary>
        public string FullName { get; set; }
        /// <summary>
        /// 按钮图标
        /// </summary>
        public string Img { get; set; }
        /// <summary>
        /// 按钮事件
        /// </summary>
        public string Event { get; set; }
        /// <summary>
        /// 按钮控件ID
        /// </summary>
        public string Control_ID { get; set; }
        /// <summary>
        /// 按钮分类
        /// </summary>
        public string Category { get; set; }
        /// <summary>
        /// 是否分割
        /// </summary>
        public string Split { get; set; }
        /// <summary>
        /// 按钮描述
        /// </summary>
        public string Description { get; set; }
    }
}
