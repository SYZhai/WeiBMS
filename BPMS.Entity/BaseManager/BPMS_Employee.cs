//=====================================================================================
// All Rights Reserved , Copyright © Learun 2013
//=====================================================================================

using DotNet.Kernel;
using System;
using System.ComponentModel;
using System.Text;

namespace BPMS.Entity
{
    /// <summary>
    /// 员工管理
    /// <author>
    ///		<name>shecixiong</name>
    ///		<date>2013.10.29</date>
    /// </author>
    /// </summary>
    [Description("员工管理")]
    [Key("EmployeeId")]
    public class BPMS_Employee
    {
        private string _EmployeeId = null;
        /// <summary>
        /// 职员主键
        /// </summary>
        /// <returns></returns>
        [Description("职员主键")]
        public string EmployeeId
        {
            get
            {
                return this._EmployeeId;
            }
            set
            {
                this._EmployeeId = value;
            }
        }
        private string _UserId = null;
        /// <summary>
        /// 用户主键
        /// </summary>
        /// <returns></returns>
        [Description("用户主键")]
        public string UserId
        {
            get
            {
                return this._UserId;
            }
            set
            {
                this._UserId = value;
            }
        }
        private string _Code = null;
        /// <summary>
        /// 编号,工号
        /// </summary>
        /// <returns></returns>
        [Description("编号,工号")]
        public string Code
        {
            get
            {
                return this._Code;
            }
            set
            {
                this._Code = value;
            }
        }
        private string _RealName = null;
        /// <summary>
        /// 姓名
        /// </summary>
        /// <returns></returns>
        [Description("姓名")]
        public string RealName
        {
            get
            {
                return this._RealName;
            }
            set
            {
                this._RealName = value;
            }
        }
        private string _Spell = null;
        /// <summary>
        /// 真实姓名拼音
        /// </summary>
        /// <returns></returns>
        [Description("真实姓名拼音")]
        public string Spell
        {
            get
            {
                return this._Spell;
            }
            set
            {
                this._Spell = value;
            }
        }
        private string _Alias = null;
        /// <summary>
        /// 别名
        /// </summary>
        /// <returns></returns>
        [Description("别名")]
        public string Alias
        {
            get
            {
                return this._Alias;
            }
            set
            {
                this._Alias = value;
            }
        }
        private string _Gender = null;
        /// <summary>
        /// 性别
        /// </summary>
        /// <returns></returns>
        [Description("性别")]
        public string Gender
        {
            get
            {
                return this._Gender;
            }
            set
            {
                this._Gender = value;
            }
        }
        private string _SubCompanyId = null;
        /// <summary>
        /// 分支机构主键
        /// </summary>
        /// <returns></returns>
        [Description("分支机构主键")]
        public string SubCompanyId
        {
            get
            {
                return this._SubCompanyId;
            }
            set
            {
                this._SubCompanyId = value;
            }
        }
        private string _CompanyId = null;
        /// <summary>
        /// 公司主键
        /// </summary>
        /// <returns></returns>
        [Description("公司主键")]
        public string CompanyId
        {
            get
            {
                return this._CompanyId;
            }
            set
            {
                this._CompanyId = value;
            }
        }
        private string _DepartmentId = null;
        /// <summary>
        /// 部门主键
        /// </summary>
        /// <returns></returns>
        [Description("部门主键")]
        public string DepartmentId
        {
            get
            {
                return this._DepartmentId;
            }
            set
            {
                this._DepartmentId = value;
            }
        }
        private string _WorkgroupId = null;
        /// <summary>
        /// 工作组主键
        /// </summary>
        /// <returns></returns>
        [Description("工作组主键")]
        public string WorkgroupId
        {
            get
            {
                return this._WorkgroupId;
            }
            set
            {
                this._WorkgroupId = value;
            }
        }
        private string _DutyId = null;
        /// <summary>
        /// 职位主键
        /// </summary>
        /// <returns></returns>
        [Description("职位主键")]
        public string DutyId
        {
            get
            {
                return this._DutyId;
            }
            set
            {
                this._DutyId = value;
            }
        }
        private string _IDCard = null;
        /// <summary>
        /// 身份证号码
        /// </summary>
        /// <returns></returns>
        [Description("身份证号码")]
        public string IDCard
        {
            get
            {
                return this._IDCard;
            }
            set
            {
                this._IDCard = value;
            }
        }
        private string _BankCode = null;
        /// <summary>
        /// 工资卡
        /// </summary>
        /// <returns></returns>
        [Description("工资卡")]
        public string BankCode
        {
            get
            {
                return this._BankCode;
            }
            set
            {
                this._BankCode = value;
            }
        }
        private string _Email = null;
        /// <summary>
        /// 电子邮件
        /// </summary>
        /// <returns></returns>
        [Description("电子邮件")]
        public string Email
        {
            get
            {
                return this._Email;
            }
            set
            {
                this._Email = value;
            }
        }
        private string _Mobile = null;
        /// <summary>
        /// 手机
        /// </summary>
        /// <returns></returns>
        [Description("手机")]
        public string Mobile
        {
            get
            {
                return this._Mobile;
            }
            set
            {
                this._Mobile = value;
            }
        }
        private string _ShortNumber = null;
        /// <summary>
        /// 短号
        /// </summary>
        /// <returns></returns>
        [Description("短号")]
        public string ShortNumber
        {
            get
            {
                return this._ShortNumber;
            }
            set
            {
                this._ShortNumber = value;
            }
        }
        private string _Telephone = null;
        /// <summary>
        /// 电话
        /// </summary>
        /// <returns></returns>
        [Description("电话")]
        public string Telephone
        {
            get
            {
                return this._Telephone;
            }
            set
            {
                this._Telephone = value;
            }
        }
        private string _OICQ = null;
        /// <summary>
        /// QQ号码
        /// </summary>
        /// <returns></returns>
        [Description("QQ号码")]
        public string OICQ
        {
            get
            {
                return this._OICQ;
            }
            set
            {
                this._OICQ = value;
            }
        }
        private string _OfficePhone = null;
        /// <summary>
        /// 办公电话
        /// </summary>
        /// <returns></returns>
        [Description("办公电话")]
        public string OfficePhone
        {
            get
            {
                return this._OfficePhone;
            }
            set
            {
                this._OfficePhone = value;
            }
        }
        private string _OfficeZipCode = null;
        /// <summary>
        /// 办公邮编
        /// </summary>
        /// <returns></returns>
        [Description("办公邮编")]
        public string OfficeZipCode
        {
            get
            {
                return this._OfficeZipCode;
            }
            set
            {
                this._OfficeZipCode = value;
            }
        }
        private string _OfficeAddress = null;
        /// <summary>
        /// 办公地址
        /// </summary>
        /// <returns></returns>
        [Description("办公地址")]
        public string OfficeAddress
        {
            get
            {
                return this._OfficeAddress;
            }
            set
            {
                this._OfficeAddress = value;
            }
        }
        private string _OfficeFax = null;
        /// <summary>
        /// 办公传真
        /// </summary>
        /// <returns></returns>
        [Description("办公传真")]
        public string OfficeFax
        {
            get
            {
                return this._OfficeFax;
            }
            set
            {
                this._OfficeFax = value;
            }
        }
        private int? _Age = null;
        /// <summary>
        /// 年龄
        /// </summary>
        /// <returns></returns>
        [Description("年龄")]
        public int? Age
        {
            get
            {
                return this._Age;
            }
            set
            {
                this._Age = value;
            }
        }
        private DateTime? _Birthday = null;
        /// <summary>
        /// 出生日期
        /// </summary>
        /// <returns></returns>
        [Description("出生日期")]
        public DateTime? Birthday
        {
            get
            {
                return this._Birthday;
            }
            set
            {
                this._Birthday = value;
            }
        }
        private string _Education = null;
        /// <summary>
        /// 最高学历
        /// </summary>
        /// <returns></returns>
        [Description("最高学历")]
        public string Education
        {
            get
            {
                return this._Education;
            }
            set
            {
                this._Education = value;
            }
        }
        private string _School = null;
        /// <summary>
        /// 毕业院校
        /// </summary>
        /// <returns></returns>
        [Description("毕业院校")]
        public string School
        {
            get
            {
                return this._School;
            }
            set
            {
                this._School = value;
            }
        }
        private DateTime? _GraduationDate = null;
        /// <summary>
        /// 毕业时间
        /// </summary>
        /// <returns></returns>
        [Description("毕业时间")]
        public DateTime? GraduationDate
        {
            get
            {
                return this._GraduationDate;
            }
            set
            {
                this._GraduationDate = value;
            }
        }
        private string _Major = null;
        /// <summary>
        /// 所学专业
        /// </summary>
        /// <returns></returns>
        [Description("所学专业")]
        public string Major
        {
            get
            {
                return this._Major;
            }
            set
            {
                this._Major = value;
            }
        }
        private string _Degree = null;
        /// <summary>
        /// 最高学位
        /// </summary>
        /// <returns></returns>
        [Description("最高学位")]
        public string Degree
        {
            get
            {
                return this._Degree;
            }
            set
            {
                this._Degree = value;
            }
        }
        private string _TitleId = null;
        /// <summary>
        /// 职称主键
        /// </summary>
        /// <returns></returns>
        [Description("职称主键")]
        public string TitleId
        {
            get
            {
                return this._TitleId;
            }
            set
            {
                this._TitleId = value;
            }
        }
        private DateTime? _TitleDate = null;
        /// <summary>
        /// 职称评定日期
        /// </summary>
        /// <returns></returns>
        [Description("职称评定日期")]
        public DateTime? TitleDate
        {
            get
            {
                return this._TitleDate;
            }
            set
            {
                this._TitleDate = value;
            }
        }
        private string _TitleLevel = null;
        /// <summary>
        /// TitleLevel
        /// </summary>
        /// <returns></returns>
        [Description("TitleLevel")]
        public string TitleLevel
        {
            get
            {
                return this._TitleLevel;
            }
            set
            {
                this._TitleLevel = value;
            }
        }
        private string _WorkingDate = null;
        /// <summary>
        /// 工作时间
        /// </summary>
        /// <returns></returns>
        [Description("工作时间")]
        public string WorkingDate
        {
            get
            {
                return this._WorkingDate;
            }
            set
            {
                this._WorkingDate = value;
            }
        }
        private DateTime? _JoinInDate = null;
        /// <summary>
        /// 加入本单位时间
        /// </summary>
        /// <returns></returns>
        [Description("加入本单位时间")]
        public DateTime? JoinInDate
        {
            get
            {
                return this._JoinInDate;
            }
            set
            {
                this._JoinInDate = value;
            }
        }
        private string _HomeZipCode = null;
        /// <summary>
        /// 家庭住址邮编
        /// </summary>
        /// <returns></returns>
        [Description("家庭住址邮编")]
        public string HomeZipCode
        {
            get
            {
                return this._HomeZipCode;
            }
            set
            {
                this._HomeZipCode = value;
            }
        }
        private string _HomeAddress = null;
        /// <summary>
        /// 家庭住址
        /// </summary>
        /// <returns></returns>
        [Description("家庭住址")]
        public string HomeAddress
        {
            get
            {
                return this._HomeAddress;
            }
            set
            {
                this._HomeAddress = value;
            }
        }
        private string _HomePhone = null;
        /// <summary>
        /// 住宅电话
        /// </summary>
        /// <returns></returns>
        [Description("住宅电话")]
        public string HomePhone
        {
            get
            {
                return this._HomePhone;
            }
            set
            {
                this._HomePhone = value;
            }
        }
        private string _HomeFax = null;
        /// <summary>
        /// 家庭传真
        /// </summary>
        /// <returns></returns>
        [Description("家庭传真")]
        public string HomeFax
        {
            get
            {
                return this._HomeFax;
            }
            set
            {
                this._HomeFax = value;
            }
        }
        private string _Province = null;
        /// <summary>
        /// 籍贯省
        /// </summary>
        /// <returns></returns>
        [Description("籍贯省")]
        public string Province
        {
            get
            {
                return this._Province;
            }
            set
            {
                this._Province = value;
            }
        }
        private string _City = null;
        /// <summary>
        /// 籍贯市
        /// </summary>
        /// <returns></returns>
        [Description("籍贯市")]
        public string City
        {
            get
            {
                return this._City;
            }
            set
            {
                this._City = value;
            }
        }
        private string _Area = null;
        /// <summary>
        /// 籍贯区
        /// </summary>
        /// <returns></returns>
        [Description("籍贯区")]
        public string Area
        {
            get
            {
                return this._Area;
            }
            set
            {
                this._Area = value;
            }
        }
        private string _NativePlace = null;
        /// <summary>
        /// 籍贯
        /// </summary>
        /// <returns></returns>
        [Description("籍贯")]
        public string NativePlace
        {
            get
            {
                return this._NativePlace;
            }
            set
            {
                this._NativePlace = value;
            }
        }
        private string _Party = null;
        /// <summary>
        /// 政治面貌
        /// </summary>
        /// <returns></returns>
        [Description("政治面貌")]
        public string Party
        {
            get
            {
                return this._Party;
            }
            set
            {
                this._Party = value;
            }
        }
        private string _Nation = null;
        /// <summary>
        /// 国籍
        /// </summary>
        /// <returns></returns>
        [Description("国籍")]
        public string Nation
        {
            get
            {
                return this._Nation;
            }
            set
            {
                this._Nation = value;
            }
        }
        private string _Nationality = null;
        /// <summary>
        /// 民族
        /// </summary>
        /// <returns></returns>
        [Description("民族")]
        public string Nationality
        {
            get
            {
                return this._Nationality;
            }
            set
            {
                this._Nationality = value;
            }
        }
        private string _WorkingProperty = null;
        /// <summary>
        /// 用工性质
        /// </summary>
        /// <returns></returns>
        [Description("用工性质")]
        public string WorkingProperty
        {
            get
            {
                return this._WorkingProperty;
            }
            set
            {
                this._WorkingProperty = value;
            }
        }
        private string _Competency = null;
        /// <summary>
        /// 职业资格
        /// </summary>
        /// <returns></returns>
        [Description("职业资格")]
        public string Competency
        {
            get
            {
                return this._Competency;
            }
            set
            {
                this._Competency = value;
            }
        }
        private string _EmergencyContact = null;
        /// <summary>
        /// 紧急联系
        /// </summary>
        /// <returns></returns>
        [Description("紧急联系")]
        public string EmergencyContact
        {
            get
            {
                return this._EmergencyContact;
            }
            set
            {
                this._EmergencyContact = value;
            }
        }
        private int? _IsDimission = null;
        /// <summary>
        /// 离职
        /// </summary>
        /// <returns></returns>
        [Description("离职")]
        public int? IsDimission
        {
            get
            {
                return this._IsDimission;
            }
            set
            {
                this._IsDimission = value;
            }
        }
        private DateTime? _DimissionDate = null;
        /// <summary>
        /// 离职日期
        /// </summary>
        /// <returns></returns>
        [Description("离职日期")]
        public DateTime? DimissionDate
        {
            get
            {
                return this._DimissionDate;
            }
            set
            {
                this._DimissionDate = value;
            }
        }
        private string _DimissionCause = null;
        /// <summary>
        /// 离职原因
        /// </summary>
        /// <returns></returns>
        [Description("离职原因")]
        public string DimissionCause
        {
            get
            {
                return this._DimissionCause;
            }
            set
            {
                this._DimissionCause = value;
            }
        }
        private string _DimissionWhither = null;
        /// <summary>
        /// 离职去向
        /// </summary>
        /// <returns></returns>
        [Description("离职去向")]
        public string DimissionWhither
        {
            get
            {
                return this._DimissionWhither;
            }
            set
            {
                this._DimissionWhither = value;
            }
        }
        private string _Description = null;
        /// <summary>
        /// 描述
        /// </summary>
        /// <returns></returns>
        [Description("描述")]
        public string Description
        {
            get
            {
                return this._Description;
            }
            set
            {
                this._Description = value;
            }
        }
        private int? _Enabled = null;
        /// <summary>
        /// 有效：1-有效，0-无效
        /// </summary>
        /// <returns></returns>
        [Description("有效：1-有效，0-无效")]
        public int? Enabled
        {
            get
            {
                return this._Enabled;
            }
            set
            {
                this._Enabled = value;
            }
        }
        private int? _SortCode = null;
        /// <summary>
        /// 排序吗
        /// </summary>
        /// <returns></returns>
        [Description("排序吗")]
        public int? SortCode
        {
            get
            {
                return this._SortCode;
            }
            set
            {
                this._SortCode = value;
            }
        }
        private int? _DeleteMark = null;
        /// <summary>
        /// 删除标记:1-正常，0-删除
        /// </summary>
        /// <returns></returns>
        [Description("删除标记:1-正常，0-删除")]
        public int? DeleteMark
        {
            get
            {
                return this._DeleteMark;
            }
            set
            {
                this._DeleteMark = value;
            }
        }
        private DateTime? _CreateDate = null;
        /// <summary>
        /// 创建时间
        /// </summary>
        /// <returns></returns>
        [Description("创建时间")]
        public DateTime? CreateDate
        {
            get
            {
                return this._CreateDate;
            }
            set
            {
                this._CreateDate = value;
            }
        }
        private string _CreateUserId = null;
        /// <summary>
        /// 创建用户主键
        /// </summary>
        /// <returns></returns>
        [Description("创建用户主键")]
        public string CreateUserId
        {
            get
            {
                return this._CreateUserId;
            }
            set
            {
                this._CreateUserId = value;
            }
        }
        private string _CreateUserName = null;
        /// <summary>
        /// 创建用户
        /// </summary>
        /// <returns></returns>
        [Description("创建用户")]
        public string CreateUserName
        {
            get
            {
                return this._CreateUserName;
            }
            set
            {
                this._CreateUserName = value;
            }
        }
        private DateTime? _ModifyDate = null;
        /// <summary>
        /// 修改时间
        /// </summary>
        /// <returns></returns>
        [Description("修改时间")]
        public DateTime? ModifyDate
        {
            get
            {
                return this._ModifyDate;
            }
            set
            {
                this._ModifyDate = value;
            }
        }
        private string _ModifyUserId = null;
        /// <summary>
        /// 修改用户主键
        /// </summary>
        /// <returns></returns>
        [Description("修改用户主键")]
        public string ModifyUserId
        {
            get
            {
                return this._ModifyUserId;
            }
            set
            {
                this._ModifyUserId = value;
            }
        }
        private string _ModifyUserName = null;
        /// <summary>
        /// 修改用户
        /// </summary>
        /// <returns></returns>
        [Description("修改用户")]
        public string ModifyUserName
        {
            get
            {
                return this._ModifyUserName;
            }
            set
            {
                this._ModifyUserName = value;
            }
        }
    }
}