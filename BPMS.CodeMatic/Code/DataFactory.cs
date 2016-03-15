using DotNet.DataAccess;
using DotNet.Kernel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BPMS.CodeMatic.Code
{
    /// <summary>
    /// 连接数据库服务工厂
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.05.28</date>
    /// </author>
    /// </summary>
    /// </summary>
    public class DataFactory
    {
        #region SqlServer-有关数据库连接的方法
        /// <summary>
        /// 获取SqlServer指定的数据库连接
        /// </summary>
        /// <returns></returns>
        public static IDbHelper SqlHelper()
        {
            return new SqlServerHelper(ConfigHelper.GetValue("SqlServer_BPMS_DB"));
        }
        /// <summary>
        /// 获取SqlServer指定的数据库连接
        /// </summary>
        /// <param name="connectionString">链接字符串</param>
        /// <returns></returns>
        public static IDbHelper SqlHelper(string connectionString)
        {
            return new SqlServerHelper(connectionString);
        }
        /// <summary>
        /// SqlServer公共方法操作 增、删、改、查
        /// </summary>
        /// <returns></returns>
        public static IDbUtilities DbUtils()
        {
            return new DbUtilities(ConfigHelper.GetValue("SqlServer_BPMS_DB"), SqlSourceType.SQLServer);
        }
        /// <summary>
        /// SqlServer公共方法操作 增、删、改、查
        /// </summary>
        /// <param name="connectionString">链接字符串</param>
        /// <returns></returns>
        public static IDbUtilities DbUtils(string connectionString)
        {
            return new DbUtilities(connectionString, SqlSourceType.SQLServer);
        }
        #endregion
    }
}
