using DotNet.Kernel;
//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SQLite;
using System.Linq;
using System.Text;

namespace DotNet.DataAccess
{
    /// <summary>
    /// 有关数据库连接的方法
    /// 版本：2.0
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.09.27</date>
    /// </author>
    /// </summary>
    public class SQLiteHelper
    {
        #region 数据库连接必要条件参数
        /// <summary>
        /// 数据库连接字符串
        /// </summary>
        protected string connectionString = "";
        /// <summary>
        /// 构造方法
        /// </summary>
        /// <param name="connString">数据库连接字符串</param>
        public SQLiteHelper(string connString)
        {
            DbCommon.ParamKey = "@";
            DbCommon.PlusSign = "+";
            DbCommon.GetDBNow = "GETDATE()";
            connectionString = connString;
            new SqlSourceType();
        }
        /// <summary>
        /// 当前数据库类型
        /// </summary>
        public SqlSourceType SqlSourceType
        {
            get
            {
                return SqlSourceType.MySql;
            }
        }
        private static Object locker = new Object();
        private SQLiteConnection db = null;
        /// <summary>
        /// 取得单身实例
        /// </summary>
        public SQLiteConnection GetInstance()
        {
            //在并发时，使用单一对象
            if (db == null)
            {
                return db = new SQLiteConnection(connectionString);
            }
            else
            {
                lock (locker)
                {
                    return db;
                }
            }
        }
        /// <summary>
        /// 超时时间
        /// </summary>
        public int CommandTimeOut = 600;
        // 是否已在事务之中
        private bool inTransaction = false;
        /// <summary>
        /// 是否已采用事务
        /// </summary>
        public bool InTransaction
        {
            get
            {
                return this.inTransaction;
            }

            set
            {
                this.inTransaction = value;
            }
        }
        #endregion

