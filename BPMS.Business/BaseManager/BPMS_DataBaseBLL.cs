using BPMS.IBusiness;
using BPMS.Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace BPMS.Business
{
    /// <summary>
    /// 操作数据库
    /// </summary>
    public class BPMS_DataBaseBLL : BPMS_DataBaseIBLL
    {
        private readonly BPMS_DataBaseDAL dal = new BPMS_DataBaseDAL();

        /// <summary>
        /// 加载所有数据表
        /// </summary>
        /// <param name="DB">库名</param>
        /// <returns></returns>
        public DataTable InitDBName(string DB)
        {
            return dal.InitDBName(DB);
        }
        /// <summary>
        /// 获取某一个表的所有字段
        /// </summary>
        /// <param name="tableCode">查询指定表</param>
        /// <returns></returns>
        public DataTable GetSysColumns(string tableCode)
        {
            return dal.GetSysColumns(tableCode);
        }
        /// <summary>
        /// 获取表空间使用情况
        /// </summary>
        /// <returns></returns>
        public DataTable GetSpaceCase()
        {
            return dal.GetSpaceCase();
        }
        /// <summary>
        /// 备份数据库
        /// </summary>
        /// <param name="dbName">数据库文件名</param>
        /// <param name="dbFileName">路经包括盘符和文件名以及扩展名称一般为“_dat”</param>
        public bool BackupDatabase(string dbName, string dbFileName)
        {
            dal.BackupDatabase(dbName, dbFileName);
            return true;
        }

        /// <summary>
        /// 恢复数据库
        /// </summary>
        /// <param name="dbName">数据库名</param>
        /// <param name="dbFileName">路经包括盘符和文件名以及扩展名称一般为“_dat”</param>
        public bool RestoreDatabase(string dbName, string dbFileName)
        {
            return dal.RestoreDatabase(dbName, dbFileName) >= 0 ? true : false;
        }
    }
}
