using Senparc.Weixin.Context;
using Senparc.Weixin.Entities;
using Senparc.Weixin.MessageHandlers;
using Senparc.Weixin.QY.Entities;
using Senparc.Weixin.QY.Helpers;
using Senparc.Weixin.QY.MessageHandlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;

namespace QY.API
{
    public class CustomQYMessageHandler : QyMessageHandler<MessageContext<Senparc.Weixin.QY.Entities.IRequestMessageBase, Senparc.Weixin.QY.Entities.IResponseMessageBase>>
    {
        public CustomQYMessageHandler(XDocument requestDoc, PostModel postdata)
            : base(requestDoc, postdata)
        {
        }

        public override void OnExecuting()
        {
            base.OnExecuting();
        }

        public override Senparc.Weixin.QY.Entities.IResponseMessageBase OnTextRequest(RequestMessageText requestMessage)
        {
            var responseMessage = base.CreateResponseMessage<ResponseMessageText>();
            responseMessage.Content = requestMessage.Content;
            return responseMessage;
        }

        /// <summary>
        /// 默认消息
        /// </summary>
        /// <param name="requestMessage"></param>
        /// <returns></returns>
        public override Senparc.Weixin.QY.Entities.IResponseMessageBase DefaultResponseMessage(Senparc.Weixin.QY.Entities.IRequestMessageBase requestMessage)
        {
            var responseMessage = this.CreateResponseMessage<ResponseMessageText>();
            responseMessage.Content = "您发送的消息类型暂未被识别。";
            return responseMessage;
        }
    }
}
