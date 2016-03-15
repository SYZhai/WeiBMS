//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================
using System;
using System.Collections.Generic;
using System.Linq;
using System.Management;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace DotNet.Kernel
{
    /// <summary>
    /// 获取计算机硬件信息
    /// 版本：2.0
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.09.27</date>
    /// </author>
    /// </summary>
    public class ComputerHelper
    {
        ///<summary>
        /// 获取硬盘卷标号
        ///</summary>
        ///<returns></returns>
        private string GetDiskVolumeSerialNumber()
        {
            ManagementClass mc = new ManagementClass("win32_NetworkAdapterConfiguration");
            ManagementObject disk = new ManagementObject("win32_logicaldisk.deviceid=\"c:\"");
            disk.Get();
            return disk.GetPropertyValue("VolumeSerialNumber").ToString();
        }

        ///<summary>
        /// 获取CPU序列号
        ///</summary>
        ///<returns></returns>
        private string GetCpu()
        {
            string strCpu = null;
            ManagementClass myCpu = new ManagementClass("win32_Processor");
            ManagementObjectCollection myCpuCollection = myCpu.GetInstances();
            foreach (ManagementObject myObject in myCpuCollection)
            {
                strCpu = myObject.Properties["Processorid"].Value.ToString();
            }
            return strCpu;
        }
        ///<summary>
        /// 软件特征码
        ///</summary>
        ///<returns>软件特征码是获取正式版软件</returns>
        public string GetMNum()
        {
            string strNum = GetCpu() + GetDiskVolumeSerialNumber();
            strNum = strNum.Substring(0, 16);    //截取前24位作为机器码
            return strNum;
        }
    }
}