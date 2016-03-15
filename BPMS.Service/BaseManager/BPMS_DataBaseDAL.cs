using DotNet.Kernel;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;

namespace BPMS.Service
{
    /// <summary>
    /// 操作数据库
    /// </summary>
    public class BPMS_DataBaseDAL
    {
        #region 兼容 SQLServer
        /// <summary>
        /// 加载所有数据表
        /// </summary>
        /// <param name="DB">库名</param>
        /// <returns></returns>
        public DataTable InitDBName(string DB)
        {
            StringBuilder strSql = new StringBuilder(@"SELECT    ID = D.ID ,
                                                                    Field = CASE WHEN A.COLORDER = 1 THEN D.NAME
                                                                              ELSE ''
                                                                         END ,
                                                                    Remark = CASE WHEN A.COLORDER = 1 THEN ISNULL(F.VALUE, '')
                                                                              ELSE ''
                                                                         END ,
                                                                    ParentID = 0 ,
                                                                    colorder = 0
                                                          FROM      SYSCOLUMNS A
                                                                    LEFT JOIN SYSTYPES B ON A.XUSERTYPE = B.XUSERTYPE
                                                                    INNER JOIN SYSOBJECTS D ON A.ID = D.ID
                                                                                               AND D.XTYPE = 'U'
                                                                                               AND D.NAME <> 'DTPROPERTIES'
                                                                    LEFT JOIN sys.extended_properties F ON D.ID = F.major_id
                                                          WHERE     a.COLORDER = 1
                                                                    AND F.minor_id = 0");
            return DataFactory.SqlHelper().GetDataTableBySQL(strSql);
        }
        /// <summary>
        /// 获取某一个表的所有字段
        /// </summary>
        /// <param name="tableCode">查询指定表</param>
        /// <returns></returns>
        public DataTable GetSysColumns(string tableCode)
        {
            StringBuilder strSql = new StringBuilder();
            if (!string.IsNullOrEmpty(tableCode))
            {
                strSql.Append(@"SELECT
                             [number]=a.colorder,
                             [column] =a.name,
							 [datatype]=b.name,
							 [length]=COLUMNPROPERTY(a.id,a.name,'PRECISION'),
							 [identity]=case when COLUMNPROPERTY( a.id,a.name,'IsIdentity')=1 then '√'else '' end,
                             [key]=case when exists(SELECT 1 FROM sysobjects where xtype='PK' and parent_obj=a.id and name in (
                             SELECT name FROM sysindexes WHERE indid in(
                             SELECT indid FROM sysindexkeys WHERE id = a.id AND colid=a.colid
                             ))) then '√' else '' end,
                             [isnullable]=case when a.isnullable=1 then '√'else '' end,
                             [default]=isnull(e.text,''),
                             [remark]=isnull(g.[value],'')
                             FROM syscolumns a
                             left join systypes b on a.xusertype=b.xusertype
                             inner join sysobjects d on a.id=d.id  and d.xtype='U' and  d.name<>'dtproperties'
                             left join syscomments e on a.cdefault=e.id
                             left join sys.extended_properties g on a.id=g.major_id and a.colid=g.minor_id 
                             left join sys.extended_properties f on d.id=f.major_id and f.minor_id=0");
                strSql.Append("where d.name='" + tableCode + "' order by a.id,a.colorder");
                return DataFactory.SqlHelper().GetDataTableBySQL(strSql);
            }
            return null;
        }
        /// <summary>
        /// 获取表空间使用情况
        /// </summary>
        /// <returns></returns>
        public DataTable GetSpaceCase()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"DECLARE @TableInfo TABLE
                                (
                                  name VARCHAR(50) ,
                                  [rows] CHAR(11) ,
                                  reserved VARCHAR(50) ,
                                  data VARCHAR(50) ,
                                  index_size VARCHAR(50) ,
                                  unused VARCHAR(50)
                                )
                            DECLARE @TableName TABLE ( name VARCHAR(50) )
                            DECLARE @name VARCHAR(50)
                            INSERT  INTO @TableName
                                    ( name
                                    )
                                    SELECT  o.name
                                    FROM    sysobjects o ,
                                            sysindexes i
                                    WHERE   o.id = i.id
                                            AND o.Xtype = 'U'
                                            AND i.indid < 2
                                    ORDER BY i.rows DESC ,
                                            o.name
            
                            WHILE EXISTS ( SELECT   1
                                           FROM     @TableName ) 
                                BEGIN
                                    SELECT TOP 1
                                            @name = name
                                    FROM    @TableName 
                                    DELETE @TableName WHERE name=@name
                                    INSERT  INTO @TableInfo
                                            ( name ,
                                              [rows] ,
                                              reserved ,
                                              data ,
                                              index_size ,
                                              unused 
            	        
                                            )
                                            EXEC sys.sp_spaceused @name
                                END
            
                                    SELECT F.*,p.tdescription FROM @TableInfo F LEFT JOIN (
                                    SELECT  name = CASE WHEN A.COLORDER = 1 THEN D.NAME
                                                      ELSE ''
                                                 END ,
                                            tdescription = CASE WHEN A.COLORDER = 1 THEN ISNULL(F.VALUE, '')
                                                       ELSE ''
                                                  END
                                    FROM    SYSCOLUMNS A
                                            LEFT JOIN SYSTYPES B ON A.XUSERTYPE = B.XUSERTYPE
                                            INNER JOIN SYSOBJECTS D ON A.ID = D.ID
                                                                       AND D.XTYPE = 'U'
                                                                       AND D.NAME <> 'DTPROPERTIES'
                                            LEFT JOIN sys.extended_properties F ON D.ID = F.major_id 
                                    WHERE   a.COLORDER = 1
                                            AND F.minor_id = 0
            
                                    )P ON F.name=p.name");
            return DataFactory.SqlHelper().GetDataTableBySQL(strSql);
        }
        /// <summary>
        /// 备份数据库
        /// </summary>
        /// <param name="dbName">数据库文件名</param>
        /// <param name="dbFileName">路经包括盘符和文件名以及扩展名称一般为“_dat”</param>
        public int BackupDatabase(string dbName, string dbFileName)
        {
            string backupSql = "DUMP TRANSACTION {0} WITH NO_LOG; BACKUP DATABASE {0} to DISK ='{1}' ";
            backupSql = string.Format(backupSql, dbName, dbFileName);
            int IsOk = DataFactory.SqlHelper().ExecuteBySqlNotTran(new StringBuilder(backupSql), null);
            #region 写日操作日志
            BPMS_SysLogDAL.Instance.AddTaskLog(RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName, "备份数据库", "数据库备份成功，文件名：" + Path.GetFileNameWithoutExtension(dbFileName) + ".bak");
            #endregion
            return IsOk;
        }
        /// <summary>
        /// 恢复数据库
        /// </summary>
        /// <param name="dbName">数据库名</param>
        /// <param name="dbFileName">路经包括盘符和文件名以及扩展名称一般为“_dat”</param>
        public int RestoreDatabase(string dbName, string dbFileName)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("USE master ");
            strSql.Append("  GO  ");
            strSql.Append("restore database @dbName from disk='@dbFileName'  WITH REPLACE,RECOVERY");
            SqlParam[] param = {
                                         new SqlParam("@dbName",dbName),
                                         new SqlParam("@dbFileName",dbFileName)};
            return DataFactory.SqlHelper().ExecuteBySqlNotTran(strSql, param);
        }
        #endregion

        #region 兼容 Oracle
        #endregion

        #region 兼容 MySql
        #endregion
    }
}
