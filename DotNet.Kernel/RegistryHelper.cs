//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DotNet.Kernel
{
    /// <summary>
    /// 写入/读取注册表
    /// 版本：2.0
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.09.27</date>
    /// </author>
    /// </summary>
    public class RegistryHelper
    {
        /// <summary>
        /// 读取指定名称的注册表的值 
        /// </summary>
        /// <param name="name">名称</param>
        /// <returns></returns>
        public object GetRegistData(string name)
        {
            string registData;
            RegistryKey hkml = Registry.LocalMachine;
            RegistryKey software = hkml.OpenSubKey("SOFTWARE", true);
            RegistryKey aimdir = software.OpenSubKey("Learun", true);
            registData = aimdir.GetValue(name).ToString();
            return registData;
        }
        /// <summary>
        /// 向注册表中写数据 
        /// </summary>
        /// <param name="name">名称</param>
        /// <param name="tovalue">值</param>
        public void WTRegedit(string name, object tovalue)
        {
            RegistryKey hklm = Registry.LocalMachine;
            RegistryKey software = hklm.OpenSubKey("SOFTWARE", true);
            RegistryKey aimdir = software.CreateSubKey("Learun");
            aimdir.SetValue(name, tovalue);
        }
        /// <summary>
        /// 判断指定注册表项是否存在 
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public bool IsRegeditExit(string name)
        {
            try
            {
                this.GetRegistData(name);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
