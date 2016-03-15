
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Senparc.Weixin.QY;
using DotNet.Utilities;

namespace BPMS.WEB.api
{
    public partial class api : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sToken = "zsyy94123qwe";
            string sEncodingAESKey = "ugezVmmKMqlIV0DHK7DwxYUu0SRx56jxsHASe6qQowk";
            string sCorpID = "wxe1afc2b45b386c79";
            Tencent.WXBizMsgCrypt wxcpt = new Tencent.WXBizMsgCrypt(sToken, sEncodingAESKey, sCorpID);
            string sVerifyMsgSig = Request.QueryString["msg_signature"];
            string sVerifyTimeStamp = Request.QueryString["timestamp"];
            string sVerifyNonce = Request.QueryString["nonce"];
            string sVerifyEchoStr = Request.QueryString["echostr"];
            string replyEchoStr = "";
            if (Request.HttpMethod == "GET")
            {
                //get method - 仅在微信后台填写URL验证时触发
                
                //LogHelper log = new LogHelper();
                //log.WriteLog("sVerifyMsgSig:" + sVerifyMsgSig);
                replyEchoStr = Signature.VerifyURL(sToken, sEncodingAESKey, sCorpID, sVerifyMsgSig, sVerifyTimeStamp, sVerifyNonce, sVerifyEchoStr);
                if (replyEchoStr != null || replyEchoStr != "")
                {
                    WriteContent(replyEchoStr); //返回字符串则表示验证通过
                }
                else 
                {
                    WriteContent("failed:" + replyEchoStr + "。" +
                                "如果你在浏览器中看到这句话，说明此地址可以被作为微信企业号账号后台的Url，请注意保持Token一致。");
                }
                Response.End();
            
            }
            else
            {
                //post method - 当有用户想公众账号发送消息时触发
                //本地测试的时候注释掉 ----start -----
                replyEchoStr = Signature.VerifyURL(sToken, sEncodingAESKey, sCorpID, sVerifyMsgSig, sVerifyTimeStamp, sVerifyNonce, sVerifyEchoStr);
                if (replyEchoStr == null || replyEchoStr == "")
                {
                    WriteContent("参数错误！");
                    return;
                }

                //本地测试的时候注释掉 ----end -----
                
                var maxRecordCount = 10;
                
                //自定义MessageHandler，对微信请求的详细判断操作都在这里面。
                var messageHandler = new Senparc.Weixin.QY.MessageHandlers.QyMessageHandler<Document>(Request.InputStream, maxRecordCount);

                try
                {
                    //测试时可开启此记录，帮助跟踪数据，使用前请确保App_Data文件夹存在，且有读写权限。
                    //messageHandler.RequestDocument.Save(
                    //    Server.MapPath("~/App_Data/" + DateTime.Now.Ticks + "_Request_" +
                    //                   messageHandler.RequestMessage.FromUserName + ".txt"));
                    //执行微信处理过程
                    messageHandler.Execute();
                    //测试时可开启，帮助跟踪数据
                    //messageHandler.ResponseDocument.Save(
                    //    Server.MapPath("~/App_Data/" + DateTime.Now.Ticks + "_Response_" +
                    //                   messageHandler.ResponseMessage.ToUserName + ".txt"));
                    WriteContent(messageHandler.ResponseDocument.ToString());
                    return;
                }
                catch (Exception ex)
                {
                    using (TextWriter tw = new StreamWriter(Server.MapPath("~/App_Data/Error_" + DateTime.Now.Ticks + ".txt")))
                    {
                        tw.WriteLine(ex.Message);
                        tw.WriteLine(ex.InnerException.Message);
                        if (messageHandler.ResponseDocument != null)
                        {
                            tw.WriteLine(messageHandler.ResponseDocument.ToString());
                        }
                        tw.Flush();
                        tw.Close();
                    }
                    WriteContent("");
                }
                finally
                {
                    Response.End();
                }
            }
        }

        private void WriteContent(string str)
        {
            Response.Output.Write(str);
        }
    
    }

}