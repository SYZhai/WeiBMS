//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================
using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Oracle.DataAccess.Client;
using MySql.Data.MySqlClient;


namespace DotNet.Kernel
{
    /// <summary>
    /// 数据库访问扩展
    /// 版本：2.0
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.09.27</date>
    /// </author>
    /// </summary>
    public sealed partial class DbHelperExpand
    {
        /// <summary>
        /// 构造方法
        /// </summary>
        public DbHelperExpand()
        {
            SoftRegHelper Verify = new SoftRegHelper();
        }
       
        /// <summary>
        /// 批量操作每批次记录数
        /// </summary>
        public static int BatchSize = 2000;

        /// <summary>
        /// 超时时间
        /// </summary>
        public int CommandTimeOut = 600;

        #region SqlBulkCopy 批量数据处理

        #region Oracle
        /// <summary>
        ///大批量数据插入
        /// </summary>
        /// <param name="table">数据表</param>
        /// <param name="connectionString">数据库连接字符串</param>
        /// <returns></returns>
        public bool OracleBulkInsert(DataTable table, string connectionString)
        {
            try
            {
                using (OracleConnection connection = new OracleConnection(connectionString))
                {
                    connection.Open();
                    OracleTransaction trans = connection.BeginTransaction();
                    using (OracleBulkCopy bulkCopy = new OracleBulkCopy(connection))
                    {
                        //设置源表名称
                        bulkCopy.DestinationTableName = table.TableName;
                        //设置超时限制
                        bulkCopy.BulkCopyTimeout = CommandTimeOut;
                        //要写入列
                        foreach (DataColumn dtColumn in table.Columns)
                        {
                            bulkCopy.ColumnMappings.Add(dtColumn.ColumnName.ToUpper(), dtColumn.ColumnName.ToUpper());
                        }
                        try
                        {
                            // 写入
                            bulkCopy.WriteToServer(table);
                            // 提交事务
                            trans.Commit();
                            return true;
                        }
                        catch
                        {
                            trans.Rollback();
                            bulkCopy.Close();
                            return false;
                        }
                        finally
                        {
                            connection.Close();
                            connection.Dispose();
                            bulkCopy.Close();
                            bulkCopy.Dispose();
                        }
                    }
                }
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
                return false;
            }
        }
        #endregion

        #region SqlServer
        /// <summary>
        ///大批量数据插入
        /// </summary>
        /// <param name="table">数据表</param>
        /// <param name="connectionString">数据库连接字符串</param>
        /// <returns></returns>
        public bool SqlServerBulkInsert(DataTable table, string connectionString)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlTransaction trans = conn.BeginTransaction();

                    SqlBulkCopy sqlbulkCopy = new SqlBulkCopy(conn, SqlBulkCopyOptions.Default, trans);
                    // 设置源表名称
                    sqlbulkCopy.DestinationTableName = table.TableName;
                    //分几次拷贝
                    //sqlbulkCopy.BatchSize = 10;
                    // 设置超时限制
                    sqlbulkCopy.BulkCopyTimeout = CommandTimeOut;
                    foreach (DataColumn dtColumn in table.Columns)
                    {
                        sqlbulkCopy.ColumnMappings.Add(dtColumn.ColumnName, dtColumn.ColumnName);
                    }
                    try
                    {
                        // 写入
                        sqlbulkCopy.WriteToServer(table);
                        // 提交事务
                        trans.Commit();
                        return true;
                    }
                    catch
                    {
                        trans.Rollback();
                        sqlbulkCopy.Close();
                        return false;
                    }
                    finally
                    {
                        conn.Close();
                        conn.Dispose();
                        sqlbulkCopy.Close();
                    }
                }
            }
            catch (Exception e)
            {
                DbLog.WriteException(e);
                return false;
            }
        }
        #endregion

        #region MySql
        /// <summary>
        ///大批量数据插入
        /// </summary>
        /// <param name="table">数据表</param>
        /// <param name="connectionString">数据库连接字符串</param>
        /// <returns></returns>
        public bool MySqlBulkInsert(DataTable table, string connectionString)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    MySqlTransaction tran = null;
                    try
                    {
                        conn.Open();
                        tran = conn.BeginTransaction();
                        MySqlBulkLoader bulk = new MySqlBulkLoader(conn)
                        {
                            FieldTerminator = ",",
                            FieldQuotationCharacter = '"',
                            EscapeCharacter = '"',
                            LineTerminator = "\r\n",
                            NumberOfLinesToSkip = 0,
                            TableName = table.TableName,
                        };
                        bulk.Timeout = CommandTimeOut;
                        bulk.Columns.AddRange(table.Columns.Cast<DataColumn>().Select(colum => colum.ColumnName).ToList());
                        tran.Commit();
                        return true;
                    }
                    catch
                    {
                        tran.Rollback();
                        return false;
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
                return false;
            }
        }
        /// <summary>
        ///使用MySqlDataAdapter批量更新数据
        /// </summary>
        /// <param name="connectionString">数据库连接字符串</param>
        /// <param name="table">数据表</param>
        public void BatchUpdate(string connectionString, DataTable table)
        {
            MySqlConnection connection = new MySqlConnection(connectionString);
            MySqlCommand command = connection.CreateCommand();
            command.CommandTimeout = CommandTimeOut;
            command.CommandType = CommandType.Text;
            MySqlDataAdapter adapter = new MySqlDataAdapter(command);
            MySqlCommandBuilder commandBulider = new MySqlCommandBuilder(adapter);
            commandBulider.ConflictOption = ConflictOption.OverwriteChanges;
            MySqlTransaction transaction = null;
            try
            {
                connection.Open();
                transaction = connection.BeginTransaction();
                //设置批量更新的每次处理条数
                adapter.UpdateBatchSize = BatchSize;
                //设置事物
                adapter.SelectCommand.Transaction = transaction;
                if (table.ExtendedProperties["SQL"] != null)
                {
                    adapter.SelectCommand.CommandText = table.ExtendedProperties["SQL"].ToString();
                }
                adapter.Update(table);
                transaction.Commit();/////提交事务
            }
            catch (MySqlException ex)
            {
                if (transaction != null) transaction.Rollback();
                throw ex;
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
        }
        #endregion

        #endregion

    }
}
