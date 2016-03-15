using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BPMS.Service
{
    /// <summary>
    /// LogOnHelper
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.19</date>
    /// </author>
    /// </summary>
    public class LogOnHelper
    {
        /// <summary>
        /// 用户是否已经登录了系统？
        /// </summary>
        /// <returns>是否登录</returns>
        public static bool UserIsLogOn()
        {
            // 加强安全验证防止未授权匿名调用
            if (!IsAuthorized())
            {
                throw new Exception(MessageHelper.MSG0028);
            }
            return true;
        }
        /// <summary>
        /// 验证用户是否是授权的用户
        /// 不是任何人都可以调用服务的，将来这里还可以进行扩展的
        /// 例如用IP地址限制等等
        /// 这里应该能抛出异常才可以
        /// </summary>
        /// <returns>验证成功</returns>
        public static bool IsAuthorized()
        {
            return true;
        }
    }
}
