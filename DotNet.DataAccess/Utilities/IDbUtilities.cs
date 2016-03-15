//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================
using DotNet.Kernel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DotNet.DataAccess
{
    /// <summary>
    /// 增、删、改、查 接口
    /// 版本：2.0
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.09.27</date>
    /// </author>
    /// </summary>
    public interface IDbUtilities
    {
        #region GetObject
        /// <summary>
        /// 根据唯一ID获取对象,返回Hashtable
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="pkName">字段主键</param>
        /// <param name="pkVal">字段值</param>
        /// <returns>返回Hashtable</returns>
        Hashtable GetHashtableById(string tableName, string pkName, string pkVal);
        /// <summary>
        /// 根据唯一ID获取对象,返回Hashtable
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="ht">参数</param>
        /// <returns>返回Hashtable</returns>
        Hashtable GetHashtableById(string tableName, Hashtable ht);
        /// <summary>
        /// 根据唯一ID获取对象,返回Hashtable
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns>返回Hashtable</returns>
        Hashtable GetHashtableById(string tableName, StringBuilder where, SqlParam[] param);
        /// <summary>
        /// 根据唯一ID获取对象,返回实体
        /// </summary>
        /// <param name="pkName">字段主键</param>
        /// <param name="pkVal">字段值</param>
        /// <returns>返回实体类</returns>
        T GetModelById<T>(string pkName, string pkVal);
        /// <summary>
        /// 根据唯一ID获取对象,返回实体
        /// </summary>
        /// <param name="ht">参数</param>
        /// <returns>返回实体类</returns>
        T GetModelById<T>(Hashtable ht);
        /// <summary>
        /// 根据唯一ID获取对象,返回实体
        /// </summary>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns>返回实体类</returns>
        T GetModelById<T>(StringBuilder where, SqlParam[] param);
        #endregion

        #region RecordCount
        /// <summary>
        /// 影响行数
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="pkName">字段主键</param>
        /// <param name="pkVal">字段值</param>
        /// <returns>返回数量</returns>
        int RecordCount(string tableName, string pkName, string pkVal);
        /// <summary>
        /// 影响行数
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="ht">参数</param>
        /// <returns>返回数量</returns>
        int RecordCount(string tableName, Hashtable ht);
        /// <summary>
        /// 影响行数
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="where">条件</param>
        /// <param name="param">参数化</param>
        /// <returns>返回数量</returns>
        int RecordCount(string tableName, StringBuilder where, SqlParam[] param);
        #endregion

        #region GetMax
        /// <summary>
        /// 获取最大编号
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="pkName">字段</param>
        /// <returns></returns>
        object GetMax(string tableName, string pkName);
        #endregion

        #region Insert
        /// <summary>
        /// 通过Hashtable插入数据
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="ht">Hashtable</param>
        /// <returns>int</returns>
        int Insert(string tableName, Hashtable ht);
        /// <summary>
        /// 通过实体类插入数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <returns>int</returns>
        int Insert<T>(T entity);
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
        int Update(string tableName, string pkName, string pkVal, Hashtable ht);
        /// <summary>
        /// 通过实体类修改数据
        /// </summary>
        /// <param name="entity">实体类</param>
        /// <param name="key">主键</param>
        /// <returns></returns>
        int Update<T>(T entity, string key);
        #endregion

        #region Delete
        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="pkName">字段主键</param>
        /// <param name="pkVal">字段值</param>
        /// <returns></returns>
        int Delete(string tableName, string pkName, string pkVal);
        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="pkName">字段主键</param>
        /// <param name="pkVal">字段值</param>
        /// <returns></returns>
        int BatchDelete(string tableName, string pkName, object[] pkValues);
        #endregion
    }
}
