using DotNet.Kernel;
//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
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
    public class AccessHelper
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
        public AccessHelper(string connString)
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
        private OleDbConnection db = null;
        /// <summary>
        /// 取得单身实例
        /// </summary>
        public OleDbConnection GetInstance()
        {
            //在并发时，使用单一对象
            if (db == null)
            {
                return db = new OleDbConnection(connectionString);
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
            OleDbConnection conn = this.GetInstance();
            //创建指令
            OleDbCommand cmd = new OleDbCommand(sql.ToString(), conn);
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
            OleDbConnection conn = this.GetInstance();
            //创建指令
            OleDbCommand cmd = new OleDbCommand(sql.ToString(), conn);
            cmd.Parameters.AddRange(param);
            try
            {
                conn.Open();
                OleDbTransaction DbTrans = conn.BeginTransaction();
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
                using (OleDbConnection conn = this.GetInstance())
                {
                    conn.Open();
                    OleDbTransaction DbTrans = conn.BeginTransaction();
                    try
                    {
                        for (int i = 0; i < sqls.Length; i++)
                        {
                            StringBuilder builder = (StringBuilder)sqls[i];
                            if (builder != null)
                            {
                                SqlParam[] paramArray = (SqlParam[])param[i];
                                //创建指令
                                OleDbCommand cmd = new OleDbCommand(builder.ToString(), conn);
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
                using (OleDbConnection conn = this.GetInstance())
                {
                    OleDbCommand cmd = new OleDbCommand(procName, conn);
                    try
                    {
                        cmd.CommandTimeout = CommandTimeOut;
                        cmd.CommandType = CommandType.StoredProcedure;
                        //创建适配器
                        OleDbDataAdapter da = new OleDbDataAdapter();
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
                OleDbConnection conn = this.GetInstance();
                //创建适配器
                OleDbDataAdapter da = new OleDbDataAdapter(sql.ToString(), conn);
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
                using (OleDbConnection conn = this.GetInstance())
                {
                    OleDbCommand cmd = new OleDbCommand(procName, conn);
                    try
                    {
                        cmd.CommandTimeout = CommandTimeOut;
                        cmd.CommandType = CommandType.StoredProcedure;
                        //创建适配器
                        OleDbDataAdapter da = new OleDbDataAdapter();
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
                using (OleDbConnection conn = this.GetInstance())
                {
                    OleDbCommand cmd = new OleDbCommand(sql.ToString(), conn);
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

        #region ACCESS高效分页
        /// <summary>
        /// 分页使用
        /// </summary>
        /// <param name="query"></param>
        /// <param name="passCount"></param>
        /// <returns></returns>
        private string recordID(string query, int passCount)
        {
            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                conn.Open();
                OleDbCommand cmd = new OleDbCommand(query, conn);
                string result = string.Empty;
                using (OleDbDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        if (passCount < 1)
                        {
                            result += "," + dr.GetInt32(0);
                        }
                        passCount--;
                    }
                }
                conn.Close();
                conn.Dispose();
                return result.Substring(1);
            }
        }
        /// <summary>
        /// ACCESS高效分页
        /// </summary>
        /// <param name="pageIndex">当前页码</param>
        /// <param name="pageSize">分页容量</param>
        /// <param name="strKey">主键</param>
        /// <param name="showString">显示的字段</param>
        /// <param name="queryString">查询字符串，支持联合查询</param>
        /// <param name="whereString">查询条件，若有条件限制则必须以where 开头</param>
        /// <param name="orderString">排序规则</param>
        /// <param name="pageCount">传出参数：总页数统计</param>
        /// <param name="recordCount">传出参数：总记录统计</param>
        /// <returns>装载记录的DataTable</returns>
        public DataTable GetPageList(int pageIndex, int pageSize, string strKey, string showString, string queryString, string whereString, string orderString, out int pageCount, out int recordCount)
        {
            if (pageIndex < 1) pageIndex = 1;
            if (pageSize < 1) pageSize = 10;
            if (string.IsNullOrEmpty(showString)) showString = "*";
            if (string.IsNullOrEmpty(orderString)) orderString = strKey + " asc ";
            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                conn.Open();
                string myVw = string.Format(" ( {0} ) tempVw ", queryString);
                OleDbCommand cmdCount = new OleDbCommand(string.Format(" select count(*) as recordCount from {0} {1}", myVw, whereString), conn);

                recordCount = Convert.ToInt32(cmdCount.ExecuteScalar());

                if ((recordCount % pageSize) > 0)
                    pageCount = recordCount / pageSize + 1;
                else
                    pageCount = recordCount / pageSize;
                OleDbCommand cmdRecord;
                if (pageIndex == 1)//第一页
                {
                    cmdRecord = new OleDbCommand(string.Format("select top {0} {1} from {2} {3} order by {4} ", pageSize, showString, myVw, whereString, orderString), conn);
                }
                else if (pageIndex > pageCount)//超出总页数
                {
                    cmdRecord = new OleDbCommand(string.Format("select top {0} {1} from {2} {3} order by {4} ", pageSize, showString, myVw, "where 1=2", orderString), conn);
                }
                else
                {
                    int pageLowerBound = pageSize * pageIndex;
                    int pageUpperBound = pageLowerBound - pageSize;
                    string recordIDs = recordID(string.Format("select top {0} {1} from {2} {3} order by {4} ", pageLowerBound, strKey, myVw, whereString, orderString), pageUpperBound);
                    cmdRecord = new OleDbCommand(string.Format("select {0} from {1} where {2} in ({3}) order by {4} ", showString, myVw, strKey, recordIDs, orderString), conn);

                }
                OleDbDataAdapter dataAdapter = new OleDbDataAdapter(cmdRecord);
                DataTable dt = new DataTable();
                dataAdapter.Fill(dt);
                conn.Close();
                conn.Dispose();
                return dt;
            }
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
