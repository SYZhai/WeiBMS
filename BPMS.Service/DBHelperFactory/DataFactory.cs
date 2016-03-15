using DotNet.DataAccess;
using DotNet.Kernel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BPMS.Service
{
    /// <summary>
    /// 数据库服务工厂
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.05.28</date>
    /// </author>
    /// </summary>
    public class DataFactory
    {
        /// <summary>
        /// 当前数据库类型
        /// </summary>
        public static SqlSourceType DbType { get; set; }

        /// <summary>
        /// 获取指定的数据库连接
        /// </summary>
        /// <returns></returns>
        public static IDbHelper SqlHelper()
        {
            switch (DbType)
            {
                case SqlSourceType.SQLServer:
                    return SqlHelper(ConfigHelper.GetValue("SqlServer_BPMS"));
                case SqlSourceType.Oracle:
                    return SqlHelper(ConfigHelper.GetValue("Oracle_BPMS"));
                case SqlSourceType.MySql:
                    return SqlHelper(ConfigHelper.GetValue("MySql_BPMS"));
                default:
                    break;
            }
            return null;
        }
        /// <summary>
        /// 获取指定的数据库连接
        /// </summary>
        /// <param name="connectionString">链接字符串</param>
        /// <returns></returns>
        public static IDbHelper SqlHelper(string connectionString)
        {
            switch (DbType)
            {
                case SqlSourceType.SQLServer:
                    return new SqlServerHelper(connectionString);
                case SqlSourceType.Oracle:
                    return new OracleHelper(connectionString);
                case SqlSourceType.MySql:
                    return new MySqlHelper(connectionString);
                default:
                    break;
            }
            return null;
        }
        /// <summary>
        /// 公共方法操作 增、删、改、查
        /// </summary>
        /// <param name="connectionString">链接字符串</param>
        /// <returns></returns>
        public static IDbUtilities DbUtils(string connectionString = null)
        {
            if (!string.IsNullOrEmpty(connectionString))
            {
                return new DbUtilities(connectionString, DbType);
            }
            else
            {
                switch (DbType)
                {
                    case SqlSourceType.Oracle:
                        return new DbUtilities(ConfigHelper.GetValue("Oracle_BPMS"), DbType);
                    case SqlSourceType.SQLServer:
                        return new DbUtilities(ConfigHelper.GetValue("SqlServer_BPMS"), DbType);
                    case SqlSourceType.MySql:
                        return new DbUtilities(ConfigHelper.GetValue("MySql_BPMS"), DbType);
                    default:
                        break;
                }
            }
            return null;
        }
    }
}
