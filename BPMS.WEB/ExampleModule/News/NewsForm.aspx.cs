using BPMS.Business;
using BPMS.Entity;
using BPMS.IBusiness;
using DotNet.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPMS.WEB.ExampleModule.News
{
    public partial class NewsForm : System.Web.UI.Page
    {
        BASE_NewsIBLL base_newsibll = new BASE_NewsBLL();
        BASE_News base_news = new BASE_News();
        string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            _key = Request["key"];                          //主键
            if (!IsPostBack)
            {
                InitControl();
            }
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public void InitControl()
        {
            if (!string.IsNullOrEmpty(_key))
            {
                base_news = base_newsibll.GetEntity(_key);
                ControlBindHelper.SetWebControls(this.Page, base_news);
            }
        }
        /// <summary>
        /// 确认事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Accept_Click(object sender, EventArgs e)
        {
            bool IsOk = false;
            base_news = ControlBindHelper.GetWebControls<BASE_News>(this.Page);
            base_news.Enabled = Enabled.Checked ? 1 : 0;
            if (!string.IsNullOrEmpty(_key))//判断是否编辑
            {
                base_news.NewsId = _key;
                base_news.ModifyDate = DateTime.Now;
                base_news.ModifyUserId = RequestSession.GetSessionUser().UserId.ToString();
                base_news.ModifyUserName = RequestSession.GetSessionUser().UserName.ToString();
                IsOk = base_newsibll.Update(base_news);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0006); }
            }
            else
            {
                base_news.ReadCount = 0;
                base_news.NewsId = CommonHelper.GetGuid;
                base_news.CreateUserId = RequestSession.GetSessionUser().UserId.ToString();
                base_news.CreateUserName = RequestSession.GetSessionUser().UserName.ToString();
                IsOk = base_newsibll.Insert(base_news);
                if (IsOk) { ShowMsgHelper.AlertCallback(MessageHelper.MSG0005); }
            }
            if (!IsOk)
                ShowMsgHelper.Alert_Error(MessageHelper.MSG0022);
        }
    }
}