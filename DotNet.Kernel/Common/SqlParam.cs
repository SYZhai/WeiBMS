//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace DotNet.Kernel
{
    /// <summary>
    /// 存放参数【键，键值】
    /// 版本：2.0
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.09.27</date>
    /// </author>
    /// </summary>
    public class SqlParam
    {

        /// <summary>
        /// 目标字段
        /// </summary>
        public string FieldName { get; set; }
        /// <summary>
        /// 数据类型
        /// </summary>
        public DbType DataType { get; set; }
        /// <summary>
        ///值 
        /// </summary>
        public object FiledValue { get; set; }

        public SqlParam()
        {

        }
        public SqlParam(string _FieldName, object _FiledValue)
            : this(_FieldName, DbType.AnsiString, _FiledValue)
        {
        }
        public SqlParam(string _FieldName, DbType _DbType, object _FiledValue)
        {
            if (ConfigHelper.GetValue("ComponentDbType") == "Oracle")
            {
                _FieldName = _FieldName.Replace("@", ":");
            }
            this.FieldName = _FieldName;
            this.DataType = _DbType;
            this.FiledValue = _FiledValue;
        }
    }
}
