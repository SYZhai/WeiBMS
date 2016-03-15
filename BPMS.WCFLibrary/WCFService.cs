using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using BPMS.Service;
using DotNet.Kernel;
using DotNet.Utilities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Xml;
using System.ServiceModel.Activation;

namespace BPMS.WCFLibrary
{
    /// <summary>
    /// WCF服务
    /// 版本：1.0
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.11.02</date>
    /// </author>
    /// </summary>
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Required)]
    public class WCFService : IWCFService
    {
        BPMS_PermissionIBLL bpms_permissionibll = new BPMS_PermissionBLL();
        BASE_InterfaceManageIBLL base_interfacemanageibll = new BASE_InterfaceManageBLL();
        BASE_InterfaceManage base_interfacemanage = new BASE_InterfaceManage();
        BPMS_InterfaceAccessIBLL bpms_interfaceaccessibll = new BPMS_InterfaceAccessBLL();

        #region 权限接口
        /// <summary>
        /// 模块菜单权限（返回JSON格式）
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public string GetModulePermission(string UserId)
        {
            //验证是否有权访问    
            if (!bpms_interfaceaccessibll.IsEnabled(UserId))
            {
                return MessageHelper.MSG0027;
            }
            IList ModulePermissionList = bpms_permissionibll.GetModulePermission(UserId);
            return JsonHelper.ListToJson<BPMS_ModulePermission>(ModulePermissionList, "BPMS");
        }
        /// <summary>
        /// 操作按钮权限（返回JSON格式）
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public string GetButtonPermission(string UserId)
        {
            //验证是否有权访问    
            if (!bpms_interfaceaccessibll.IsEnabled(UserId))
            {
                return MessageHelper.MSG0027;
            }
            IList ButtonPermissionList = bpms_permissionibll.GetButtonPermission(UserId);
            return JsonHelper.ListToJson<BPMS_ButtonPermission>(ButtonPermissionList, "BPMS");
        }
        /// <summary>
        /// 角色数据权限（返回XML格式）
        /// </summary>
        /// <param name="UserId">用户主键</param>
        /// <returns></returns>
        public string GetDataPermission(string UserId)
        {
            //验证是否有权访问    
            if (!bpms_interfaceaccessibll.IsEnabled(UserId))
            {
                return MessageHelper.MSG0027;
            }
            Hashtable DataPermissionList = bpms_permissionibll.GetDataPermission(UserId);
            return HashtableHelper.HashtableToXml(DataPermissionList);
        }
        #endregion

        #region 动态接口
        /// <summary>
        /// 创建系统异常日志
        /// </summary>
        protected LogHelper Logger = new LogHelper("WCFService");
        /// <summary>
        /// 创建系统异常日志
        /// </summary>
        protected LogHelper LoggerTime = new LogHelper("处理时间");

        #region 业务接口调用
        /// <summary>
        /// 业务接口调用
        /// </summary>
        /// <param name="Xml">XML格式</param>
        /// <param name="DeviceMark">设备号</param>
        /// <param name="Token">记号</param>
        /// <returns></returns>
        public string Invoke(string Xml, string DeviceMark, string Token)
        {
            //Stopwatch sw = new Stopwatch();
            //sw.Start();
            Xml = GZipHelper.Uncompress(Xml);
            StringBuilder Output = new StringBuilder();
            ArrayList arraySql = new ArrayList();
            ArrayList arrayParam = new ArrayList();
            int Type = 0;
            bool IsOk = false;
            try
            {
                AnalysisXml(Xml, out arraySql, out arrayParam, out Type);
                switch (Type)
                {
                    case 0://新增
                        IsOk = DataFactory.SqlHelper().BatchExecuteBySql((object[])arraySql.ToArray(typeof(object)), (object[])arrayParam.ToArray(typeof(object))) >= 0 ? true : false;
                        Output.Append(ResultMsg(IsOk, DbErrorMsg.ReturnMsg));
                        break;
                    case 1://修改
                        IsOk = DataFactory.SqlHelper().BatchExecuteBySql((object[])arraySql.ToArray(typeof(object)), (object[])arrayParam.ToArray(typeof(object))) >= 0 ? true : false;
                        Output.Append(ResultMsg(IsOk, DbErrorMsg.ReturnMsg));
                        break;
                    case 2://删除
                        IsOk = DataFactory.SqlHelper().BatchExecuteBySql((object[])arraySql.ToArray(typeof(object)), (object[])arrayParam.ToArray(typeof(object))) >= 0 ? true : false;
                        Output.Append(ResultMsg(IsOk, DbErrorMsg.ReturnMsg));
                        break;
                    case 3://查询
                        string strSql = string.Join(",", (string[])arraySql.ToArray(typeof(string)));
                        object[] arrayParamobject = (object[])arrayParam.ToArray(typeof(object));
                        SqlParam[] paramArray = (SqlParam[])arrayParamobject[0];
                        DataTable dt = DataFactory.SqlHelper().GetDataTableBySQL(new StringBuilder(strSql), paramArray);
                        if (DataTableHelper.IsExistRows(dt))
                        {
                            Output.Append(DataTableHelper.DataTableToXML(dt));
                        }
                        else
                        {
                            Output.Append(ResultMsg(false, "没有找到您要的相关数据"));
                        }
                        break;
                    case 4://存储过程-DataTableProc
                        string DataTableProc = string.Join(",", (string[])arraySql.ToArray(typeof(string)));
                        object[] DataTableProcParamobject = (object[])arrayParam.ToArray(typeof(object));
                        Hashtable DataTableProcparamArray = (Hashtable)DataTableProcParamobject[0];
                        DataTable DataTableProc_dt = DataFactory.SqlHelper().GetDataTableProc(DataTableProc, DataTableProcparamArray);
                        if (DataTableHelper.IsExistRows(DataTableProc_dt))
                        {
                            Output.Append(DataTableHelper.DataTableToXML(DataTableProc_dt));
                        }
                        else
                        {
                            Output.Append(ResultMsg(false, "没有找到您要的相关数据"));
                        }
                        break;
                    case 5://存储过程-DataSetProc
                        string DataSetProc = string.Join(",", (string[])arraySql.ToArray(typeof(string)));
                        object[] DataSetProcParamobject = (object[])arrayParam.ToArray(typeof(object));
                        Hashtable DataSetProcparamArray = (Hashtable)DataSetProcParamobject[0];
                        DataSet DataSetProc_dt = DataFactory.SqlHelper().GetDataSetProc(DataSetProc, DataSetProcparamArray);
                        if (DataSetProc_dt != null)
                        {
                            Output.Append(DataTableHelper.DataSetToXML(DataSetProc_dt));
                        }
                        else
                        {
                            Output.Append(ResultMsg(false, "没有找到您要的相关数据"));
                        }
                        break;
                    case 6://存储过程-ExecuteByProc
                        string ExecuteByProc = string.Join(",", (string[])arraySql.ToArray(typeof(string)));
                        object[] ExecuteByProcParamobject = (object[])arrayParam.ToArray(typeof(object));
                        Hashtable ExecuteByProcparamArray = (Hashtable)ExecuteByProcParamobject[0];
                        IsOk = DataFactory.SqlHelper().ExecuteByProc(ExecuteByProc, ExecuteByProcparamArray) >= 0 ? true : false;
                        Output.Append(ResultMsg(IsOk, DbErrorMsg.ReturnMsg));
                        break;
                    case 7://存储过程-BatchExecuteByProc
                        IsOk = DataFactory.SqlHelper().BatchExecuteByProc((object[])arraySql.ToArray(typeof(object)), (object[])arrayParam.ToArray(typeof(object))) >= 0 ? true : false;
                        Output.Append(ResultMsg(IsOk, DbErrorMsg.ReturnMsg));
                        break;
                    case -1://异常信息
                        Output.Append(ResultMsg(false, Logger.LogErrorMsg));
                        break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                Output.Append(ResultMsg(false, ex.Message));
            }
            //sw.Stop();
            //LoggerTime.WriteLog("服务器处理总耗时:" + sw.ElapsedMilliseconds + "毫秒-----------\r\n");
            return GZipHelper.Compress(Output.ToString());
        }
        #endregion

        #region 解析XML字符串格式
        /// <summary>
        /// 解析XML字符串格式
        /// </summary>
        /// <param name="Xml">xml字符串格式</param>
        /// <returns></returns>
        private void AnalysisXml(string Xml, out ArrayList arrSql, out ArrayList arrParam, out int Type)
        {
            ArrayList _arrSql = new ArrayList();
            ArrayList _arrParam = new ArrayList();
            int _Type = -1;
            try
            {
                XmlDocument xd = new XmlDocument();
                xd.LoadXml(Xml);
                foreach (XmlNode node in xd.ChildNodes)
                {
                    if (node.Name.Trim() == "Request")
                    {
                        foreach (XmlNode subnode in node.ChildNodes)
                        {
                            if (subnode.Name.Trim() == "data")
                            {
                                base_interfacemanage = base_interfacemanageibll.GetEntityByCode(subnode.Attributes["code"].Value);//根据接口代码获取对象
                                if (base_interfacemanage.InterfaceId != null)
                                {
                                    _Type = CommonHelper.GetInt(base_interfacemanage.Type);                           //动作类型：0-新增,1-修改,2-删除,3-查询,4-存储过程-DataTableProc,5-存储过程-GetDataSetProc,6-存储过程-ExecuteByProc,7-存储过程-BatchExecuteByProc
                                    string PermissionConstraint = base_interfacemanage.PermissionConstraint;          //约束达式
                                    foreach (XmlNode node_data in subnode.ChildNodes)
                                    {
                                        if (node_data.Name.Trim() == "no")
                                        {
                                            string pkName;
                                            string pkVal;
                                            switch (_Type)
                                            {
                                                case 0://新增
                                                    Hashtable ht_add = this.XmlNodeToHashtable(node_data);
                                                    _arrSql.Add(DbCommon.InsertSql(PermissionConstraint.Trim(), ht_add));
                                                    _arrParam.Add(DbCommon.GetParameter(ht_add));
                                                    break;
                                                case 1://修改
                                                    Hashtable ht_edit = this.XmlNodeToHashtable(node_data, out pkName, out pkVal);
                                                    _arrSql.Add(new StringBuilder(PermissionConstraint.Trim()));
                                                    _arrParam.Add(DbCommon.GetParameter(ht_edit));
                                                    break;
                                                case 2://删除
                                                    Hashtable ht_Delete = this.XmlNodeToHashtable(node_data, out pkName, out pkVal);
                                                    _arrSql.Add(DbCommon.DeleteSql(PermissionConstraint.Trim(), pkName));
                                                    _arrParam.Add(new SqlParam[] { new SqlParam("@" + pkName, pkVal) });
                                                    break;
                                                case 3://查询
                                                    Hashtable ht_Param = this.XmlNodeToHashtable(node_data);
                                                    _arrSql.Add(PermissionConstraint.Trim());
                                                    _arrParam.Add(DbCommon.GetParameter(ht_Param));
                                                    break;
                                                case 4://存储过程-DataTableProc
                                                    Hashtable DataTableProc = this.XmlNodeToHashtable(node_data);
                                                    _arrSql.Add(PermissionConstraint.Trim());
                                                    _arrParam.Add(DataTableProc);
                                                    break;
                                                case 5://存储过程-DataSetProc
                                                    Hashtable DataSetProc = this.XmlNodeToHashtable(node_data);
                                                    _arrSql.Add(PermissionConstraint.Trim());
                                                    _arrParam.Add(DataSetProc);
                                                    break;
                                                case 6://存储过程-ExecuteByProc
                                                    Hashtable ExecuteByProc = this.XmlNodeToHashtable(node_data);
                                                    _arrSql.Add(PermissionConstraint.Trim());
                                                    _arrParam.Add(ExecuteByProc);
                                                    break;
                                                case 7://存储过程-BatchExecuteByProc
                                                    Hashtable BatchExecuteByProc = this.XmlNodeToHashtable(node_data);
                                                    _arrSql.Add(PermissionConstraint.Trim());
                                                    _arrParam.Add(DbCommon.GetParameter(BatchExecuteByProc));
                                                    break;
                                                default:
                                                    break;
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    Logger.WriteLog(Xml.ToString() + "\r\n接口不存在\r\n");
                                }
                            }
                        }
                        break;
                    }
                }
            }
            catch (Exception e)
            {
                Logger.WriteLog(Xml.ToString() + "\r\n" + e.Message + "\r\n");
            }
            finally
            {
                arrSql = _arrSql;
                arrParam = _arrParam;
                Type = _Type;
            }
        }
        #endregion

        #region  XML节点转换Hashtable
        /// <summary>
        /// XML节点转换Hashtable
        /// </summary>
        /// <param name="node">XML节点</param>
        /// <param name="pkName">返回主键</param>
        /// <param name="pkVal">返回主键值</param>
        /// <returns>返回XML节点</returns>
        public Hashtable XmlNodeToHashtable(XmlNode node, out string pkName, out string pkVal)
        {
            string _pkName = "";
            string _pkVal = "";
            bool isFirstValue = true;
            Hashtable ht = new Hashtable();
            foreach (XmlNode node_info in node.ChildNodes)
            {
                if (isFirstValue)//<no>里面标签固定第一行主键
                {
                    isFirstValue = false;
                    _pkName = node_info.Name.Trim();
                    _pkVal = node_info.InnerText.Trim();
                }
                ht[node_info.Name.Trim()] = node_info.InnerText.Trim();
            }
            pkName = _pkName;
            pkVal = _pkVal;
            return ht;
        }
        /// <summary>
        /// XML节点转换Hashtable
        /// </summary>
        /// <param name="node">XML节点</param>
        /// <returns>返回XML节点</returns>
        public Hashtable XmlNodeToHashtable(XmlNode node)
        {
            Hashtable ht = new Hashtable();
            foreach (XmlNode node_info in node.ChildNodes)
            {
                ht[node_info.Name.Trim()] = node_info.InnerText.Trim();
            }
            return ht;
        }
        #endregion

        #region 返回结果
        /// <summary>
        /// 返回结果
        /// </summary>
        /// <param name="result">true:成功，false:失败</param>
        /// <param name="reason">原因</param>
        /// <returns></returns>
        private string ResultMsg(bool result, string reason)
        {
            StringBuilder strResponse = new StringBuilder();
            strResponse.Append("<Response>");
            strResponse.Append("<result>" + result + "</result>");
            strResponse.Append("<reason>" + reason + "</reason>");
            strResponse.Append("</Response>");
            return strResponse.ToString();
        }
        #endregion
        #endregion
    }
}
