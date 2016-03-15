using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace BPMS.CodeMatic.Code
{
    /// <summary>
    /// 代码拼接组件
    /// </summary>
    public class CodeBuilder
    {
        #region C#实体数据类型
        /// <summary>
        /// C#实体数据类型
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public string FindModelsType(string name)
        {
            if (name == "int" || name == "smallint")
            {
                return "int?";
            }
            else if (name == "tinyint")
            {
                return "byte?";
            }
            else if (name == "numeric" || name == "real" || name == "float")
            {
                return "Single?";
            }
            else if (name == "float")
            {
                return "float?";
            }
            else if (name == "decimal")
            {
                return "decimal?";
            }
            else if (name == "char" || name == "varchar" || name == "text" || name == "nchar" || name == "nvarchar" || name == "ntext")
            {
                return "string";
            }
            else if (name == "bit")
            {
                return "bool?";
            }
            else if (name == "datetime" || name == "smalldatetime")
            {
                return "DateTime?";
            }
            else if (name == "money" || name == "smallmoney")
            {
                return "double?";
            }
            else
            {
                return "string";
            }
        }
        #endregion

        #region 变量
        /// <summary>
        /// 类名称
        /// </summary>
        public string ClassName { get; set; }
        /// <summary>
        /// 作者
        /// </summary>
        public string Author { get; set; }
        /// <summary>
        /// 项目名称
        /// </summary>
        public string ProjectName { get; set; }
        /// <summary>
        /// 创建年份
        /// </summary>
        public string CreateYear { get; set; }
        /// <summary>
        /// 公司
        /// </summary>
        public string Company { get; set; }
        /// <summary>
        /// 创建日期
        /// </summary>
        public string CreateDate { get; set; }
        #endregion

        #region 实体类
        /// <summary>
        /// 生成实体类
        /// </summary>
        /// <param name="table">表</param>
        /// <param name="Key">表主键</param>
        /// <param name="tableexplain">表说明</param>
        /// <param name="Entity_dt">字段</param>
        /// <returns></returns>
        public string Entity(string table, string Key, string tableexplain, DataTable Entity_dt)
        {
            StringBuilder sb_Entity = new StringBuilder();
            sb_Entity.Append("//=====================================================================================\r\n");
            sb_Entity.Append("// All Rights Reserved , Copyright © " + Company + " " + CreateYear + "\r\n");
            sb_Entity.Append("//=====================================================================================\r\n\r\n");
            sb_Entity.Append("using DotNet.Kernel;\r\n");
            sb_Entity.Append("using System;\r\n");
            sb_Entity.Append("using System.ComponentModel;\r\n");
            sb_Entity.Append("using System.Text;\r\n\r\n");
            sb_Entity.Append("namespace " + ProjectName + "\r\n");
            sb_Entity.Append("{\r\n");
            sb_Entity.Append("    /// <summary>\r\n");
            sb_Entity.Append("    /// " + tableexplain + "\r\n");
            sb_Entity.Append("    /// <author>\r\n");
            sb_Entity.Append("    ///		<name>" + Author + "</name>\r\n");
            sb_Entity.Append("    ///		<date>" + CreateDate + "</date>\r\n");
            sb_Entity.Append("    /// </author>\r\n");
            sb_Entity.Append("    /// </summary>\r\n");
            sb_Entity.Append("    [Description(\"" + tableexplain + "\")]\r\n");
            sb_Entity.Append("    [Key(\"" + Key + "\")]\r\n");
            sb_Entity.Append("    public class " + ClassName + "\r\n");
            sb_Entity.Append("    {\r\n");

            if (DataTableHelper.IsExistRows(Entity_dt))
            {
                for (int i = 0; i < Entity_dt.Rows.Count; i++)
                {
                    string column = Entity_dt.Rows[i]["column"].ToString();
                    string datatype = FindModelsType(Entity_dt.Rows[i]["datatype"].ToString());
                    sb_Entity.Append("        private " + datatype + " _" + column + " = null;\r\n");
                    sb_Entity.Append("        /// <summary>\r\n");
                    sb_Entity.Append("        /// " + Entity_dt.Rows[i]["remark"].ToString() + "\r\n");
                    sb_Entity.Append("        /// </summary>\r\n");
                    sb_Entity.Append("        /// <returns></returns>\r\n");
                    sb_Entity.Append("        [Description(\"" + Entity_dt.Rows[i]["remark"].ToString() + "\")]\r\n");
                    sb_Entity.Append("        public " + datatype + " " + column + "\r\n");
                    sb_Entity.Append("        {\r\n");
                    sb_Entity.Append("            get\r\n");
                    sb_Entity.Append("            {\r\n");
                    sb_Entity.Append("                return this._" + column + ";\r\n");
                    sb_Entity.Append("            }\r\n");
                    sb_Entity.Append("            set\r\n");
                    sb_Entity.Append("            {\r\n");
                    sb_Entity.Append("                this._" + column + " = value;\r\n");
                    sb_Entity.Append("            }\r\n");
                    sb_Entity.Append("        }\r\n");
                }
            }
            sb_Entity.Append("    }\r\n");
            sb_Entity.Append("}");
            return sb_Entity.ToString();
        }
        #endregion

        #region 数据访问类
        /// <summary>
        /// 生成数据访问类
        /// </summary>
        /// <param name="table">表</param>
        /// <param name="tableexplain">表说明</param>
        /// <param name="key">主键</param>
        /// <param name="method">选择方法</param>
        /// <returns></returns>
        public string Dal(string table, string tableexplain, string key, Hashtable method)
        {
            StringBuilder sb_Dal = new StringBuilder();
            sb_Dal.Append("//=====================================================================================\r\n");
            sb_Dal.Append("// All Rights Reserved , Copyright © " + Company + " " + CreateYear + "\r\n");
            sb_Dal.Append("//=====================================================================================\r\n\r\n");
            sb_Dal.Append("using DotNet.Kernel;\r\n");
            sb_Dal.Append("using DotNet.Utilities;\r\n");
            sb_Dal.Append("using BPMS.Entity;\r\n");
            sb_Dal.Append("using System.Collections;\r\n");
            sb_Dal.Append("using System.Text;\r\n");
            sb_Dal.Append("using " + ProjectName + ";\r\n\r\n");
            sb_Dal.Append("namespace " + ProjectName + "\r\n");
            sb_Dal.Append("{\r\n");
            sb_Dal.Append("    /// <summary>\r\n");
            sb_Dal.Append("    /// " + tableexplain + "\r\n");
            sb_Dal.Append("    /// <author>\r\n");
            sb_Dal.Append("    ///		<name>" + Author + "</name>\r\n");
            sb_Dal.Append("    ///		<date>" + CreateDate + "</date>\r\n");
            sb_Dal.Append("    /// </author>\r\n");
            sb_Dal.Append("    /// </summary>\r\n");
            sb_Dal.Append("    public class " + table + "DAL\r\n");
            sb_Dal.Append("    {\r\n");
            sb_Dal.Append("        #region Method\r\n");

            if (method["ckb_GetMaxCode"].ToString() == "checked")
            {
                #region 获取最大编号
                sb_Dal.Append("        /// <summary>\r\n");
                sb_Dal.Append("        /// 获取最大编号\r\n");
                sb_Dal.Append("        /// </summary>\r\n");
                sb_Dal.Append("        /// <returns></returns>\r\n");
                sb_Dal.Append("        public object GetMaxCode()\r\n");
                sb_Dal.Append("        {\r\n");
                sb_Dal.Append("            return DataFactory.DbUtils().GetMax(\"" + table + "\", \"" + key + "\");\r\n");
                sb_Dal.Append("        }\r\n");
                #endregion
            }

            if (method["ckb_RecordCount"].ToString() == "checked")
            {
                #region 获取记录总数
                sb_Dal.Append("        /// <summary>\r\n");
                sb_Dal.Append("        /// 获取记录总数\r\n");
                sb_Dal.Append("        /// </summary>\r\n");
                sb_Dal.Append("        /// <param name=\"KeyValue\">主键值</param>\r\n");
                sb_Dal.Append("        /// <returns></returns>\r\n");
                sb_Dal.Append("        public int GetRecordCount(string KeyValue)\r\n");
                sb_Dal.Append("        {\r\n");
                sb_Dal.Append("            return DataFactory.DbUtils().RecordCount(\"" + table + "\", \"" + key + "\", KeyValue);\r\n");
                sb_Dal.Append("        }\r\n");

                sb_Dal.Append("        /// <summary>\r\n");
                sb_Dal.Append("        /// 获取记录总数（带条件）\r\n");
                sb_Dal.Append("        /// </summary>\r\n");
                sb_Dal.Append("        /// <param name=\"where\">条件</param>\r\n");
                sb_Dal.Append("        /// <param name=\"param\">参数化</param>\r\n");
                sb_Dal.Append("        /// <returns></returns>\r\n");
                sb_Dal.Append("        public int GetRecordCount(StringBuilder where, SqlParam[] param)\r\n");
                sb_Dal.Append("        {\r\n");
                sb_Dal.Append("            return DataFactory.DbUtils().RecordCount(\"" + table + "\", where, param);\r\n");
                sb_Dal.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_Insert"].ToString() == "checked")
            {
                #region 增加一条数据
                sb_Dal.Append("        /// <summary>\r\n");
                sb_Dal.Append("        /// 增加一条数据\r\n");
                sb_Dal.Append("        /// </summary>\r\n");
                sb_Dal.Append("        /// <param name=\"entity\">实体类</param>\r\n");
                sb_Dal.Append("        /// <returns></returns>\r\n");
                sb_Dal.Append("        public int Insert(" + table + " entity)\r\n");
                sb_Dal.Append("        {\r\n");
                sb_Dal.Append("            return DataFactory.DbUtils().Insert(entity);\r\n");
                sb_Dal.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_Update"].ToString() == "checked")
            {
                #region 更新一条数据
                sb_Dal.Append("        /// <summary>\r\n");
                sb_Dal.Append("        /// 更新一条数据\r\n");
                sb_Dal.Append("        /// </summary>\r\n");
                sb_Dal.Append("        /// <param name=\"entity\">实体类</param>\r\n");
                sb_Dal.Append("        /// <returns></returns>\r\n");
                sb_Dal.Append("        public int Update(" + table + " entity)\r\n");
                sb_Dal.Append("        {\r\n");
                sb_Dal.Append("            return DataFactory.DbUtils().Update(entity, \"" + key + "\");\r\n");
                sb_Dal.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_Delete"].ToString() == "checked")
            {
                #region 删数据
                sb_Dal.Append("        /// <summary>\r\n");
                sb_Dal.Append("        /// 删除一条数据\r\n");
                sb_Dal.Append("        /// </summary>\r\n");
                sb_Dal.Append("        /// <param name=\"KeyValue\">主键</param>\r\n");
                sb_Dal.Append("        /// <returns></returns>\r\n");
                sb_Dal.Append("        public int Delete(string KeyValue)\r\n");
                sb_Dal.Append("        {\r\n");
                sb_Dal.Append("            return DataFactory.DbUtils().Delete(\"" + table + "\", \"" + key + "\", KeyValue);\r\n");
                sb_Dal.Append("        }\r\n");

                sb_Dal.Append("        /// <summary>\r\n");
                sb_Dal.Append("        /// 批量删除数据\r\n");
                sb_Dal.Append("        /// </summary>\r\n");
                sb_Dal.Append("        /// <param name=\"KeyValue\">主键</param>\r\n");
                sb_Dal.Append("        /// <returns></returns>\r\n");
                sb_Dal.Append("        public int BatchDelete(string[] KeyValue)\r\n");
                sb_Dal.Append("        {\r\n");
                sb_Dal.Append("            return DataFactory.DbUtils().BatchDelete(\"" + table + "\", \"" + key + "\", KeyValue);\r\n");
                sb_Dal.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_GetEntity"].ToString() == "checked")
            {
                #region 得到一个对象实体
                sb_Dal.Append("        /// <summary>\r\n");
                sb_Dal.Append("        /// 得到一个对象实体\r\n");
                sb_Dal.Append("        /// </summary>\r\n");
                sb_Dal.Append("        /// <param name=\"KeyValue\">主键</param>\r\n");
                sb_Dal.Append("        /// <returns></returns>\r\n");
                sb_Dal.Append("        public " + table + " GetEntity(string KeyValue)\r\n");
                sb_Dal.Append("        {\r\n");
                sb_Dal.Append("            return DataFactory.DbUtils().GetModelById<" + table + ">(\"" + key + "\", KeyValue);\r\n");
                sb_Dal.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_GetList"].ToString() == "checked")
            {
                #region 获得数据列表
                sb_Dal.Append("        /// <summary>\r\n");
                sb_Dal.Append("        /// 获得数据列表\r\n");
                sb_Dal.Append("        /// </summary>\r\n");
                sb_Dal.Append("        /// <returns></returns>\r\n");
                sb_Dal.Append("        public IList GetList()\r\n");
                sb_Dal.Append("        {\r\n");
                sb_Dal.Append("            return this.GetListWhere(null, null);\r\n");
                sb_Dal.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_GetListWhere"].ToString() == "checked")
            {
                #region 获得数据列表(带条件)
                sb_Dal.Append("        /// <summary>\r\n");
                sb_Dal.Append("        /// 获得数据列表(带条件)\r\n");
                sb_Dal.Append("        /// </summary>\r\n");
                sb_Dal.Append("        /// <param name=\"where\">条件</param>\r\n");
                sb_Dal.Append("        /// <param name=\"param\">参数化</param>\r\n");
                sb_Dal.Append("        /// <returns></returns>\r\n");
                sb_Dal.Append("        public IList GetListWhere(StringBuilder where, SqlParam[] param)\r\n");
                sb_Dal.Append("        {\r\n");
                sb_Dal.Append("            StringBuilder strSql = new StringBuilder();\r\n");
                sb_Dal.Append("            strSql.Append(\"SELECT * FROM " + table + " WHERE 1=1\");\r\n");
                sb_Dal.Append("            strSql.Append(where);\r\n");
                sb_Dal.Append("            return DataFactory.SqlHelper().GetDataListBySQL<" + table + ">(strSql, param);\r\n");
                sb_Dal.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_GetPageList"].ToString() == "checked")
            {
                #region 分页获取数据列表
                sb_Dal.Append("        /// <summary>\r\n");
                sb_Dal.Append("        /// 分页获取数据列表\r\n");
                sb_Dal.Append("        /// </summary>\r\n");
                sb_Dal.Append("        /// <param name=\"orderField\">排序字段</param>\r\n");
                sb_Dal.Append("        /// <param name=\"orderType\">排序类型</param>\r\n");
                sb_Dal.Append("        /// <param name=\"pageIndex\">当前页</param>\r\n");
                sb_Dal.Append("        /// <param name=\"pageSize\">页大小</param>\r\n");
                sb_Dal.Append("        /// <param name=\"count\">总条数</param>\r\n");
                sb_Dal.Append("        /// <returns></returns>\r\n");
                sb_Dal.Append("        public IList GetPageList(string orderField,string orderType, int pageIndex, int pageSize, ref int count)\r\n");
                sb_Dal.Append("        {\r\n");
                sb_Dal.Append("            return this.GetPageListWhere(null, null,orderField, orderType, pageIndex, pageSize, ref  count);\r\n");
                sb_Dal.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_GetPageListWhere"].ToString() == "checked")
            {
                #region 分页获取数据列表(带条件)
                sb_Dal.Append("        /// <summary>\r\n");
                sb_Dal.Append("        /// 分页获取数据列表(带条件)\r\n");
                sb_Dal.Append("        /// </summary>\r\n");
                sb_Dal.Append("        /// <param name=\"where\">条件</param>\r\n");
                sb_Dal.Append("        /// <param name=\"param\">参数化</param>\r\n");
                sb_Dal.Append("        /// <param name=\"orderField\">排序字段</param>\r\n");
                sb_Dal.Append("        /// <param name=\"orderType\">排序类型</param>\r\n");
                sb_Dal.Append("        /// <param name=\"pageIndex\">当前页</param>\r\n");
                sb_Dal.Append("        /// <param name=\"pageSize\">页大小</param>\r\n");
                sb_Dal.Append("        /// <param name=\"count\">总条数</param>\r\n");
                sb_Dal.Append("        /// <returns></returns>\r\n");
                sb_Dal.Append("        public IList GetPageListWhere(StringBuilder where, SqlParam[] param,string orderField, string orderType, int pageIndex, int pageSize, ref int count)\r\n");
                sb_Dal.Append("        {\r\n");
                sb_Dal.Append("            StringBuilder strSql = new StringBuilder();\r\n");
                sb_Dal.Append("            strSql.Append(\"SELECT * FROM " + table + " WHERE 1=1\");\r\n");
                sb_Dal.Append("            strSql.Append(where);\r\n");
                sb_Dal.Append("            return DataFactory.SqlHelper().GetPageList<" + table + ">(strSql.ToString(), param, CommonHelper.ToOrderField(\"SortCode\", orderField), orderType, pageIndex, pageSize, ref count);\r\n");
                sb_Dal.Append("        }\r\n");
                #endregion
            }
            sb_Dal.Append("        #endregion\r\n");
            sb_Dal.Append("    }\r\n");
            sb_Dal.Append("}");
            return sb_Dal.ToString();
        }
        #endregion

        #region 业务逻辑类
        /// <summary>
        /// 生成业务逻辑类
        /// </summary>
        /// <param name="table">表</param>
        /// <param name="tableexplain">表说明</param>
        /// <param name="method">选择方法</param>
        /// <returns></returns>
        public string BLL(string table, string tableexplain, Hashtable method)
        {
            StringBuilder sb_BLL = new StringBuilder();
            sb_BLL.Append("//=====================================================================================\r\n");
            sb_BLL.Append("// All Rights Reserved , Copyright © " + Company + " " + CreateYear + "\r\n");
            sb_BLL.Append("//=====================================================================================\r\n\r\n");
            sb_BLL.Append("using DotNet.Kernel;\r\n");
            sb_BLL.Append("using DotNet.Utilities;\r\n");
            sb_BLL.Append("using BPMS.Entity;\r\n");
            sb_BLL.Append("using BPMS.Service;\r\n");
            sb_BLL.Append("using BPMS.IBusiness;\r\n");
            sb_BLL.Append("using System.Collections;\r\n");
            sb_BLL.Append("using System.Text;\r\n\r\n");
            sb_BLL.Append("namespace " + ProjectName + "\r\n");
            sb_BLL.Append("{\r\n");
            sb_BLL.Append("    /// <summary>\r\n");
            sb_BLL.Append("    /// " + tableexplain + "\r\n");
            sb_BLL.Append("    /// <author>\r\n");
            sb_BLL.Append("    ///		<name>" + Author + "</name>\r\n");
            sb_BLL.Append("    ///		<date>" + CreateDate + "</date>\r\n");
            sb_BLL.Append("    /// </author>\r\n");
            sb_BLL.Append("    /// </summary>\r\n");
            sb_BLL.Append("    public class " + table + "BLL : " + table + "IBLL\r\n");
            sb_BLL.Append("    {\r\n");
            sb_BLL.Append("        private readonly " + table + "DAL dal = new " + table + "DAL();\r\n\r\n");

            sb_BLL.Append("        #region Method\r\n");
            if (method["ckb_GetMaxCode"].ToString() == "checked")
            {
                #region 获取最大编号
                sb_BLL.Append("        /// <summary>\r\n");
                sb_BLL.Append("        /// 获取最大编号\r\n");
                sb_BLL.Append("        /// </summary>\r\n");
                sb_BLL.Append("        /// <returns></returns>\r\n");
                sb_BLL.Append("        public object GetMaxCode()\r\n");
                sb_BLL.Append("        {\r\n");
                sb_BLL.Append("            return dal.GetMaxCode();\r\n");
                sb_BLL.Append("        }\r\n");
                #endregion
            }

            if (method["ckb_RecordCount"].ToString() == "checked")
            {
                #region 获取记录总数
                sb_BLL.Append("        /// <summary>\r\n");
                sb_BLL.Append("        /// 获取记录总数\r\n");
                sb_BLL.Append("        /// </summary>\r\n");
                sb_BLL.Append("        /// <param name=\"KeyValue\">主键值</param>\r\n");
                sb_BLL.Append("        /// <returns></returns>\r\n");
                sb_BLL.Append("        public int GetRecordCount(string KeyValue)\r\n");
                sb_BLL.Append("        {\r\n");
                sb_BLL.Append("            return dal.GetRecordCount(KeyValue);\r\n");
                sb_BLL.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_Insert"].ToString() == "checked")
            {
                #region 增加一条数据
                sb_BLL.Append("        /// <summary>\r\n");
                sb_BLL.Append("        /// 增加一条数据\r\n");
                sb_BLL.Append("        /// </summary>\r\n");
                sb_BLL.Append("        /// <param name=\"entity\">实体类</param>\r\n");
                sb_BLL.Append("        /// <returns></returns>\r\n");
                sb_BLL.Append("        public bool Insert(" + table + " entity)\r\n");
                sb_BLL.Append("        {\r\n");
                sb_BLL.Append("            return dal.Insert(entity) >= 0 ? true : false;\r\n");
                sb_BLL.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_Update"].ToString() == "checked")
            {
                #region 更新一条数据
                sb_BLL.Append("        /// <summary>\r\n");
                sb_BLL.Append("        /// 更新一条数据\r\n");
                sb_BLL.Append("        /// </summary>\r\n");
                sb_BLL.Append("        /// <param name=\"entity\">实体类</param>\r\n");
                sb_BLL.Append("        /// <returns></returns>\r\n");
                sb_BLL.Append("        public bool Update(" + table + " entity)\r\n");
                sb_BLL.Append("        {\r\n");
                sb_BLL.Append("            return dal.Update(entity) >= 0 ? true : false;\r\n");
                sb_BLL.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_Delete"].ToString() == "checked")
            {
                #region 删数据
                sb_BLL.Append("        /// <summary>\r\n");
                sb_BLL.Append("        /// 删除一条数据\r\n");
                sb_BLL.Append("        /// </summary>\r\n");
                sb_BLL.Append("        /// <param name=\"KeyValue\">主键</param>\r\n");
                sb_BLL.Append("        /// <returns></returns>\r\n");
                sb_BLL.Append("        public bool Delete(string KeyValue)\r\n");
                sb_BLL.Append("        {\r\n");
                sb_BLL.Append("            return dal.Delete(KeyValue) >= 0 ? true : false;\r\n");
                sb_BLL.Append("        }\r\n");

                sb_BLL.Append("        /// <summary>\r\n");
                sb_BLL.Append("        /// 批量删除数据\r\n");
                sb_BLL.Append("        /// </summary>\r\n");
                sb_BLL.Append("        /// <param name=\"KeyValue\">主键</param>\r\n");
                sb_BLL.Append("        /// <returns></returns>\r\n");
                sb_BLL.Append("        public bool BatchDelete(string[] KeyValue)\r\n");
                sb_BLL.Append("        {\r\n");
                sb_BLL.Append("            return dal.BatchDelete(KeyValue) >= 0 ? true : false;\r\n");
                sb_BLL.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_GetEntity"].ToString() == "checked")
            {
                #region 得到一个对象实体
                sb_BLL.Append("        /// <summary>\r\n");
                sb_BLL.Append("        /// 得到一个对象实体\r\n");
                sb_BLL.Append("        /// </summary>\r\n");
                sb_BLL.Append("        /// <param name=\"KeyValue\">主键</param>\r\n");
                sb_BLL.Append("        /// <returns></returns>\r\n");
                sb_BLL.Append("        public " + table + " GetEntity(string KeyValue)\r\n");
                sb_BLL.Append("        {\r\n");
                sb_BLL.Append("            return dal.GetEntity(KeyValue);\r\n");
                sb_BLL.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_GetList"].ToString() == "checked")
            {
                #region 获得数据列表
                sb_BLL.Append("        /// <summary>\r\n");
                sb_BLL.Append("        /// 获得数据列表\r\n");
                sb_BLL.Append("        /// </summary>\r\n");
                sb_BLL.Append("        /// <returns></returns>\r\n");
                sb_BLL.Append("        public IList GetList()\r\n");
                sb_BLL.Append("        {\r\n");
                sb_BLL.Append("            return dal.GetListWhere(null, null);\r\n");
                sb_BLL.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_GetListWhere"].ToString() == "checked")
            {
                #region 获得数据列表(带条件)
                sb_BLL.Append("        /// <summary>\r\n");
                sb_BLL.Append("        /// 获得数据列表(带条件)\r\n");
                sb_BLL.Append("        /// </summary>\r\n");
                sb_BLL.Append("        /// <param name=\"where\">条件</param>\r\n");
                sb_BLL.Append("        /// <param name=\"param\">参数化</param>\r\n");
                sb_BLL.Append("        /// <returns></returns>\r\n");
                sb_BLL.Append("        public IList GetListWhere(StringBuilder where, SqlParam[] param)\r\n");
                sb_BLL.Append("        {\r\n");
                sb_BLL.Append("            return dal.GetListWhere(where, param);\r\n");
                sb_BLL.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_GetPageList"].ToString() == "checked")
            {
                #region 分页获取数据列表
                sb_BLL.Append("        /// <summary>\r\n");
                sb_BLL.Append("        /// 分页获取数据列表\r\n");
                sb_BLL.Append("        /// </summary>\r\n");
                sb_BLL.Append("        /// <param name=\"orderField\">排序字段</param>\r\n");
                sb_BLL.Append("        /// <param name=\"orderType\">排序类型</param>\r\n");
                sb_BLL.Append("        /// <param name=\"pageIndex\">当前页</param>\r\n");
                sb_BLL.Append("        /// <param name=\"pageSize\">页大小</param>\r\n");
                sb_BLL.Append("        /// <param name=\"count\">总条数</param>\r\n");
                sb_BLL.Append("        /// <returns></returns>\r\n");
                sb_BLL.Append("        public IList GetPageList(string orderField,string orderType, int pageIndex, int pageSize, ref int count)\r\n");
                sb_BLL.Append("        {\r\n");
                sb_BLL.Append("            return dal.GetPageListWhere(null, null, orderField, orderType, pageIndex, pageSize, ref  count);\r\n");
                sb_BLL.Append("        }\r\n");
                #endregion
            }
            if (method["ckb_GetPageListWhere"].ToString() == "checked")
            {
                #region 分页获取数据列表(带条件)
                sb_BLL.Append("        /// <summary>\r\n");
                sb_BLL.Append("        /// 分页获取数据列表(带条件)\r\n");
                sb_BLL.Append("        /// </summary>\r\n");
                sb_BLL.Append("        /// <param name=\"where\">条件</param>\r\n");
                sb_BLL.Append("        /// <param name=\"param\">参数化</param>\r\n");
                sb_BLL.Append("        /// <param name=\"orderField\">排序字段</param>\r\n");
                sb_BLL.Append("        /// <param name=\"orderType\">排序类型</param>\r\n");
                sb_BLL.Append("        /// <param name=\"pageIndex\">当前页</param>\r\n");
                sb_BLL.Append("        /// <param name=\"pageSize\">页大小</param>\r\n");
                sb_BLL.Append("        /// <param name=\"count\">总条数</param>\r\n");
                sb_BLL.Append("        /// <returns></returns>\r\n");
                sb_BLL.Append("        public IList GetPageListWhere(StringBuilder where, SqlParam[] param,string orderField, string orderType, int pageIndex, int pageSize, ref int count)\r\n");
                sb_BLL.Append("        {\r\n");
                sb_BLL.Append("            return dal.GetPageListWhere(where, param, orderField, orderType, pageIndex, pageSize, ref count);\r\n");
                sb_BLL.Append("        }\r\n");
                #endregion
            }
            sb_BLL.Append("        #endregion\r\n");
            sb_BLL.Append("    }\r\n");
            sb_BLL.Append("}");
            return sb_BLL.ToString();
        }
        #endregion

        #region 业务逻辑接口类
        /// <summary>
        /// 业务逻辑接口类
        /// </summary>
        /// <param name="table">表</param>
        /// <param name="tableexplain">表说明</param>
        /// <param name="method">选择方法</param>
        /// <returns></returns>
        public string IBLL(string table, string tableexplain, Hashtable method)
        {
            StringBuilder sb_IBLL = new StringBuilder();
            sb_IBLL.Append("//=====================================================================================\r\n");
            sb_IBLL.Append("// All Rights Reserved , Copyright © " + Company + " " + CreateYear + "\r\n");
            sb_IBLL.Append("//=====================================================================================\r\n\r\n");
            sb_IBLL.Append("using DotNet.Kernel;\r\n");
            sb_IBLL.Append("using BPMS.Entity;\r\n");
            sb_IBLL.Append("using System.Collections;\r\n");
            sb_IBLL.Append("using System.Text;\r\n\r\n");
            sb_IBLL.Append("namespace " + ProjectName + "\r\n");
            sb_IBLL.Append("{\r\n");
            sb_IBLL.Append("    /// <summary>\r\n");
            sb_IBLL.Append("    /// " + tableexplain + " - 接口\r\n");
            sb_IBLL.Append("    /// <author>\r\n");
            sb_IBLL.Append("    ///		<name>" + Author + "</name>\r\n");
            sb_IBLL.Append("    ///		<date>" + CreateDate + "</date>\r\n");
            sb_IBLL.Append("    /// </author>\r\n");
            sb_IBLL.Append("    /// </summary>\r\n");
            sb_IBLL.Append("    public interface " + table + "IBLL\r\n");
            sb_IBLL.Append("    {\r\n");
            sb_IBLL.Append("        #region Method\r\n");

            if (method["ckb_GetMaxCode"].ToString() == "checked")
            {
                #region 获取最大编号
                sb_IBLL.Append("        /// <summary>\r\n");
                sb_IBLL.Append("        /// 获取最大编号\r\n");
                sb_IBLL.Append("        /// </summary>\r\n");
                sb_IBLL.Append("        /// <returns></returns>\r\n");
                sb_IBLL.Append("        object GetMaxCode();\r\n");
                #endregion
            }


            if (method["ckb_RecordCount"].ToString() == "checked")
            {
                #region 获取记录总数
                sb_IBLL.Append("        /// <summary>\r\n");
                sb_IBLL.Append("        /// 获取记录总数\r\n");
                sb_IBLL.Append("        /// </summary>\r\n");
                sb_IBLL.Append("        /// <param name=\"KeyValue\">主键值</param>\r\n");
                sb_IBLL.Append("        /// <returns></returns>\r\n");
                sb_IBLL.Append("        int GetRecordCount(string KeyValue);\r\n");
                #endregion
            }
            if (method["ckb_Insert"].ToString() == "checked")
            {
                #region 增加一条数据
                sb_IBLL.Append("        /// <summary>\r\n");
                sb_IBLL.Append("        /// 增加一条数据\r\n");
                sb_IBLL.Append("        /// </summary>\r\n");
                sb_IBLL.Append("        /// <param name=\"entity\">实体类</param>\r\n");
                sb_IBLL.Append("        /// <returns></returns>\r\n");
                sb_IBLL.Append("        bool Insert(" + table + " entity);\r\n");
                #endregion
            }
            if (method["ckb_Update"].ToString() == "checked")
            {
                #region 更新一条数据
                sb_IBLL.Append("        /// <summary>\r\n");
                sb_IBLL.Append("        /// 更新一条数据\r\n");
                sb_IBLL.Append("        /// </summary>\r\n");
                sb_IBLL.Append("        /// <param name=\"entity\">实体类</param>\r\n");
                sb_IBLL.Append("        /// <returns></returns>\r\n");
                sb_IBLL.Append("        bool Update(" + table + " entity);\r\n");
                #endregion
            }
            if (method["ckb_Delete"].ToString() == "checked")
            {
                #region 删数据
                sb_IBLL.Append("        /// <summary>\r\n");
                sb_IBLL.Append("        /// 删除一条数据\r\n");
                sb_IBLL.Append("        /// </summary>\r\n");
                sb_IBLL.Append("        /// <param name=\"KeyValue\">主键</param>\r\n");
                sb_IBLL.Append("        /// <returns></returns>\r\n");
                sb_IBLL.Append("        bool Delete(string KeyValue);\r\n");

                sb_IBLL.Append("        /// <summary>\r\n");
                sb_IBLL.Append("        /// 批量删除数据\r\n");
                sb_IBLL.Append("        /// </summary>\r\n");
                sb_IBLL.Append("        /// <param name=\"KeyValue\">主键</param>\r\n");
                sb_IBLL.Append("        /// <returns></returns>\r\n");
                sb_IBLL.Append("        bool BatchDelete(string[] KeyValue);\r\n");
                #endregion
            }
            if (method["ckb_GetEntity"].ToString() == "checked")
            {
                #region 得到一个对象实体
                sb_IBLL.Append("        /// <summary>\r\n");
                sb_IBLL.Append("        /// 得到一个对象实体\r\n");
                sb_IBLL.Append("        /// </summary>\r\n");
                sb_IBLL.Append("        /// <param name=\"KeyValue\">主键</param>\r\n");
                sb_IBLL.Append("        /// <returns></returns>\r\n");
                sb_IBLL.Append("        " + table + " GetEntity(string KeyValue);\r\n");
                #endregion
            }
            if (method["ckb_GetList"].ToString() == "checked")
            {
                #region 获得数据列表
                sb_IBLL.Append("        /// <summary>\r\n");
                sb_IBLL.Append("        /// 获得数据列表\r\n");
                sb_IBLL.Append("        /// </summary>\r\n");
                sb_IBLL.Append("        /// <returns></returns>\r\n");
                sb_IBLL.Append("        IList GetList();\r\n");
                #endregion
            }
            if (method["ckb_GetListWhere"].ToString() == "checked")
            {
                #region 获得数据列表(带条件)
                sb_IBLL.Append("        /// <summary>\r\n");
                sb_IBLL.Append("        /// 获得数据列表(带条件)\r\n");
                sb_IBLL.Append("        /// </summary>\r\n");
                sb_IBLL.Append("        /// <param name=\"where\">条件</param>\r\n");
                sb_IBLL.Append("        /// <param name=\"param\">参数化</param>\r\n");
                sb_IBLL.Append("        /// <returns></returns>\r\n");
                sb_IBLL.Append("        IList GetListWhere(StringBuilder where, SqlParam[] param);\r\n");
                #endregion
            }
            if (method["ckb_GetPageList"].ToString() == "checked")
            {
                #region 分页获取数据列表
                sb_IBLL.Append("        /// <summary>\r\n");
                sb_IBLL.Append("        /// 分页获取数据列表\r\n");
                sb_IBLL.Append("        /// </summary>\r\n");
                sb_IBLL.Append("        /// <param name=\"orderField\">排序字段</param>\r\n");
                sb_IBLL.Append("        /// <param name=\"orderType\">排序类型</param>\r\n");
                sb_IBLL.Append("        /// <param name=\"pageIndex\">当前页</param>\r\n");
                sb_IBLL.Append("        /// <param name=\"pageSize\">页大小</param>\r\n");
                sb_IBLL.Append("        /// <param name=\"count\">总条数</param>\r\n");
                sb_IBLL.Append("        /// <returns></returns>\r\n");
                sb_IBLL.Append("        IList GetPageList(string orderField,string orderType, int pageIndex, int pageSize, ref int count);\r\n");
                #endregion
            }
            if (method["ckb_GetPageListWhere"].ToString() == "checked")
            {
                #region 分页获取数据列表(带条件)
                sb_IBLL.Append("        /// <summary>\r\n");
                sb_IBLL.Append("        /// 分页获取数据列表(带条件)\r\n");
                sb_IBLL.Append("        /// </summary>\r\n");
                sb_IBLL.Append("        /// <param name=\"where\">条件</param>\r\n");
                sb_IBLL.Append("        /// <param name=\"param\">参数化</param>\r\n");
                sb_IBLL.Append("        /// <param name=\"orderField\">排序字段</param>\r\n");
                sb_IBLL.Append("        /// <param name=\"orderType\">排序类型</param>\r\n");
                sb_IBLL.Append("        /// <param name=\"pageIndex\">当前页</param>\r\n");
                sb_IBLL.Append("        /// <param name=\"pageSize\">页大小</param>\r\n");
                sb_IBLL.Append("        /// <param name=\"count\">总条数</param>\r\n");
                sb_IBLL.Append("        /// <returns></returns>\r\n");
                sb_IBLL.Append("        IList GetPageListWhere(StringBuilder where, SqlParam[] param,string orderField, string orderType, int pageIndex, int pageSize, ref int count);\r\n");
                #endregion
            }
            sb_IBLL.Append("        #endregion\r\n");
            sb_IBLL.Append("    }\r\n");
            sb_IBLL.Append("}");
            return sb_IBLL.ToString();
        }
        #endregion

        #region 页面表单
        #region Aspx_From
        /// <summary>
        /// 页面表单-Aspx_From
        /// </summary>
        /// <param name="table">表</param>
        /// <param name="tableexplain">表说明</param>
        /// <param name="arrayFrom">字段</param>
        /// <param name="CodeType">显示列数模式</param>
        /// <returns></returns>
        public string Aspx_From(string table, string tableexplain, object[] arrayFrom, string CodeType)
        {
            if (CodeType == "")
            {
                CodeType = "1";
            }
            StringBuilder sb_Aspx_From = new StringBuilder();
            sb_Aspx_From.Append("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
            sb_Aspx_From.Append("<head runat=\"server\">\r\n");
            sb_Aspx_From.Append("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
            sb_Aspx_From.Append("    <title>" + HttpContext.Current.Server.UrlDecode(tableexplain) + "表单</title>\r\n");
            sb_Aspx_From.Append("    <link href=\"/Themes/Styles/style.css\" rel=\"stylesheet\" />\r\n");
            sb_Aspx_From.Append("    <script src=\"/Themes/Scripts/jquery-1.8.2.min.js\" type=\"text/javascript\"></script>\r\n");
            sb_Aspx_From.Append("    <script src=\"/Themes/Scripts/DatePicker/WdatePicker.js\" type=\"text/javascript\"></script>\r\n");
            sb_Aspx_From.Append("    <script src=\"/Themes/Scripts/Validator/JValidator.js\" type=\"text/javascript\"></script>\r\n");
            sb_Aspx_From.Append("    <script src=\"/Themes/Scripts/artDialog/artDialog.source.js\" type=\"text/javascript\"></script>\r\n");
            sb_Aspx_From.Append("    <script src=\"/Themes/Scripts/artDialog/iframeTools.source.js\" type=\"text/javascript\"></script>\r\n");
            sb_Aspx_From.Append("    <script src=\"/Themes/Scripts/FunctionJS.js\" type=\"text/javascript\"></script>\r\n");
            sb_Aspx_From.Append("</head>\r\n");
            sb_Aspx_From.Append("<body>\r\n");
            sb_Aspx_From.Append("    <form id=\"form1\" runat=\"server\">\r\n");
            sb_Aspx_From.Append("        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"frm\" >\r\n");
            int index = 0;
            foreach (string item in arrayFrom)
            {
                if (item.Length > 0)
                {
                    Hashtable ht = HashtableHelper.List_Key_ValueToHashtable(item);
                    string Validator = ht["Validator"].ToString();
                    string maxlength = ht["Length"].ToString();
                    string ControlType = ht["Type"].ToString();
                    if (Validator != "")
                    {
                        Validator = "datacol=\"yes\" err=\"" + ht["Remark"].ToString() + "\" checkexpession=\"" + Validator + "\"";
                    }
                    if (CommonHelper.GetInt(maxlength) > 0)
                    {
                        maxlength = "maxlength=\"" + ht["Length"].ToString() + "\"";
                    }
                    else
                    {
                        maxlength = "";
                    }
                    if (index == 0)
                    {
                        sb_Aspx_From.Append("            <tr>\r\n");
                    }
                    sb_Aspx_From.Append("                <th>" + ht["Remark"].ToString() + "：\r\n");
                    sb_Aspx_From.Append("                </th>\r\n");
                    sb_Aspx_From.Append("                <td>\r\n");
                    switch (ControlType)
                    {
                        case "1"://1 - 文本框
                            sb_Aspx_From.Append("                    <input id=\"" + ht["Column"].ToString() + "\" " + maxlength + " runat=\"server\" type=\"text\"  " + Validator + " class=\"txt\" style=\"width: " + ht["MaxLength"].ToString() + "\" />\r\n");
                            break;
                        case "2"://2 - 下拉框
                            sb_Aspx_From.Append("                    <select id=\"" + ht["Column"].ToString() + "\" runat=\"server\" class=\"select\" style=\"width: " + ht["MaxLength"] + "\" " + Validator + ">\r\n");
                            sb_Aspx_From.Append("                    </select>\r\n");
                            break;
                        case "3"://3 - 日期框
                            sb_Aspx_From.Append("                    <input id=\"" + ht["Column"].ToString() + "\" " + maxlength + " onfocus=\"WdatePicker()\" class=\"txt\" runat=\"server\" type=\"text\" " + Validator + " style=\"width: " + ht["MaxLength"].ToString() + "\" />\r\n");
                            break;
                        case "4"://4 - 标签
                            sb_Aspx_From.Append("                    <label id=\"" + ht["Column"].ToString() + "\"/>\r\n");
                            break;
                        case "5"://5 - 文本区
                            sb_Aspx_From.Append("                    <textarea id=\"" + ht["Column"].ToString() + "\"  " + maxlength + " runat=\"server\" class=\"txtArea\" type=\"text\" " + Validator + "></textarea>\r\n");
                            break;
                        case "6"://6 - 复选框
                            sb_Aspx_From.Append("                    <span class=\"item\">\r\n");
                            sb_Aspx_From.Append("                    <input id=\"" + ht["Column"].ToString() + "\" type=\"checkbox\" runat=\"server\" checked=\"checked\" style=\"vertical-align: middle;\" />\r\n");
                            sb_Aspx_From.Append("                    <label for=\"" + ht["Column"].ToString() + "\" style=\"vertical-align: middle;\">" + ht["Remark"].ToString() + "</label>\r\n");
                            sb_Aspx_From.Append("                    &nbsp;&nbsp;\r\n");
                            sb_Aspx_From.Append("                    </span>\r\n");
                            break;
                        default:
                            break;
                    }
                    sb_Aspx_From.Append("                </td>\r\n");
                    index++;
                    if (CodeType == index.ToString())
                    {
                        index = 0;
                        sb_Aspx_From.Append("            </tr>\r\n");
                    }
                }
            }
            sb_Aspx_From.Append("        </table>\r\n");
            sb_Aspx_From.Append("        <div class=\"frmbottom\">\r\n");
            sb_Aspx_From.Append("            <asp:LinkButton ID=\"Accept\" runat=\"server\" class=\"l-btn\" OnClientClick=\"return CheckDataValid('#form1');\" OnClick=\"Accept_Click\"><span class=\"l-btn-left\">\r\n");
            sb_Aspx_From.Append("            <img src=\"/Themes/Images/16/accept.png\" alt=\"\" />确 认</span></asp:LinkButton>\r\n");
            sb_Aspx_From.Append("            <a class=\"l-btn\" href=\"javascript:void(0)\" onclick=\"OpenClose();\"><span class=\"l-btn-left\">\r\n");
            sb_Aspx_From.Append("            <img src=\"/Themes/Images/16/cancel.png\" alt=\"\" />关 闭</span></a>\r\n");
            sb_Aspx_From.Append("        </div>\r\n");
            sb_Aspx_From.Append("    </form>\r\n");
            sb_Aspx_From.Append("</body>\r\n");
            sb_Aspx_From.Append("</html>\r\n");
            return sb_Aspx_From.ToString();
        }
        #endregion

        #region 页面表单-Aspx_CS_From
        /// <summary>
        /// 页面表单-Aspx_CS_From
        /// </summary>
        /// <param name="table">表名</param>
        /// <param name="key">主键</param>
        /// <returns></returns>
        public string Aspx_CS_From(string table, string key)
        {
            StringBuilder sb_Aspx_CS_From = new StringBuilder();
            sb_Aspx_CS_From.Append("using BPMS.Entity;\r\n");
            sb_Aspx_CS_From.Append("using BPMS.Business;\r\n");
            sb_Aspx_CS_From.Append("using BPMS.IBusiness;\r\n");
            sb_Aspx_CS_From.Append("using DotNet.Utilities;\r\n");
            sb_Aspx_CS_From.Append("using System;\r\n");
            sb_Aspx_CS_From.Append("using System.Web;\r\n");
            sb_Aspx_CS_From.Append("using System.Web.UI;\r\n");
            sb_Aspx_CS_From.Append("using System.Web.UI.WebControls;\r\n\r\n");
            sb_Aspx_CS_From.Append("namespace BPMS.WEB\r\n");
            sb_Aspx_CS_From.Append("{\r\n");
            sb_Aspx_CS_From.Append("    public partial class " + table + "Form : System.Web.UI.Page\r\n");
            sb_Aspx_CS_From.Append("    {\r\n");

            sb_Aspx_CS_From.Append("        " + table + "IBLL " + table.ToLower() + "ibll = new " + table + "BLL();\r\n");
            sb_Aspx_CS_From.Append("        " + table + " " + table.ToLower() + " = new " + table + "();\r\n");
            sb_Aspx_CS_From.Append("        string _key;\r\n");
            sb_Aspx_CS_From.Append("        protected void Page_Load(object sender, EventArgs e)\r\n");
            sb_Aspx_CS_From.Append("        {\r\n");
            sb_Aspx_CS_From.Append("            _key = Request[\"key\"];                          //主键\r\n");
            sb_Aspx_CS_From.Append("            if (!IsPostBack)\r\n");
            sb_Aspx_CS_From.Append("            {\r\n");
            sb_Aspx_CS_From.Append("                InitControl();\r\n");
            sb_Aspx_CS_From.Append("            }\r\n");
            sb_Aspx_CS_From.Append("        }\r\n");


            sb_Aspx_CS_From.Append("        /// <summary>\r\n");
            sb_Aspx_CS_From.Append("        /// 得到一个对象实体\r\n");
            sb_Aspx_CS_From.Append("        /// </summary>\r\n");
            sb_Aspx_CS_From.Append("        public void InitControl()\r\n");
            sb_Aspx_CS_From.Append("        {\r\n");
            sb_Aspx_CS_From.Append("            if (!string.IsNullOrEmpty(_key))\r\n");
            sb_Aspx_CS_From.Append("            {\r\n");
            sb_Aspx_CS_From.Append("                " + table.ToLower() + " = " + table.ToLower() + "ibll.GetEntity(_key);\r\n");
            sb_Aspx_CS_From.Append("                ControlBindHelper.SetWebControls(this.Page, " + table.ToLower() + ");\r\n");
            sb_Aspx_CS_From.Append("            }\r\n");
            sb_Aspx_CS_From.Append("        }\r\n");


            sb_Aspx_CS_From.Append("        /// <summary>\r\n");
            sb_Aspx_CS_From.Append("        /// 确认事件\r\n");
            sb_Aspx_CS_From.Append("        /// </summary>\r\n");
            sb_Aspx_CS_From.Append("        /// <param name=\"sender\"></param>\r\n");
            sb_Aspx_CS_From.Append("        /// <param name=\"e\"></param>\r\n");
            sb_Aspx_CS_From.Append("        protected void Accept_Click(object sender, EventArgs e)\r\n");
            sb_Aspx_CS_From.Append("        {\r\n");
            sb_Aspx_CS_From.Append("            bool IsOk = false;\r\n");
            sb_Aspx_CS_From.Append("            " + table.ToLower() + " = ControlBindHelper.GetWebControls<" + table + ">(this.Page);\r\n");
            sb_Aspx_CS_From.Append("            if (!string.IsNullOrEmpty(_key))//判断是否编辑\r\n");
            sb_Aspx_CS_From.Append("            {\r\n");
            sb_Aspx_CS_From.Append("                " + table.ToLower() + "." + key + " = _key;\r\n");
            sb_Aspx_CS_From.Append("                " + table.ToLower() + ".ModifyDate = DateTime.Now;\r\n");
            sb_Aspx_CS_From.Append("                " + table.ToLower() + ".ModifyUserId = RequestSession.GetSessionUser().UserId.ToString();\r\n");
            sb_Aspx_CS_From.Append("                " + table.ToLower() + ".ModifyUserName = RequestSession.GetSessionUser().UserName.ToString();\r\n");
            sb_Aspx_CS_From.Append("                IsOk = " + table.ToLower() + "ibll.Update(" + table.ToLower() + ");\r\n");
            sb_Aspx_CS_From.Append("                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0006); }\r\n");

            sb_Aspx_CS_From.Append("            }\r\n");
            sb_Aspx_CS_From.Append("            else\r\n");
            sb_Aspx_CS_From.Append("            {\r\n");
            sb_Aspx_CS_From.Append("                " + table.ToLower() + "." + key + " = CommonHelper.GetGuid;\r\n");
            sb_Aspx_CS_From.Append("                " + table.ToLower() + ".CreateUserId = RequestSession.GetSessionUser().UserId.ToString();\r\n");
            sb_Aspx_CS_From.Append("                " + table.ToLower() + ".CreateUserName = RequestSession.GetSessionUser().UserName.ToString();\r\n");
            sb_Aspx_CS_From.Append("                IsOk = " + table.ToLower() + "ibll.Insert(" + table.ToLower() + ");\r\n");
            sb_Aspx_CS_From.Append("                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0005); }\r\n");
            sb_Aspx_CS_From.Append("            }\r\n");
            sb_Aspx_CS_From.Append("            if (!IsOk)\r\n");
            sb_Aspx_CS_From.Append("                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);\r\n");
            sb_Aspx_CS_From.Append("        }\r\n");

            sb_Aspx_CS_From.Append("    }\r\n");
            sb_Aspx_CS_From.Append("}");
            return sb_Aspx_CS_From.ToString();
        }
        #endregion
        #endregion

        #region 页面表格列表

        #region 页面表格列表 Aspx
        /// <summary>
        /// 表头显示/隐藏
        /// </summary>
        /// <param name="Field"></param>
        /// <returns></returns>
        public string IsShow_Field(string Field)
        {
            if (Field == "false")
            {
                return ",hidden: true";
            }
            return "";
        }
        /// <summary>
        /// 固定数据转换如：1-男;0-女
        /// </summary>
        /// <param name="render">字符串</param>
        /// <param name="index">所有</param>
        /// <returns></returns>
        public string ToRender(string render, int index)
        {
            if (string.IsNullOrEmpty(render))
                return "";
            StringBuilder str = new StringBuilder();
            string[] strrender = render.Split(';');
            str.Append(",\r\n");
            str.Append("                    render: function (ui) {\r\n");
            str.Append("                        var rowData = ui.rowData;\r\n");
            str.Append("                        var value = rowData[" + index + "];\r\n");
            foreach (var item in strrender)
            {
                if (item.Length > 0)
                {
                    string[] stritem = item.Split('-');
                    str.Append("                        if (value == '" + stritem[0] + "') {\r\n");
                    str.Append("                            return \"" + stritem[1] + "\";\r\n");
                    str.Append("                        }\r\n");
                }
            }
            str.Append("                    }\r\n");
            return str.ToString();
        }
        /// <summary>
        /// 页面表格列表-Aspx_List
        /// </summary>
        /// <param name="table">表</param>
        /// <param name="tableexplain">表说明</param>
        /// <param name="GetUrl">请求地址</param>
        /// <param name="arrayFrom">字段</param>
        /// <param name="CodeType">显示列数模式</param>
        /// <returns></returns>
        public string Aspx_List(string table, string tableexplain, string GetUrl, object[] arrayFrom, string CodeType)
        {
            StringBuilder sb_Aspx_List = new StringBuilder();
            StringBuilder sb_colM = new StringBuilder();
            StringBuilder sb_sort = new StringBuilder();
            int index = 0;
            foreach (string item in arrayFrom)
            {
                if (item.Length > 0)
                {
                    Hashtable ht = HashtableHelper.List_Key_ValueToHashtable(item);
                    sb_colM.Append("                { title: \"" + ht["Remark"] + "\", width: " + ht["MaxLength"] + ", align: \"" + ht["align"] + "\" " + IsShow_Field(ht["IsShow"].ToString()) + " " + ToRender(ht["render"].ToString(), index) + "},\r\n");



                    sb_sort.Append("                \"" + ht["Column"] + "\",\r\n");
                    index++;
                }
            }
            sb_Aspx_List.Append("<!DOCTYPE html>\r\n\r\n");
            sb_Aspx_List.Append("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
            sb_Aspx_List.Append("<head runat=\"server\">\r\n");
            sb_Aspx_List.Append("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
            sb_Aspx_List.Append("    <title>" + tableexplain + "列表</title>\r\n");
            sb_Aspx_List.Append("    <link href=\"/Themes/Styles/style.css\" rel=\"stylesheet\" />\r\n");
            sb_Aspx_List.Append("    <script src=\"/Themes/Scripts/jquery-1.8.2.min.js\"></script>\r\n");
            sb_Aspx_List.Append("    <script src=\"/Themes/Scripts/PqGrid/jquery-ui.min.js\"></script>\r\n");
            sb_Aspx_List.Append("    <script src=\"/Themes/Scripts/PqGrid/pqgrid.min.js\" charset=\"GBK\"></script>\r\n");
            sb_Aspx_List.Append("    <link href=\"/Themes/Scripts/PqGrid/pqgrid.min.css\" rel=\"stylesheet\" />\r\n");
            sb_Aspx_List.Append("    <script src=\"/Themes/Scripts/FunctionJS.js\" type=\"text/javascript\"></script>\r\n");
            sb_Aspx_List.Append("    <script type=\"text/javascript\">\r\n");
            sb_Aspx_List.Append("        $(function () {\r\n");
            sb_Aspx_List.Append("            ListGrid();\r\n");
            sb_Aspx_List.Append("        });\r\n");
            sb_Aspx_List.Append("        /**加载表格函数**/\r\n");
            sb_Aspx_List.Append("        function ListGrid() {\r\n");
            sb_Aspx_List.Append("            //url：请求地址\r\n");
            sb_Aspx_List.Append("            var url = \"" + GetUrl + "\";\r\n");
            sb_Aspx_List.Append("            //colM：表头名称\r\n");
            sb_Aspx_List.Append("            var colM = [\r\n");
            sb_Aspx_List.Append("" + StringHelper.DeleteLastLength(sb_colM.ToString(), 3) + "\r\n");
            sb_Aspx_List.Append("            ];\r\n");
            sb_Aspx_List.Append("            //sort：要显示字段,数组对应\r\n");
            sb_Aspx_List.Append("            var sort = [\r\n");
            sb_Aspx_List.Append("" + StringHelper.DeleteLastLength(sb_sort.ToString(), 3) + "\r\n");
            sb_Aspx_List.Append("            ];\r\n");
            if (CodeType == "2")
            {
                sb_Aspx_List.Append("            PQLoadGrid(\"#grid_paging\", url, colM, sort, 20)\r\n");
                sb_Aspx_List.Append("            $(\"#grid_paging\").pqGrid({ freezeCols: 1 })\r\n");
                sb_Aspx_List.Append("            pqGridResize(\"#grid_paging\", -51, -2);\r\n");
            }
            else
            {
                sb_Aspx_List.Append("            PQLoadGridNoPage(\"#grid_paging\", url, colM, sort)\r\n");
                sb_Aspx_List.Append("            $(\"#grid_paging\").pqGrid({ topVisible:false });\r\n");
                sb_Aspx_List.Append("            pqGridResizefixed(\"#grid_paging\", $(window).height() - 34, +15);\r\n");
            }
            sb_Aspx_List.Append("        }\r\n");
            sb_Aspx_List.Append("    </script>\r\n");
            sb_Aspx_List.Append("</head>\r\n");
            sb_Aspx_List.Append("<body>\r\n");
            sb_Aspx_List.Append("    <form id=\"form1\" runat=\"server\">\r\n");
            sb_Aspx_List.Append("        <div id=\"grid_paging\" style=\"margin-top: 1px;\"></div>\r\n");
            sb_Aspx_List.Append("    </form>\r\n");
            sb_Aspx_List.Append("</body>\r\n");
            sb_Aspx_List.Append("</html>\r\n");
            return sb_Aspx_List.ToString();
        }
        #endregion

        #region 页面表格列表-Aspx.CS
        /// <summary>
        /// 页面表格列表-Aspx_CS_From
        /// </summary>
        /// <param name="table">表名</param>
        /// <param name="CodeType">类型</param>
        /// <returns></returns>
        public string Aspx_CS_List(string table, string CodeType)
        {
            StringBuilder sb_Aspx_CS_List = new StringBuilder();
            sb_Aspx_CS_List.Append("using BPMS.Entity;\r\n");
            sb_Aspx_CS_List.Append("using BPMS.IBusiness;\r\n");
            sb_Aspx_CS_List.Append("using BPMS.Business;\r\n");
            sb_Aspx_CS_List.Append("using DotNet.Utilities;\r\n");
            sb_Aspx_CS_List.Append("using System;\r\n");
            sb_Aspx_CS_List.Append("using System.Web;\r\n");
            sb_Aspx_CS_List.Append("using System.Web.UI;\r\n");
            sb_Aspx_CS_List.Append("using System.Web.UI.WebControls;\r\n\r\n");
            sb_Aspx_CS_List.Append("namespace BPMS.WEB\r\n");
            sb_Aspx_CS_List.Append("{\r\n");
            sb_Aspx_CS_List.Append("    public partial class " + table + "List : System.Web.UI.Page\r\n");
            sb_Aspx_CS_List.Append("    {\r\n");

            sb_Aspx_CS_List.Append("        " + table + "IBLL " + table.ToLower() + "ibll = new " + table + "BLL();\r\n");
            sb_Aspx_CS_List.Append("        " + table + " " + table.ToLower() + " = new " + table + "();\r\n");
            sb_Aspx_CS_List.Append("        protected void Page_Load(object sender, EventArgs e)\r\n");
            sb_Aspx_CS_List.Append("        {\r\n");
            sb_Aspx_CS_List.Append("            if (!IsPostBack)\r\n");
            sb_Aspx_CS_List.Append("            {\r\n");
            sb_Aspx_CS_List.Append("                LoadAction();\r\n");
            sb_Aspx_CS_List.Append("            }\r\n");
            sb_Aspx_CS_List.Append("        }\r\n");

            sb_Aspx_CS_List.Append("        public void LoadAction()\r\n");
            sb_Aspx_CS_List.Append("        {\r\n");
            sb_Aspx_CS_List.Append("            Response.Buffer = true;\r\n");
            sb_Aspx_CS_List.Append("            Response.ExpiresAbsolute = System.DateTime.Now.AddSeconds(-1);\r\n");
            sb_Aspx_CS_List.Append("            Response.Expires = 0;\r\n");
            sb_Aspx_CS_List.Append("            Response.CacheControl = \"no-cache\";\r\n");
            sb_Aspx_CS_List.Append("            Response.AddHeader(\"Pragma\", \"No-Cache\");\r\n\r\n");
            sb_Aspx_CS_List.Append("            string active = HttpContext.Current.Request[\"action\"];                                          //提交类型\r\n");
            if (CodeType == "2")//判断是否分页
            {
                sb_Aspx_CS_List.Append("            int pageIndex = CommonHelper.GetInt(HttpContext.Current.Request[\"pqGrid_PageIndex\"]);           //当前页\r\n");
                sb_Aspx_CS_List.Append("            int pageSize = CommonHelper.GetInt(HttpContext.Current.Request[\"pqGrid_PageSize\"]);             //当前页大小\r\n");
            }
            sb_Aspx_CS_List.Append("            string orderField = HttpContext.Current.Request[\"pqGrid_OrderField\"];                           //排序字段  \r\n");
            sb_Aspx_CS_List.Append("            string orderType = HttpContext.Current.Request[\"pqGrid_OrderType\"];                             //排序类型\r\n");
            sb_Aspx_CS_List.Append("            string pqGrid_Sort = HttpContext.Current.Request[\"pqGrid_Sort\"];                                //要显示字段\r\n");
            sb_Aspx_CS_List.Append("            string key = HttpContext.Current.Request[\"key\"];                                                //主键\r\n");
            sb_Aspx_CS_List.Append("            switch (active)\r\n");
            sb_Aspx_CS_List.Append("            {\r\n");
            sb_Aspx_CS_List.Append("                case \"GridBindList\"://加载列表\r\n");
            if (CodeType == "2")//判断是否分页
            {
                sb_Aspx_CS_List.Append("                    int count = 0;\r\n");
                sb_Aspx_CS_List.Append("                    Response.Write(JsonHelper.PqGridPageJson<" + table + ">(" + table.ToLower() + "ibll.GetPageList(orderField, orderType, pageIndex, pageSize, ref count), pageIndex, pqGrid_Sort, count));\r\n");
                sb_Aspx_CS_List.Append("                    Response.End();\r\n");
            }
            else
            {
                sb_Aspx_CS_List.Append("                    Response.Write(JsonHelper.PqGridJson<" + table + ">(" + table.ToLower() + "ibll.GetList(), pqGrid_Sort));\r\n");
                sb_Aspx_CS_List.Append("                    Response.End();\r\n");
            }
            sb_Aspx_CS_List.Append("                    break;\r\n");
            sb_Aspx_CS_List.Append("                case \"Delete\":    //删除数据\r\n");
            sb_Aspx_CS_List.Append("                    Response.Write(" + table.ToLower() + "ibll.Delete(key));\r\n");
            sb_Aspx_CS_List.Append("                    Response.End();\r\n");
            sb_Aspx_CS_List.Append("                    break;\r\n");
            sb_Aspx_CS_List.Append("                default:\r\n");
            sb_Aspx_CS_List.Append("                    break;\r\n");
            sb_Aspx_CS_List.Append("            }\r\n");
            sb_Aspx_CS_List.Append("        }\r\n");
            sb_Aspx_CS_List.Append("    }\r\n");
            sb_Aspx_CS_List.Append("}");
            return sb_Aspx_CS_List.ToString();
        }
        #endregion
        #endregion
    }
}