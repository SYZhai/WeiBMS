//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================
using DotNet.Kernel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DotNet.DataAccess
{
    /// <summary>
    /// 增、删、改、查 操作
    /// 版本：2.0
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.09.27</date>
    /// </author>
    /// </summary>
    public class DbUtilities : IDbUtilities
    {
        /// <summary>
        /// 当前数据库类型
        /// </summary>
        public SqlSourceType SqlSourceType { get; set; }
        private IDbHelper db = null;
        /// <summary>
        /// 链接数据库实例
        /// </summary>
        /// <returns></returns>
        public IDbHelper GetInstance()
        {
            if (db == null)
            {
                switch (SqlSourceType)
                {
                    case SqlSourceType.Oracle:
                        return db = new OracleHelper(connectionString);
                    case SqlSourceType.SQLServer:
                        return db = new SqlServerHelper(connectionString);
                    case SqlSourceType.MySql:
                        return db = new MySqlHelper(connectionString);
                    case SqlSourceType.Access:
                        break;
                    case SqlSourceType.SqLite:
                        break;
                    default:
                        break;
                }
            }
            else
            {
                return db;
            }
            return null;
        }
        /// <summary>
        /// 数据库连接字符串
        /// </summary>
        protected string connectionString = "";
        /// <summary>
        /// 构造方法
        /// </summary>
        /// <param name="connString">数据库连接字符串</param>
        /// <param name="type">数据库软件类型</param>
        public DbUtilities(string connString, SqlSourceType type)
        {
            connectionString = connString;
            SqlSourceType = type;
        }

        #region GetObject
        /// <summary>
        /// 根据唯一ID获取对象,返回Hashtable
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="pkName">字段主键</param>
        /// <param name="pkVal">字段值</param>
        /// <returns>返回Hashtable</returns>
        public Hashtable GetHashtableById(string tableName, string pkName, string pkVal)
        {
            this.GetInstance();
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT * FROM ").Append(tableName).Append(" Where ").Append(pkName).Append("=" + DbCommon.ParamKey + "ID");
            return DbCommon.DataTableToHashtable(db.GetDataTableBySQL(sb, new SqlParam[] { new SqlParam("" + DbCommon.ParamKey + "ID", pkVal) }));
        }
        /// <summary>
        /// 根据唯一ID获取对象,返回Hashtable
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="ht">参数</param>
        /// <returns>返回Hashtable</returns>
        public Hashtable GetHashtableById(string tableName, Hashtable ht)
        {
            this.GetInstance();
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM " + tableName + " WHERE 1=1");
            foreach (string key in ht.Keys)
            {
                strSql.Append(" AND " + key + " = " + DbCommon.ParamKey + "" + key + "");
            }
            return DbCommon.DataTableToHashtable(db.GetDataTableBySQL(strSql, DbCommon.GetParameter(ht)));
        }
        /// <summary>
        /// 根据唯一ID获取对象,返回Hashtable
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns>返回Hashtable</returns>
        public Hashtable GetHashtableById(string tableName, StringBuilder where, SqlParam[] param)
        {
            this.GetInstance();
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM " + tableName + " WHERE 1=1");
            strSql.Append(where);
            return DbCommon.DataTableToHashtable(db.GetDataTableBySQL(strSql, param));
        }
        /// <summary>
        /// 根据唯一ID获取对象,返回实体
        /// </summary>
        /// <param name="pkName">字段主键</param>
        /// <param name="pkVal">字段值</param>
        /// <returns>返回实体类</returns>
        public T GetModelById<T>(string pkName, string pkVal)
        {
            if (string.IsNullOrEmpty(pkVal))
            {
                return default(T);
            }
            this.GetInstance();
            T model = Activator.CreateInstance<T>();
            Type type = model.GetType();
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT * FROM ").Append(type.Name).Append(" Where ").Append(pkName).Append("=" + DbCommon.ParamKey + "ID");
            DataTable dt = db.GetDataTableBySQL(sb, new SqlParam[] { new SqlParam("" + DbCommon.ParamKey + "ID", pkVal) });
            if (dt.Rows.Count > 0)
            {
                return DbReader.ReaderToModel<T>(dt.Rows[0]);
            }
            return model;
        }
        /// <summary>
        /// 根据唯一ID获取对象,返回实体
        /// </summary>
        /// <param name="ht">参数</param>
        /// <returns>返回实体类</returns>
        public T GetModelById<T>(Hashtable ht)
        {
            this.GetInstance();
            T model = Activator.CreateInstance<T>();
            Type type = model.GetType();
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM " + type.Name + " WHERE 1=1");
            foreach (string key in ht.Keys)
            {
                strSql.Append(" AND " + key + " = " + DbCommon.ParamKey + "" + key + "");
            }
            DataTable dt = db.GetDataTableBySQL(strSql, DbCommon.GetParameter(ht));
            if (dt.Rows.Count > 0)
            {
                return DbReader.ReaderToModel<T>(dt.Rows[0]);
            }
            return model;
        }
        /// <summary>
        /// 根据唯一ID获取对象,返回实体
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns>返回实体类</returns>
        public T GetModelById<T>(StringBuilder where, SqlParam[] param)
        {
            this.GetInstance();
            T model = Activator.CreateInstance<T>();
            Type type = model.GetType();
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM " + type.Name + " WHERE 1=1");
            strSql.Append(where);
            DataTable dt = db.GetDataTableBySQL(strSql, param);
            if (dt.Rows.Count > 0)
            {
                return DbReader.ReaderToModel<T>(dt.Rows[0]);
            }
            return model;
        }
        #endregion

        #region RecordCount
        /// <summary>
        /// 影响行数
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="pkName">字段主键</param>
        /// <param name="pkVal">字段值</param>
        /// <returns>返回数量</returns>
        public int RecordCount(string tableName, string pkName, string pkVal)
        {
            this.GetInstance();
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT Count(1) FROM " + tableName + "");
            strSql.Append(" where " + pkName + " = " + DbCommon.ParamKey + pkName);
            SqlParam[] param = {
                                         new SqlParam(DbCommon.ParamKey+pkName+"",pkVal)};
            return DbCommon.GetInt(db.GetObjectValue(strSql, param));
        }
        /// <summary>
        /// 影响行数
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="ht">参数</param>
        /// <returns>返回数量</returns>
        public int RecordCount(string tableName, Hashtable ht)
        {
            this.GetInstance();
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT Count(1) FROM " + tableName + " WHERE 1=1");
            foreach (string key in ht.Keys)
            {
                strSql.Append(" AND " + key + " = " + DbCommon.ParamKey + "" + key + "");
            }
            return DbCommon.GetInt(db.GetObjectValue(strSql, DbCommon.GetParameter(ht)));
        }
        /// <summary>
        /// 影响行数
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns>返回数量</returns>
        public int RecordCount(string tableName, StringBuilder where, SqlParam[] param)
        {
            this.GetInstance();
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT Count(1) FROM " + tableName + " WHERE 1=1");
            strSql.Append(where);
            return DbCommon.GetInt(db.GetObjectValue(strSql, param));
        }
        #endregion

        #region GetMax
        /// <summary>
        /// 获取最大编号
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="pkName">字段</param>
        /// <returns></returns>
        public object GetMax(string tableName, string pkName)
        {
            this.GetInstance();
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT MAX(" + pkName + ") FROM " + tableName + "");
            object obj = db.GetObjectValue(strSql);
            if (!string.IsNullOrEmpty(obj.ToString()))
            {
                return Convert.ToInt32(obj) + 1;
            }
            return 1;
        }
        #endregion

        #region Insert
        /// <summary>
        /// 通过Hashtable插入数据
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="ht">Hashtable</param>
        /// <returns>int</returns>
        public int Insert(string tableName, Hashtable ht)
        {
            this.GetInstance();
            return db.ExecuteBySql(DbCommon.InsertSql(tableName, ht), DbCommon.GetParameter(ht));
        }
        /// <summary>
        /// 通过实体类插入数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns>int</returns>
        public int Insert<T>(T entity)
        {
            this.GetInstance();
            return db.ExecuteBySql(DbCommon.InsertSql(entity), DbCommon.GetParameter(entity));
        }
        #endregion

        #region Update
        /// <summary>
        /// 通过Hashtable修改数据
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="pkName">字段主键</param>
        /// <param name="pkValue"></param>
        /// <param name="ht">Hashtable</param>
        /// <returns>int</returns>
        public int Update(string tableName, string pkName, string pkVal, Hashtable ht)
        {
            ht[pkName] = pkVal;
            this.GetInstance();
            return db.ExecuteBySql(DbCommon.UpdateSql(tableName, pkName, ht), DbCommon.GetParameter(ht));
        }
        /// <summary>
        /// 通过实体类修改数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <param name="key">主键</param>
        /// <returns></returns>
        public int Update<T>(T entity, string key)
        {
            this.GetInstance();
            return db.ExecuteBySql(DbCommon.UpdateSql(entity, key), DbCommon.GetParameter(entity));
        }
        #endregion

        #region Delete
        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="pkName">字段主键</param>
        /// <param name="pkVal">字段值</param>
        /// <returns></returns>
        public int Delete(string tableName, string pkName, string pkVal)
        {
            this.GetInstance();
            return db.ExecuteBySql(DbCommon.DeleteSql(tableName, pkName), new SqlParam[] { new SqlParam(DbCommon.ParamKey + pkName, pkVal) });
        }
        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="pkName">字段主键</param>
        /// <param name="pkVal">字段值</param>
        /// <returns></returns>
        public int BatchDelete(string tableName, string pkName, object[] pkValues)
        {
            this.GetInstance();
            SqlParam[] param = new SqlParam[pkValues.Length];
            int index = 0;
            string str = DbCommon.ParamKey + "ID" + index;
            StringBuilder sql = new StringBuilder("DELETE FROM " + tableName + " WHERE " + pkName + " IN (");
            for (int i = 0; i < (param.Length - 1); i++)
            {
                object obj2 = pkValues[i];
                str = DbCommon.ParamKey + "ID" + index;
                sql.Append(str).Append(",");
                param[index] = new SqlParam(str, obj2);
                index++;
            }
            str = DbCommon.ParamKey + "ID" + index;
            sql.Append(str);
            param[index] = new SqlParam(str, pkValues[index]);
            sql.Append(")");
            return db.ExecuteBySql(sql, param);
        }
        #endregion
    }
}
