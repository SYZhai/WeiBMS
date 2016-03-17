
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
using Tencent;
using Senparc.Weixin.QY.Entities;
using Senparc.Weixin.XmlUtility;
using System.Xml.Linq;
using Senparc.Weixin.QY.Entities.Response;
using Senparc.Weixin.QY.MessageHandlers;
using Senparc.Weixin.MessageHandlers;
using Senparc.Weixin.Context;
using QY.API;

namespace BPMS.WEB.api
{
    public partial class api : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sToken = "zsyy94123qwe";
            string sEncodingAESKey = "ugezVmmKMqlIV0DHK7DwxYUu0SRx56jxsHASe6qQowk";
            string sCorpID = "wxe1afc2b45b386c79";
            WXBizMsgCrypt wxcpt = new WXBizMsgCrypt(sToken, sEncodingAESKey, sCorpID);
            string sVerifyMsgSig = Request.QueryString["msg_signature"];
            string sVerifyTimeStamp = Request.QueryString["timestamp"];
            string sVerifyNonce = Request.QueryString["nonce"];
            string sVerifyEchoStr = Request.QueryString["echostr"];
            string replyEchoStr = "";
            LogHelper log = new LogHelper();
            if (Request.HttpMethod == "GET")
            {
                //get method - 仅在微信后台填写URL验证时触发
                
                
                log.WriteLog("1");
                replyEchoStr = Signature.VerifyURL(sToken, sEncodingAESKey, sCorpID, sVerifyMsgSig, sVerifyTimeStamp, sVerifyNonce, sVerifyEchoStr);
                if (replyEchoStr != null || replyEchoStr != "")
                {

                    WriteContent(replyEchoStr); //返回字符串则表示验证通过
                    log.WriteLog("2");
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
                log.WriteLog("3:");
                //post method - 当有用户想公众账号发送消息时触发
                //本地测试的时候注释掉 ----start -----
                //replyEchoStr = Signature.VerifyURL(sToken, sEncodingAESKey, sCorpID, sVerifyMsgSig, sVerifyTimeStamp, sVerifyNonce, sVerifyEchoStr);
                //if (replyEchoStr == null || replyEchoStr == "")
                //{
                //    WriteContent("参数错误！");
                //    return;
                //}

                //本地测试的时候注释掉 ----end -----

                var maxRecordCount = 10;
                log.WriteLog("4:");
                //自定义MessageHandler，对微信请求的详细判断操作都在这里面。
           
                try
                {
                    
                    XDocument postData= XmlUtility.Convert(Request.InputStream); 

                    EncryptPostData PostData = Senparc.Weixin.QY.RequestMessageFactory.GetEncryptPostData(postData.ToString());
                    //获取签名
                    string sig= Signature.GenarateSinature(sToken, sVerifyTimeStamp, sVerifyNonce, PostData.Encrypt);
                    //解密的明文信息
                    string sMsg = "";
                    int r= wxcpt.DecryptMsg(sig, sVerifyTimeStamp, sVerifyNonce, postData.ToString(),ref sMsg);
                    log.WriteLog("r=：" + r);
                    log.WriteLog("sMsg=：" + sMsg);
                    
                    IRequestMessageBase RequestMessageBase= RequestMessageFactory.GetRequestEntity(sMsg);
                    log.WriteLog("MsgType=：" + RequestMessageBase.MsgType);
                    PostModel postmodel = new PostModel();
                    postmodel.CorpId = sCorpID;
                    postmodel.EncodingAESKey = sEncodingAESKey;
                    postmodel.Msg_Signature = sVerifyMsgSig;
                    postmodel.Nonce = sVerifyNonce;
                    postmodel.Signature = sig;
                    postmodel.Timestamp = sVerifyTimeStamp;
                    postmodel.Token = sToken;
                    CustomQYMessageHandler myMes = new CustomQYMessageHandler(postData, postmodel);
                    myMes.Execute();
                    log.WriteLog("myMes.RequestDocument=：" + myMes.RequestDocument.ToString());
                    log.WriteLog("myMes.RequestMessage.FromUserName=：" + myMes.RequestMessage.FromUserName);
                   
                
                   
                    
                    myMes.DefaultResponseMessage(RequestMessageBase);
                    //企业回复
                    //测试时可开启此记录，帮助跟踪数据，使用前请确保App_Data文件夹存在，且有读写权限。
                    //messageHandler.RequestDocument.Save(
                    //    Server.MapPath("~/App_Data/" + DateTime.Now.Ticks + "_Request_" +
                    //                   messageHandler.RequestMessage.FromUserName + ".txt"));
                    //执行微信处理过程
                    //messageHandler.Execute();
                    //测试时可开启，帮助跟踪数据
                    //messageHandler.ResponseDocument.Save(
                    //    Server.MapPath("~/App_Data/" + DateTime.Now.Ticks + "_Response_" +
                    //                   messageHandler.ResponseMessage.ToUserName + ".txt"));
                    //WriteContent(messageHandler.ResponseDocument.ToString());
                    return;
                }
                catch (Exception ex)
                {
                    log.WriteLog(ex.ToString());
                    //using (TextWriter tw = new StreamWriter(Server.MapPath("~/App_Data/Error_" + DateTime.Now.Ticks + ".txt")))
                    //{
                    //    tw.WriteLine(ex.Message);
                    //    tw.WriteLine(ex.InnerException.Message);
                    //    //if (messageHandler.ResponseDocument != null)
                    //    //{
                    //    //    tw.WriteLine(messageHandler.ResponseDocument.ToString());
                    //    //}
                    //    tw.Flush();
                    //    tw.Close();
                    //}
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
        /// <summary>
        /// 写日志(用于跟踪)
        /// </summary>
        private void WriteLog(string strMemo)
        {
            string filename = Server.MapPath("~/logs/log.txt");
            if (!Directory.Exists(Server.MapPath("//logs//")))
                Directory.CreateDirectory("//logs//");
            StreamWriter sr = null;
            try
            {
                if (!File.Exists(filename))
                {
                    sr = File.CreateText(filename);
                }
                else
                {
                    sr = File.AppendText(filename);
                }
                sr.WriteLine(strMemo);
            }
            catch
            {
            }
            finally
            {
                if (sr != null)
                    sr.Close();
            }
        }
    }

}