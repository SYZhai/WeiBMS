//=====================================================================================
// All Rights Reserved , Copyright ? Learun 2013
//=====================================================================================
using DotNet.Kernel;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
    public class MySqlHelper : IDbHelper
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
        public MySqlHelper(string connString)
        {
            DbCommon.ParamKey = "@";
            DbCommon.PlusSign = "+";
            DbCommon.GetDBNow = "now()";
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
        private static readonly Object locker = new Object();
        private MySqlConnection db = null;
        /// <summary>
        /// 取得单身实例
        /// </summary>
        public MySqlConnection GetInstance()
        {
            //在并发时，使用单一对象
            if (db == null)
            {
                return db = new MySqlConnection(connectionString);
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
        //DbCommand 命令
        private DbCommand dbCommand = null;
        /// <summary>
        /// 命令
        /// </summary>
        public DbCommand DbCommand
        {
            get
            {
                return this.dbCommand;
            }
            set
            {
                this.dbCommand = value;
            }
        }
        //事务 命令
        private DbTransaction dbTransaction = null;
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

        #region 根据 SQL 返回影响行数
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
            MySqlConnection conn = this.GetInstance();
            //创建指令
            dbCommand = new MySqlCommand(sql.ToString(), conn);
            DbCommon.MySqlAddInParameter(dbCommand, param);
            try
            {
                //打开连接
                conn.Open();
                result = dbCommand.ExecuteScalar();
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

        #region 根据 SQL 执行
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
            MySqlConnection conn = this.GetInstance();
            //创建指令
            dbCommand = new MySqlCommand(sql.ToString(), conn);
            DbCommon.MySqlAddInParameter(dbCommand, param);
            try
            {
                conn.Open();
                dbTransaction = conn.BeginTransaction();
                try
                {
                    dbCommand.Transaction = dbTransaction;
                    num = dbCommand.ExecuteNonQuery();
                    dbTransaction.Commit();
                }
                catch (Exception e)
                {
                    dbTransaction.Rollback();
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
        ///  根据SQL执行,带参数,不带事务
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <param name="param">参数化</param>
        /// <returns>object</returns>
        public int ExecuteBySqlNotTran(StringBuilder sql, SqlParam[] param)
        {
            int num = 0;
            //创建连接
            MySqlConnection conn = this.GetInstance();
            //创建指令
            dbCommand = new MySqlCommand(sql.ToString(), conn);
            DbCommon.MySqlAddInParameter(dbCommand, param);
            try
            {
                conn.Open();
                try
                {
                    num = dbCommand.ExecuteNonQuery();
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
                using (MySqlConnection conn = this.GetInstance())
                {
                    conn.Open();
                    dbTransaction = conn.BeginTransaction();
                    try
                    {
                        for (int i = 0; i < sqls.Length; i++)
                        {
                            StringBuilder builder = (StringBuilder)sqls[i];
                            if (builder != null)
                            {
                                SqlParam[] paramArray = (SqlParam[])param[i];
                                //创建指令
                                dbCommand = new MySqlCommand(builder.ToString(), conn);
                                DbCommon.MySqlAddInParameter(dbCommand, paramArray);
                                dbCommand.Transaction = dbTransaction;
                                dbCommand.ExecuteNonQuery();
                            }
                        }
                        dbTransaction.Commit();
                        num = 1;
                    }
                    catch (Exception e)
                    {
                        num = -1;
                        dbTransaction.Rollback();
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
                using (MySqlConnection conn = this.GetInstance())
                {
                    conn.Open();
                    dbCommand = new MySqlCommand(sql.ToString(), conn);
                    try
                    {
                        dbCommand.CommandTimeout = CommandTimeOut;
                        dbCommand.CommandType = CommandType.Text;
                        DbCommon.MySqlAddInParameter(dbCommand, param);
                        return DbReader.ReaderToDataTable(dbCommand.ExecuteReader(CommandBehavior.CloseConnection));
                    }
                    catch
                    {
                        return null;
                    }
                    finally
                    {
                        dbCommand.Dispose();
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

        #region 根据 存储过程 返回 DataTable 数据集
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
                using (MySqlConnection conn = this.GetInstance())
                {
                    dbCommand = new MySqlCommand(procName, conn);
                    try
                    {
                        dbCommand.CommandTimeout = CommandTimeOut;
                        dbCommand.CommandType = CommandType.StoredProcedure;
                        DbCommon.MySqlAddInParameter(dbCommand, ht);
                        return DbReader.ReaderToDataTable(dbCommand.ExecuteReader(CommandBehavior.CloseConnection));
                    }
                    catch
                    {
                        return null;
                    }
                    finally
                    {
                        dbCommand.Dispose();
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
        /// <summary>
        /// 执行一存储过程返回数据表 返回多个值
        /// <param name="procName">存储过程名称</param>
        /// <param name="ht">Hashtable</param>
        /// <param name="rs">Hashtable</param>
        public DataTable GetDataTableProcReturn(string procName, Hashtable ht, ref Hashtable rs)
        {
            try
            {
                using (MySqlConnection conn = this.GetInstance())
                {
                    dbCommand = new MySqlCommand(procName, conn);
                    try
                    {
                        dbCommand.CommandTimeout = CommandTimeOut;
                        dbCommand.CommandType = CommandType.StoredProcedure;
                        DbCommon.MySqlAddInParameter(dbCommand, ht);
                        DataTable dt = DbReader.ReaderToDataTable(dbCommand.ExecuteReader(CommandBehavior.CloseConnection));
                        rs = new Hashtable();
                        foreach (string str in ht.Keys)
                        {
                            if (str.StartsWith("OUT_"))
                            {
                                object parameterValue = dbCommand.Parameters["@" + str.Remove(0, 4)].Direction = ParameterDirection.ReturnValue;
                                rs[str] = parameterValue;
                            }
                        }
                        return dt;
                    }
                    catch
                    {
                        return null;
                    }
                    finally
                    {
                        dbCommand.Dispose();
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
                MySqlConnection conn = this.GetInstance();
                //创建适配器
                MySqlDataAdapter da = new MySqlDataAdapter(sql.ToString(), conn);
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
        #endregion

        #region 根据 存储过程 返回 DataSet 数据集
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
                using (MySqlConnection conn = this.GetInstance())
                {
                    MySqlCommand cmd = new MySqlCommand(procName, conn);
                    try
                    {
                        cmd.CommandTimeout = CommandTimeOut;
                        cmd.CommandType = CommandType.StoredProcedure;
                        //创建适配器
                        MySqlDataAdapter da = new MySqlDataAdapter();
                        //给变量赋值
                        DbCommon.MySqlAddInParameter(cmd, ht);
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
        /// <summary>
        /// 执行一存储过程返回数据集 返回多个值
        /// <param name="procName">存储过程名称</param>
        /// <param name="ht">Hashtable</param>
        /// <param name="rs">Hashtable</param>
        public DataSet GetDataSetProcReturn(string procName, Hashtable ht, ref Hashtable rs)
        {
            try
            {
                using (MySqlConnection conn = this.GetInstance())
                {
                    MySqlCommand cmd = new MySqlCommand(procName, conn);
                    try
                    {
                        cmd.CommandTimeout = CommandTimeOut;
                        cmd.CommandType = CommandType.StoredProcedure;
                        //创建适配器
                        MySqlDataAdapter da = new MySqlDataAdapter();
                        //给变量赋值
                        DbCommon.MySqlAddInParameter(cmd, ht);
                        da.SelectCommand = cmd;
                        //填充数据
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        rs = new Hashtable();
                        foreach (string str in ht.Keys)
                        {
                            if (str.StartsWith("OUT_"))
                            {
                                object parameterValue = cmd.Parameters["@" + str.Remove(0, 4)].Direction = ParameterDirection.ReturnValue;
                                rs[str] = parameterValue;
                            }
                        }
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
            try
            {
                using (MySqlConnection conn = this.GetInstance())
                {
                    conn.Open();
                    dbCommand = new MySqlCommand(sql.ToString(), conn);
                    try
                    {
                        dbCommand.CommandTimeout = CommandTimeOut;
                        dbCommand.CommandType = CommandType.Text;
                        DbCommon.MySqlAddInParameter(dbCommand, param);
                        return DbReader.ReaderToList<T>(dbCommand.ExecuteReader(CommandBehavior.CloseConnection));
                    }
                    finally
                    {
                        dbCommand.Dispose();
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

        #region 根据 存储过程 执行
        /// <summary>
        /// 调用存储过程(带事务)
        /// </summary>
        /// <param name="procName">存储过程名称</param>
        /// <param name="ht">参数化</param>
        public int ExecuteByProc(string procName, Hashtable ht)
        {
            int num = 0;
            //创建连接
            MySqlConnection conn = this.GetInstance();
            //创建指令
            dbCommand = new MySqlCommand(procName, conn);
            dbCommand.CommandTimeout = CommandTimeOut;
            dbCommand.CommandType = CommandType.StoredProcedure;
            DbCommon.MySqlAddInParameter(dbCommand, ht);
            try
            {
                conn.Open();
                dbTransaction = conn.BeginTransaction();
                try
                {
                    dbCommand.Transaction = dbTransaction;
                    num = dbCommand.ExecuteNonQuery();
                    dbTransaction.Commit();
                }
                catch (Exception e)
                {
                    dbTransaction.Rollback();
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
            MySqlConnection conn = this.GetInstance();
            //创建指令
            dbCommand = new MySqlCommand(procName, conn);
            dbCommand.CommandTimeout = CommandTimeOut;
            dbCommand.CommandType = CommandType.StoredProcedure;
            DbCommon.MySqlAddInParameter(dbCommand, ht);
            try
            {
                conn.Open();
                try
                {
                    num = dbCommand.ExecuteNonQuery();
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
            MySqlConnection conn = this.GetInstance();
            try
            {
                conn.Open();
                dbTransaction = conn.BeginTransaction();
                try
                {
                    for (int i = 0; i < arrayprocName.Length; i++)
                    {
                        string procName = arrayprocName[i].ToString();
                        if (procName != null)
                        {
                            SqlParam[] paramArray = (SqlParam[])param[i];
                            //创建指令
                            dbCommand = new MySqlCommand(procName, conn);
                            dbCommand.CommandTimeout = CommandTimeOut;
                            dbCommand.CommandType = CommandType.StoredProcedure;
                            DbCommon.MySqlAddInParameter(dbCommand, paramArray);
                            dbCommand.Transaction = dbTransaction;
                            num = dbCommand.ExecuteNonQuery();
                        }
                    }
                    dbTransaction.Commit();
                    num = 1;
                }
                catch (Exception e)
                {
                    dbTransaction.Rollback();
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
        /// 调用存储过程返回指定消息
        /// </summary>
        /// <param name="procName">存储过程名称</param>
        /// <param name="ht">Hashtable</param>
        /// <param name="msg">OutPut Msg</param>
        public int ExecuteByProcReturnMsg(string procName, Hashtable ht, ref object msg)
        {
            int num = 0;
            //创建连接
            MySqlConnection conn = this.GetInstance();
            //创建指令
            dbCommand = new MySqlCommand(procName, conn);
            dbCommand.CommandTimeout = CommandTimeOut;
            dbCommand.CommandType = CommandType.StoredProcedure;
            DbCommon.MySqlAddInParameter(dbCommand, ht);
            try
            {
                conn.Open();
                dbTransaction = conn.BeginTransaction();
                try
                {
                    dbCommand.Transaction = dbTransaction;
                    num = dbCommand.ExecuteNonQuery();
                    dbTransaction.Commit();
                }
                catch (Exception e)
                {
                    dbTransaction.Rollback();
                    num = -1;
                    DbLog.WriteException(e);
                }
                finally
                {
                    conn.Close();
                    conn.Dispose();
                }
                msg = dbCommand.Parameters["@Msg"].Direction = ParameterDirection.ReturnValue;
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
        /// 调用存储过程返回指定消息（不带事务）
        /// </summary>
        /// <param name="procName">存储过程名称</param>
        /// <param name="ht">Hashtable</param>
        /// <param name="msg">OutPut Msg</param>
        public int ExecuteByProcNotTranReturnMsg(string procName, Hashtable ht, ref object msg)
        {
            int num = 0;
            //创建连接
            MySqlConnection conn = this.GetInstance();
            //创建指令
            dbCommand = new MySqlCommand(procName, conn);
            dbCommand.CommandTimeout = CommandTimeOut;
            dbCommand.CommandType = CommandType.StoredProcedure;
            DbCommon.MySqlAddInParameter(dbCommand, ht);
            try
            {
                conn.Open();
                try
                {
                    num = dbCommand.ExecuteNonQuery();
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
                msg = dbCommand.Parameters["@Msg"].Direction = ParameterDirection.ReturnValue;
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
        /// 调用存储过程返回指定消息
        /// </summary>
        /// <param name="procName">存储过程名称</param>
        /// <param name="ht">Hashtable</param>
        /// <param name="msg">OutPut rs</param>
        public int ExecuteByProcReturn(string procName, Hashtable ht, ref Hashtable rs)
        {
            int num = 0;
            //创建连接
            MySqlConnection conn = this.GetInstance();
            //创建指令
            dbCommand = new MySqlCommand(procName, conn);
            dbCommand.CommandTimeout = CommandTimeOut;
            dbCommand.CommandType = CommandType.StoredProcedure;
            DbCommon.MySqlAddInParameter(dbCommand, ht);
            try
            {
                conn.Open();
                dbTransaction = conn.BeginTransaction();
                try
                {
                    dbCommand.Transaction = dbTransaction;
                    num = dbCommand.ExecuteNonQuery();
                    dbTransaction.Commit();
                }
                catch (Exception e)
                {
                    dbTransaction.Rollback();
                    num = -1;
                    DbLog.WriteException(e);
                }
                finally
                {
                    conn.Close();
                    conn.Dispose();
                }
                rs = new Hashtable();
                foreach (string str in ht.Keys)
                {
                    if (str.StartsWith("OUT_"))
                    {
                        object parameterValue = dbCommand.Parameters["@" + str.Remove(0, 4)].Direction = ParameterDirection.ReturnValue;
                        rs[str] = parameterValue;
                    }
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

        #region 数据分页 返回 DataTable
        /// <summary>
        /// 摘要:
        ///     数据分页
        /// 参数：
        ///     sql：传入要执行sql语句
        ///     param：参数化
        ///     orderField：排序字段
        ///     orderType：排序类型
        ///     pageIndex：当前页
        ///     pageSize：页大小
        ///     count：返回查询条数
        /// </summary>
        public DataTable GetPageList(string sql, SqlParam[] param, string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder sb = new StringBuilder();
            try
            {
                int num = (pageIndex - 1) * pageSize;
                int num1 = (pageIndex) * pageSize;
                sb.Append("Select * From (Select ROW_NUMBER() Over (Order By " + orderField + " " + orderType + "");
                sb.Append(") As rowNum, * From (" + sql + ") As T ) As N Where rowNum > " + num + " And rowNum <= " + num1 + "");
                count = Convert.ToInt32(this.GetObjectValue(new StringBuilder("Select Count(1) From (" + sql + ") As t"), param));
                return this.GetDataTableBySQL(sb, param);
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
                return null; ;
            }
        }
        /// <summary>
        /// 摘要:
        ///     数据分页
        /// 参数：
        ///     sql：传入要执行sql语句
        ///     orderField：排序字段
        ///     orderType：排序类型
        ///     pageIndex：当前页
        ///     pageSize：页大小
        ///     count：返回查询条数
        /// </summary>
        public DataTable GetPageList(string sql, string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            return GetPageList(sql, null, orderField, orderType, pageIndex, pageSize, ref  count);
        }
        #endregion

        #region 数据分页 返回 ILis
        /// <summary>
        /// 摘要:
        ///     数据分页
        /// 参数：
        ///     sql：传入要执行sql语句
        ///     param：参数化
        ///     orderField：排序字段
        ///     orderType：排序类型
        ///     pageIndex：当前页
        ///     pageSize：页大小
        ///     count：返回查询条数
        /// </summary>
        public IList GetPageList<T>(string sql, SqlParam[] param, string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder sb = new StringBuilder();
            try
            {
                int num = (pageIndex - 1) * pageSize;
                int num1 = (pageIndex) * pageSize;
                sb.Append(sql + " Order By " + orderField + " " + orderType + "");
                sb.Append(" LIMIT " + num + "," + num1 + "");
                count = Convert.ToInt32(this.GetObjectValue(new StringBuilder("Select Count(1) From (" + sql + ") As t"), param));
                return this.GetDataListBySQL<T>(sb, param);
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
                return null; ;
            }
        }
        /// <summary>
        /// 摘要:
        ///     数据分页
        /// 参数：
        ///     sql：传入要执行sql语句
        ///     orderField：排序字段
        ///     orderType：排序类型
        ///     pageIndex：当前页
        ///     pageSize：页大小
        ///     count：返回查询条数
        /// </summary>
        public IList GetPageList<T>(string sql, string orderField, string orderType, int pageIndex, int pageSize, ref int count)
        {
            return GetPageList<T>(sql, null, orderField, orderType, pageIndex, pageSize, ref  count);
        }
        #endregion

        #region SqlBulkCopy 批量数据处理
        /// <summary>
        ///大批量数据插入
        /// </summary>
        /// <param name="connectionString">数据库连接字符串</param>
        /// <param name="table">数据表</param>
        /// <returns></returns>
        public bool BulkInsert(DataTable dt)
        {
            DbHelperExpand copy = new DbHelperExpand();
            return copy.MySqlBulkInsert(dt, connectionString);
        }
        #endregion

        #region IDisposable 成员
        /// <summary>
        /// 内存回收
        /// </summary>
        public void Dispose()
        {
            if (this.dbCommand != null)
            {
                //this.dbCommand.Dispose();
            }
            if (this.dbTransaction != null)
            {
                //this.dbTransaction.Dispose();
            }
        }
        #endregion
    }
}