        #region 根据SQL返回影响行数
        /// <summary>
        /// 根据SQL返回影响行数
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns></returns>
        public object GetObjectValue(StringBuilder sql)
        {
            return this.GetObjectValue(sql, null);
        }
        /// <summary>
        /// 根据SQL返回影响行数,带参数
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        public object GetObjectValue(StringBuilder sql, SqlParam[] param)
        {
            object result = null;
            //创建连接
            SQLiteConnection conn = this.GetInstance();
            //创建指令
            SQLiteCommand cmd = new SQLiteCommand(sql.ToString(), conn);
            cmd.Parameters.AddRange(param);
            try
            {
                //打开连接
                conn.Open();
                result = cmd.ExecuteScalar();
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return result;
        }
        #endregion

        #region 根据SQL执行
        /// <summary>
        ///  根据SQL执行
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns>object</returns>
        public int ExecuteBySql(StringBuilder sql)
        {
            return this.ExecuteBySql(sql, null);
        }
        /// <summary>
        ///  根据SQL执行,带参数
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <param name="param">参数化</param>
        /// <returns>object</returns>
        public int ExecuteBySql(StringBuilder sql, SqlParam[] param)
        {
            int num = 0;
            //创建连接
            SQLiteConnection conn = this.GetInstance();
            //创建指令
            SQLiteCommand cmd = new SQLiteCommand(sql.ToString(), conn);
            cmd.Parameters.AddRange(param);
            try
            {
                conn.Open();
                SQLiteTransaction DbTrans = conn.BeginTransaction();
                try
                {
                    cmd.Transaction = DbTrans;
                    num = cmd.ExecuteNonQuery();
                    DbTrans.Commit();
                }
                catch (Exception e)
                {
                    DbTrans.Rollback();
                    num = -1;
                    DbLog.WriteException(e);
                }
                finally
                {
                    conn.Close();
                    conn.Dispose();
                }
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return num;
        }
        /// <summary>
        /// 批量执行SQL语句
        /// </summary>
        /// <param name="sqls">sql语句</param>
        /// <param name="m_param">参数化</param>
        /// <returns></returns>
        public int BatchExecuteBySql(object[] sqls, object[] param)
        {
            int num = 0;
            try
            {
                using (SQLiteConnection conn = this.GetInstance())
                {
                    conn.Open();
                    SQLiteTransaction DbTrans = conn.BeginTransaction();
                    try
                    {
                        for (int i = 0; i < sqls.Length; i++)
                        {
                            StringBuilder builder = (StringBuilder)sqls[i];
                            if (builder != null)
                            {
                                SqlParam[] paramArray = (SqlParam[])param[i];
                                //创建指令
                                SQLiteCommand cmd = new SQLiteCommand(builder.ToString(), conn);
                                cmd.Parameters.AddRange(param);
                                cmd.Transaction = DbTrans;
                                cmd.ExecuteNonQuery();
                            }
                        }
                        DbTrans.Commit();
                        num = 1;
                    }
                    catch (Exception e)
                    {
                        num = -1;
                        DbTrans.Rollback();
                        DbLog.WriteException(e);
                    }
                    finally
                    {
                        conn.Close();
                        conn.Dispose();
                    }
                }
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
            }
            return num;
        }
        #endregion

        #region 根据 SQL 返回 DataTable 数据集
        /// <summary>
        /// 根据 SQL 返回 DataTable 数据集
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns>DataTable</returns>
        public DataTable GetDataTableBySQL(StringBuilder sql)
        {
            return this.GetDataTableBySQL(sql, null);
        }
        /// <summary>
        /// 根据 SQL 返回 DataTable 数据集，带参数
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <param name="param">参数化</param>
        /// <returns>DataTable</returns>
        public DataTable GetDataTableBySQL(StringBuilder sql, SqlParam[] param)
        {
            try
            {
                return DbReader.ReaderToDataTable(GetIDataReaderBySql(sql, param));
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
                return null;
            }
        }
        /// <summary>
        /// 摘要:
        ///     执行一存储过程DataTable
        /// 参数：
        ///     procName：存储过程名称
        ///     Hashtable：传入参数字段名
        /// </summary>
        public DataTable GetDataTableProc(string procName, Hashtable ht)
        {
            try
            {
                using (SQLiteConnection conn = this.GetInstance())
                {
                    SQLiteCommand cmd = new SQLiteCommand(procName, conn);
                    try
                    {
                        cmd.CommandTimeout = CommandTimeOut;
                        cmd.CommandType = CommandType.StoredProcedure;
                        //创建适配器
                        SQLiteDataAdapter da = new SQLiteDataAdapter();
                        //给变量赋值
                        da.SelectCommand.Parameters.AddRange(DbCommon.GetParameter(ht));
                        da.SelectCommand = cmd;
                        //填充数据
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        return ds.Tables[0];
                    }
                    catch
                    {
                        return null;
                    }
                    finally
                    {
                        cmd.Dispose();
                        conn.Close();
                        conn.Dispose();
                    }
                }
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
                return null;
            }
        }
        #endregion

        #region 根据 SQL 返回 DataSet 数据集
        /// <summary>
        /// 根据 SQL 返回 DataSet 数据集
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns>DataSet</returns>
        public DataSet GetDataSetBySQL(StringBuilder sql)
        {
            return GetDataSetBySQL(sql, null);
        }
        /// <summary>
        /// 根据 SQL 返回 DataSet 数据集，带参数
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <param name="param">参数化</param>
        /// <returns>DataSet</returns>
        public DataSet GetDataSetBySQL(StringBuilder sql, SqlParam[] param)
        {
            try
            {
                //创建连接
                SQLiteConnection conn = this.GetInstance();
                //创建适配器
                SQLiteDataAdapter da = new SQLiteDataAdapter(sql.ToString(), conn);
                //给变量赋值
                da.SelectCommand.Parameters.AddRange(param);
                //填充数据
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
                return null;
            }
        }
        /// <summary>
        /// 摘要:
        ///     执行一存储过程DataSet
        /// 参数：
        ///     procName：存储过程名称
        ///     Hashtable：传入参数字段名
        /// </summary>
        public DataSet GetDataSetProc(string procName, Hashtable ht)
        {
            try
            {
                using (SQLiteConnection conn = this.GetInstance())
                {
                    SQLiteCommand cmd = new SQLiteCommand(procName, conn);
                    try
                    {
                        cmd.CommandTimeout = CommandTimeOut;
                        cmd.CommandType = CommandType.StoredProcedure;
                        //创建适配器
                        SQLiteDataAdapter da = new SQLiteDataAdapter();
                        //给变量赋值
                        da.SelectCommand.Parameters.AddRange(DbCommon.GetParameter(ht));
                        da.SelectCommand = cmd;
                        //填充数据
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        return ds;
                    }
                    catch
                    {
                        return null;
                    }
                    finally
                    {
                        cmd.Dispose();
                        conn.Close();
                        conn.Dispose();
                    }
                }
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
                return null;
            }
        }
        #endregion

        #region 根据 SQL 返回 IList
        /// <summary>
        /// 根据 SQL 返回 IList
        /// </summary>
        /// <typeparam name="T">实体类</typeparam>
        /// <param name="sql">语句</param>
        /// <returns></returns>
        public IList GetDataListBySQL<T>(StringBuilder sql)
        {
            return this.GetDataListBySQL<T>(sql, null);
        }
        /// <summary>
        /// 根据 SQL 返回 IList,带参数 (比DataSet效率高)
        /// </summary>
        /// <typeparam name="T">实体类</typeparam>
        /// <param name="sql">Sql语句</param>
        /// <param name="param">参数化</param>
        /// <returns></returns>
        public IList GetDataListBySQL<T>(StringBuilder sql, SqlParam[] param)
        {
            IList list = new List<T>();
            return DbReader.ReaderToList<T>(GetIDataReaderBySql(sql, param));
        }
        #endregion

        #region 根据 SQL 返回 IDataReader
        /// <summary>
        /// 根据 SQL 返回 IDataReader
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns>IDataReader</returns>
        public IDataReader GetIDataReaderBySql(StringBuilder sql)
        {
            return GetIDataReaderBySql(sql, null);
        }
        /// <summary>
        /// 根据 SQL 返回 IDataReader
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <param name="param">参数化</param>
        /// <returns>IDataReader</returns>
        public IDataReader GetIDataReaderBySql(StringBuilder sql, SqlParam[] param)
        {
            try
            {
                using (SQLiteConnection conn = this.GetInstance())
                {
                    SQLiteCommand cmd = new SQLiteCommand(sql.ToString(), conn);
                    try
                    {
                        cmd.CommandTimeout = CommandTimeOut;
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddRange(param);
                        return cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    }
                    catch
                    {
                        return null;
                    }
                    finally
                    {
                        cmd.Dispose();
                        conn.Close();
                        conn.Dispose();
                    }
                }
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
                return null;
            }
        }
        #endregion

        #region 调用存储过程
        /// <summary>
        /// 调用存储过程(带事务)
        /// </summary>
        /// <param name="procName">存储过程名称</param>
        /// <param name="ht">参数化</param>
        public int ExecuteByProc(string procName, Hashtable ht)
        {
            int num = 0;
            //创建连接
            SQLiteConnection conn = this.GetInstance();
            //创建指令
            SQLiteCommand cmd = new SQLiteCommand(procName, conn);
            cmd.CommandTimeout = CommandTimeOut;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(DbCommon.GetParameter(ht));
            try
            {
                conn.Open();
                SQLiteTransaction DbTrans = conn.BeginTransaction();
                try
                {
                    cmd.Transaction = DbTrans;
                    num = cmd.ExecuteNonQuery();
                    DbTrans.Commit();
                }
                catch (Exception e)
                {
                    DbTrans.Rollback();
                    num = -1;
                    DbLog.WriteException(e);
                }
                finally
                {
                    conn.Close();
                    conn.Dispose();
                }
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return num;
        }
        /// <summary>
        ///调用存储过程 (不带事务)
        /// </summary>
        /// <param name="procName">存储过程名称</param>
        /// <param name="ht">参数化</param>
        /// <returns></returns>
        public int ExecuteByProcNotTran(string procName, Hashtable ht)
        {
            int num = 0;
            //创建连接
            SQLiteConnection conn = this.GetInstance();
            //创建指令
            SQLiteCommand cmd = new SQLiteCommand(procName, conn);
            cmd.CommandTimeout = CommandTimeOut;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(DbCommon.GetParameter(ht));
            try
            {
                conn.Open();
                try
                {
                    num = cmd.ExecuteNonQuery();
                }
                catch (Exception e)
                {
                    num = -1;
                    DbLog.WriteException(e);
                }
                finally
                {
                    conn.Close();
                    conn.Dispose();
                }
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return num;
        }
        /// <summary>
        /// 批量调用存储过程
        /// </summary>
        /// <param name="arrayprocName"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public int BatchExecuteByProc(object[] arrayprocName, object[] param)
        {
            int num = 0;
            //创建连接
            SQLiteConnection conn = this.GetInstance();
            try
            {
                conn.Open();
                SQLiteTransaction DbTrans = conn.BeginTransaction();
                try
                {
                    for (int i = 0; i < arrayprocName.Length; i++)
                    {
                        string procName = arrayprocName[i].ToString();
                        if (procName != null)
                        {
                            SqlParam[] paramArray = (SqlParam[])param[i];
                            //创建指令
                            SQLiteCommand cmd = new SQLiteCommand(procName, conn);
                            cmd.CommandTimeout = CommandTimeOut;
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddRange(paramArray);
                            cmd.Transaction = DbTrans;
                            num = cmd.ExecuteNonQuery();
                        }
                    }
                    DbTrans.Commit();
                    num = 1;
                }
                catch (Exception e)
                {
                    DbTrans.Rollback();
                    num = -1;
                    DbLog.WriteException(e);
                }
                finally
                {
                    conn.Close();
                    conn.Dispose();
                }
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
            return num;
        }
        #endregion

        #region IDisposable 成员
        /// <summary>
        /// 内存回收
        /// </summary>
        public void Dispose()
        {
        }
        #endregion
    }
}
