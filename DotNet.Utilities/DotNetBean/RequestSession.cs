﻿//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================
using System;
using System.Collections.Generic;
using System.Text;
using System.Web;

namespace DotNet.Utilities
{
    /// <summary>
    /// Session 帮助类
    /// </summary>
    public class RequestSession
    {
        public RequestSession()
        {

        }
        private static string SESSION_USER = "SESSION_USER";
        public static void AddSessionUser(SessionUser user)
        {
            HttpContext rq = HttpContext.Current;
            rq.Session[SESSION_USER] = user;
        }
        public static SessionUser GetSessionUser()
        {
            try 
            { 
                HttpContext rq = HttpContext.Current;
                return (SessionUser)rq.Session[SESSION_USER];
            }
            catch (Exception)
            {
                throw new Exception(MessageHelper.MSG0031);
            }
        }
    }
}
