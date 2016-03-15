//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================
using System;
using System.Collections.Generic;
using System.Text;

namespace DotNet.Kernel
{
    /// <summary>
    /// 提交数据库错误信息
    /// 应用单件模式，保存状态
    /// 版本：2.0
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.09.27</date>
    /// </author>
    /// </summary>
    public class DbErrorMsg
    {
        public static string ReturnMsg { get; set; }
    }
}
