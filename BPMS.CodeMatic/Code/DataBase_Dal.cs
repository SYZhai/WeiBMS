using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace BPMS.CodeMatic.Code
{
    /// <summary>
    /// 操作数据库
    /// </summary>
    public class DataBase_Dal
    {
        /// <summary>
        /// 加载所有数据库名称
        /// </summary>
        /// <param name="connectstring">链接字符串</param>
        /// <returns></returns>
        public DataTable InitDBName(string connectstring)
        {
            StringBuilder strSql = new StringBuilder("select name from sys.databases");
            return DataFactory.SqlHelper(connectstring).GetDataTableBySQL(strSql);
        }
        /// <summary>
        /// 加载所有数据表
        /// </summary>
        /// <param name="DB">库名</param>
        /// <param name="DBServerName">服务器地址</param>
        /// <param name="DBLoginName">用户</param>
        /// <param name="Password">密码</param>
        /// <returns></returns>
        public DataTable InitDBName(string DB, string DBServerName, string DBLoginName, string Password)
        {
            string connectstring = string.Format(" data source={0}; initial catalog=" + DB + ";user id={1};password={2}", DBServerName, DBLoginName, Password);
            StringBuilder strSql = new StringBuilder(@"( SELECT    ID = D.ID ,
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
                                                                    AND F.minor_id = 0
                                                        )
                                                        UNION
                                                        ( SELECT    0 AS ID ,
                                                                    Field = A.Name ,
                                                                    Remark = G.Value ,
                                                                    ParentID = D.id ,
                                                                    colorder = a.colorder
                                                          FROM      SYSCOLUMNS A
                                                                    LEFT JOIN SYSTYPES B ON A.XUSERTYPE = B.XUSERTYPE
                                                                    INNER JOIN SYSOBJECTS D ON A.ID = D.ID
                                                                                               AND D.XTYPE = 'U'
                                                                                               AND D.NAME <> 'DTPROPERTIES'
                                                                    LEFT JOIN sys.extended_properties G ON A.ID = G.major_id
                                                                                                           AND A.COLID = G.minor_id
                                                                    LEFT JOIN sys.extended_properties F ON D.ID = F.major_id
                                                                                                           AND F.minor_id = 0
                                                        ) ORDER BY ParentID ,colorder");
            return DataFactory.SqlHelper(connectstring.ToString()).GetDataTableBySQL(strSql);
        }
        /// <summary>
        /// 获取某一个表的所有字段
        /// </summary>
        /// <param name="tableCode">查询指定表</param>
        /// <param name="connectstring">链接字符串</param>
        /// <returns></returns>
        public DataTable GetSysColumns(string tableCode, string connectstring)
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
                return DataFactory.SqlHelper(connectstring).GetDataTableBySQL(strSql);
            }
            return null;
        }
        /// <summary>
        /// 获取某一个表的主键字段
        /// </summary>
        /// <param name="tableCode">查询指定表</param>
        /// <param name="connectstring">链接字符串</param>
        /// <returns></returns>
        public string GetPrimaryKeyColumns(string tableCode, string connectstring)
        {
            StringBuilder strSql = new StringBuilder();
            if (!string.IsNullOrEmpty(tableCode))
            {
                strSql.Append(@"  SELECT  a.name
                                                    FROM    SYSCOLUMNS A
                                                            INNER JOIN SYSOBJECTS D ON A.ID = D.ID
                                                              AND D.XTYPE = 'U'
                                                              AND D.NAME <> 'DTPROPERTIES'
                                                    WHERE   d.name = '" + tableCode + "' AND EXISTS ( SELECT 1  FROM SYSOBJECTS WHERE XTYPE = 'PK' AND PARENT_OBJ = A.ID AND NAME IN ( SELECT NAME FROM SYSINDEXES WHERE INDID IN ( SELECT INDID FROM SYSINDEXKEYS WHERE  ID = A.ID AND COLID = A.COLID ) ) )");
                DataTable dt = DataFactory.SqlHelper(connectstring).GetDataTableBySQL(strSql);
                return dt.Rows[0]["name"].ToString();
            }
            return "";
        }

    }
}