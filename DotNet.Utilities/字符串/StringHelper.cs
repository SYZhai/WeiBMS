//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace DotNet.Utilities
{
    /// <summary>
    /// 字符串处理
    /// </summary>
    public class StringHelper
    {
        /// <summary>
        /// 格式化TextArea输入内容为html显示
        /// </summary>
        /// <param name="s">要格式化内容</param>
        /// <returns>完成内容</returns>
        public static string FormatTextArea(string s)
        {
            s = s.Replace("\n", "<br>");
            s = s.Replace("\x20", "&nbsp;");
            return s;
        }

        #region 得到字符串的长度，一个汉字算2个字符
        /// <summary>   
        /// 得到字符串的长度，一个汉字算2个字符   
        /// </summary>   
        /// <param name="str">字符串</param>   
        /// <returns>返回字符串长度</returns>   
        public static int GetLength(string str)
        {
            if (str.Length == 0) return 0;

            ASCIIEncoding ascii = new ASCIIEncoding();
            int tempLen = 0;
            byte[] s = ascii.GetBytes(str);
            for (int i = 0; i < s.Length; i++)
            {
                if ((int)s[i] == 63)
                {
                    tempLen += 2;
                }
                else
                {
                    tempLen += 1;
                }
            }
            return tempLen;
        }

        public static string GetCenterShow(string p, int size, int font)
        {
            // p = p.Trim();
            if (font == 2)
            {
                int s = 0;
                int len = p.Length;
                if (len >= 11) return p;
                if (len == 9) s = 2;
                if (len == 8) s = 2;
                if (len == 7) s = 3;
                if (len == 6) s = 4;
                if (len == 5) s = 4;
                if (len == 4) s = 5;
                if (len == 3) s = 6;
                if (len == 2) s = 7;
                string ttt = "";
                ttt = ttt.PadLeft(s, ' ');
                return ttt + p;
            }
            if (font == 1)
            {
                int len = GetLength(p);
                int tmp = 34 - len;
                if (tmp < 0) return p;
                double index = ((double)tmp / 2);  // 5
                string ttt = "";
                int s = (int)index;
                ttt = ttt.PadLeft(s, ' ');
                return ttt + p;
            }
            return p;
        }
        #endregion

        #region 省略字符串
        /// <summary>
        /// 省略字符串
        /// </summary>
        /// <param name="RawString">字符</param>
        /// <param name="Length">字节</param>
        /// <param name="status">是否开启省略字符串 0：否，1：是</param>
        /// <returns></returns>
        public static string GetOmitString(string str, int length, string status)
        {
            string temp = str;
            if (status == "1")
            {
                int j = 0;
                int k = 0;
                for (int i = 0; i < temp.Length; i++)
                {
                    if (Regex.IsMatch(temp.Substring(i, 1), @"[\u4e00-\u9fa5]+"))
                    {
                        j += 2;
                    }
                    else
                    {
                        j += 1;
                    }
                    if (j <= length)
                    {
                        k += 1;
                    }
                    if (j >= length)
                    {
                        return temp.Substring(0, k) + "...";
                    }
                }
            }
            return temp;
        }
        #endregion

        #region 分割字符串
        /// <summary>
        /// 分割字符串
        /// </summary>
        public static string[] SplitString(string strContent, string strSplit)
        {
            if (!string.IsNullOrEmpty(strContent))
            {
                if (strContent.IndexOf(strSplit) < 0)
                    return new string[] { strContent };

                return Regex.Split(strContent, Regex.Escape(strSplit), RegexOptions.IgnoreCase);
            }
            else
                return new string[0] { };
        }

        /// <summary>
        /// 分割字符串
        /// </summary>
        /// <returns></returns>
        public static string[] SplitString(string strContent, string strSplit, int count)
        {
            string[] result = new string[count];
            string[] splited = SplitString(strContent, strSplit);

            for (int i = 0; i < count; i++)
            {
                if (i < splited.Length)
                    result[i] = splited[i];
                else
                    result[i] = string.Empty;
            }

            return result;
        }
        #endregion

        #region 删除最后结尾的指定字符后的字符
        /// <summary>
        /// 删除最后结尾的指定字符后的字符
        /// </summary>
        public static string DelLastChar(string str, string strchar)
        {
            if (string.IsNullOrEmpty(str))
                return "";
            if (str.LastIndexOf(strchar) >= 0 && str.LastIndexOf(strchar) == str.Length - 1)
            {
                return str.Substring(0, str.LastIndexOf(strchar));
            }
            return str;
        }
        /// <summary>
        /// 删除最后字符
        /// </summary>
        /// <param name="str"></param>
        /// <param name="Length"></param>
        /// <returns></returns>
        public static string DeleteLastLength(string str, int Length)
        {
            if (string.IsNullOrEmpty(str))
                return "";
            str = str.Substring(0, str.Length - Length);//
            return str;
        }
        #endregion
    }
}
