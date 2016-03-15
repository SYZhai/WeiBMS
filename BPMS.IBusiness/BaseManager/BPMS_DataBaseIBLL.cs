using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace BPMS.IBusiness
{
    /// <summary>
    /// 操作数据库
    /// </summary>
    public interface BPMS_DataBaseIBLL
    {
        /// <summary>
        /// 加载所有数据表
        /// </summary>
        /// <param name="DB">库名</param>
        /// <returns></returns>
        DataTable InitDBName(string DB);
        /// <summary>
        /// 获取某一个表的所有字段
        /// </summary>
        /// <param name="tableCode">查询指定表</param>
        /// <returns></returns>
        DataTable GetSysColumns(string tableCode);
        /// <summary>
        /// 获取表空间使用情况
        /// </summary>
        /// <returns></returns>
        DataTable GetSpaceCase();
        /// <summary>
        /// 备份数据库
        /// </summary>
        /// <param name="dbName">数据库文件名</param>
        /// <param name="dbFileName">路经包括盘符和文件名以及扩展名称一般为“_dat”</param>
        bool BackupDatabase(string dbName, string dbFileName);
        /// <summary>
        /// 恢复数据库
        /// </summary>
        /// <param name="dbName">数据库名</param>
        /// <param name="dbFileName">路经包括盘符和文件名以及扩展名称一般为“_dat”</param>
        bool RestoreDatabase(string dbName, string dbFileName);
    }
}
