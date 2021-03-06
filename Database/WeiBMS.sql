USE [master]
GO
/****** Object:  Database [WeiBMS]    Script Date: 2016-3-7 10:00:43 ******/
CREATE DATABASE [WeiBMS] ON  PRIMARY 
( NAME = N'BPMS', FILENAME = N'E:\DataBase\WeiBMS.mdf' , SIZE = 6336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BPMS_log', FILENAME = N'E:\DataBase\WeiBMS_log.LDF' , SIZE = 12608KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WeiBMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WeiBMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WeiBMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WeiBMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WeiBMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WeiBMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WeiBMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [WeiBMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WeiBMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WeiBMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WeiBMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WeiBMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WeiBMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WeiBMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WeiBMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WeiBMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WeiBMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WeiBMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WeiBMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WeiBMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WeiBMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WeiBMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WeiBMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WeiBMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WeiBMS] SET RECOVERY FULL 
GO
ALTER DATABASE [WeiBMS] SET  MULTI_USER 
GO
ALTER DATABASE [WeiBMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WeiBMS] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WeiBMS', N'ON'
GO
USE [WeiBMS]
GO
/****** Object:  Table [dbo].[BASE_File]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BASE_File](
	[FileId] [varchar](50) NOT NULL,
	[ParentId] [varchar](50) NULL,
	[FileName] [varchar](200) NULL,
	[FilePath] [varchar](200) NULL,
	[Introduction] [varchar](200) NULL,
	[FileType] [varchar](50) NULL,
	[FileSize] [varchar](50) NULL,
	[FileImg] [varchar](50) NULL,
	[Extensions] [varchar](50) NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BASE_File_Enabled]  DEFAULT ((1)),
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BASE_File_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BASE_InterfaceManage]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BASE_InterfaceManage](
	[InterfaceId] [varchar](50) NOT NULL,
	[Code] [varchar](50) NULL,
	[FullName] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[PermissionConstraint] [varchar](max) NULL,
	[Description] [varchar](200) NULL,
	[AllowEdit] [int] NULL,
	[AllowDelete] [int] NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BASE_InterfaceManage_Enabled]  DEFAULT ((1)),
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL CONSTRAINT [DF_BASE_InterfaceManage_DeleteMark]  DEFAULT ((1)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BASE_InterfaceManage_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BASE_InterfaceManageDetails]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BASE_InterfaceManageDetails](
	[InterfaceDetailsId] [varchar](50) NOT NULL,
	[InterfaceId] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Field] [varchar](50) NULL,
	[FieldMemo] [varchar](200) NULL,
	[FieldType] [varchar](50) NULL,
	[FieldMaxLength] [int] NULL,
	[FieldMinLength] [int] NULL,
	[PermissionConstraint] [varchar](max) NULL,
	[SortCode] [int] NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BASE_InterfaceManageDetails_Enabled]  DEFAULT ((1))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BASE_News]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BASE_News](
	[NewsId] [varchar](50) NOT NULL,
	[Introduction] [varchar](200) NULL,
	[Contents] [text] NULL,
	[Keywords] [varchar](200) NULL,
	[AuditStatus] [varchar](50) NULL,
	[ReadCount] [int] NULL,
	[Enabled] [int] NULL,
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BASE_News_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_AppendProperty]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_AppendProperty](
	[PropertyId] [varchar](50) NOT NULL,
	[ParentId] [varchar](50) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Control_Id] [varchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[DataSourceType] [int] NULL,
	[DataSource] [varchar](max) NULL,
	[Length] [varchar](50) NULL,
	[Height] [varchar](50) NULL,
	[Style] [varchar](50) NULL,
	[Validator] [varchar](200) NULL,
	[Showlength] [int] NULL,
	[Defaults] [varchar](200) NULL,
	[Custom] [varchar](200) NULL,
	[Event] [varchar](max) NULL,
	[Description] [varchar](200) NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BPMS_AppendProperty_Enabled]  DEFAULT ((1)),
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL CONSTRAINT [DF_BPMS_AppendProperty_DeleteMark]  DEFAULT ((1)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_AppendProperty_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_AppendPropertyInstance]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_AppendPropertyInstance](
	[PropertyInstanceId] [varchar](50) NOT NULL,
	[PropertyId] [varchar](50) NULL,
	[PropertyInstance_Value] [varchar](max) NULL,
	[PropertyInstance_Key] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_Button]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_Button](
	[ButtonId] [varchar](50) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Img] [varchar](50) NULL,
	[Event] [varchar](200) NULL,
	[Control_ID] [varchar](50) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Split] [int] NULL,
	[Description] [varchar](200) NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BPMS_Button_Enabled]  DEFAULT ((1)),
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL CONSTRAINT [DF_BPMS_Button_DeleteMark]  DEFAULT ((1)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_Button_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_DataPermission]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_DataPermission](
	[DataPermissionId] [varchar](50) NOT NULL,
	[RoleId] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[ResourceId] [varchar](50) NULL,
	[ObjectId] [text] NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_DataPermission_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_Employee]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_Employee](
	[EmployeeId] [varchar](50) NOT NULL,
	[UserId] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[RealName] [varchar](50) NULL,
	[Spell] [varchar](200) NULL,
	[Alias] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[SubCompanyId] [varchar](50) NULL,
	[CompanyId] [varchar](50) NULL,
	[DepartmentId] [varchar](50) NULL,
	[WorkgroupId] [varchar](50) NULL,
	[DutyId] [varchar](50) NULL,
	[IDCard] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[ShortNumber] [varchar](50) NULL,
	[Telephone] [varchar](50) NULL,
	[OICQ] [varchar](50) NULL,
	[OfficePhone] [varchar](50) NULL,
	[OfficeZipCode] [varchar](50) NULL,
	[OfficeAddress] [varchar](50) NULL,
	[OfficeFax] [varchar](50) NULL,
	[Age] [int] NULL,
	[Birthday] [datetime] NULL,
	[Education] [varchar](50) NULL,
	[School] [varchar](200) NULL,
	[GraduationDate] [datetime] NULL,
	[Major] [varchar](50) NULL,
	[Degree] [varchar](50) NULL,
	[TitleId] [varchar](50) NULL,
	[TitleDate] [datetime] NULL,
	[TitleLevel] [varchar](50) NULL,
	[WorkingDate] [varchar](50) NULL,
	[JoinInDate] [datetime] NULL,
	[HomeZipCode] [varchar](50) NULL,
	[HomeAddress] [varchar](200) NULL,
	[HomePhone] [varchar](50) NULL,
	[HomeFax] [varchar](50) NULL,
	[Province] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Area] [varchar](50) NULL,
	[NativePlace] [varchar](50) NULL,
	[Party] [varchar](50) NULL,
	[Nation] [varchar](50) NULL,
	[Nationality] [varchar](50) NULL,
	[WorkingProperty] [varchar](50) NULL,
	[Competency] [varchar](200) NULL,
	[EmergencyContact] [varchar](50) NULL,
	[IsDimission] [int] NULL,
	[DimissionDate] [datetime] NULL,
	[DimissionCause] [varchar](200) NULL,
	[DimissionWhither] [varchar](200) NULL,
	[Description] [varchar](200) NULL,
	[Enabled] [int] NULL,
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_Exception]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_Exception](
	[ExceptionId] [varchar](50) NOT NULL,
	[Source] [varchar](200) NULL,
	[Exception] [varchar](200) NULL,
	[Description] [varchar](max) NULL,
	[OperationIp] [varchar](50) NULL,
	[OperationIpCity] [varchar](200) NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_InterfaceAccess]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_InterfaceAccess](
	[IAccessId] [varchar](50) NOT NULL,
	[Code] [varchar](50) NULL,
	[AuthorizationUserId] [varchar](50) NULL,
	[AuthorizationUserName] [varchar](50) NULL,
	[AuthorizationCode] [varchar](200) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Description] [varchar](200) NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BPMS_InterfaceAccess_Enabled]  DEFAULT ((1)),
	[DeleteMark] [int] NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_InterfaceAccess_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_IPBlacklist]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_IPBlacklist](
	[IPBlacklistId] [varchar](50) NOT NULL,
	[Category] [varchar](50) NULL,
	[StartIp] [varchar](50) NULL,
	[EndIp] [varchar](50) NULL,
	[Failuretime] [datetime] NULL,
	[Description] [varchar](200) NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BPMS_IPBlacklist_Enabled]  DEFAULT ((1)),
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL CONSTRAINT [DF_BPMS_IPBlacklist_DeleteMark]  DEFAULT ((1)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_IPBlacklist_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_ItemDetails]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_ItemDetails](
	[ItemDetailsId] [varchar](50) NOT NULL,
	[ItemsId] [varchar](50) NULL,
	[ParentId] [varchar](50) NULL,
	[ItemName] [varchar](200) NULL,
	[ItemCode] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[AllowEdit] [int] NULL,
	[AllowDelete] [int] NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BPMS_ItemDetails_Enabled]  DEFAULT ((1)),
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL CONSTRAINT [DF_BPMS_ItemDetails_DeleteMark]  DEFAULT ((1)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_ItemDetails_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_Items]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_Items](
	[ItemsId] [varchar](50) NOT NULL,
	[ParentId] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[FullName] [varchar](50) NULL,
	[Category] [varchar](50) NULL,
	[IsTree] [int] NULL,
	[AllowEdit] [int] NULL,
	[AllowDelete] [int] NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BPMS_Items_Enabled]  DEFAULT ((1)),
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL CONSTRAINT [DF_BPMS_Items_DeleteMark]  DEFAULT ((1)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_Items_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_Organization]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_Organization](
	[OrganizationId] [varchar](50) NOT NULL,
	[ParentId] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[ShortName] [varchar](50) NULL,
	[FullName] [varchar](50) NULL,
	[Category] [varchar](50) NULL,
	[IsInnerOrganize] [int] NULL,
	[Manager] [varchar](50) NULL,
	[AssistantManager] [varchar](50) NULL,
	[OuterPhone] [varchar](50) NULL,
	[InnerPhone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Postalcode] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[Web] [varchar](200) NULL,
	[Description] [varchar](200) NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BPMS_Organization_Enabled]  DEFAULT ((1)),
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL CONSTRAINT [DF_BPMS_Organization_DeleteMark]  DEFAULT ((1)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_Organization_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_QYNumber]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_QYNumber](
	[QYId] [varchar](50) NOT NULL,
	[QYName] [varchar](50) NOT NULL,
	[QYDescription] [varchar](200) NULL,
	[QYLogo] [varchar](100) NULL,
	[QYEwm] [varchar](100) NULL,
	[CorpID] [varchar](50) NOT NULL,
	[Enabled] [int] NOT NULL,
	[SortCode] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserId] [varchar](50) NOT NULL,
	[CreateUserName] [varchar](50) NOT NULL,
	[remark] [varchar](100) NULL,
 CONSTRAINT [PK_BPMS_QYNumber] PRIMARY KEY CLUSTERED 
(
	[QYId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_RoleMenu]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_RoleMenu](
	[RoleMenuId] [varchar](50) NOT NULL,
	[RoleId] [varchar](50) NULL,
	[MenuId] [varchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_RoleMenu_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_RoleMenuButton]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_RoleMenuButton](
	[RoleMenuButtonId] [varchar](50) NOT NULL,
	[RoleId] [varchar](50) NULL,
	[MenuId] [varchar](50) NULL,
	[ButtonId] [varchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_RoleMenuButton_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_Roles]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_Roles](
	[RoleId] [varchar](50) NOT NULL,
	[OrganizationId] [varchar](50) NULL,
	[ParentId] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[FullName] [varchar](50) NULL,
	[Category] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[AllowEdit] [int] NULL,
	[AllowDelete] [int] NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BPMS_Roles_Enabled]  DEFAULT ((1)),
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL CONSTRAINT [DF_BPMS_Roles_DeleteMark]  DEFAULT ((1)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_Roles_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_Shortcut]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_Shortcut](
	[ShortcutId] [varchar](50) NOT NULL,
	[UserId] [varchar](50) NOT NULL,
	[MenuId] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_Shortcut_CreateDate]  DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_StaffOrganize]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_StaffOrganize](
	[StaffOrganizeId] [varchar](50) NOT NULL,
	[OrganizationId] [varchar](50) NULL,
	[UserId] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_SysLogDetails]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_SysLogDetails](
	[SysLogDetailsId] [varchar](50) NOT NULL,
	[SyslogsId] [varchar](50) NULL,
	[FieldName] [varchar](50) NULL,
	[FieldText] [varchar](50) NULL,
	[NewValue] [varchar](max) NULL,
	[OldValue] [varchar](max) NULL,
	[Remark] [varchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_SysLoginLog]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_SysLoginLog](
	[SysLoginLogId] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_SysLoginLog_CreateDate]  DEFAULT (getdate()),
	[Account] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[IPAddress] [varchar](50) NULL,
	[IPAddressName] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_SysLogs]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_SysLogs](
	[SyslogsId] [varchar](50) NOT NULL,
	[OperationType] [int] NULL,
	[TableName] [varchar](50) NULL,
	[BusinessName] [varchar](500) NULL,
	[Object_ID] [varchar](50) NULL,
	[OperationIp] [varchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_Syslogs_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[Result] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_SysMenu]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_SysMenu](
	[MenuId] [varchar](50) NOT NULL,
	[ParentId] [varchar](50) NOT NULL,
	[Code] [varchar](50) NULL,
	[FullName] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[Img] [varchar](50) NULL,
	[Category] [varchar](50) NULL,
	[NavigateUrl] [varchar](200) NULL,
	[FormName] [varchar](200) NULL,
	[Target] [varchar](50) NULL,
	[IsUnfold] [int] NULL,
	[AllowEdit] [int] NULL,
	[AllowDelete] [int] NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BPMS_SysMenu_Enabled]  DEFAULT ((1)),
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL CONSTRAINT [DF_BPMS_SysMenu_DeleteMark]  DEFAULT ((1)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_SysMenu_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_SysMenuButton]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_SysMenuButton](
	[SysMenuButtonId] [varchar](50) NOT NULL,
	[MenuId] [varchar](50) NULL,
	[ButtonId] [varchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_SysMenuButton_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[SortCode] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_TableColumns]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_TableColumns](
	[TableColumnsId] [varchar](50) NOT NULL,
	[MenuId] [varchar](50) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Field] [varchar](200) NOT NULL,
	[Width] [int] NOT NULL,
	[IsHidden] [int] NULL,
	[Align] [varchar](50) NULL,
	[Custom] [varchar](max) NULL,
	[IsPublic] [int] NULL,
	[Description] [varchar](200) NULL,
	[AllowEdit] [int] NULL,
	[AllowDelete] [int] NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BPMS_TableColumns_Enabled]  DEFAULT ((1)),
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL CONSTRAINT [DF_BPMS_TableColumns_DeleteMark]  DEFAULT ((1)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_TableColumns_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_User]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_User](
	[UserId] [varchar](50) NOT NULL,
	[Code] [varchar](50) NULL,
	[Account] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Secretkey] [varchar](50) NULL,
	[RealName] [varchar](50) NULL,
	[Spell] [varchar](200) NULL,
	[Alias] [varchar](50) NULL,
	[RoleId] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Telephone] [varchar](50) NULL,
	[Birthday] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[OICQ] [varchar](50) NULL,
	[DutyId] [varchar](50) NULL,
	[TitleId] [varchar](50) NULL,
	[CompanyId] [varchar](50) NULL,
	[DepartmentId] [varchar](50) NULL,
	[WorkgroupId] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[SecurityLevel] [varchar](50) NULL,
	[ChangePasswordDate] [datetime] NULL,
	[OpenId] [int] NULL,
	[IPAddress] [varchar](50) NULL,
	[MACAddress] [varchar](50) NULL,
	[LogOnCount] [int] NULL,
	[FirstVisit] [datetime] NULL,
	[PreviousVisit] [datetime] NULL,
	[LastVisit] [datetime] NULL,
	[Enabled] [int] NULL CONSTRAINT [DF_BPMS_User_Enabled]  DEFAULT ((1)),
	[SortCode] [int] NULL,
	[DeleteMark] [int] NULL CONSTRAINT [DF_BPMS_User_DeleteMark]  DEFAULT ((1)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_User_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUserId] [varchar](50) NULL,
	[ModifyUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_UserMenu]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_UserMenu](
	[UserMenuId] [varchar](50) NOT NULL,
	[UserId] [varchar](50) NULL,
	[MenuId] [varchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_UserMenu_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_UserMenuButton]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_UserMenuButton](
	[UserMenuButtonId] [varchar](50) NOT NULL,
	[UserId] [varchar](50) NULL,
	[MenuId] [varchar](50) NULL,
	[ButtonId] [varchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_UserMenuButton_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BPMS_UserRole]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BPMS_UserRole](
	[UserRoleId] [varchar](50) NOT NULL,
	[UserId] [varchar](50) NULL,
	[RoleId] [varchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_BPMS_UserRole_CreateDate]  DEFAULT (getdate()),
	[CreateUserId] [varchar](50) NULL,
	[CreateUserName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[BASE_File] ([FileId], [ParentId], [FileName], [FilePath], [Introduction], [FileType], [FileSize], [FileImg], [Extensions], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'acdbc266-ab9f-43f9-a8ad-4659a460ae60', NULL, N'首页.png', NULL, NULL, N'文件', N'2.16 MB', NULL, N'.png', 1, NULL, NULL, CAST(N'2015-11-10 12:56:22.920' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', NULL, NULL, NULL)
INSERT [dbo].[BASE_File] ([FileId], [ParentId], [FileName], [FilePath], [Introduction], [FileType], [FileSize], [FileImg], [Extensions], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'bbf8c1ba-e896-40df-9809-145e0ae8c823', NULL, N'07b002.jpg', NULL, NULL, N'文件', N'145.19 KB', NULL, N'.jpg', 1, NULL, NULL, CAST(N'2015-11-18 09:29:47.807' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', NULL, NULL, NULL)
INSERT [dbo].[BASE_InterfaceManage] ([InterfaceId], [Code], [FullName], [Type], [PermissionConstraint], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'90363285-c228-4237-86b0-ca2a87ba5553', N'I-ED00001', N'换单对应表下载', N'3', N'        Select * From (Select ROW_NUMBER() Over (Order By @orderField,@orderType) As rowNum, * From  (SELECT * FROM EDMS_Contrast WHERE 1=1 AND CreateDate>@CreateDate  AND ([Status] IS NULL OR [Status]=''到件'') ) As T ) As N Where rowNum > @beginNum And rowNum <= @endNum', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2013-10-30 23:51:30.693' AS DateTime), N'48f3889c-af8d-401f-ada2-c383031af92d', N'管理员', NULL, NULL, NULL)
INSERT [dbo].[BASE_InterfaceManage] ([InterfaceId], [Code], [FullName], [Type], [PermissionConstraint], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'c2b9232a-8fc4-4246-b136-391aadf630da', N'I-ED00002', N'拣货单下载', N'3', N'select * from EDMS_PickingList where  CreateDate>@CreateDate  AND Status is null ', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2013-10-30 23:54:21.193' AS DateTime), N'48f3889c-af8d-401f-ada2-c383031af92d', N'管理员', CAST(N'2013-10-30 23:54:42.243' AS DateTime), N'48f3889c-af8d-401f-ada2-c383031af92d', N'管理员')
INSERT [dbo].[BASE_InterfaceManage] ([InterfaceId], [Code], [FullName], [Type], [PermissionConstraint], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'6662f086-bbed-448f-b27e-5c1fae836a3d', N'I-ED00003', N'问题描述同步', N'3', N'select * from EDMS_IssueList where   CreateDate>@CreateDate', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2013-10-30 23:55:45.867' AS DateTime), N'48f3889c-af8d-401f-ada2-c383031af92d', N'管理员', CAST(N'2015-03-17 18:33:31.903' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BASE_InterfaceManage] ([InterfaceId], [Code], [FullName], [Type], [PermissionConstraint], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'a6862576-8d98-4626-9df2-aefb46e9b198', N'I-ED00004', N'扫描结果上传', N'7', N'PROC_Commit_ScanLog', NULL, NULL, NULL, 0, NULL, 0, CAST(N'2013-10-31 17:28:23.473' AS DateTime), N'48f3889c-af8d-401f-ada2-c383031af92d', N'管理员', CAST(N'2013-11-01 00:12:56.053' AS DateTime), N'48f3889c-af8d-401f-ada2-c383031af92d', N'管理员')
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'9e53a975-83b5-4df8-b9a6-2fff4b2371c6', N'90363285-c228-4237-86b0-ca2a87ba5553', NULL, N'orderField', NULL, N'字符串', 50, 1, NULL, 1, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'c9315861-c139-4b44-b579-8195ea5edd35', N'90363285-c228-4237-86b0-ca2a87ba5553', NULL, N'orderType', NULL, N'字符串', 50, 1, NULL, 2, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'6b1c37c6-c215-43a9-8404-d6a23432325a', N'90363285-c228-4237-86b0-ca2a87ba5553', NULL, N'beginNum', NULL, N'字符串', 50, 1, NULL, 3, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'3dcf4e6c-b09c-4c41-a88c-40042f9786b0', N'90363285-c228-4237-86b0-ca2a87ba5553', NULL, N'endNum', NULL, N'字符串', 50, 1, NULL, 4, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'073b9e5a-64d2-4bb0-84a4-f85a1c7d0114', N'a6862576-8d98-4626-9df2-aefb46e9b198', NULL, N'ScanId', N'扫描主键', N'字符串', 50, 1, NULL, 1, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'f08d8cbd-efbb-4bb5-9b1c-00bc850368b3', N'a6862576-8d98-4626-9df2-aefb46e9b198', NULL, N'Scanner', N'扫描人ID', N'字符串', 50, 1, NULL, 2, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'460b4310-a9da-43c0-bd3f-35263f747c39', N'a6862576-8d98-4626-9df2-aefb46e9b198', NULL, N'ScanDate ', N'扫描日期', N'字符串', 50, 1, NULL, 4, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'69ccdd5d-e290-4cf6-8b41-3498ff87b96b', N'a6862576-8d98-4626-9df2-aefb46e9b198', NULL, N'StokPlace', N'库位', N'字符串', 50, 1, NULL, 3, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'42a32928-3515-4e47-b9ae-d66fc5c5b464', N'a6862576-8d98-4626-9df2-aefb46e9b198', NULL, N'ScanType ', N'扫描类型', N'字符串', 50, 1, NULL, 5, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'f29156e4-aa51-4158-93d1-3c3b5b91740e', N'a6862576-8d98-4626-9df2-aefb46e9b198', NULL, N'BoxCode ', N'箱号', N'字符串', 50, 1, NULL, 6, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'6217078b-1dea-436e-b4f7-51c04cc3f785', N'a6862576-8d98-4626-9df2-aefb46e9b198', NULL, N'Remark ', N'自定义', N'字符串', 200, 1, NULL, 7, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'learun11', N'90363285-c228-4237-86b0-ca2a87ba5553', NULL, N'CreateDate', N'创建时间', N'字符串', 50, 1, NULL, 5, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'learun12', N'c2b9232a-8fc4-4246-b136-391aadf630da', NULL, N'CreateDate', N'创建时间', N'字符串', 50, 1, NULL, 1, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'241ca3bf-c842-44fd-a2cc-184ca09a8072', N'6662f086-bbed-448f-b27e-5c1fae836a3d', NULL, N'CreateDate', N'创建时间', N'字符串', 50, 1, NULL, 1, 0)
INSERT [dbo].[BASE_InterfaceManageDetails] ([InterfaceDetailsId], [InterfaceId], [Code], [Field], [FieldMemo], [FieldType], [FieldMaxLength], [FieldMinLength], [PermissionConstraint], [SortCode], [Enabled]) VALUES (N'21e52b4e-8a39-46ea-b11f-cb64ef3c4332', N'6662f086-bbed-448f-b27e-5c1fae836a3d', NULL, N'ere', NULL, N'数字', 45, 1, NULL, 2, 0)
INSERT [dbo].[BASE_News] ([NewsId], [Introduction], [Contents], [Keywords], [AuditStatus], [ReadCount], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'bde1c38e-697c-4b5d-9cda-1baf5483427e', N'关于程序员去大公司还是留在小公司的思考', N'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />转眼间已经工作近四年了，每年都有新的目标无论是薪资还是技术体系的不断完善。最近这几天“是不是该去大公司待几年”的想法总是不断的涌现在我的脑海中，这个想法从开始参加工作就已经产生了，下面说一下这个由来已久的计划：“刚开始工作的这几年 一是积累技术，因为 不是专业出身，二是积累金钱解决生活以及家庭问题。待到这两个问题都解决之后，去大公司待几年学习更为先进的全面的技术，开拓眼界，做出一些对人们影响更深的一些产品，二是为自己贴上一个光鲜的标签，算是一个资历吧，然后再去小公司去带领团队，将自己的思想和公司业务融合在一起，去干出一些更有意义的事情。”，这就是四年前开始参加工作时的职业规划。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 现在可能感觉时机已经成熟了吧，所以这个久违的想法开始出现了。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 结合朋友、同事、领导的建议 综合自己的思考，决定继续留在小公司发展，放弃原先计划中的“去大公司”的计划。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 我觉得这个问题对于广大的技术同胞来说应该是有所涉及的，所以下面说一下我个人思考的几个方面，希望能对大家在这个问题的思考上起到一些参考作用。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.薪资-我们的生存基础</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 如果你说刚开始就说钱，太现实太势利，那请你离开。薪资是我们生存在这个世界上，用来交换我们一切生活资料，保证家庭幸福的资源，除非你还有另外的获取钱的渠道，但是对于目前我们这些以上班为生的人来讲 这是我们获取生存资源的唯一途径。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 如果你从小公司跳槽到大公司，那说明你的经验以及技能方面还是不错的，其实也是正因为如此，你在小公司拿到的待遇应该比大公司高才对，这里略去其他因素只考虑我们可以掌握把控的东西，就是我们自己的技能和经验。如果你不能顺利完成由小跳大的过程，那就继续努力学习吧。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 所以，作为在一个小公司有着可以去大公司的技能和经验的人，薪资待遇应该是不错的，当然是正常情况下。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 也就是说从薪资方面，就不应该跳槽。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.前途-个人发展</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 其实在我们可以生存的不错的情况下，也就是说上述第一个方面对你的生活家庭影响不大的情况下，那么我们的个人发展就是最重要的。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 说一下我认为的在大公司的情况：可以见识以及学习到很多，因为大公司强大业务的需要而自主研发的新技术新产品，可以对我们的技术体系起到一个提高的作用，我们开发的产品也会有很多的人使用，经过自己的努力，几年的时间可以做到一块业务的领头人。当然 以后还可能有更高的发展，但是我们目前讨论的是我们在公司普通员工的这个层面这个阶段所考虑的问题，未来谁都无法预测，我们讨论的只是眼下的两三年的预测。或许以后开始创业或者去小公司，以现有的资历和技术去带领一个团队，开始征战在互联网这个领域中。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 下面再说一下在下公司的情况：作为一个在小公司有着完善的技术体系和经验的人，对于整个技术团队有着领头羊的作用。对于公司上层来讲，你是核心，是团队的核心，是项目的核心，有领导以及团队人员的信任与赏识，在这个环境中去发展。随着小公司的业务发展，由小变大，那些在大公司可以见识学习到的问题也会在不久的将来遇到。换一个角度，如果你对技术很是饥渴，没必要一定去大公司，通过周围在大公司朋友就可以了解学习到的。在小公司不断发展的过程中，我们会面临着不同的问题 不同的挑战，这些在已经成熟了的大公司是无法遇到的，这样的机会也就只能在这里有。而你个人在公司的位置或影响也会是不断的提高。无论是在公司继续还是创业，这个经历过程中学到的东西将是无比珍贵的。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 那些前辈们在我年少的时候曾经告诉过我一句话&quot;在一个公司至少要待上四年以上&quot;，现在想想确实很有道理。其实这句话所表达的重点不是几年，要表达的是我们需要在一个公司一个地方经历一个过程，这个过程中我们会积累很多东西，领导的信任与赏识、项目的积累和贡献、团队中的位置和影响、公司的业务发展、还有自身的定位 等等，这些东西都是我们需要花很多时间才能积累到才能察觉到的。如果我们像流水一样，不停的在流过新的地方，我们是无法得到这些用时间才能积累到的东西。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 刚开始工作的前两年由于年少浮躁以及迫于生活压力以及对自身定位不是很明确，换了几家公司。现在在这家公司待了两年多了，着实的感觉到积累了很多东西，对自己的职业规划也越来越明确了。所以决定在这个公司在现有的基础上去努力的奋斗吧，有些东西还是用时间去经历，会给你一些你意想不到的东西。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 至于去大公司还是小公司，还是都依据自己的情况来量体裁衣吧。大公司有着成熟的体制和业务，小公司充满了机遇和挑战，选择什么就看你自己想要什么了。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 不过说实话，现在大公司对于我现在没有什么吸引力了，因为在大公司的那些东西我通过自己和周围的朋友就能了解到学习到。我想在现在的小公司，在现在积累的资源上（已经干了两年了）继续努力的奋斗下去，未来不知如何，但我会用不断和学习和努力去面对。也许再过两年，我会积累一些新的东西。<br /></p>', N'', NULL, 0, 1, 1, NULL, CAST(N'2013-11-28 00:00:00.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', NULL, NULL, NULL)
INSERT [dbo].[BASE_News] ([NewsId], [Introduction], [Contents], [Keywords], [AuditStatus], [ReadCount], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'b1026311-87d4-455d-9dbe-17622e9ce433', N'不要逼我结对编程', N'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <p>我不是一个社交型的生物。我不想整天时间或大部分时间、甚至一小部分时间坐在另外一个程序员边上编程——即使是经过测量发现这样会提高我的开发效率。就是因为这不是我喜欢的工作方式。它会毁了我对生活的感觉，毁了我的工作环境。我，跟大多数左脑型的人一样，是一个内向的人，无法从容的忍受过度的结伴或社交活动。我感觉这些都是非常让人消耗精力、让人恼怒的事情。我更喜欢安静的一个人工作。这样工作我会非常有效率。事实上我是想说这样我会极其有效率。我深信这是我能获得最大工作效率的工作方式。更重要的，这是我最乐意的方式。生活中没有比快乐更重要的事情了。我可以做一次尝试，看看结对编程是否能比我单独编程更有效率，但我不愿意，因为我根本不在意比较的结果。如果我渴望整天时间坐在另一个人或一群人身边搞社交活动，那我不如去做公关工作或销售或其它类似的工作。</p><p>　　我知道结对编程有很多可以看到的好处。我知道有些人深信结对编程能帮助初级程序员更快的提高进步。我知道有些人深信它能让你减少 bug 的产生。我知道有些人深信它能帮助增加团队的凝合力。如此等等…我知道有很多研究都对此加以证实。我也读了不少，但这些研究都像是在跟我作对，没有一个是适合我的。一个都没有。如果按照那些自称能让我更有效率的指导强行对我施行结对编程，我宁愿立即辞职。如果结对编程是软件业唯一允许的实践方法，我宁愿单干，自己开公司。如果编程工作只能用结队编程实现，那我选择放弃编程。我会选择一种行当，一种没有这些多余的要求我从事社交活动、被人打搅的准则的行当。(不断的被打搅是结对编程的基本信条之一。长时间的结对编程的情况下一个人怎么能进入最高效率状态、进入 zone 境界？这超出了我的能力。)</p><p>　　结对编程跟我的个性真是无法兼容，我是一个能力很强、技术很高的程序员。我知道，因为我妈妈这样说的。;) 事实上，我的能力和技术证明了结对编程的非必要性。结对编程对于增加程序员的效率和开发出最好的产品都绝对不是必须的。它对我反而有负面影响。</p><p>　　我并不认为我是唯一有这种观点的人。所有我的同事都有这种看法。在我 20 多年的职业生涯中，我只知道有一个人，我怀疑他有可能是适合结对编程的，这个人是外向型的，老实的说，他不是一个特别好的程序员。不是特别差，但不能称作好——一般吧。我的意思是，我有信心说，我的对结对编程的观点和态度不是独有的。绝对不是。我相信软件产业里有份量的开发者或领袖会有同感。而那些广大的“螺丝钉”和“齿轮”(朝九晚五拿工资的人)，我怀疑只有 40% 或更少的人能从结对编程中受益。我怀疑所有的关于结对编程的喧嚣都来自他们。结果，外向型的管理经理们把这些人和内向型的放在团队里一起管理。(提示：非技术人员一般不应该被安排管理技术人员——这如同水火不容。)</p><p>　　所以，如果你是这些人中的一员，请闭嘴，不要再说什么结对编程了。它就像是一支又老又无聊的颂歌，我早就听烦了。没错，它可能很适合你。没错，它可能很适合你的团队。但你们只是少数——非常少但噪音很大的少数。干那些适合你自己的，但请尊重其他人，让其他人做适合他们的事。我很久没有听到或读到有人抨击结对编程有多么的糟糕了。集中你的注意力，努力思考，深入问题，设计解决方案，正确的实现，系统化的测试。我们不需要把思想观点从喉咙里挤出来，挂在脸上，显示它是多么“神奇”和多么具有“革命性”。我们只是在开发，管好自己的事就行了。如果你认为把一种编程实践方法当作宗教式的宣传比编程本身更重要，那你是绝对需要结对编程来帮助你提高效率。好的程序员，少说，多做。</p>', N'', NULL, 0, 1, 2, NULL, CAST(N'2013-11-28 00:00:00.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', NULL, NULL, NULL)
INSERT [dbo].[BASE_News] ([NewsId], [Introduction], [Contents], [Keywords], [AuditStatus], [ReadCount], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'92ab7d2b-968d-4ee2-b0e7-9fabf5a8bd13', N'云计算公司Box CEO： 偏执是成功的关键', N'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <p>亚当-李维（Adam Levie）利用八年的时间成功打造出了一家价值 12 亿美元的公司，而他现在才 28 岁。今年，作为这家云计算公司 Box 的 CEO，李维被 Inc. 杂志评为“年度企业家”。</p><p>　　Inc.杂志主编埃里克-舍恩伯格（Eric Schurenberg）称，李维“做了所有伟大的企业家都做过的事情。他总能非常超前地看清未来的发展趋势，然后充分发挥自己的个性魅力和冲天干劲，确保他的同事和客户也能洞察未来。”</p><p>　　李维在接受媒体采访时谈到了自己成功的三个秘诀：把握时机、保持失败者心态以及永远保持警醒（甚至是偏执狂般的警觉性）。</p><p>　　“我们很幸运，在时间方面把握得非常好。我们创立公司的时间，以及我们做出重大举措的时间，都把握得很到位。这使得很多大型企业都开始采用我们的云服务。”李维说。</p><p>　　据 Inc. 杂志称，Box 公司的这些重大举措包括：在意识到云存储服务已成为一种商品后，Box 公司的市场定位就从消费者市场转到了企业市场。而且，甚至在苹果 iPad 开售之前，该公司就已开始让其开发者开发 iPad 版 Box 应用程序。</p><p>　　“我们的行业和我们的业务发展速度非常迅猛，基本上每周或每月就会发生变化。因此，你必须随时准备开始做下一件事。如果你决策失误，或者执行出错，哪怕只持续一个季度，你的公司就有可能面临着生死的考验。”李维说，“你必须像一个失败者那样不停地思考和行动，专注你必须完成的下一件事。”</p><p>　　李维引用了英特尔前 CEO 安迪-葛洛夫（Andy Grove）名言说，“只有偏执狂才能够成功。”他宣称这就是他和大多数硅谷企业家奉行的准则。“你必须时刻警惕所有可能影响你的发展趋势，始终保持清醒的意识和警觉性，随时准备应对可能发生的一切。”</p>', N'', NULL, 0, 1, 3, NULL, CAST(N'2013-11-28 00:00:00.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', NULL, NULL, NULL)
INSERT [dbo].[BASE_News] ([NewsId], [Introduction], [Contents], [Keywords], [AuditStatus], [ReadCount], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'10e89140-1c20-4aa6-a84a-ef2bbfd0edda', N'360发表公开信：垄断将致中国互联网“荒漠化”', N'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <p>11 月 26 日消息奇虎 360 上诉腾讯滥用市场支配地位一案将于今天上午在最高院公开审理，奇虎 360 在庭审间隙发布公开信，指责腾讯构成垄断，并“扼杀”了创业者，致中国互联网产业“荒漠化”</p><p>　　奇虎 360 称，“互联网巨头垄断市场的程度已经远远超越了金融、电信、石油、电力这些老牌的垄断行业。腾讯一家公司的市值已经超过全部 40 多家中国互联网海外上市公司总市值的 50%，腾讯的业务更是涵盖了通信、金融Q币、娱乐游戏、社交网络、新闻资讯、电视传播、电子商务等互联网全部业务。”，并认为这种垄断让中国互联网产业”荒漠化“。</p><p>　　今天上午九点，本案最高院第一法庭公开开庭审理。奇虎 360 在庭审中提出上诉要求撤回广东高级人民法院的判决，并要求腾讯道歉并赔偿 1.5 亿元，庭审还在进一步进行的过程中，将于今天下午晚些时候结束庭审，并择日宣判结果。</p><p>　　以下是奇虎 360 公开信全文：</p><p>　　360 呼吁：不要让垄断扼杀年轻创业者的中国梦！</p><p>　　“如果腾讯做了同样的产品，你怎么办？”这句话，是中国互联网创业公司在引入投资时，几乎都会被投资人问到的问题。事实上，“生、死、腾讯”早已经成为中国互联网年轻创业者三个必须每天面对的问题，一些创业者会这样回答：“这个领域腾讯不会关注的。”“如果腾讯关注到了呢？”……</p><p>　　残酷的现实就是如此！互联网巨头让年轻人创业的门槛越来越高，这是因为互联网巨头可以肆无忌惮地以各种模仿、抄袭、交叉补贴的手段入侵到创业者的生存地带；即使在成长的过程中，巨头的挤压也是无处不在。谁还记得 IMO、联众、开心偷菜等一大批曾经在创业初期非常成功的企业？在美国，天使投资通常只需对每个项目投资 5 万美元，就可以扶植起一大批种子创业公司；而中国这种阶段的天使投资，至少要 50 万美金，是美国的 10 倍，创业者才有生存下去的可能，而且失败率居高不下。</p><p>　　你可能不知道，中国互联网表面上是创新和有活力的行业，其实互联网巨头垄断市场的程度已经远远超越了金融、电信、石油、电力这些老牌的垄断行业。腾讯一家公司的市值已经超过全部 40 多家中国互联网海外上市公司总市值的 50%，腾讯的业务更是涵盖了通信、金融Q币、娱乐游戏、社交网络、新闻资讯、电视传播、电子商务等互联网全部业务。十八届三中全会《决定》里提出“建设统一开放、竞争有序的市场体系”，传统经济领域中老牌的垄断企业都在面临新一轮被拆分的挑战，但是互联网巨头却通过大规模并购在进一步提高垄断的程度，并且垄断的触角在向其他行业急剧扩散和渗透，包括媒体、金融、影视、通讯等，全能型垄断寡头呼之欲出，这种现象在传统行业从来没有发生过。</p><p>　　一将功成万骨枯，巨头垄断已使中国互联网产业荒漠化。中国互联网巨头的市值，虽然已经名列全球前三位，但整个中国互联网行业的总产值和在全球的地位却比美国差得很远。根据第三方数据统计，2006 年之后在长达 8 年的时间里，中国互联网没有诞生一家新的有影响力的网站或公司，而同期美国却诞生了 Facebook 等一大批创新公司，中国互联网市场从与美国同步繁荣变成荒漠化。套用马云的话，如果腾讯赢了，全中国年轻的创业者们就输了。</p><p>　　垄断打破了市场平衡，破坏了市场公平，在巨头垄断的市场里，消费者利益受损、创新停滞，所以世界各国都非常警惕企业通过滥用支配地位对市场的压制行为，反垄断也是各国政府的核心职责。在美国，反垄断法被称为“自由企业的大宪章”，在德国被称为“经济宪法”，在日本被认为是“经济法的核心”，在欧盟反垄断法更是最重要的核心法律。</p><p>　　反垄断的调查与制裁的原则，即维护市场秩序和创新。十多年前，正是在微软遭遇反垄断调查面临分拆之后，谷歌才得以迅速崛起；而当谷歌成为互联网新霸主之后，全球多达 37 次反垄断和专门性调查也随之到来。也正是受益于这些反垄断的调查，美国的互联网行业一直保持了持续的创新和活力，Facebook、Youtube、Twitter、Groupon 等更多新兴互联网科技企业脱颖而出。</p><p>　　360 诉腾讯垄断案，是《反垄断法》出台六年来，最高院公开审理的互联网反垄断第一案。这意味着，《反垄断法》将不再是笼里的睡狮，而是悬在互联网巨头上方的一把利剑。只有对互联网巨头在收购、合作、结盟方面的竞争行为展开反垄断调查成为常态，对巨头公司滥用市场支配地位的竞争心态和手段进行遏制成为惯例，公平竞争的市场环境才有可能形成，创新和活力才能够不断涌现，年轻创业者们的中国梦才有可能实现。</p><p>　　我们相信，这场反垄断的标本之战，最后的赢家不是 360，不是腾讯，而将是全中国的年轻人、创业者！</p>', N'', NULL, 0, 1, 4, NULL, CAST(N'2013-11-28 00:00:00.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', NULL, NULL, NULL)
INSERT [dbo].[BPMS_AppendProperty] ([PropertyId], [ParentId], [FullName], [Control_Id], [Type], [DataSourceType], [DataSource], [Length], [Height], [Style], [Validator], [Showlength], [Defaults], [Custom], [Event], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'ec06ff11-060e-4696-b969-969979b37b1a', N'1', N'身高', N'height', 1, 0, N'', N'200px', N'25', N'txt', N'', 50, NULL, NULL, N'', NULL, 1, 1, 1, CAST(N'2013-10-31 21:08:45.987' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', NULL, NULL, NULL)
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'067b2de9-037f-4bb9-8a41-285eb3fc7267', N'新增', N'application_add.png', N'add()', N'add', N'工具栏', 0, N'', 1, 1, 1, CAST(N'2013-10-19 23:41:13.223' AS DateTime), NULL, NULL, CAST(N'2013-11-23 17:54:20.283' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', N'编辑', N'application_edit.png', N'edit()', N'edit', N'工具栏', 0, NULL, 1, 2, 1, CAST(N'2013-10-19 23:41:13.000' AS DateTime), NULL, NULL, CAST(N'2013-10-20 14:29:11.783' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', N'删除', N'application_delete.png', N'Delete()', N'Delete', N'工具栏', 1, NULL, 1, 3, 1, CAST(N'2013-10-19 23:41:13.000' AS DateTime), NULL, NULL, CAST(N'2013-10-20 14:30:03.037' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'44b5dce0-be25-46cb-be31-e985c3e0fbe7', N'字段', N'application_cascade.png', N'ModuleField()', N'ModuleField', N'工具栏', 0, N'模块字段管理', 1, 4, 1, CAST(N'2013-10-20 14:26:05.173' AS DateTime), NULL, NULL, CAST(N'2013-10-20 14:29:18.847' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'a5f5181f-55d5-4671-ab39-3a56a4b494e2', N'布局', N'application_view_columns.png', N'ModuleFieldMovable()', N'ModuleFieldMovable', N'工具栏', 0, N'模块字段布局', 1, 5, 1, CAST(N'2013-10-20 14:26:34.983' AS DateTime), NULL, NULL, CAST(N'2013-10-20 14:29:22.207' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'c7e7d4b3-d21e-4dcf-9e39-20e099ce4375', N'上传', N'20131129014358627.png', N'Uploadify()', N'Uploadify', N'工具栏', 0, N'', 1, 25, 1, CAST(N'2013-11-29 13:42:55.080' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-29 14:25:04.307' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'14f278eb-1bff-415b-9b12-ca952fb3dd13', N'重置密码', N'group_key.png', N'SetNewPassword();', N'SetPassword', N'工具栏', 0, N'重新设置新密码', 1, 12, 1, CAST(N'2013-10-21 15:50:20.720' AS DateTime), NULL, NULL, CAST(N'2013-11-15 11:41:39.080' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'ddf2d18a-f90d-490b-8c02-fe91b47c9825', N'引入', N'enter.png', N'import()', N'import', N'工具栏', 0, N'Excel导入', 1, 7, 1, CAST(N'2013-10-21 16:48:12.217' AS DateTime), NULL, NULL, CAST(N'2013-11-15 11:41:25.997' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'4b2f23d7-cdfc-422d-b403-b08583560d00', N'引出', N'out.png', N'derive()', N'derive', N'工具栏', 1, N'导出', 1, 8, 1, CAST(N'2013-10-21 16:49:27.150' AS DateTime), NULL, NULL, CAST(N'2013-10-24 14:25:32.937' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'4d866304-9d1d-4549-93fb-1505a869ba94', N'分配按钮', N'bricks.png', N'ModuleButton()', N'ModuleButton', N'工具栏', 0, N'操作按钮', 1, 6, 1, CAST(N'2013-10-24 10:30:47.390' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄', CAST(N'2013-11-15 11:41:22.140' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'e9ea8e5a-887d-484b-b8b3-99993f7f20c2', N'添加成员', N'group_add.png', N'AddMember()', N'AddMember', N'工具栏', 0, N'添加用户到角色', 1, 10, 1, CAST(N'2013-10-24 20:28:24.567' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄', CAST(N'2013-11-15 11:41:32.680' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'3b505abe-a0ca-4743-a226-cb8432f4aff4', N'删除成员', N'group_delete.png', N'DeleteMember()', N'DeleteMember', N'工具栏', 0, N'角色中删除用户', 1, 11, 1, CAST(N'2013-10-25 00:23:01.563' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄', CAST(N'2013-11-15 11:41:35.733' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'daaf833a-592e-4fdb-bb40-063719e379b9', N'保存', N'disk.png', N'AcceptSave()', N'AcceptSave', N'工具栏', 0, N'保存', 1, 13, 1, CAST(N'2013-10-25 22:34:19.677' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄', CAST(N'2013-11-15 11:41:43.497' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'1a089561-0e3c-4e2a-a4c6-375d4fc74a9b', N'授权', N'key_go.png', N'Authorization()', N'Authorization', N'工具栏', 0, N'', 1, 15, 1, CAST(N'2013-10-26 10:36:25.637' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄', CAST(N'2013-11-15 11:41:49.933' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'2abd13c2-3160-49a2-9814-9eb31a0e1677', N'刷新', N'arrow_refresh.png', N'Replace()', N'Replace', N'工具栏', 1, N'刷新当前页面', 1, 15, 1, CAST(N'2013-10-26 13:24:36.020' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄', NULL, NULL, NULL)
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'07b9464c-18c8-4e0f-933a-fd78d461e76d', N'分配角色', N'AllotRole.png', N'AllotRole()', N'AllotRole', N'工具栏', 0, N'用户分配角色', 1, 16, 1, CAST(N'2013-10-26 17:27:18.663' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄', CAST(N'2013-11-15 11:41:56.473' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'13da7fa6-eb94-48cb-a8e2-4f135b385bee', N'新增', N'application_add.png', N'add()', N'add', N'右击菜单栏', 0, NULL, 1, 1, 1, CAST(N'2013-10-19 23:41:13.000' AS DateTime), NULL, NULL, CAST(N'2013-10-20 14:29:08.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'2ef108e1-1fd7-43c7-86b9-a5d2207e96c1', N'编辑', N'application_edit.png', N'edit()', N'edit', N'右击菜单栏', 0, NULL, 1, 2, 1, CAST(N'2013-10-19 23:41:13.000' AS DateTime), NULL, NULL, CAST(N'2013-10-20 14:29:11.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'cc5cbb4c-b9f5-4d3d-9dbd-0cde87cbfaf8', N'删除', N'application_delete.png', N'Delete()', N'Delete', N'右击菜单栏', 0, N'', 1, 3, 1, CAST(N'2013-10-19 23:41:13.000' AS DateTime), NULL, NULL, CAST(N'2013-11-15 11:42:52.880' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'169e4d12-83d0-4d08-b38f-6bc5f66037a8', N'刷新', N'arrow_refresh.png', N'Replace()', N'Replace', N'右击菜单栏', 0, N'刷新当前页面', 1, 15, 1, CAST(N'2013-10-26 13:24:36.000' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄', CAST(N'2013-11-15 11:42:56.677' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'f70649d1-0740-4ed9-8d7d-de5c525efa38', N'重置', N'arrow_rotate_anticlockwise.png', N'AcceptReset()', N'AcceptReset', N'工具栏', 0, N'重置', 1, 14, 1, CAST(N'2013-10-27 17:25:23.563' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-15 11:41:46.643' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'1a473b17-a822-4f9f-8391-bfc07671b837', N'清除', N'edit-clear.png', N'Empty()', N'Empty', N'工具栏', 0, N'清空数据', 1, 17, 1, CAST(N'2013-10-29 17:20:32.320' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-15 11:41:59.660' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'71b392ae-091d-44a8-86f8-cdeba38b9c59', N'备份', N'database_copy.png', N'backups()', N'backups', N'工具栏', 0, N'数据库备份', 1, 18, 1, CAST(N'2013-10-31 10:43:29.627' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-15 11:42:03.837' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'61cec1d0-9697-4875-a822-4fe6b8cf9916', N'下载', N'20131031105012109.png', N'download()', N'download', N'工具栏', 0, N'下载', 1, 19, 1, CAST(N'2013-10-31 10:50:38.720' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-15 11:42:07.320' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'38aee003-4318-460f-9f95-f3afbce9ccd2', N'定时备份', N'time_go.png', N'Taskbackups()', N'Taskbackups', N'工具栏', 0, N'定时备份数据库', 1, 20, 1, CAST(N'2013-10-31 10:53:02.687' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-15 11:42:14.807' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'c381916d-cbbf-4a56-a02c-7480b94c900b', N'离开', N'back.png', N'ThisCloseTab()', N'Leave', N'工具栏', 0, N'关闭当前窗口', 1, 21, 1, CAST(N'2013-10-31 16:23:25.787' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-15 11:42:18.890' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'a2faad97-7e02-45b3-9e81-33e3ac25780a', N'查看详细', N'page_white_find.png', N'lookup()', N'lookup', N'工具栏', 0, N'查看相关详细信息', 1, 22, 1, CAST(N'2013-11-01 14:34:17.770' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-15 11:42:22.083' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'745d7aaf-f1e4-4463-879a-daa9c23bc700', N'浏览表单', N'world_go.png', N'browse()', N'browse', N'工具栏', 0, N'浏览表单', 1, 23, 1, CAST(N'2013-11-01 23:13:57.997' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-15 11:42:25.300' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Button] ([ButtonId], [FullName], [Img], [Event], [Control_ID], [Category], [Split], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'a3bbc612-9c33-4101-bc18-f1553b2e09d0', N'新建查询', N'201208010567.png', N'addSQLQuery();', N'addSQLQuery', N'工具栏', 0, N'新建查询', 1, 24, 1, CAST(N'2013-11-02 13:28:21.427' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-15 11:42:28.183' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_DataPermission] ([DataPermissionId], [RoleId], [Code], [ResourceId], [ObjectId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'85d8a3b7-7d9c-4220-8c91-fc5c1e941b82', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', NULL, N'Organization', N'''05e85693-14b0-4582-8063-8fbde85371f0'',''31b05701-60ef-405c-87ba-af47049e3f48'',''fa3c84c3-805a-48de-9588-dcdd64d4d9ab'',''44a23a18-6a74-4e69-929a-085a26604920'',''6f9f996b-e549-425d-b7f1-01b24d886a2a'',''01bf572a-f6d4-4a58-b29b-361238cd221e'',''e3c0707a-a67a-4caf-a1cf-b9f18378100c'',''f1c24b87-e007-4399-be49-fb1ed07c96d6'',''ce65969e-0fa6-4697-acbc-d5bdc417fe99'',''3d7259f9-7991-4c58-8064-27f020bf0659'',''75789b3b-acbd-4dba-a70f-d16d7d12c634'',''28a1477b-9d4b-46c6-95fb-c56f1f160b9d'',''f32d187b-31fe-404e-b4ba-1a5a577d896f'',''99e0d915-a686-4922-9edd-c8f0ed6e79e9'',''d3f96507-1bda-4127-bda1-ca60c7f4ce72'',''b5221eb2-6b28-4104-b327-845d0021172b'',''d8f15b36-9aef-4fac-9115-693017ae0b19'',''00fdb9af-2f93-476a-8172-d987873f6697'',''4ec5c981-9f75-48c3-8217-03eb68db11b8'',''75cdb572-da20-4e52-b727-be7c65ec4c72'',''2c5d2b38-2300-411d-979f-b65eb25846aa'',''901659a9-e671-4b2f-b7fa-0d77144fb4c3'',''39764083-a0bd-4cd6-8ead-3ea689831ed3'',''65a13460-75a1-4753-98f2-0d810f00bf43'',''cd235612-a279-45df-aaa8-d25cbbbab87d'',''c62c6939-74dc-4f67-ac5b-5ab1c2b0d85b'',''e572a3bd-8aba-4ddd-a794-a14303692df1'',''ef5e8b48-5ef4-4e07-bd70-d5c1e6414b20'',''52c60dc6-3044-44cd-b406-3572ce9df5bc'',''c649bbd2-6c20-445b-ad20-82c3e25b6133'',''acdcbd6d-ef33-4001-bda2-cd9b5e7766a0''', CAST(N'2013-11-11 21:04:23.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_InterfaceAccess] ([IAccessId], [Code], [AuthorizationUserId], [AuthorizationUserName], [AuthorizationCode], [StartDate], [EndDate], [Description], [Enabled], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'397bff42-14af-4071-9ff1-510869cb1023', N'10001', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄|admin', N'Authority:true;Workflow:false;DataSwap:false;', CAST(N'2013-11-02 00:00:00.000' AS DateTime), CAST(N'2014-11-02 23:59:00.000' AS DateTime), N'测试系统接口访问', 1, NULL, CAST(N'2013-11-02 18:00:52.013' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-14 21:13:11.097' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_IPBlacklist] ([IPBlacklistId], [Category], [StartIp], [EndIp], [Failuretime], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'03ffda58-f06e-4d68-8ea9-abad83e457c8', N'0', N'192.168.0.1', N'192.168.0.10', CAST(N'2013-11-21 00:00:00.000' AS DateTime), N'测试IP访问权限', 1, NULL, NULL, NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-14 21:12:58.880' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_IPBlacklist] ([IPBlacklistId], [Category], [StartIp], [EndIp], [Failuretime], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'9601c8d7-c52c-4b3e-afbe-e984a63c931d', N'0', N'192.168.0.11', N'192.168.0.20', CAST(N'2013-11-14 00:00:00.000' AS DateTime), N'', 1, NULL, NULL, NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', NULL, NULL, NULL)
INSERT [dbo].[BPMS_IPBlacklist] ([IPBlacklistId], [Category], [StartIp], [EndIp], [Failuretime], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'8fe4c850-e61c-4525-9526-8735ad35ec60', N'0', N'192.168.0.21', N'192.168.0.30', CAST(N'2013-11-08 00:00:00.000' AS DateTime), N'', 1, 1, NULL, NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'16cd5c63-15aa-4d9b-b44b-2b088cdb0d1d', N'b65809f0-3b7b-44d1-b2f5-c93ef9afa12d', NULL, N'技术员级职称', N'1', NULL, 1, 1, 1, 1, 1, CAST(N'2013-10-22 16:45:54.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:34:56.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'692fe0e5-e670-41f7-8263-3e5e43ac7dcb', N'b65809f0-3b7b-44d1-b2f5-c93ef9afa12d', NULL, N'助理级职称', N'2', NULL, 1, 1, 1, 2, 1, CAST(N'2013-10-22 16:46:02.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:34:59.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'8b30ae88-79aa-4025-9f42-1ec86f92d3fa', N'b65809f0-3b7b-44d1-b2f5-c93ef9afa12d', NULL, N'中级职称', N'3', NULL, 1, 1, 1, 3, 1, CAST(N'2013-10-22 16:46:05.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:35:03.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'eaf281a8-7aa8-4be9-ae14-13b00124f387', N'b65809f0-3b7b-44d1-b2f5-c93ef9afa12d', NULL, N'副高级职称', N'4', NULL, 1, 1, 1, 4, 1, CAST(N'2013-10-22 16:46:08.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:35:05.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'4c7b6237-0b89-4d1d-9d2a-6c7432884aaf', N'2acba9e8-5fa7-4b6f-8ebd-56e753dd059a', NULL, N'会计专业', N'1', NULL, 1, 1, 1, 6, 1, CAST(N'2013-10-22 16:46:16.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:35:16.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'9ee541ab-ca95-493a-8282-64132bbd29c1', N'2acba9e8-5fa7-4b6f-8ebd-56e753dd059a', NULL, N'经济专业', N'2', NULL, 1, 1, 1, 7, 1, CAST(N'2013-10-22 16:46:20.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:35:19.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'fd4e7bb4-e28f-4d74-89a1-33b94b0c84c6', N'2acba9e8-5fa7-4b6f-8ebd-56e753dd059a', NULL, N'工程技术', N'3', NULL, 1, 1, 1, 8, 1, CAST(N'2013-10-22 16:46:23.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:35:23.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'3104e2d4-d94a-4c60-8b3e-4a3965d84875', N'2acba9e8-5fa7-4b6f-8ebd-56e753dd059a', NULL, N'实验技术人员', N'4', NULL, 1, 1, 1, 9, 1, CAST(N'2013-10-22 16:46:26.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:35:26.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'1677f27c-0e9e-4d90-8e0f-66ae2a7fa245', N'2acba9e8-5fa7-4b6f-8ebd-56e753dd059a', NULL, N'软件工程师', N'5', NULL, 1, 1, 1, 10, 1, CAST(N'2013-10-22 16:46:30.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:35:30.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'cd354a07-db6a-4929-a94d-8ed5327bfa38', N'2acba9e8-5fa7-4b6f-8ebd-56e753dd059a', NULL, N'系统工程师', N'6', NULL, 1, 1, 1, 11, 1, CAST(N'2013-10-22 16:46:34.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:35:33.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'f3798cf7-3cb3-4f2a-81d2-9d8e449254c2', N'0e08fdaa-8e7a-4890-98d5-e2f36f55c512', NULL, N'实习', N'1', NULL, 1, 1, 1, 12, 1, CAST(N'2013-10-22 16:46:37.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:35:38.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'f91113f6-9681-4500-a01e-60eaaff3754d', N'0e08fdaa-8e7a-4890-98d5-e2f36f55c512', NULL, N'劳务工', N'2', NULL, 1, 1, 1, 13, 1, CAST(N'2013-10-22 16:46:41.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:35:42.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'8477f934-b0cf-4376-b1c2-da7833bb628e', N'0e08fdaa-8e7a-4890-98d5-e2f36f55c512', NULL, N'合同工', N'3', NULL, 1, 1, 1, 14, 1, CAST(N'2013-10-22 16:46:45.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:35:45.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'19d48039-6abf-4b2b-ac03-22ccc751d406', N'44e210fb-5afd-4511-a56c-a438d947d5bc', NULL, N'群众', N'1', NULL, 1, 1, 1, 15, 1, CAST(N'2013-10-22 16:46:49.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:36:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'6600a180-d2d5-45cd-b67b-193376093fa2', N'44e210fb-5afd-4511-a56c-a438d947d5bc', NULL, N'无党派民族人士', N'2', NULL, 1, 1, 1, 16, 1, CAST(N'2013-10-22 16:46:53.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:36:04.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'6116c168-2404-4088-aa28-ef975f614662', N'44e210fb-5afd-4511-a56c-a438d947d5bc', NULL, N'中共党员', N'3', NULL, 1, 1, 1, 17, 1, CAST(N'2013-10-22 16:46:57.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:36:07.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'ce8e79d4-6d2b-40cc-b430-865d2c422ecd', N'ae25f4cc-8788-447c-bfd8-a9fc348b3699', NULL, N'★', N'1', NULL, NULL, NULL, 1, 18, 1, CAST(N'2013-10-22 16:47:02.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'0e641821-0d55-4ea4-a4e2-b818fa8b4833', N'ae25f4cc-8788-447c-bfd8-a9fc348b3699', NULL, N'★★', N'2', NULL, NULL, NULL, 1, 19, 1, CAST(N'2013-10-22 16:47:06.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'417a91fb-4fcb-4d6f-9767-85b1f6c78ac0', N'ae25f4cc-8788-447c-bfd8-a9fc348b3699', NULL, N'★★★', N'3', NULL, NULL, NULL, 1, 20, 1, CAST(N'2013-10-22 16:47:12.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'ebb64160-75c8-40b0-80f1-982638ebdb76', N'ae25f4cc-8788-447c-bfd8-a9fc348b3699', NULL, N'★★★★', N'4', NULL, NULL, NULL, 1, 21, 1, CAST(N'2013-10-22 16:47:15.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'a6cc03ea-e1aa-4f74-afb6-b8e696bff240', N'ae25f4cc-8788-447c-bfd8-a9fc348b3699', NULL, N'★★★★★', N'5', NULL, NULL, NULL, 1, 22, 1, CAST(N'2013-10-22 16:47:19.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'11e37d36-473b-47eb-aa67-f723d0e437af', N'ae25f4cc-8788-447c-bfd8-a9fc348b3699', NULL, N'★★★★★★', N'6', NULL, NULL, NULL, 1, 23, 1, CAST(N'2013-10-22 16:47:23.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'bdc3f533-8e4d-4ba5-ad86-2164975cf235', N'bd4417ea-dda2-4ce2-a27c-16617e5c7e4f', NULL, N'非常不满意', N'1', NULL, NULL, NULL, 1, 24, 1, CAST(N'2013-10-22 16:47:27.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'82a317fc-b859-491a-9691-4b9046f9ce82', N'bd4417ea-dda2-4ce2-a27c-16617e5c7e4f', NULL, N'不满意', N'2', NULL, NULL, NULL, 1, 25, 1, CAST(N'2013-10-22 16:47:28.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'9dca7f9c-9c83-44cf-bcca-a51a6606316d', N'bd4417ea-dda2-4ce2-a27c-16617e5c7e4f', NULL, N'一般', N'3', NULL, NULL, NULL, 1, 26, 1, CAST(N'2013-10-22 16:57:41.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'c5fd6af6-a8ec-435a-b821-bd19f69488e7', N'bd4417ea-dda2-4ce2-a27c-16617e5c7e4f', NULL, N'满意', N'4', NULL, NULL, NULL, 1, 27, 1, CAST(N'2013-10-22 16:57:45.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'00ebef5b-20e9-4aa6-bf0d-2982018fc6f6', N'bd4417ea-dda2-4ce2-a27c-16617e5c7e4f', NULL, N'非常满意', N'5', NULL, NULL, NULL, 1, 28, 1, CAST(N'2013-10-22 16:57:49.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'518b10a4-7c1d-4304-990b-78426743e06c', N'137a2d97-d1d9-4752-9c5e-239097e2ed68', NULL, N'工程师', N'1', NULL, 1, 1, 1, 29, 1, CAST(N'2013-10-22 16:57:53.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:33:58.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'7336d8dc-581b-4ffa-9ef0-1dfe605d13e6', N'137a2d97-d1d9-4752-9c5e-239097e2ed68', NULL, N'助理工程师', N'2', NULL, 1, 1, 1, 30, 1, CAST(N'2013-10-22 16:57:57.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:34:01.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'257c313b-a399-424c-85a2-e4e75871eb22', N'137a2d97-d1d9-4752-9c5e-239097e2ed68', NULL, N'技术员', N'3', NULL, 1, 1, 1, 31, 1, CAST(N'2013-10-22 16:58:02.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:34:04.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'1bfcbf35-8884-442e-bbe1-31e68345d5e0', N'137a2d97-d1d9-4752-9c5e-239097e2ed68', NULL, N'总经理', N'4', NULL, 1, 1, 1, 32, 1, CAST(N'2013-10-22 16:58:05.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:34:07.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'11f64392-b8e0-48ba-aad9-920e2d02f504', N'137a2d97-d1d9-4752-9c5e-239097e2ed68', NULL, N'主管', N'5', NULL, 1, 1, 1, 33, 1, CAST(N'2013-10-22 16:58:11.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:34:11.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'f43a852d-575f-42fd-a089-c0b2f866e3ec', N'137a2d97-d1d9-4752-9c5e-239097e2ed68', NULL, N'副主管', N'6', NULL, 1, 1, 1, 34, 1, CAST(N'2013-10-22 16:58:14.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:34:14.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'e5865ae4-5ef5-46ac-909f-1cf1afed80f6', N'137a2d97-d1d9-4752-9c5e-239097e2ed68', NULL, N'董事长', N'7', NULL, 1, 1, 1, 35, 1, CAST(N'2013-10-22 16:58:18.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:34:19.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'c678bae2-c451-44e6-ac81-4c5abb063192', N'137a2d97-d1d9-4752-9c5e-239097e2ed68', NULL, N'副董事长', N'8', NULL, 1, 1, 1, 36, 1, CAST(N'2013-10-22 16:58:24.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:34:24.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'b0324ee5-54d6-49f7-a5e0-464c30961070', N'964d6a06-5282-4fcb-b805-f192ae0de922', NULL, N'博士', N'博士', NULL, 1, 1, 1, 37, 1, CAST(N'2013-10-22 16:58:27.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 18:16:32.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'50e8568e-bda4-4098-9414-ad3f1cfb93d2', N'964d6a06-5282-4fcb-b805-f192ae0de922', NULL, N'硕士', N'硕士', NULL, 1, 1, 1, 38, 1, CAST(N'2013-10-22 16:58:31.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 18:16:35.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'9963e48e-3b33-44ff-92f9-dfa964433d36', N'964d6a06-5282-4fcb-b805-f192ae0de922', NULL, N'学士', N'学士', NULL, 1, 1, 1, 39, 1, CAST(N'2013-10-22 16:58:35.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 18:16:38.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'6d61b542-d542-4aee-88ed-0e12e0462c2a', N'd2309db4-18eb-4934-b02c-5757f0ab475e', NULL, N'普工', N'1', NULL, 1, 1, 1, 40, 1, CAST(N'2013-10-22 16:58:39.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:36:21.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'0ec941c5-da65-4310-8f69-ff1a9a5e8af5', N'd2309db4-18eb-4934-b02c-5757f0ab475e', NULL, N'中层', N'2', NULL, 1, 1, 1, 41, 1, CAST(N'2013-10-22 16:58:43.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:36:24.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'25cd0654-cb48-4a54-b65b-dfbe4b75569b', N'd2309db4-18eb-4934-b02c-5757f0ab475e', NULL, N'高层', N'3', NULL, 1, 1, 1, 42, 1, CAST(N'2013-10-22 16:58:47.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:36:27.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'0c608ee3-9912-4242-9bb2-e2c9128a5bf6', N'd2309db4-18eb-4934-b02c-5757f0ab475e', NULL, N'管理员', N'4', NULL, 1, 1, 1, 43, 1, CAST(N'2013-10-22 16:58:52.000' AS DateTime), NULL, NULL, CAST(N'2013-10-22 23:36:30.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'2624ec93-21e9-4f85-a985-8b2cd62c3a8f', N'1559ff6d-8b04-48f7-952c-333305bc526d', NULL, N'小学', N'小学', NULL, NULL, NULL, 1, 44, 1, CAST(N'2013-10-22 16:58:52.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'9100a39f-ed1a-48c8-bd3a-afda0d25df00', N'1559ff6d-8b04-48f7-952c-333305bc526d', NULL, N'初中', N'初中', NULL, NULL, NULL, 1, 45, 1, CAST(N'2013-10-22 17:04:10.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'feaaa870-ca4b-4d90-8d8b-49b74f6dc509', N'1559ff6d-8b04-48f7-952c-333305bc526d', NULL, N'高中', N'高中', NULL, NULL, NULL, 1, 45, 1, CAST(N'2013-10-22 17:04:14.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'b2232733-a03f-472b-84e9-025e4a603753', N'1559ff6d-8b04-48f7-952c-333305bc526d', NULL, N'中专', N'中专', NULL, NULL, NULL, 1, 46, 1, CAST(N'2013-10-22 17:04:17.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'3f27fe13-7f9b-41d3-a868-9d022d01a5b5', N'1559ff6d-8b04-48f7-952c-333305bc526d', NULL, N'大专', N'大专', NULL, NULL, NULL, 1, 47, 1, CAST(N'2013-10-22 17:04:21.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'f350712f-9bf2-4c1d-9175-689dabf8ec7d', N'1559ff6d-8b04-48f7-952c-333305bc526d', N'', N'本科', N'本科', NULL, NULL, NULL, 1, 48, 1, CAST(N'2013-10-22 17:04:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'23e4826f-e369-4b74-b49d-2aa50a686e3c', N'1559ff6d-8b04-48f7-952c-333305bc526d', NULL, N'博士', N'博士', NULL, NULL, NULL, 1, 49, 1, CAST(N'2013-10-22 17:04:29.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'bb0c53b9-7f02-4bae-aadb-0f1a7f3f17c7', N'1559ff6d-8b04-48f7-952c-333305bc526d', NULL, N'硕士', N'硕士', NULL, NULL, NULL, 1, 50, 1, CAST(N'2013-10-22 17:04:34.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'a6ef105c-fd5d-4de2-8a17-519b48cd5ca1', N'1559ff6d-8b04-48f7-952c-333305bc526d', NULL, N'其他', N'其他', NULL, NULL, NULL, 1, 51, 1, CAST(N'2013-10-22 17:04:34.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'f36e3db9-d1eb-474d-b206-d96e43cfaad3', N'5fed1313-7355-4cc4-a7ec-73211a361fa6', NULL, N'系统角色', N'1', NULL, 1, 1, 1, 52, 1, CAST(N'2013-10-22 23:47:07.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'65ac1729-922d-449f-a821-e91c53e3757f', N'5fed1313-7355-4cc4-a7ec-73211a361fa6', NULL, N'业务角色', N'2', NULL, 1, 1, 1, 53, 1, CAST(N'2013-10-22 23:49:49.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'a0fc8dcc-9f0f-4dfd-add2-d17588f9e450', N'5fed1313-7355-4cc4-a7ec-73211a361fa6', NULL, N'应用角色', N'3', NULL, 1, 1, 1, 54, 1, CAST(N'2013-10-22 23:50:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'95e2f9e6-9471-4345-b338-31ed98258236', N'e2e78aec-31f7-4de5-af7b-bb5bc7c09a61', NULL, N'中国', N'中国', NULL, 1, 1, 1, 55, 1, CAST(N'2013-10-23 13:22:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'ff5e8835-0802-49b4-8237-23567e412f37', N'104bfd21-5bbe-4b96-b5c2-448b84dbe0d8', NULL, N'汉族', N'汉族', NULL, 1, 1, 1, 56, 1, CAST(N'2013-10-23 13:22:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'bc2993d4-3ce3-4490-b88f-1dbf17c7103c', N'104bfd21-5bbe-4b96-b5c2-448b84dbe0d8', NULL, N'少数民族', N'少数民族', NULL, 1, 1, 1, 57, 1, CAST(N'2013-10-23 13:23:09.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'156b777d-eae5-4756-a16e-00dfbc27d7b5', N'4d0abda4-9059-4f45-946a-8a237bc606c1', NULL, N'员工信息', N'1', N'员工特别自定义属性', 1, 1, 1, 58, 1, CAST(N'2013-10-30 16:01:46.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-10-30 16:04:21.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'f104cc95-d639-49ee-8c32-1ccf743f3345', N'4d0abda4-9059-4f45-946a-8a237bc606c1', NULL, N'客户信息', N'2', N'客户附加属性', 1, 1, 1, 59, 1, CAST(N'2013-10-30 16:02:03.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-10-30 16:04:28.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'8d2db426-7c0b-4555-ad3a-ec4d25384320', N'4d0abda4-9059-4f45-946a-8a237bc606c1', NULL, N'供应商信息', N'3', N'供应商附加属性', 1, 1, 1, 60, 1, CAST(N'2013-10-30 16:02:34.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-10-30 16:04:42.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'1a6c26ef-f7a5-4623-b7fc-30ab56b14bcc', N'4d0abda4-9059-4f45-946a-8a237bc606c1', NULL, N'仓库信息', N'4', N'仓库附加属性', 1, 1, 1, 61, 1, CAST(N'2013-10-30 16:03:17.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-10-30 16:04:50.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_ItemDetails] ([ItemDetailsId], [ItemsId], [ParentId], [ItemName], [ItemCode], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'f4165599-33cf-4285-b021-19a4a4848122', N'4d0abda4-9059-4f45-946a-8a237bc606c1', NULL, N'商品信息', N'5', N'商品附加属性', 1, 1, 1, 62, 1, CAST(N'2013-10-30 16:03:32.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-10-30 16:04:59.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'b65809f0-3b7b-44d1-b2f5-c93ef9afa12d', N'0', N'10001', N'职称等级', N'系统资料', NULL, 1, 0, 1, 1, 1, CAST(N'2013-10-22 14:50:31.170' AS DateTime), NULL, NULL, CAST(N'2013-10-23 23:51:45.580' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄')
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'2acba9e8-5fa7-4b6f-8ebd-56e753dd059a', N'0', N'10002', N'职称', N'系统资料', NULL, 1, 0, 1, 2, 1, CAST(N'2013-10-22 14:50:33.963' AS DateTime), NULL, NULL, CAST(N'2013-10-23 23:51:50.147' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄')
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'0e08fdaa-8e7a-4890-98d5-e2f36f55c512', N'0', N'10003', N'用工性质', N'系统资料', NULL, 1, 0, 1, 3, 1, CAST(N'2013-10-22 14:50:37.040' AS DateTime), NULL, NULL, CAST(N'2013-10-23 23:51:53.820' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄')
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'44e210fb-5afd-4511-a56c-a438d947d5bc', N'0', N'10004', N'政治面貌', N'系统资料', NULL, 1, 0, 1, 4, 1, CAST(N'2013-10-22 14:50:39.873' AS DateTime), NULL, NULL, CAST(N'2013-10-23 23:51:58.360' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄')
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'ae25f4cc-8788-447c-bfd8-a9fc348b3699', N'0', N'10005', N'客户信用度', N'业务资料', NULL, 1, 0, 1, 5, 1, CAST(N'2013-10-22 14:50:43.230' AS DateTime), NULL, NULL, CAST(N'2013-10-23 23:52:02.963' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄')
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'bd4417ea-dda2-4ce2-a27c-16617e5c7e4f', N'0', N'10006', N'客户满意度', N'业务资料', NULL, 1, 1, 1, 6, 1, CAST(N'2013-10-22 14:50:46.473' AS DateTime), NULL, NULL, CAST(N'2013-11-20 13:56:38.987' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'137a2d97-d1d9-4752-9c5e-239097e2ed68', N'0', N'10007', N'职位（职务）', N'系统资料', NULL, 1, 0, 1, 7, 1, CAST(N'2013-10-22 14:50:49.700' AS DateTime), NULL, NULL, CAST(N'2013-10-23 23:52:11.070' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄')
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'964d6a06-5282-4fcb-b805-f192ae0de922', N'0', N'10008', N'学位', N'系统资料', NULL, 1, 0, 1, 8, 1, CAST(N'2013-10-22 14:50:53.077' AS DateTime), NULL, NULL, CAST(N'2013-10-23 23:52:15.013' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄')
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'd2309db4-18eb-4934-b02c-5757f0ab475e', N'0', N'10009', N'员工类别', N'系统资料', NULL, 1, 0, 1, 9, 1, CAST(N'2013-10-22 14:50:56.777' AS DateTime), NULL, NULL, CAST(N'2013-10-23 23:52:20.867' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄')
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'1559ff6d-8b04-48f7-952c-333305bc526d', N'0', N'10010', N'学历', N'系统资料', NULL, 1, 0, 1, 10, 1, CAST(N'2013-10-22 14:51:00.010' AS DateTime), NULL, NULL, CAST(N'2013-10-23 23:52:24.580' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄')
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'5fed1313-7355-4cc4-a7ec-73211a361fa6', N'0', N'10012', N'角色分类', N'系统资料', NULL, 1, 1, 1, 11, 1, CAST(N'2013-10-22 23:46:52.550' AS DateTime), NULL, NULL, CAST(N'2013-10-23 23:52:28.187' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄')
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'e2e78aec-31f7-4de5-af7b-bb5bc7c09a61', N'0', N'10013', N'国籍', N'系统资料', NULL, 0, 0, 1, 12, 1, CAST(N'2013-10-23 13:21:47.117' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'104bfd21-5bbe-4b96-b5c2-448b84dbe0d8', N'0', N'10014', N'民族', N'系统资料', NULL, 0, 0, 1, 13, 1, CAST(N'2013-10-23 13:22:12.100' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_Items] ([ItemsId], [ParentId], [Code], [FullName], [Category], [IsTree], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'4d0abda4-9059-4f45-946a-8a237bc606c1', N'0', N'10015', N'自定义表单类别', N'系统资料', NULL, 1, 1, 1, 14, 1, CAST(N'2013-10-30 15:59:24.700' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-10-30 15:59:40.487' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Organization] ([OrganizationId], [ParentId], [Code], [ShortName], [FullName], [Category], [IsInnerOrganize], [Manager], [AssistantManager], [OuterPhone], [InnerPhone], [Fax], [Postalcode], [Address], [Web], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'05e85693-14b0-4582-8063-8fbde85371f0', N'0', N'1000', N'总部公司', N'江东设计集团', N'集团', 1, N'', N'', N'', N'', N'', N'', N'', N'', N'', 1, 1, 1, CAST(N'2013-10-20 21:58:35.240' AS DateTime), NULL, NULL, CAST(N'2015-11-10 14:28:26.153' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Organization] ([OrganizationId], [ParentId], [Code], [ShortName], [FullName], [Category], [IsInnerOrganize], [Manager], [AssistantManager], [OuterPhone], [InnerPhone], [Fax], [Postalcode], [Address], [Web], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'c649bbd2-6c20-445b-ad20-82c3e25b6133', N'31b05701-60ef-405c-87ba-af47049e3f48', N'1000.01.01.07', N'', N'设计部', N'部门', 1, N'', N'', N'', N'', N'', N'', N'', N'', N'', 1, 20, 1, CAST(N'2015-11-10 14:33:45.483' AS DateTime), NULL, NULL, NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Organization] ([OrganizationId], [ParentId], [Code], [ShortName], [FullName], [Category], [IsInnerOrganize], [Manager], [AssistantManager], [OuterPhone], [InnerPhone], [Fax], [Postalcode], [Address], [Web], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'acdcbd6d-ef33-4001-bda2-cd9b5e7766a0', N'31b05701-60ef-405c-87ba-af47049e3f48', N'1000.01.01.08', N'', N'品牌部', N'部门', 1, N'', N'', N'', N'', N'', N'', N'', N'', N'', 1, 21, 1, CAST(N'2015-11-10 14:34:42.180' AS DateTime), NULL, NULL, NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Organization] ([OrganizationId], [ParentId], [Code], [ShortName], [FullName], [Category], [IsInnerOrganize], [Manager], [AssistantManager], [OuterPhone], [InnerPhone], [Fax], [Postalcode], [Address], [Web], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'31b05701-60ef-405c-87ba-af47049e3f48', N'05e85693-14b0-4582-8063-8fbde85371f0', N'1000.01.01', N'', N'马鞍山分公司', N'公司', 1, N'', N'', N'', N'', N'', N'', N'1', N'', N'', 1, 8, 1, CAST(N'2013-10-20 22:46:32.397' AS DateTime), NULL, NULL, CAST(N'2015-11-10 14:29:18.980' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Organization] ([OrganizationId], [ParentId], [Code], [ShortName], [FullName], [Category], [IsInnerOrganize], [Manager], [AssistantManager], [OuterPhone], [InnerPhone], [Fax], [Postalcode], [Address], [Web], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'fa3c84c3-805a-48de-9588-dcdd64d4d9ab', N'31b05701-60ef-405c-87ba-af47049e3f48', N'1000.01.01.01', N'', N'总经理', N'部门', 1, N'', N'', N'', N'', N'', N'', N'1', N'', N'222', 1, 9, 1, CAST(N'2013-10-20 22:46:32.410' AS DateTime), NULL, NULL, CAST(N'2015-11-10 14:33:01.017' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Organization] ([OrganizationId], [ParentId], [Code], [ShortName], [FullName], [Category], [IsInnerOrganize], [Manager], [AssistantManager], [OuterPhone], [InnerPhone], [Fax], [Postalcode], [Address], [Web], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'6f9f996b-e549-425d-b7f1-01b24d886a2a', N'31b05701-60ef-405c-87ba-af47049e3f48', N'1000.01.01.02', NULL, N'人事部', N'部门', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'', NULL, 1, 10, 1, CAST(N'2013-10-20 22:46:32.630' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_Organization] ([OrganizationId], [ParentId], [Code], [ShortName], [FullName], [Category], [IsInnerOrganize], [Manager], [AssistantManager], [OuterPhone], [InnerPhone], [Fax], [Postalcode], [Address], [Web], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'01bf572a-f6d4-4a58-b29b-361238cd221e', N'31b05701-60ef-405c-87ba-af47049e3f48', N'1000.01.01.03', NULL, N'财务部', N'部门', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'', NULL, 1, 11, 1, CAST(N'2013-10-20 22:46:32.647' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_Organization] ([OrganizationId], [ParentId], [Code], [ShortName], [FullName], [Category], [IsInnerOrganize], [Manager], [AssistantManager], [OuterPhone], [InnerPhone], [Fax], [Postalcode], [Address], [Web], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'e3c0707a-a67a-4caf-a1cf-b9f18378100c', N'31b05701-60ef-405c-87ba-af47049e3f48', N'1000.01.01.04', NULL, N'市场部', N'部门', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'', NULL, 1, 12, 1, CAST(N'2013-10-20 22:46:32.850' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_Organization] ([OrganizationId], [ParentId], [Code], [ShortName], [FullName], [Category], [IsInnerOrganize], [Manager], [AssistantManager], [OuterPhone], [InnerPhone], [Fax], [Postalcode], [Address], [Web], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'f1c24b87-e007-4399-be49-fb1ed07c96d6', N'31b05701-60ef-405c-87ba-af47049e3f48', N'1000.01.01.05', N'', N'综合部', N'部门', 1, N'', N'', N'', N'', N'', N'', N'1', N'', N'', 1, 13, 1, CAST(N'2013-10-20 22:46:32.880' AS DateTime), NULL, NULL, CAST(N'2015-11-10 14:32:37.177' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_Organization] ([OrganizationId], [ParentId], [Code], [ShortName], [FullName], [Category], [IsInnerOrganize], [Manager], [AssistantManager], [OuterPhone], [InnerPhone], [Fax], [Postalcode], [Address], [Web], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'ce65969e-0fa6-4697-acbc-d5bdc417fe99', N'31b05701-60ef-405c-87ba-af47049e3f48', N'1000.01.01.06', NULL, N'IT信息部', N'部门', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1', N'', NULL, 1, 14, 1, CAST(N'2013-10-20 22:46:32.897' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_Organization] ([OrganizationId], [ParentId], [Code], [ShortName], [FullName], [Category], [IsInnerOrganize], [Manager], [AssistantManager], [OuterPhone], [InnerPhone], [Fax], [Postalcode], [Address], [Web], [Description], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'3d7259f9-7991-4c58-8064-27f020bf0659', N'ce65969e-0fa6-4697-acbc-d5bdc417fe99', N'1000.01.01.06.01', N'', N'技术研发组', N'工作组', 1, N'', N'', N'', N'', N'', N'', N'', N'', N'', 1, 19, 1, CAST(N'2013-10-20 22:54:28.660' AS DateTime), NULL, NULL, CAST(N'2015-11-10 14:31:28.277' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'97c2d0f4-2efb-46f9-ad99-e7095e014fa2', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'9f8ce93a-fc2d-4914-a59c-a6b49494108f', CAST(N'2015-11-17 14:47:22.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'0bcd4e56-5d5f-4d3f-9091-89973b1fbd51', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'3885ba7f-c246-493f-9053-7aa70a642662', CAST(N'2015-11-17 14:47:22.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'692ac717-e651-4621-8169-24c63e9737dd', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', CAST(N'2015-11-17 14:47:22.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'42c47b16-400f-4380-92e6-a957f38f4a9c', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', CAST(N'2015-11-17 14:47:22.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'1309d4de-c477-4052-bb62-a17a54cb545d', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'7996cea4-5503-4807-87ba-d2da553c4341', CAST(N'2015-11-17 14:47:22.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'f9be9c36-149e-4e32-b3af-1bfb094cb0c2', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'c108ef45-b8b6-493e-951a-9050706e2bba', CAST(N'2015-11-17 14:47:22.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'6aec82b9-7356-4166-b8cf-0c1cca7ca734', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'8104bfa2-fc85-4459-b533-7f58b7541155', CAST(N'2015-11-17 14:47:22.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'8355047e-f55f-4785-97ca-7011e49932de', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5c5077f0-7703-4fee-927a-b765e1edf900', CAST(N'2015-11-17 14:47:22.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'd839b3e0-f306-4a89-9c0c-70c74815cda3', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5477b88b-3393-4d39-ba2d-f219f486bd38', CAST(N'2015-11-17 14:47:22.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'034d6fae-a842-4521-a2f2-48ccadf58951', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'2b057961-5ed1-4785-b808-1f366085f406', CAST(N'2015-11-17 14:47:22.583' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'd5eeb581-f15d-4a99-98f7-5a0befefbb61', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'545d2450-4dac-4377-afbe-d9aa451f795f', CAST(N'2015-11-17 14:47:22.583' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'f46a162e-0f28-43ce-aaf9-308aa049165c', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', CAST(N'2015-11-17 14:47:22.583' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'43011410-990d-48a9-95f5-7fe77b9c902f', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'1af02b2d-bb66-4716-9ed5-ec3fcff9f5e2', CAST(N'2015-11-17 14:47:22.583' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'2c27bf01-bd85-4abe-b53e-e026995f00ff', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'd7a9f7e6-f004-4d39-b54c-0ad4215115a9', CAST(N'2015-11-17 14:47:22.583' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'3bcd5769-4472-4bc7-9bfb-847d442473be', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b', CAST(N'2015-11-17 14:47:22.583' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'1b10d0f3-0c62-464b-a509-e08ecedd80bd', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'e84c0fca-d912-4f5c-a25e-d5765e33b0d2', CAST(N'2015-11-17 14:47:22.583' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'56093f8f-069a-4f7e-951e-87868661e876', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'cef74b80-24a5-4d77-9ede-bbbc75cdb431', CAST(N'2015-11-17 14:47:22.583' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'f53eb3f2-794c-4abc-add0-ca3473c0d9ac', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'ba0d11ba-9747-41fe-b5bc-e0f4469508bf', CAST(N'2015-11-17 14:47:22.583' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'89f056cf-0a9d-46a7-9696-46ec525313ab', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'20078172-7a2a-491b-91c3-97c25b3a58dc', CAST(N'2015-11-17 14:47:22.583' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'57514860-5a1a-4fe4-8365-e4e38ae5488b', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'8fcead5e-991a-4904-99ac-2c9d9269040b', CAST(N'2015-11-17 14:47:22.583' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'3ce5a6c5-5f01-4f0f-989c-9927b95bb8fe', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb0c4d65-4757-4892-b2e9-35882704e592', CAST(N'2015-11-17 14:47:22.583' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'61ec3ad6-496f-40ed-b443-0aaa172d6c14', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b863d076-37bb-45aa-8318-37942026921e', CAST(N'2015-11-17 14:47:22.587' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'2fcaa906-8ddf-4d2e-9a50-b0f754219607', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', CAST(N'2015-11-17 14:47:22.587' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'95264578-e08e-454d-89e5-3192477e51fb', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', CAST(N'2015-11-17 14:47:22.587' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'acbdbcbf-6eac-4719-97cc-ee7c4baff5bd', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', CAST(N'2015-11-17 14:47:22.587' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'dec3fb85-81c0-4eb6-a8ec-0561714c9959', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'e620450b-6d17-4192-bee0-66fbd114e82a', CAST(N'2015-11-17 14:47:22.587' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'd2cad146-e524-4c60-8bf8-4285ea390a93', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'c0969b4f-8925-43f3-b664-f1114a4e9aed', CAST(N'2015-11-17 14:47:22.587' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'fc227efb-9391-45bc-bc48-cec6c9102c4e', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'4d864415-aa4f-4621-ac86-87578c7861a5', CAST(N'2015-11-17 14:47:22.587' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'e4f0c06c-876f-4574-9d3d-f66df576df1e', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'2969f5af-6c78-44fc-93ea-c1b96fb3db50', CAST(N'2015-11-17 14:47:22.587' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'218d3b3c-fc1a-4687-9d96-270201ba02ae', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'd8775515-d8df-45f1-9369-8d62bfbf1fd1', CAST(N'2015-11-17 14:47:22.587' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'28d47595-fb46-4025-881b-694534e3d375', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'6f796e95-c177-4070-a6b5-8ced973c0111', CAST(N'2015-11-17 14:47:22.590' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'cd95da8b-461b-4e9f-97aa-0be304b745ae', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'1ff6d07d-3d17-4ae2-8ce2-8a70f240048c', CAST(N'2015-11-17 14:47:22.590' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'5736ca6b-ba5d-4d24-8568-eb78f763720a', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'4de3b54c-7d8f-4928-802b-852bd8c2d9fa', CAST(N'2015-11-17 14:47:22.590' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'6c48218d-e7fa-48da-a126-5d446b69751e', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', CAST(N'2015-11-17 14:47:22.590' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'97f63018-3b4f-4728-b30c-76eaaeb4c23e', N'06ab50bd-f33e-4c87-95d0-1db5201f0039', N'9f8ce93a-fc2d-4914-a59c-a6b49494108f', CAST(N'2013-11-05 23:43:37.210' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'2d67d023-f793-414c-94dc-cc5486d980a6', N'06ab50bd-f33e-4c87-95d0-1db5201f0039', N'3885ba7f-c246-493f-9053-7aa70a642662', CAST(N'2013-11-05 23:43:37.210' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'1cec5bba-6477-47e8-bc78-1b1c1bbfc2cd', N'06ab50bd-f33e-4c87-95d0-1db5201f0039', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', CAST(N'2013-11-05 23:43:37.210' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'e631a774-062f-44dc-a906-05ce7eb39c07', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', CAST(N'2015-11-17 14:47:22.590' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'24b89b43-ed25-46d8-8ed4-1c8fa6ed5666', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'ff01d1e1-6a9e-4183-aee7-6708d76375d1', CAST(N'2015-11-17 14:47:22.590' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'4f141894-cb07-4508-b4f4-17f9d0d171a5', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'4c31de1e-3788-429e-b15e-f9fb70b264b1', CAST(N'2015-11-17 14:47:22.590' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenu] ([RoleMenuId], [RoleId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'fbb44ba2-a3b8-42c6-886d-13d883ff01ad', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb12f51e-91cc-436f-99fa-154841d9f15a', CAST(N'2015-11-17 14:47:22.590' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'20bbcf18-dfc0-4af8-ac06-e5b638832833', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'8b2dc4de-0dfc-4160-b18b-80d5e9f47812', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'2eee1514-4e00-429f-8394-a55a54be9f4a', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'b80d6d3c-d336-4315-a5af-242f3b5d8908', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'673de04a-fc4a-4c76-abda-a49cc86a5834', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'c5e45c17-660d-4497-a357-9f990677d27a', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'81078015-4962-4ce7-829a-186cedaafb33', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'4b47559a-91ee-4f51-8490-acecab25b729', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'fb12c5d5-358d-480e-b034-342acafa1d6e', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'fddb967e-c3f2-4da7-a3bf-22fd6ecbc0ea', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'a2faad97-7e02-45b3-9e81-33e3ac25780a', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'db8218c0-587a-4218-8659-e60ac465075a', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'14f278eb-1bff-415b-9b12-ca952fb3dd13', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'93b7ffc8-703b-4b81-8831-7f43d9183ddb', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'07b9464c-18c8-4e0f-933a-fd78d461e76d', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'7df7f4ce-1677-43f5-af0b-6102e0eb18c9', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'ddf2d18a-f90d-490b-8c02-fe91b47c9825', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'6df4c50a-3dc9-4aec-b3dd-b96310afb06d', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'4b2f23d7-cdfc-422d-b403-b08583560d00', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'2312660a-2259-458a-a816-221f646f4e0d', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'9f3b03f2-e8dc-41c1-adc1-ae5805e8cd25', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'13da7fa6-eb94-48cb-a8e2-4f135b385bee', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'cdc421dc-b345-4e14-922a-9c52936bfd64', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'2ef108e1-1fd7-43c7-86b9-a5d2207e96c1', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'31eade7e-19e6-4506-a650-d50da60a7a5d', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'cc5cbb4c-b9f5-4d3d-9dbd-0cde87cbfaf8', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'86d3d088-dd19-48fc-bac5-768c2753a38d', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'169e4d12-83d0-4d08-b38f-6bc5f66037a8', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'f0485885-7146-468a-847e-f297098cc42e', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'7996cea4-5503-4807-87ba-d2da553c4341', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'8f7d3b0e-25a7-44fa-8b4a-3f26cbe73f8e', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'7996cea4-5503-4807-87ba-d2da553c4341', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'78820f82-2174-40d3-8822-e86df3c08601', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'7996cea4-5503-4807-87ba-d2da553c4341', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'a8080436-44c5-4346-b2bf-6d3b7a7925b8', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'7996cea4-5503-4807-87ba-d2da553c4341', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'8509ad31-3c38-4358-b021-445c224d8701', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'7996cea4-5503-4807-87ba-d2da553c4341', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'461d68c5-bf47-46f2-a1b8-eba41b8ae241', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'c108ef45-b8b6-493e-951a-9050706e2bba', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'bba82fe7-e775-4e15-b3c5-a81bd09d3181', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'c108ef45-b8b6-493e-951a-9050706e2bba', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'e22b2310-64c7-47a1-80ce-2b188c75aab9', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'c108ef45-b8b6-493e-951a-9050706e2bba', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'e79a1ae7-7fc1-4c2f-b590-d0e2b0f13584', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'c108ef45-b8b6-493e-951a-9050706e2bba', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'52f10d63-9ad3-4729-853e-1ffce8d8a10f', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'c108ef45-b8b6-493e-951a-9050706e2bba', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'c509c2e3-386f-4476-814a-a6901502d3df', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'8104bfa2-fc85-4459-b533-7f58b7541155', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'175ee254-25fe-4561-b063-a3f5646d7cea', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'8104bfa2-fc85-4459-b533-7f58b7541155', N'f70649d1-0740-4ed9-8d7d-de5c525efa38', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'0e53cc9d-a4fe-4607-a45b-fdaad35d7dae', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'8104bfa2-fc85-4459-b533-7f58b7541155', N'1a089561-0e3c-4e2a-a4c6-375d4fc74a9b', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'0e659953-86b5-4b2d-bd51-54ef38155d45', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5c5077f0-7703-4fee-927a-b765e1edf900', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'fcc8e49f-9e7d-43d1-906c-40828ed0c417', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5c5077f0-7703-4fee-927a-b765e1edf900', N'e9ea8e5a-887d-484b-b8b3-99993f7f20c2', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'2179239a-aa42-4d86-a681-13b90b3ad23b', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5c5077f0-7703-4fee-927a-b765e1edf900', N'3b505abe-a0ca-4743-a226-cb8432f4aff4', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'bdb965ad-8750-4a71-89a3-ae25c1b5b7d2', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5c5077f0-7703-4fee-927a-b765e1edf900', N'f70649d1-0740-4ed9-8d7d-de5c525efa38', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'26c7ac9a-8850-48c4-98ac-851210a8b031', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5c5077f0-7703-4fee-927a-b765e1edf900', N'1a089561-0e3c-4e2a-a4c6-375d4fc74a9b', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'242c5a87-aee8-4a31-82a7-b4ff1920c4b9', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5c5077f0-7703-4fee-927a-b765e1edf900', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'9f5242ea-79cc-49fa-9498-a99f9768fec1', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5477b88b-3393-4d39-ba2d-f219f486bd38', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'0fe74ab3-190d-4a9c-b24b-fc368c39da28', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5477b88b-3393-4d39-ba2d-f219f486bd38', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'383c6520-fd56-4fb9-97d8-c13d0280a54c', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5477b88b-3393-4d39-ba2d-f219f486bd38', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'f8953733-9fb4-4382-a0a0-4af8d416a69e', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5477b88b-3393-4d39-ba2d-f219f486bd38', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'5c5eec86-6740-4e63-a404-08295fde276e', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5477b88b-3393-4d39-ba2d-f219f486bd38', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.713' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'46d27fa3-3e76-4694-aa0e-32d3424c0a32', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'2b057961-5ed1-4785-b808-1f366085f406', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'5b9d73b9-94cf-4bcf-bfd0-dc0a0875c1dc', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'2b057961-5ed1-4785-b808-1f366085f406', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'49feba6e-f3fb-47ac-bf92-0346c43fa4e6', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'2b057961-5ed1-4785-b808-1f366085f406', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'03b691ba-9eee-4972-8da7-39314e243590', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'2b057961-5ed1-4785-b808-1f366085f406', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'f0aeb519-ad1b-4e11-ae6d-b775c53b7e71', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'2b057961-5ed1-4785-b808-1f366085f406', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'0dc0e878-e71e-478e-b7a1-465ec2adefbc', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'c2ed80ec-e0bb-45a6-865a-50bb055bb43f', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'f2c494be-5982-4f9d-b47d-5c3887980525', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'650848bb-1420-46e7-b9cb-a7bc6850f974', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'1af02b2d-bb66-4716-9ed5-ec3fcff9f5e2', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'dad9421a-025b-4a10-8a4b-fcb706e151ba', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'1af02b2d-bb66-4716-9ed5-ec3fcff9f5e2', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'615e834e-74b8-47e5-84d5-6fa0b14845a3', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'1af02b2d-bb66-4716-9ed5-ec3fcff9f5e2', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'10c4a124-09f9-4f78-9cb1-a86ea6efc605', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'1af02b2d-bb66-4716-9ed5-ec3fcff9f5e2', N'745d7aaf-f1e4-4463-879a-daa9c23bc700', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'219e4cf8-89d7-48ad-be83-6a8f672922d1', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'd7a9f7e6-f004-4d39-b54c-0ad4215115a9', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'b96d9aa1-eb90-48d2-b631-265401c88fa0', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'd7a9f7e6-f004-4d39-b54c-0ad4215115a9', N'1a473b17-a822-4f9f-8391-bfc07671b837', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'fff30098-f7b4-40aa-9ac3-6a1f07d8db46', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'd7a9f7e6-f004-4d39-b54c-0ad4215115a9', N'4b2f23d7-cdfc-422d-b403-b08583560d00', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'49f0fb0e-3e35-4235-a3de-58f988701316', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'd7a9f7e6-f004-4d39-b54c-0ad4215115a9', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'0ad55c8d-78e0-482d-825f-67dc9f9350c9', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'd401383a-5818-421b-a874-a10da8cc0cfa', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b', N'1a473b17-a822-4f9f-8391-bfc07671b837', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'c71a9cfd-448c-4cb0-af35-df1856ace8fd', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b', N'4b2f23d7-cdfc-422d-b403-b08583560d00', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'f9ef075d-eeda-4a07-926e-052a61118296', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'525bcefc-943d-4a64-951d-575f6e68699c', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb0c4d65-4757-4892-b2e9-35882704e592', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'61e151e2-6565-4012-95ac-e0a6638ff28f', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb0c4d65-4757-4892-b2e9-35882704e592', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'ff0a14ac-9674-4461-b5bc-010001394be3', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb0c4d65-4757-4892-b2e9-35882704e592', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'aed251fa-cc58-4c79-88a3-526ebe315ef7', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb0c4d65-4757-4892-b2e9-35882704e592', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'1a929133-c2c7-4ad0-bf56-bd0db3de3e37', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb0c4d65-4757-4892-b2e9-35882704e592', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'53514412-7fe3-448d-ac83-e3844a619843', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b863d076-37bb-45aa-8318-37942026921e', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'a5fec093-6f9d-4052-883b-6a98fce67050', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b863d076-37bb-45aa-8318-37942026921e', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'32e94369-c6a2-4e4e-a699-3d36578541fd', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b863d076-37bb-45aa-8318-37942026921e', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'2a5e55ef-1f13-4b33-8215-293b288af91f', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b863d076-37bb-45aa-8318-37942026921e', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'7d469e5b-bcca-40a4-a7c1-a5b24cdd72f1', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b863d076-37bb-45aa-8318-37942026921e', N'44b5dce0-be25-46cb-be31-e985c3e0fbe7', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'b0f9af4d-96c8-45b4-b4ae-4b1bdf3d7957', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b863d076-37bb-45aa-8318-37942026921e', N'a5f5181f-55d5-4671-ab39-3a56a4b494e2', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'521a5d09-6ff4-419d-b5a2-f4e52da7b843', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b863d076-37bb-45aa-8318-37942026921e', N'4d866304-9d1d-4549-93fb-1505a869ba94', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'b964d14c-6f69-4ff8-a221-14861c87b05d', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'b863d076-37bb-45aa-8318-37942026921e', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'1f035d47-d9f2-4c36-8bfa-28d1ca7693b4', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'26feca59-567b-46bf-827c-3dc704a27ae6', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'a3bbc612-9c33-4101-bc18-f1553b2e09d0', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'3092cb45-a234-45f6-8b5c-9afe672b4b31', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'ce8b0dd0-df92-4067-b97b-ec9d7facaa4f', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'8db7a70c-6949-476a-822e-af0e84fb96df', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'71b392ae-091d-44a8-86f8-cdeba38b9c59', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'0f4fd840-2386-474c-80e4-b87a1eda93b0', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'e54aace5-ee42-43a4-9027-e15b47818182', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'61cec1d0-9697-4875-a822-4fe6b8cf9916', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'30979042-9caa-4f5a-96ff-9e33230d7052', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'38aee003-4318-460f-9f95-f3afbce9ccd2', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'a311ffec-7949-4417-83d4-a4ea8dcd3294', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'2032af49-f8ea-41f7-af8e-eb77baee5072', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'd37e57b0-18e2-4c0c-a554-f0d86e8637e5', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'b967a903-4e9a-42c3-bb28-4102829e7bce', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'3fc20bec-ff6d-4210-b15c-c3f55a8f334c', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'4dc60e56-aa0a-4eea-b424-2a188082b0d1', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'76decd06-73d9-4600-bcb2-b312a00a3c6f', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'41686d83-16c0-4fc2-a86f-60a1649e4966', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'75428346-9f5f-4a03-b43b-7b1c61936020', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'a7e76532-63d2-47b6-afaa-f1a843227a14', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'c85e6f90-7b88-43f9-b708-734d31eed8a5', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'0905d517-a3f5-4e7e-bb18-86308d073733', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'f518ac8b-0ad3-41f3-8aa3-787ef909b396', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'c7e7d4b3-d21e-4dcf-9e39-20e099ce4375', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'e41d1c97-8741-4bf1-82df-51a1b9cda5e3', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'61cec1d0-9697-4875-a822-4fe6b8cf9916', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'75b0f721-1687-4474-9437-4e8571b7bf81', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'06101695-a6b9-4dd0-9ed2-4ca51b0c8d68', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
GO
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'107d8e45-953e-4da9-b249-ec78b2330621', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'eef3d872-9454-410a-8f1b-1ed4fedb9eae', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'd5160887-8508-42c2-b873-c8b10bc8e889', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'78458791-cf73-4f34-963c-1c829bf8822e', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'35fb5493-2979-45ea-bdcf-b71c703fed29', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'8418a4c6-f433-4098-a0cf-74d66f02ec93', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'13da7fa6-eb94-48cb-a8e2-4f135b385bee', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'3d0a30e0-968a-40e7-aaa4-211c4d274e2e', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'2ef108e1-1fd7-43c7-86b9-a5d2207e96c1', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'00711c6a-7705-484a-bfb5-27cfc75c0daa', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'cc5cbb4c-b9f5-4d3d-9dbd-0cde87cbfaf8', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_RoleMenuButton] ([RoleMenuButtonId], [RoleId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'f5d364db-da3d-4cc6-8c13-640bb35f37b3', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'169e4d12-83d0-4d08-b38f-6bc5f66037a8', CAST(N'2015-11-17 14:47:34.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_Roles] ([RoleId], [OrganizationId], [ParentId], [Code], [FullName], [Category], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'31b05701-60ef-405c-87ba-af47049e3f48', NULL, N'100001', N'系统管理员', N'1', N'11', 1, 1, 1, 1, 1, CAST(N'2013-10-23 10:14:51.310' AS DateTime), NULL, NULL, CAST(N'2013-10-25 21:47:13.380' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄')
INSERT [dbo].[BPMS_Roles] ([RoleId], [OrganizationId], [ParentId], [Code], [FullName], [Category], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'cf92fb54-b9da-4ce9-9331-a5c8069c46c5', N'31b05701-60ef-405c-87ba-af47049e3f48', NULL, N'100002', N'用户管理员', N'2', NULL, NULL, NULL, 1, 2, 1, CAST(N'2013-10-23 10:14:53.737' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_Roles] ([RoleId], [OrganizationId], [ParentId], [Code], [FullName], [Category], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'd82df1c9-985a-42ed-96ab-e78d858ce6cd', N'31b05701-60ef-405c-87ba-af47049e3f48', NULL, N'100003', N'系统配置员', N'3', NULL, NULL, NULL, 1, 3, 1, CAST(N'2013-10-23 10:14:56.670' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_Roles] ([RoleId], [OrganizationId], [ParentId], [Code], [FullName], [Category], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'06ab50bd-f33e-4c87-95d0-1db5201f0039', N'31b05701-60ef-405c-87ba-af47049e3f48', NULL, N'100004', N'业务管理员', N'1', NULL, NULL, NULL, 1, 4, 1, CAST(N'2013-10-23 10:14:57.263' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_Roles] ([RoleId], [OrganizationId], [ParentId], [Code], [FullName], [Category], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'14e9cd2c-b6c7-48e7-83e9-6c823b922f4b', N'31b05701-60ef-405c-87ba-af47049e3f48', NULL, N'100005', N'财务主管', N'2', NULL, NULL, NULL, 1, 5, 1, CAST(N'2013-10-23 10:16:26.347' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_Roles] ([RoleId], [OrganizationId], [ParentId], [Code], [FullName], [Category], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'7425db08-64ce-4380-ab8d-9021ea074b78', N'31b05701-60ef-405c-87ba-af47049e3f48', NULL, N'100006', N'开发人员', N'3', N'1', 1, 1, 1, 6, 1, CAST(N'2013-10-23 10:16:29.443' AS DateTime), NULL, NULL, CAST(N'2013-10-25 21:47:20.747' AS DateTime), N'ed097525-ba86-4940-934b-9ee1b884fbbd', N'佘赐雄')
INSERT [dbo].[BPMS_Roles] ([RoleId], [OrganizationId], [ParentId], [Code], [FullName], [Category], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'eb19e72f-2356-4f54-8bd8-d23c349dd35b', N'31b05701-60ef-405c-87ba-af47049e3f48', NULL, N'100007', N'测试人员', N'1', NULL, NULL, NULL, 1, 7, 1, CAST(N'2013-10-23 10:16:32.747' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_Roles] ([RoleId], [OrganizationId], [ParentId], [Code], [FullName], [Category], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'd0a61fac-f54c-42dd-9193-f858717feb34', N'31b05701-60ef-405c-87ba-af47049e3f48', NULL, N'100008', N'董事长', N'2', NULL, NULL, NULL, 1, 8, 1, CAST(N'2013-10-23 10:16:36.377' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_Roles] ([RoleId], [OrganizationId], [ParentId], [Code], [FullName], [Category], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'b237853e-6b0b-4971-92f5-da7815918053', N'31b05701-60ef-405c-87ba-af47049e3f48', NULL, N'100009', N'人事主管', N'3', NULL, NULL, NULL, 1, 9, 1, CAST(N'2013-10-23 10:16:40.160' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'a75e9154-3803-4a62-ad1f-a2daa033a53b', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', CAST(N'2013-10-28 14:27:30.143' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'a36624d1-5693-4929-99e2-18ee94d9f3ca', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', CAST(N'2013-10-28 14:27:31.127' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'97506ff7-0abb-48b2-af05-b7eccea4e6bb', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'c108ef45-b8b6-493e-951a-9050706e2bba', CAST(N'2013-10-28 14:27:37.493' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'85f5e6e6-cbb7-4295-a4c0-92f51b35b0d9', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'7996cea4-5503-4807-87ba-d2da553c4341', CAST(N'2013-10-28 14:27:39.700' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'1549444f-c573-41e4-b06b-66390462e40e', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'b863d076-37bb-45aa-8318-37942026921e', CAST(N'2013-10-28 14:27:50.310' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'd91007a6-f998-4f95-9c3b-bdaf5e96acc5', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'eb0c4d65-4757-4892-b2e9-35882704e592', CAST(N'2013-10-28 14:27:53.663' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'f74b13b0-1ce3-4e06-ae86-b671fa5786c4', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'8104bfa2-fc85-4459-b533-7f58b7541155', CAST(N'2013-10-28 14:27:57.840' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'a44ec4a6-a2eb-4c5a-a4b5-451cf711d845', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', CAST(N'2013-10-28 14:28:07.517' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'b027a6b2-8635-4cb9-b2e8-180ac3e5999c', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'5c5077f0-7703-4fee-927a-b765e1edf900', CAST(N'2013-10-28 14:28:11.587' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'61798e58-6d68-4701-b37c-10b94a5f452f', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'd7a9f7e6-f004-4d39-b54c-0ad4215115a9', CAST(N'2013-10-29 17:18:05.130' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'a85dd7e9-e5bb-474e-b15e-df847a41f108', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'e84c0fca-d912-4f5c-a25e-d5765e33b0d2', CAST(N'2013-10-30 15:49:16.193' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'0f4f75a0-c305-437f-8302-dee22636be51', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b', CAST(N'2013-10-30 15:49:07.817' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'9c1ab96c-990f-4700-9e03-69a00e6530ab', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'1af02b2d-bb66-4716-9ed5-ec3fcff9f5e2', CAST(N'2013-10-30 16:36:26.350' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'609a4fb6-c3d4-4ab8-a584-90c362b6af77', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', CAST(N'2013-10-30 17:30:11.203' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'3a2fdcfe-aae6-4699-924d-2d238dc12588', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', CAST(N'2013-10-30 22:33:33.590' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'332952f7-04bc-4fee-a247-98f6656e57ef', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'ba0d11ba-9747-41fe-b5bc-e0f4469508bf', CAST(N'2013-10-31 16:55:32.103' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'010ddf1b-8fa2-4cb9-a8ea-279548e57353', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'cef74b80-24a5-4d77-9ede-bbbc75cdb431', CAST(N'2013-10-31 16:50:19.583' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'0dc04591-06d8-474f-b23f-a1f33506224b', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'2b057961-5ed1-4785-b808-1f366085f406', CAST(N'2013-10-31 17:39:37.817' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'ca50b50c-8b1c-4686-8dde-084bec037d94', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'5477b88b-3393-4d39-ba2d-f219f486bd38', CAST(N'2013-11-02 17:24:00.203' AS DateTime))
INSERT [dbo].[BPMS_Shortcut] ([ShortcutId], [UserId], [MenuId], [CreateDate]) VALUES (N'a50bf5ff-e2bb-4515-9970-e7c2a8b25465', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', CAST(N'2013-11-04 11:02:33.207' AS DateTime))
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c707f883-431c-4037-a714-6d317dea8b92', N'e4cf93d2-26fd-4eeb-b087-27fc92d051af', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e0523553-e17f-488f-aba0-d0be39479cd8', N'edd7c238-bea7-468e-83bf-ef8a31715f5f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'89d43f0d-11c7-4be9-8190-03c9848842de', N'acd263ad-8608-4622-832f-7aaa32969ba6', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e6f8cb87-ad07-4684-b88a-aee9c39cb7e5', N'94383ffd-5bd9-4788-a219-935857194c4a', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c5902ae8-7c2a-4706-8ae8-b9dfbf584dac', N'f9cd854d-c402-4f7a-838d-ed6e81c1cbbd', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'60a1b3e8-5b75-4fe5-8cc6-d702fbb09dda', N'd2a92569-4b20-455c-aab2-b38b2fd31783', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f5f6f463-284e-4e1e-b575-1002738aff9d', N'4da794df-ef0c-4542-8f7c-46652a54e41c', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3459a953-396c-45aa-bf18-cc4bc3fb90c1', N'dc3f571c-f464-4fd0-8397-61d7806a13f4', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd3c8108f-0a54-424d-b7df-f19fb1b96f36', N'7611c462-1398-4007-80b0-2ddc773a625d', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7252bece-ca1f-40bd-8034-f31b475203bd', N'a67c18cf-20af-403b-afc7-db641c3cdf60', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'16968ebf-da1c-412d-b303-af54c7291a75', N'c2dddda6-0876-4a45-8e04-3f37d51faa51', NULL, NULL, NULL, NULL, N'URL:/CommonModule/UserPermission/UserPermissionIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1e9a8ff3-f808-49b3-921c-dc9e2a359df7', N'6d902587-b845-442e-8145-8e3160b20885', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3c14a04e-a7d3-42fa-9933-9350a7e09f9a', N'd431c3a0-9d6b-4d20-af1b-659935e6df72', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/IAuthorizationList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f6496d8e-7300-4477-b78b-a523a8619a5a', N'30fcfd11-2bef-4713-bca5-7456b1199ac0', NULL, NULL, NULL, NULL, N'URL:/CommonModule/IPManager/IPManagerList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'55f689db-d27a-4291-a927-940c89dbfbaa', N'5169d9e4-976f-45eb-81fe-fbb3af8758b2', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3a1bf998-7597-432c-a431-e0647179d108', N'bb3d469a-a169-4566-8f30-f068a81bfcce', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'90e2308d-1706-400d-9266-f01d35f45743', N'6ab10383-a3b9-4938-a9ff-1fb955165d62', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'448b9b25-53c6-4f6a-a794-3a00d46e4f5f', N'0b655aa2-50ac-47b3-b3dd-bb39fd26b68a', NULL, NULL, NULL, NULL, N'URL:/CommonModule/FlexibleForm/FlexibleFormIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8beca5c0-e343-44e5-bd74-b6e7f1efb9cb', N'6244f111-2c4b-4da8-995a-489e6ac8a39a', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'79ac2da4-9f1b-48a6-a02e-ab3eabd337b4', N'c861b6b1-1b0b-44bc-9c76-909007f3f96f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Button/ButtonList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd2686160-faa0-4b40-952f-f46f63571264', N'2ead14a0-a5c0-4654-bb56-cb4b00922611', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/News/NewsList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c8c06ab5-fcaf-4740-b3f4-8647123e5e75', N'd5509af8-5338-4970-b10d-9f969a7cfa95', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/News/NewsList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'88814d3a-bd56-4cfa-866f-05ef5c404bcf', N'feef798e-970a-4192-a688-044bdda114bc', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8fb6dae8-1404-4776-8f62-278adf3af92e', N'99e286a4-b95f-410b-addc-f7db4e6e437f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e1f875a7-2514-4acb-8afd-ee5313725425', N'50faf9d5-b84f-444b-8db9-8c99f1bac404', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/News/NewsList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'840a8b45-577e-4489-9a7a-11962e7d2a49', N'8727ab9c-1ec2-4fbb-8743-c029612aea92', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/News/NewsList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6ab10d0c-5b97-40ad-a1aa-c461d9a00691', N'62391c44-3a32-4521-b219-7b01ce29f81f', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/News/NewsList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'61f95e4e-e4f9-4d50-a0ea-3f8090f5f1ba', N'5c7f43f2-30d2-4515-bb36-51aee86358d4', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/News/NewsList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd858de99-98f3-4dce-b598-af09614c3e20', N'bc6247a6-57a7-4287-b582-586334ad82d7', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/News/NewsList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'accb3034-881a-4a93-a4ae-5e6e3fc79318', N'757a9846-0905-4ae8-9fb8-8a1b1703e1f3', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/News/NewsList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'903026b4-6bfa-47bc-9133-9d64237e8b60', N'695b18d7-073d-4f6e-b29b-87e0e6bf08d8', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'928e0e5b-56b9-447f-91e4-097c581aee1b', N'f5359f48-105d-4ebd-9411-d9a804e69aaa', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/News/NewsList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9504d61c-eb42-477d-be2f-2ef613834f41', N'7967c660-cfb4-4e8f-8d7c-970467afde98', NULL, NULL, NULL, NULL, N'URL:')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b2efb41f-1324-4367-b028-f643b1c7867a', N'80ed37bd-b335-4bb7-943c-dac382036e54', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7fd0bbf7-ce50-498e-b457-b09b9add175b', N'52453adf-4424-4a85-8b2c-0e7124b4b86a', N'修改时间', N'ModifyDate', N'2013/11/29 13:38:31', N'2013/11/24 17:16:18', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f59342f4-c040-488d-b303-2651ad591256', N'd10fffdd-da94-4af1-8a5b-91cd6d5cfa98', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Button/ButtonList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'998fd4bc-f64b-4e47-a4d3-b941a228a76f', N'2f68f5b0-e867-4489-ab88-d62df77ad724', N'按钮主键', N'ButtonId', N'c7e7d4b3-d21e-4dcf-9e39-20e099ce4375', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'100b0680-f948-486c-991a-0db4ae100b87', N'2f68f5b0-e867-4489-ab88-d62df77ad724', N'按钮名称', N'FullName', N'上传', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a2e01101-a96b-4409-818d-51c5ad057ae1', N'2f68f5b0-e867-4489-ab88-d62df77ad724', N'按钮图标', N'Img', N'cup_go.png', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd2af176d-b377-4f34-b315-a3a074e9fa1c', N'2f68f5b0-e867-4489-ab88-d62df77ad724', N'按钮事件', N'Event', N'Uploadify', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd4373d81-fc62-4fb3-b8cc-a0cd02a11b12', N'2f68f5b0-e867-4489-ab88-d62df77ad724', N'控件ID', N'Control_ID', N'Uploadify', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'753ade9e-71df-47c3-9cea-06e4858ebf4b', N'2f68f5b0-e867-4489-ab88-d62df77ad724', N'分类', N'Category', N'工具栏', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c5bf0a1d-5482-4b30-8fd3-7928aaf6a8d2', N'2f68f5b0-e867-4489-ab88-d62df77ad724', N'是否分开', N'Split', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'37be7a66-1d5d-4096-84b4-8a534010bfc7', N'2f68f5b0-e867-4489-ab88-d62df77ad724', N'描述', N'Description', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'28edd108-e104-46d3-b577-b7ad4a70c8a2', N'2f68f5b0-e867-4489-ab88-d62df77ad724', N'有效：1-有效，0-无效', N'Enabled', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cf18a79f-c5e6-46ae-b209-291da9987754', N'2f68f5b0-e867-4489-ab88-d62df77ad724', N'排序吗', N'SortCode', N'25', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4f42120c-734b-46c0-ac0f-e611f62564b6', N'2f68f5b0-e867-4489-ab88-d62df77ad724', N'创建用户主键', N'CreateUserId', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7df1f8ae-067a-4903-b2bd-6255d1f6d2fd', N'2f68f5b0-e867-4489-ab88-d62df77ad724', N'创建用户', N'CreateUserName', N'佘赐雄', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'eb57a78c-1857-4bc8-b1a1-31bfeb8cda05', N'08b47950-8292-40d9-a77c-5c22ab421ab0', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'be82b137-7193-4403-bd62-48c8a78446be', N'3286ebf3-a8ca-442f-ae23-5971d11958b9', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Button/ButtonList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b3ccbeee-aef3-405b-ad1a-e2773f37d2ae', N'66e42cde-06d7-4e7d-961e-3fa7c3d802e0', N'按钮图标', N'Img', N'20131129014358627.png', N'cup_go.png', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'41c39588-3c62-4956-aed6-a3e70b71d86a', N'42688e23-8626-4e4a-beb3-8a68fea8eaad', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'db18c64e-8da8-4a90-95e0-8a6203cd3648', N'1d092859-fb76-478a-8dea-c036d31e0f0c', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9bc99c4c-6e30-4f9a-b98b-5afdd6ca8c09', N'eaedb52d-5279-4c46-b391-36f185b70ad9', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Button/ButtonList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'39987f5c-8aaa-4add-8f9b-1f52157b2d11', N'e27bcb14-bec2-41a6-8eaa-650f2a7be2de', N'是否分开', N'Split', N'0', N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c420d9dd-0dcf-4123-962e-12c4570a6056', N'e27bcb14-bec2-41a6-8eaa-650f2a7be2de', N'修改时间', N'ModifyDate', N'2013/11/29 13:53:09', N'2013/11/29 13:50:59', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f0fd2142-bed0-4918-82e0-ce81109a0737', N'6c67ef56-a8c0-44d2-addf-71ad142ba394', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'acbc34da-b54e-4786-b80e-ac6f292ada83', N'76d4f76f-991d-45e5-9745-f74ede44d6ae', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5cc90a53-327d-46ec-8f9c-7a7dd8d34ee0', N'f54ae556-9b36-47ec-8fca-a66192b80b5f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ba276d17-afef-4026-8ba4-3be0a405c623', N'd7b66edf-caed-44a8-8e9c-93ebbeee28fd', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ab64396c-d02c-409d-9ace-42d750f14ae6', N'32f4182e-87d3-4f20-9831-0ba0e79ae2e8', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2d5592dc-1990-46de-b5fd-9c3411d7ca0f', N'429be051-d063-4388-b671-37cf96de9540', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Button/ButtonList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3a852bb9-7555-4490-b202-56e73b075263', N'549744b3-205a-44df-945d-ac8e953d22a9', N'按钮事件', N'Event', N'Uploadify()', N'Uploadify', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'28574a14-bbc0-4b8c-a6d8-e08e29ee3cc2', N'549744b3-205a-44df-945d-ac8e953d22a9', N'修改时间', N'ModifyDate', N'2013/11/29 14:25:04', N'2013/11/29 13:53:09', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e5d1e504-45c5-4093-bcdd-7c0c0c3e7174', N'0cea6b64-3b48-4995-94f4-dcf534627cb9', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd8a9bcb5-6bae-468e-b63b-0aafd06eb103', N'9417cfc8-8472-4bb6-91c9-367d2215163c', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8e604d71-3c5e-4791-bbd6-09f4e1c36e61', N'a36d3cf8-88c0-4a60-85c3-7072f1ff3786', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9310d7fe-ae81-49c9-ad34-62dd8d6a91a9', N'6792972c-779f-42c2-8873-88a1665713b5', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'43d461b7-483d-46dd-b7de-9e950d39d1f4', N'fb89f543-05dd-447b-b02a-a51dfbed5e61', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'fd0cb18b-74f2-4331-8dc1-e10701c2dbae', N'a785e0cb-7237-4a46-ba69-e36cb20b2533', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7fa56aca-5772-48cb-b0bf-ced8bd99fb25', N'6c82ec69-c9cf-493e-8bb0-dcbc02c2bc9b', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c26213ea-6af3-4815-9e82-135899f32f92', N'c7980a21-2f53-40e7-a6cc-e23b27b39650', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e850e389-beb7-4155-8a3a-cef2ad839a35', N'eb28f370-7521-431f-86f0-f3c225d25a14', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/News/NewsList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a1574cdd-f777-4c04-aaec-77850eba2053', N'c250d635-f940-4fdb-aca6-fb8c7cca8767', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e5a3bcfe-b74c-4018-82c2-6f733516e9fb', N'a0f703b8-5d80-4348-a5a3-101df17f02fb', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2d98e8ae-12a6-4aee-930b-e28fd1f6ee8e', N'c2ad5768-6cb6-4f51-b0a1-3749022ea843', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'70009271-3612-480f-8667-768387389eaa', N'5018e49f-e9d1-430a-a19b-825b828538d0', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'32404d03-7bd2-44d3-89c7-f8cfc5b320fe', N'40696537-8ea7-4b97-938f-3782990fefae', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e1babce7-2fda-41e7-b635-b11677672f7f', N'630394f8-eb96-4cdf-98e8-84b104837b4f', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ef48138a-f220-474f-b4e3-d3b41edb9279', N'630907e6-9029-43a5-940a-d778a6653dc7', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'893e18c3-50e2-4b12-8281-111765910c33', N'f078da88-3d6b-42ed-b23d-5920535af2c3', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6aecc4c7-4d15-4ffa-b128-981fee0d4e36', N'e13fdd10-3d60-4372-bb3c-d0d40107034c', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3832f9dd-4db7-4809-bb52-49d6b0337d02', N'a0f716fa-0941-475b-b0ac-973af19a8b3e', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f2fc99a7-6f10-494e-b8cf-245508f379a0', N'efe4ad6a-5f37-47c2-8821-06eac0c26e08', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd65db20b-5bf7-499b-ac7f-46c5f0bec025', N'36b52f5b-58ed-4e5f-aa02-da3ffa44934e', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e9ec5b24-d7a7-4733-9cec-62567c91d491', N'b84f9a26-973e-4dd1-950f-e31ea3cf5d0d', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'62fd177a-63e3-4be9-9ef1-36ed9b481f3c', N'cfefd258-5891-4dc1-9cd3-0ee10b2b7d53', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6cea703b-d9e3-4fe9-bbe2-22f783270503', N'c80b8cc4-cd5b-40e1-8029-31a0d5712063', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'05c50324-dec9-428b-8b70-dd29b4cd0de5', N'a6abdcca-dc3a-4fb0-8e9c-03b743a2dbb2', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a28ad708-6ee1-431f-bbe3-07c6f8beedba', N'f0628867-fbea-4c0d-ab9c-3dea66eebbb0', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd11990cf-cf2c-4b3b-ad60-51a02ec40f75', N'73dfa4a4-1f60-4e57-83d5-29de001de2eb', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1ca92ef6-45e6-4056-aecd-54a668a721c1', N'313afd83-ae9c-4cd1-aeeb-c4aac8c03d87', N'名称', N'FullName', N'打印功能', N'打印单据', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8340bca3-41d7-4a03-8195-cdd9000bfcc2', N'ffb07f66-432f-4130-ad96-9b977ae9b82f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3f678b73-8898-4108-a853-23cada2d9dd3', N'e000e7f1-1245-4bfb-8323-4f1c6653d347', N'修改时间', N'ModifyDate', N'2013/11/30 15:13:01', N'2013/11/30 14:56:44', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e8e324d0-fdc9-4347-9286-c78c5cbccf61', N'4d50551a-0da0-4955-8b73-1fed0db403b2', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/Printpage/index.html')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'56942bde-c426-4bd4-9eec-649e3e75bd6f', N'8ce7287e-c067-4ab9-ba4f-2a59c25341ae', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ab81f770-ec98-4589-901c-766b13310348', N'ae9b9bf7-0813-42ca-99a4-03288c4f816c', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/News/NewsList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0eccf7e9-8c92-456b-8ab6-e68b95dc041c', N'3906a1c4-b3bd-4700-8e3b-b656611b36de', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3d3c5640-95f2-4ef3-a407-78b0da14721b', N'326a4271-c1ed-41c8-b21d-b3520a72e9cf', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/InterfaceManageList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5afb4b97-f31a-45bd-9e84-be2ca3e1e0ec', N'e00f3bd4-710b-4581-bc25-c26d8a3237ee', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/POOrder/POOrderForm.aspx')
GO
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8cae1caa-9721-4489-800c-f08cd506b71d', N'0ff5c047-06ba-4d06-a373-d9b9a76ddc74', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/InterfaceManageList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7f39dbbd-3317-4a0b-bf17-caa818a66dc7', N'd877951c-10a3-4c88-9cae-4cbc4ea55c4f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd5c950f3-27f0-4f30-b880-07d38c69509c', N'5a769c53-2b88-4e79-bd32-c35302269e00', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/InterfaceManageList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'23f79ab5-0fba-46d4-9b13-291fcfd5c9c2', N'deb32ef3-5cdb-4bfb-96ab-c6fc0fdf92aa', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cea76201-3060-426b-9265-1bd961ef8f44', N'8ac011fd-1127-48d3-8c18-424483e41c6c', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5fb8a225-2ae7-414f-9e29-789fcac99cc4', N'a25c3478-f924-4b6e-bb45-16c4e59523f0', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f824696f-2f0a-434a-b613-54ba63516fed', N'42c1b4d5-63fd-4cc0-89a9-3a6043b40ede', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/InterfaceManageList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'db627158-839c-42bf-beff-728e0b19e5fe', N'b7633009-ba35-4ab1-8b8f-c3029a9875ea', NULL, NULL, NULL, NULL, N'URL:/CommonModule/UserPermission/UserPermissionIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5afd1db7-9c53-4a18-89f7-a9389c80510e', N'c88c5327-f133-4f73-8fa9-f36645ceffa5', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a39490fa-4e5c-413e-9fec-052690b7b123', N'0377c8b2-d5ec-4478-8193-ded5bad7194d', NULL, NULL, NULL, NULL, N'URL:/CommonModule/IPManager/IPManagerList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'12b10e17-462d-4d2d-8ea0-4baa65367e79', N'78c9bc9a-d11f-43c6-bf13-39fac941236f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/IAuthorizationList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'40528012-8ed0-4b9c-863a-bdf6e6a3a529', N'fe12a6f9-f029-4e5e-967f-261497556cba', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'049db28e-e47b-414b-aa87-8eb7ea1c0f3e', N'b4316b39-e9cd-4b54-9f21-f8843dab7e04', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b395f462-2e25-4228-bbd5-dbc2c17bad52', N'0f66a346-b138-4fa3-9ba9-af51c583da8a', NULL, NULL, NULL, NULL, N'URL:/CommonModule/FlexibleForm/FlexibleFormIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'27ebdbee-89fa-4b34-bf1a-9723af22cba6', N'ff18dc20-fe9e-455b-b614-a938c9cdf913', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Log/LoginLogList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'22947a6f-f4d6-4a82-a22b-74dd6d7a38d1', N'107eca29-c8f0-4fe1-a18d-396710d87ccf', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Log/LogList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'212b10b2-1cb1-4aa4-a9d8-82c53727d11d', N'0c7b38d2-9748-4abd-a5dc-76f7eb7340e8', NULL, NULL, NULL, NULL, N'URL:/CommonModule/ExceptionLog/ExceptionIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'691e28c4-5768-422c-9cb4-bb6703d20041', N'a624168b-b7ac-46c0-9ba9-e902749316d6', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Log/LogList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'68634988-a124-4114-879c-6cb8d351a6ea', N'5d4dd39f-e769-4d7a-845a-e33ca25545c9', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/Individuation.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'782275d6-fb3f-4ba2-98c5-02b8a22f26a1', N'b5a67933-31fe-4516-ac97-bf24784446c8', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'97559fd4-1a99-41dc-8d39-fb8c8566b58a', N'01aed648-7bd1-42c6-9370-b642fbd81de4', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'09db6c24-c2c6-4edc-84fd-ecddafdcb276', N'ecb3dbe5-ddbc-4337-856b-3d1a624077cc', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/IAuthorizationList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2bf35f8a-3a3d-4207-93f6-ead584354faa', N'9cafffdf-48c1-4640-8157-88d58e7cfe26', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/IAuthorizationList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'38cb279f-6751-4eca-9455-09567b5f7dc5', N'5c6d1100-5edb-4146-9852-125ef662b5c4', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'bb66b116-3d67-4dbf-a74a-fcff717e9285', N'fe098575-6dd3-4497-90ed-f77d0d29ff43', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/IAuthorizationList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4077de65-6430-4be0-9ff5-683aaf3aa0cd', N'92a5c187-2fcf-4bfc-857f-d1eb5e1caa7a', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4a2d6c88-c46c-4fe8-af3e-fb92dbaebc55', N'b7f57a47-695a-4342-9978-bd6714cfee29', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/IAuthorizationList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'52556dc3-7097-4d48-883e-d73871712678', N'0b477554-34a0-48d4-ac97-f57928f697a9', NULL, NULL, NULL, NULL, N'URL:/CommonModule/IPManager/IPManagerList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'571e3822-fb1b-495b-84c0-1cfd299fd231', N'43e64e39-fef5-42c2-aa90-5dfd15dcf143', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Dictionary/DictionaryIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3d45ee83-d5e1-49d5-a0aa-7bb6d2ea1125', N'e6c049bb-93f5-48cf-8dbc-e480bd4eda86', NULL, NULL, NULL, NULL, N'URL:/CommonModule/FlexibleForm/FlexibleFormIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd0a835c5-2bbd-4555-a10d-64eedd9a1110', N'85b9a099-9f33-411e-88f2-8beb3b5e9973', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Log/LoginLogList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f8c49f7d-18c6-4761-bcc8-5c296fa5f57f', N'2b9d1661-98eb-408c-8496-20ad80fd4d62', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Button/ButtonList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a26045cb-8679-4d6b-ab36-d9c363b29f02', N'1f5ab8f5-fa08-400d-acd8-e69a89e21456', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cc389b6d-2220-477f-a672-3a39ef3295bb', N'af934471-747b-4f5c-b21f-d12c72cf3c29', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Button/ButtonList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0e228b2f-6381-40e7-8489-d734e7b936f4', N'6dab2032-5a3b-4d87-ada4-b3d032b14e33', N'有效：1-有效，0-无效', N'Enabled', N'0', N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5e4d9409-5b73-4c69-bfc7-2ac1496648e9', N'6dab2032-5a3b-4d87-ada4-b3d032b14e33', N'修改时间', N'ModifyDate', N'2013/11/23 17:50:01', N'2013/10/20 14:29:08', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4b64de52-285a-438c-81d4-68ec4b5635c5', N'a8d0e126-6e9e-4083-86b2-57883b675e4d', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5d659fcb-3559-47b7-bc79-bd8db96f7c31', N'8e79541c-9488-4631-84dc-02b13cd8b52f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2ef1f4b7-b100-494d-bbc5-4463ca378b7f', N'c9c44404-325c-4be1-b4f3-39d7ab18d032', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'72907ef0-2836-4a30-b7b7-59248e514840', N'413227ac-efad-4727-b551-2b905dbe2dcc', N'有效：1-有效，0-无效', N'Enabled', N'0', N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9a65f58a-e2bf-467f-82ff-d89797e11535', N'413227ac-efad-4727-b551-2b905dbe2dcc', N'修改时间', N'ModifyDate', N'2013/11/23 17:53:49', N'2013/10/28 10:57:16', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'01472123-c6ee-4e0d-a411-4b562e823ca9', N'573d4dee-121b-40b2-800c-00fb2f29875e', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'fffe6ae9-f61a-4f0b-9155-f1ea258d417e', N'de834279-a9b6-4003-bc9f-128eab28d0f6', N'有效：1-有效，0-无效', N'Enabled', N'1', N'0', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3bd4293a-c423-4a47-bf2b-bfe1966bab0a', N'de834279-a9b6-4003-bc9f-128eab28d0f6', N'修改时间', N'ModifyDate', N'2013/11/23 17:54:09', N'2013/11/23 17:53:49', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'edad500e-1502-41a9-aa27-7e9a484431c6', N'21d9596e-a8d4-4604-a437-3055a5325c28', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Button/ButtonList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'901c3966-ccd4-4ed4-99e7-e9f040a58cd1', N'89191c3d-a14f-47a9-ac5e-b0e160898fc5', N'有效：1-有效，0-无效', N'Enabled', N'1', N'0', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'567f361c-e9ed-4310-a738-7f123acb0fd8', N'89191c3d-a14f-47a9-ac5e-b0e160898fc5', N'修改时间', N'ModifyDate', N'2013/11/23 17:54:20', N'2013/11/23 17:50:01', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ba896678-bc44-4f58-946a-1f95441fcc0b', N'78f33c45-1e10-49bf-ad2e-69824bbc745f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b0ce2a9c-a4ab-421f-83d3-a6d6759d3483', N'd4d3cf9d-91d8-421e-889c-744ad618a05f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9b32446e-9c21-4b18-9bd7-baa233dee588', N'90521472-4d8f-440e-9c37-f2756c2b934b', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'aaca31f3-e82c-4f57-8c40-2ba20f32d634', N'49685c7b-e79e-43b1-9aaa-b183d72025df', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'27aeb895-f300-4f38-9475-e93201c1474b', N'aac45980-149f-4b8e-8357-d27dfc5ef714', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1bd515fc-bb2c-4fd3-a801-57db2a29c16e', N'47950c3e-b4a2-4c1e-9b10-a4cc49523867', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b5d1dd43-cf6b-4052-ab66-a8ffdabae49e', N'6d323481-7afd-4989-b526-604b9d95ffde', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'73a0cc7e-19a9-413c-8e19-13169f91d9c3', N'2a4d4027-c737-4801-8eee-78f8d7e96a9a', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd6f83c49-5793-4f69-ac65-14b6d17e6948', N'19892226-a2fb-4a9b-ad6a-a6f0e6abc471', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6fddb30c-ec9d-4cef-981b-3101f8b8e510', N'146d4111-8d16-4dae-92f1-ad7f0c4a29d4', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'549f685e-3970-442d-84fb-d5283d459a34', N'cdc8e8a3-2b8d-42ac-a54c-1ab83d424681', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9f414c4e-33d6-464a-b557-68e9f5c159a7', N'8da3532b-6714-42b1-94b4-fa781d2341c2', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f81408e8-3988-4021-a747-ad62a8c1ed1d', N'02fdd6aa-a7cc-4477-b3d2-e85d07160f14', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0e09f3b9-3ee4-4160-a764-4acee651c4cb', N'3eeb6314-8ba9-41eb-a8e6-b94dad57dc3a', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a87779d2-17d2-4ac9-9221-3ddac7bb3450', N'c15da0ec-5262-4fa6-ae35-7470476868b3', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a23ac132-4b3b-486a-83ac-ec3e3cff23b5', N'02fa81a1-b2e1-44d7-a234-c5eade3c5f97', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd1f42a84-f63f-4302-a29f-8a75382b9cf4', N'e595334e-0249-4552-b160-b20a2a076ba8', N'真实姓名拼音', N'Spell', N'WJM', N'WJMZYZ', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b6fb5490-6a19-4de6-902b-d31695d39e31', N'e595334e-0249-4552-b160-b20a2a076ba8', N'手机号码', N'Mobile', N'13811181124', N'13811181124 ', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'bdef400f-3099-4d76-9559-6d2016d2a844', N'e595334e-0249-4552-b160-b20a2a076ba8', N'修改时间', N'ModifyDate', N'2013/11/24 11:33:57', N'2013/10/23 23:50:51', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'531f67aa-3565-4b7e-b569-cbcfe1c67919', N'e595334e-0249-4552-b160-b20a2a076ba8', N'修改用户主键', N'ModifyUserId', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'ed097525-ba86-4940-934b-9ee1b884fbbd', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7708e446-1cbf-4aaf-96d4-d7ee724e150e', N'884d0c15-f45d-438a-975f-857c73c45dd4', N'描述', N'Description', N'', N'1111', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e68f9543-ca26-4a3b-8a67-50f66a81d162', N'884d0c15-f45d-438a-975f-857c73c45dd4', N'修改时间', N'ModifyDate', N'2013/11/24 11:34:03', N'2013/11/24 11:33:57', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b24cdacc-fc16-4b7a-8fb2-90ddc3524d65', N'af643387-64ce-41c5-984f-4eac4e3d6059', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'df93e70a-15cf-426c-b0ac-922ba5f0fea7', N'21ba3e33-cf0a-4a4c-bf44-89d3338a77a6', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ce2b6a68-ecee-45de-aaf1-c73d85499def', N'9514bfac-d5a0-4359-b238-fe256e6792e0', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6aa5d6c7-ef93-47d7-8532-5b3cb3db71fc', N'c7300c2d-2d6a-48b5-a43f-fb07057c3bea', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'27a05877-153c-4c8c-9a47-0079c3fbd12d', N'd812853e-4cb0-41f5-a03d-43eab304d277', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a49453cc-da9f-48cd-a54d-3f5652b9c21e', N'4c0c861b-0f7f-4ed0-832d-187a7375a05c', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'46eb640e-d6ee-4611-9eab-351fbd21fefa', N'e22dac68-343a-4aae-9d89-049699f5dd6e', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6d199a7f-df6f-49fa-b66b-e571e4d7d2ac', N'a08212d8-ab1e-4d21-a5f3-49c0cbf99579', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'169aeaf8-5012-4b4f-a3fb-502440bff698', N'c3ccd42b-34ad-4909-8ca0-50829686140b', N'有效：1-有效，0-无效', N'Enabled', N'0', N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ebfa3ba4-bce5-43cd-ae91-acf4692985d0', N'c3ccd42b-34ad-4909-8ca0-50829686140b', N'修改时间', N'ModifyDate', N'2013/11/27 14:51:28', N'2013/11/3 13:59:10', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5c5c176c-e473-4fc5-b21d-bb86fba0bede', N'3cb06a79-da23-4449-a433-577d19044fc1', NULL, NULL, NULL, NULL, N'URL:/CommonModule/UserPermission/UserPermissionIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c29abfa7-1246-4176-8142-a5d53ebec46a', N'4747665e-40cb-460a-9ca8-cead0d634e36', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2ead5741-cc06-4385-b081-49f84947a97d', N'cc8a984e-9147-41b6-b985-b985a8f2e92d', N'有效：1-有效，0-无效', N'Enabled', N'1', N'0', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'701fabe3-d886-43ad-98ce-c92fcf0202ee', N'cc8a984e-9147-41b6-b985-b985a8f2e92d', N'修改时间', N'ModifyDate', N'2013/11/27 14:59:32', N'2013/11/27 14:51:28', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'bec1beb5-8bde-4799-99e0-1c23ca084cc0', N'6e7a66e3-41df-470d-888c-a6291a59eb0c', NULL, NULL, NULL, NULL, N'URL:/CommonModule/UserPermission/UserPermissionIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cbfd9e56-11df-482f-b9f2-7eda6f24432d', N'7ef3c322-115e-423d-8aea-8bb420f3b4de', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7b87f094-077e-4a07-af87-3f92b0331f36', N'd94a6c4a-f93f-4bdb-890e-f3b6a106a35f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Dictionary/DictionaryIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e1b0c581-bf47-495f-98b6-e27482a24430', N'71e28a07-615d-4ad3-a094-5ebd31916392', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Log/LogList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'34cfea4d-9d36-4446-91e9-6d9409b2f5a1', N'03951c6d-4eb9-4d7e-9543-3aa95d7ff7ad', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Button/ButtonList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8344b720-8f14-4357-8f8f-543e4088ba7f', N'be29687f-bf5e-4330-a696-6e451a047f93', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Button/ButtonList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'859e0c60-b823-4a81-b84c-b19b2c8c18b5', N'04639133-50e7-463e-81a2-cca23751eab7', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6b65d907-b693-4149-83f9-c17367a97f99', N'c6007473-2b77-4aeb-a7a1-4946470d31ff', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'540d76d4-0a27-4c6a-9e08-a8f02baa08a7', N'd3709d9b-b245-4bda-9ac6-45e769744d2b', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b77a9050-8400-4fd0-8a2d-3cf479b0f974', N'a0ca01c3-2336-4ba7-9faa-223165055b16', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e585c22a-ae5e-42b3-a51e-e9363eaa5995', N'55193471-b44a-4ec5-9ac8-5ee986e850d1', NULL, NULL, NULL, NULL, N'URL:')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'80f70c00-17a1-4023-81c0-5932591ec5d1', N'64529956-2647-4313-9f39-c62d318950e2', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'62860e45-d905-43fc-87f2-a3e1c06d8518', N'6445429f-4981-4022-8d2d-e3d7ee9498da', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/Printpage/index.html')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7ba9d130-f945-474b-8d27-9bb6ef240f1a', N'f5053bcc-d235-46c1-aa47-37aa294f3aa3', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ac403d11-e8ac-44c3-8b4c-8faf6f1cc1ae', N'7d0273c9-2a82-4d92-b3ff-33765a2463eb', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e9fb33db-7487-42b5-8b30-f8ec2489aeae', N'f1cf2b56-fa7b-4713-b678-b641bcc69c9e', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/InterfaceManageList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6057cd33-9b1b-4da9-aa25-c13f738754cc', N'bbc37bc9-72b5-4dcc-af42-2e55a69a0bce', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
GO
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'428f1a1c-b01f-43ac-8ba9-3f1ad3f64d24', N'4d724813-54c8-490e-8c40-552919efd148', NULL, NULL, NULL, NULL, N'URL:/CommonModule/FlexibleForm/FlexibleFormIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'33c84bcc-bbd7-4b07-81ae-da33374740c9', N'11f9c919-a73d-4671-a8c0-52e40045e709', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3e760788-2c84-4223-979c-19f150d52cc4', N'e79409a3-869c-4663-80ad-26cc1c3afbbf', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'bd50845b-6f20-4122-81cd-952569c4e9b8', N'acb2d88f-fad6-471a-9c65-e9716ccfae4e', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'92f96179-d2ea-4ef2-86e8-70b81ddefc5f', N'9bbba87f-578a-4c42-bfda-987e715d0864', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/IAuthorizationList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'41509833-2ad0-44ca-b3bf-b8ff66af83de', N'79be5ab3-8e1d-4906-a61f-bb42e87b9011', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/IAuthorizationList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'02e85d57-6d40-4a87-8da2-8957b0ca96ea', N'd203d315-e678-45bb-868a-45c7d127a570', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4fc151ce-15e4-46f2-9ba2-b70a00a7f077', N'ff04a921-c48b-4571-a765-cc6c978400b5', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b1cc3f65-1267-4be4-a098-5ac8df17d4ec', N'f9127b79-47e7-4e6c-9758-bb3de1951210', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0b0d34c6-2de3-4e29-bdd6-5edfd973229a', N'56b97c16-c81f-4c6a-b480-6e14224b807d', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/News/NewsList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'54a03846-7666-41b7-a9b9-524eaef8e636', N'49c40e0c-348f-44a9-96e9-5e30e34b1e5e', NULL, NULL, NULL, NULL, N'URL:/CommonModule/FlexibleForm/FlexibleFormIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a04ac046-38b9-456c-ab45-13931e52893b', N'217c1940-a7f2-4abe-88f8-06e676aa3829', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'469d7dd9-274b-4f58-b158-8835047d8368', N'820a24a5-bf20-4528-97fe-e630824894cd', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ad26adea-13b5-4926-8592-67c9fe941240', N'c3884fb3-d6be-449d-956f-a18c69cc991c', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/Individuation.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'040170be-e4e6-4f67-b60f-3159a1e5ad20', N'978d4197-c8f8-4890-9d0b-3cbecea158cb', NULL, NULL, NULL, NULL, N'URL:/CommonModule/FlexibleForm/FlexibleFormIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5e6adff3-7111-4a7b-b8a1-ee9da3c220c2', N'3b77e3f7-8e84-4815-9165-4d646021bbed', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd917feba-3df2-45a7-9385-60547a6c3fb3', N'59123598-7cf0-4940-a66a-8f5b23d271cc', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c6fd667e-ceff-49bc-9817-0c03cd5b875c', N'da280751-f950-47a5-8f08-a4d3f2bba107', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/InterfaceManageList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'bc91c577-2df9-40d3-a3d1-62a02c5c7e33', N'70dab01f-4e75-4ee2-83c0-e04fa965b687', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/Printpage/index.html')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b58fdabd-535a-4239-a9fa-42640065d105', N'1ecdf7f1-6238-464e-b2e7-23876a1a18fc', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/Printpage/index.html')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1ad84c74-aebc-491e-a579-9b4ef32a9e7b', N'e7dfda70-1be0-46d3-a87a-5df8c1835164', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'87ae3c8e-6ebb-4b2b-9717-002a187c7c7c', N'1eb03960-8ec4-47ad-950c-d6a0ae3b7fe4', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/ConfigForm.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'65d84622-4039-4550-8609-fee9f2ca8a7d', N'6df4ac62-65dd-4429-bb60-39195ce83bae', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/SystemInfoList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'99e4c48f-6401-488e-9255-2b4fb5317bf0', N'b15086ff-a954-4c50-b046-299e9b244567', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/ConfigForm.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7ebb4135-f77b-4864-8d59-6339c20a964a', N'0bd97d8c-d721-436c-b421-7d19959225e5', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/Individuation.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e9f74df7-7144-41ac-85f0-d052f1c35e10', N'2cee74b7-850a-467d-b696-37991c328290', NULL, NULL, NULL, NULL, N'URL:/CommonModule/ExceptionLog/ExceptionIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'75633c86-dd6d-48a3-b25d-688d60bcf93d', N'8f59170e-5b71-459c-bb16-1dffcc7b0e4b', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/SystemInfoList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'03236147-8e09-43f8-8062-5b98d6739a06', N'f63980dc-2f5e-46e4-b861-b69e4d25947f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/Individuation.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4a4fc301-95a8-4198-a856-cffabe734d90', N'da11f37e-1e3d-4a3f-bfb1-3daa88ab4af6', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/SystemInfoList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6169c5eb-97ab-4dd2-8d83-d09b9e995ec2', N'cac6c82b-ad57-4f52-951a-c0c8bf898d2f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/ConfigForm.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c1d41584-fb6b-4ce0-973b-dcfe07b04026', N'5f80b897-93a8-4e08-97ed-ef037a19e7eb', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/SystemInfoList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a643eca5-dbdf-4247-b588-a84c53b09ff8', N'0d475463-533a-44a2-a104-8536bb09a3b8', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/SystemInfoList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd9edbfb2-9502-4191-b8b5-e53d50ab27c6', N'37793632-8d1b-4049-967a-0edd86bce06c', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/SystemInfoList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'032b1659-f028-4d32-8ac6-629e97e6c2f9', N'1fd61457-5d3d-4c4c-8242-c5bcafde728f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/Individuation.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cf76d9da-ad0b-4a78-be69-984d049baaf1', N'd0583ec7-54d0-452e-a346-84f1398e4aa9', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'392e0321-d6e1-4203-b492-34cf6b282795', N'67b4ae6e-73d8-427a-acc1-7850a1cc81a1', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'109d1ec1-aadb-4db3-a4b5-2ecca6bfb87f', N'ca433267-92e7-4468-be90-153d5c68932f', N'真实姓名', N'RealName', N'翟双焰', N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e6fd65e0-e307-4a63-a1d4-d0ad90e70913', N'ca433267-92e7-4468-be90-153d5c68932f', N'真实姓名拼音', N'Spell', N'ZSY,DSY', N'SCX', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a92a7e72-8844-4383-a784-8f43f289295a', N'ca433267-92e7-4468-be90-153d5c68932f', N'手机号码', N'Mobile', N'18769369446', N'18502107860', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'69d67d3c-2119-4cf4-a5a1-2dc79abad99c', N'ca433267-92e7-4468-be90-153d5c68932f', N'出生日期', N'Birthday', N'2013-10-28 0:00:00', N'2013-10-28 18:49:23', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9ab5a0ff-bc36-488a-a190-903aec60f454', N'ca433267-92e7-4468-be90-153d5c68932f', N'电子邮件', N'Email', N'1454904486@qq.com', N'812431372@qq.com', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'57a75abe-e7b0-443d-a465-78609c8fef89', N'ca433267-92e7-4468-be90-153d5c68932f', N'QQ号码', N'OICQ', N'1454904486', N'812431372', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2fa5c199-00af-4862-9ffe-c0dcbb40ea2f', N'ca433267-92e7-4468-be90-153d5c68932f', N'修改时间', N'ModifyDate', N'2015-11-10 14:26:46', N'2013-11-4 0:52:55', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'48bfc8ba-2f4a-40d5-b07b-70351b7caf70', N'57a279fe-8e05-4e81-b49f-b4a68f201b30', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'44e313a2-f716-4bd8-a274-599791398211', N'76195a9c-88b7-487c-9679-7ca01b724490', N'名称', N'FullName', N'江东设计集团', N'力软集团', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'804d6c2e-3b75-4f44-9846-1909e367d536', N'76195a9c-88b7-487c-9679-7ca01b724490', N'修改时间', N'ModifyDate', N'2015-11-10 14:28:26', N'2013-11-3 13:56:37', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8a5e9a02-6de1-49c2-af7a-c2ac7a102c5b', N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', N'组织机构主键', N'OrganizationId', NULL, N'ef5e8b48-5ef4-4e07-bd70-d5c1e6414b20', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'fa1ecd01-da57-41b0-82a1-29a860a03dfd', N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', N'父级主键', N'ParentId', NULL, N'05e85693-14b0-4582-8063-8fbde85371f0', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f40421a2-a419-464f-b113-7973afadafe3', N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', N'编号', N'Code', NULL, N'1000-02-01', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a508c6a4-b67d-4804-9157-ea6bb10aff98', N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', N'名称', N'FullName', NULL, N'北京分公司', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'532d2f36-2de9-4bef-a4f9-4ef7c4e90845', N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', N'分类', N'Category', NULL, N'公司', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3a553dc0-3a3d-44b1-99d2-16d7bb535c7c', N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'27d1ae41-3f81-4571-a6b5-018e9f583963', N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b7820e82-5b74-4dd3-b05c-b24a5ef52710', N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', N'排序吗', N'SortCode', NULL, N'34', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd9d7fdc5-1e54-4d07-9ba5-aa660403999d', N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0a855bbd-4852-4afc-9073-39dd63287558', N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', N'创建时间', N'CreateDate', NULL, N'2013-10-21 12:05:37', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c05e2a12-7d75-454c-83ed-01af2e5af47e', N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', N'修改时间', N'ModifyDate', NULL, N'2013-10-28 11:29:51', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f2118f5e-f911-45b8-8d3b-4c7d8c53cd09', N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', N'修改用户主键', N'ModifyUserId', NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c75353e0-3ca7-4f9f-b72f-336d8876ef71', N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', N'修改用户', N'ModifyUserName', NULL, N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'60eeecc4-5ccd-4904-b97a-afc3b9e500a6', N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', N'组织机构主键', N'OrganizationId', NULL, N'e572a3bd-8aba-4ddd-a794-a14303692df1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4e4d2a91-6abb-4d14-ac28-732bbaf56d34', N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', N'父级主键', N'ParentId', NULL, N'c62c6939-74dc-4f67-ac5b-5ab1c2b0d85b', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'35989ca2-96c7-492d-83d3-69ee6b25af34', N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', N'编号', N'Code', NULL, N'1000.01.02.02', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8507a61c-270e-4d06-a872-9cefd783e4ce', N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', N'名称', N'FullName', NULL, N'财务部', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'722be0ca-4cba-448c-be9e-695c2562b8d2', N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', N'分类', N'Category', NULL, N'部门', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9f7ad3a4-b6c1-42a5-91f4-27027d478f69', N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3d001a09-3b75-423e-8c13-f2bcb2213251', N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0c91b43c-8ada-4305-9dcd-5f3b4a45c9c9', N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', N'排序吗', N'SortCode', NULL, N'33', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ba8fbe76-9c4d-4629-b9a7-49052e47bc03', N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'02e8193a-86b7-4ca4-9d22-e76f07a6e516', N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', N'创建时间', N'CreateDate', NULL, N'2013-10-21 12:04:38', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8dbb332d-683f-465d-b9bf-30f52d827bbf', N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', N'修改时间', N'ModifyDate', NULL, N'2013-11-3 14:00:16', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2b97e2a4-81f4-4654-bbfa-f36f7cfa3c41', N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', N'修改用户主键', N'ModifyUserId', NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c4f4402a-ca35-418f-8c62-af1138a21005', N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', N'修改用户', N'ModifyUserName', NULL, N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'11fcff92-1505-4aad-99e7-5b446f923afc', N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', N'组织机构主键', N'OrganizationId', NULL, N'c62c6939-74dc-4f67-ac5b-5ab1c2b0d85b', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'32e5e8a5-924f-4fe2-938d-bbaa9023115e', N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', N'父级主键', N'ParentId', NULL, N'05e85693-14b0-4582-8063-8fbde85371f0', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'48d18a0f-c4e9-4f22-bb89-bb61510d5fd4', N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', N'编号', N'Code', NULL, N'1000.01.02', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'aef137c2-7458-48bd-9770-b582118eee5c', N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', N'名称', N'FullName', NULL, N'福建分公司', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6b045715-84cb-40c3-8af6-17a28fc23236', N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', N'分类', N'Category', NULL, N'公司', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'59e45e51-4749-40c0-af65-9e1be96ca77b', N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c0dd1935-d13c-44bb-81b2-65761b222149', N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9230653e-96c7-4023-a919-1b1f2f15456c', N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', N'排序吗', N'SortCode', NULL, N'31', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'04c9ca1c-9c4c-4eda-aabc-038f74355184', N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'04afa445-fc20-4804-a43c-5df695a70812', N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', N'创建时间', N'CreateDate', NULL, N'2013-10-21 11:54:51', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'78798388-d422-41f9-8e67-ea3d1b2fb415', N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', N'修改时间', N'ModifyDate', NULL, N'2013-11-3 13:58:45', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1ed89c2e-034a-4e7c-a113-883f010f05a4', N'3838474b-2a1e-4700-9e42-4cdd7db87175', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/ConfigForm.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2a7f0d25-5db4-4d5e-9b5e-045528d86f8e', N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', N'修改用户主键', N'ModifyUserId', NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2c4a1eb9-b7f0-4518-bf2e-32df289d3cca', N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', N'修改用户', N'ModifyUserName', NULL, N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'415d2840-d014-4623-bd4a-8b79b188260e', N'1602d285-9475-46b4-950b-d1367ec98342', N'名称', N'FullName', N'马鞍山分公司', N'上海分公司', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'13b67e93-9948-4c20-9b98-792e89a1b4ec', N'1602d285-9475-46b4-950b-d1367ec98342', N'修改时间', N'ModifyDate', N'2015-11-10 14:29:18', N'2013-11-27 14:59:32', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'53ae9fd6-cdc2-44cc-8b90-439a6a16fe53', N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', N'组织机构主键', N'OrganizationId', NULL, N'cd235612-a279-45df-aaa8-d25cbbbab87d', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'514b342b-32ef-43ca-af1c-31653646f7f5', N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', N'父级主键', N'ParentId', NULL, N'901659a9-e671-4b2f-b7fa-0d77144fb4c3', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e50ce18d-cad0-467f-884c-853f941d798f', N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', N'编号', N'Code', NULL, N'1000.01.01.09.03', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4e80960f-ace5-4d79-9689-76dbc4effebc', N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', N'名称', N'FullName', NULL, N'销售二组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'af3c76d8-ce69-4f57-b23b-5af9a2ae6bca', N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', N'分类', N'Category', NULL, N'工作组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'db55c4c1-ad33-4b01-9f34-a592dac33fab', N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'bce769af-31ca-4acc-82c2-7f64f5fbe50e', N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6a5406e5-2d87-4bc1-9135-3de21332d343', N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', N'排序吗', N'SortCode', NULL, N'30', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a1eb7e43-7616-414f-8d5d-a86befc20169', N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6a4c98a4-bd63-452f-8436-0dbee99ac6c3', N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', N'创建时间', N'CreateDate', NULL, N'2013-10-20 23:57:45', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5599f3ff-f228-490f-8a36-be40d4052089', N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', N'修改时间', N'ModifyDate', NULL, N'2013-11-3 13:58:30', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'11ba15a4-b304-4321-b744-2d7b7a67b43e', N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', N'修改用户主键', N'ModifyUserId', NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL)
GO
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c2395057-951e-46bb-bc8b-f361a9b8faa1', N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', N'修改用户', N'ModifyUserName', NULL, N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'133a8049-857a-4c32-a2e8-5d3177e449b5', N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', N'组织机构主键', N'OrganizationId', NULL, N'65a13460-75a1-4753-98f2-0d810f00bf43', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd806f02e-3efa-484e-ba5f-a977c1d9247c', N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', N'父级主键', N'ParentId', NULL, N'901659a9-e671-4b2f-b7fa-0d77144fb4c3', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'acc055c5-e80f-49ba-98a8-f50efb59173e', N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', N'编号', N'Code', NULL, N'1000.01.01.09.02', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'010f0d7f-cb3f-4299-ae66-27cb84bc10f5', N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', N'名称', N'FullName', NULL, N'销售一组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'60203b3d-80b2-4db5-a5f6-2f8355f1d594', N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', N'分类', N'Category', NULL, N'工作组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd886d268-a127-4494-be6f-2c009edb5a73', N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd428686e-c2c7-4a12-9e88-ada6b863cae5', N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b2916c77-c400-490c-b522-d50a35f96b37', N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', N'排序吗', N'SortCode', NULL, N'29', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f04a7000-229e-4b4a-ac1c-2743f7013c0b', N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b384e3c9-c7cc-4dfa-83f6-c89877df0796', N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', N'创建时间', N'CreateDate', NULL, N'2013-10-20 23:57:44', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9af9e495-f5bf-4af5-9c95-324cb26b58ca', N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', N'修改时间', N'ModifyDate', NULL, N'2013-11-3 13:58:24', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2b84dced-f73e-476f-89b5-f875506cf6ec', N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', N'修改用户主键', N'ModifyUserId', NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'63d41920-c8f8-4e54-8b99-ab21233b9a8b', N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', N'修改用户', N'ModifyUserName', NULL, N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'304a4efc-145c-460d-8e1a-8af3dcfde35c', N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', N'组织机构主键', N'OrganizationId', NULL, N'39764083-a0bd-4cd6-8ead-3ea689831ed3', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd5822922-7c1c-4ca3-aace-ca129e21f3c5', N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', N'父级主键', N'ParentId', NULL, N'901659a9-e671-4b2f-b7fa-0d77144fb4c3', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'68dea581-6de2-48d3-bfd8-dfd6fd951a7c', N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', N'编号', N'Code', NULL, N'1000.01.01.09.01', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3a772726-b879-4b36-b1d2-535dfbd5cbc9', N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', N'名称', N'FullName', NULL, N'大客户组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd5116e3c-2552-4b04-8c40-81bc168508d1', N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', N'分类', N'Category', NULL, N'工作组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'81290b07-aa31-4b5f-a57c-2660104d0140', N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'18227338-d2d4-4bbb-bec0-a94a5253ab3f', N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8c877653-5429-4aa7-acd9-f0fa971548d7', N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', N'排序吗', N'SortCode', NULL, N'28', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'fd1ff0e4-b92c-4432-886a-f9f697efdadc', N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'89cf83c1-b6fc-40b6-b2c8-4dd82e63028f', N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', N'创建时间', N'CreateDate', NULL, N'2013-10-20 23:57:39', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3ff3dd89-5acc-4f9e-9003-723c437fa104', N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', N'修改时间', N'ModifyDate', NULL, N'2013-11-3 13:58:16', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b0cab6e1-1db6-4760-9168-2759dca088df', N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', N'修改用户主键', N'ModifyUserId', NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0b480aed-a429-40f5-bfbd-5dcce1565391', N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', N'修改用户', N'ModifyUserName', NULL, N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'77b78653-74e0-4b4a-8528-7c77d3f3b01d', N'5a169740-78a7-4426-8063-a98f9ea9be46', N'组织机构主键', N'OrganizationId', NULL, N'901659a9-e671-4b2f-b7fa-0d77144fb4c3', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3d4289a9-595c-4171-9dca-af9ac87096e3', N'5a169740-78a7-4426-8063-a98f9ea9be46', N'父级主键', N'ParentId', NULL, N'31b05701-60ef-405c-87ba-af47049e3f48', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'45e6512b-c9d5-40b1-984f-a848dfec41fa', N'5a169740-78a7-4426-8063-a98f9ea9be46', N'编号', N'Code', NULL, N'1000.01.01.09', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c119767e-7513-4e64-87e9-cb48716655ad', N'5a169740-78a7-4426-8063-a98f9ea9be46', N'名称', N'FullName', NULL, N'销售部', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f395ff95-bc9a-4c7e-800f-7c8a490a4775', N'5a169740-78a7-4426-8063-a98f9ea9be46', N'分类', N'Category', NULL, N'部门', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'995cca7a-301d-4069-9956-7a1af726a8fe', N'5a169740-78a7-4426-8063-a98f9ea9be46', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0b003474-40fd-4a9f-b301-0a57df8c5717', N'5a169740-78a7-4426-8063-a98f9ea9be46', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'25d453f6-8371-41bb-8e20-554f7622d6a0', N'5a169740-78a7-4426-8063-a98f9ea9be46', N'排序吗', N'SortCode', NULL, N'27', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'095b8803-fe89-4481-9e5f-f7b42beab291', N'5a169740-78a7-4426-8063-a98f9ea9be46', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1e2f3612-8c64-4536-97c8-764ed783c430', N'5a169740-78a7-4426-8063-a98f9ea9be46', N'创建时间', N'CreateDate', NULL, N'2013-10-20 23:57:34', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f6de7102-520c-480e-bead-ab1a92d167a1', N'5a169740-78a7-4426-8063-a98f9ea9be46', N'修改时间', N'ModifyDate', NULL, N'2013-11-3 13:57:30', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6b3a722a-5329-476d-a139-bf75961334f2', N'5a169740-78a7-4426-8063-a98f9ea9be46', N'修改用户主键', N'ModifyUserId', NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'92dce619-40aa-4022-8cc2-b2f785a9daa6', N'5a169740-78a7-4426-8063-a98f9ea9be46', N'修改用户', N'ModifyUserName', NULL, N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd5cbd110-2da1-47ac-a251-251eb2de9d77', N'9e4dbc1a-dd27-4ee0-965f-e18a47bc4226', N'组织机构主键', N'OrganizationId', NULL, N'2c5d2b38-2300-411d-979f-b65eb25846aa', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'977f6137-f59f-403d-a795-11c4721ea178', N'9e4dbc1a-dd27-4ee0-965f-e18a47bc4226', N'父级主键', N'ParentId', NULL, N'00fdb9af-2f93-476a-8172-d987873f6697', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a621321b-e176-480d-b247-c6a59ca537d0', N'9e4dbc1a-dd27-4ee0-965f-e18a47bc4226', N'编号', N'Code', NULL, N'1000.01.01.10.03', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'252cbbdf-45da-49e1-a515-ff5b6a1f616b', N'9e4dbc1a-dd27-4ee0-965f-e18a47bc4226', N'名称', N'FullName', NULL, N'检验组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8f33474c-b4e4-47aa-8a7a-9335928437b9', N'9e4dbc1a-dd27-4ee0-965f-e18a47bc4226', N'分类', N'Category', NULL, N'工作组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'61d8ac6c-57ce-4ed4-8bcd-a62c445fec77', N'9e4dbc1a-dd27-4ee0-965f-e18a47bc4226', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c3dfb1f5-6b59-4b95-a849-cfa5afabf73e', N'9e4dbc1a-dd27-4ee0-965f-e18a47bc4226', N'排序吗', N'SortCode', NULL, N'26', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'88bb41c2-98be-4b60-9dd9-b4b7cc43db32', N'9e4dbc1a-dd27-4ee0-965f-e18a47bc4226', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c0994c70-c8e4-4c16-a482-345d893bcdec', N'9e4dbc1a-dd27-4ee0-965f-e18a47bc4226', N'创建时间', N'CreateDate', NULL, N'2013-10-20 23:56:14', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'64b9488c-0355-4746-a7fd-68032ac23659', N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', N'组织机构主键', N'OrganizationId', NULL, N'75cdb572-da20-4e52-b727-be7c65ec4c72', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c26c8560-9bf8-469b-828a-b422345af570', N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', N'父级主键', N'ParentId', NULL, N'00fdb9af-2f93-476a-8172-d987873f6697', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'28ae5664-9619-4787-b8ee-edefbe88140b', N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', N'编号', N'Code', NULL, N'1000.01.01.08.02', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'58edbd3b-26d5-418f-b67e-121ba0db5a07', N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', N'名称', N'FullName', NULL, N'作业组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'780b238f-80b6-42b6-a1b5-9376cb02cbef', N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', N'分类', N'Category', NULL, N'工作组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f5c12ffb-9292-4e1e-82fd-ee7d8980f6d3', N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f9ba154a-fc2b-48ca-ab00-502049a1b301', N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6fe31f55-4458-4a1f-a80e-a1fe11f29669', N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', N'排序吗', N'SortCode', NULL, N'17', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'538c4590-71c8-4bcd-86d0-f77b568f06a6', N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3207fb10-12ae-4d8d-b630-3b8656b45309', N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', N'创建时间', N'CreateDate', NULL, N'2013-10-20 23:55:17', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'32acc139-8970-45be-968e-5772d86998b9', N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', N'修改时间', N'ModifyDate', NULL, N'2013-11-3 13:57:55', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7ba6a189-e95d-40c0-be55-85b5b195ca83', N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', N'修改用户主键', N'ModifyUserId', NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ff731128-0686-41ad-8ce7-90677c0ff983', N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', N'修改用户', N'ModifyUserName', NULL, N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'54508f2c-fe2d-465f-a01f-e03b21fab482', N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', N'组织机构主键', N'OrganizationId', NULL, N'4ec5c981-9f75-48c3-8217-03eb68db11b8', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6caf9d76-5089-499b-b702-a8ca4445c051', N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', N'父级主键', N'ParentId', NULL, N'00fdb9af-2f93-476a-8172-d987873f6697', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd43dee97-138d-41fa-a852-04505730038b', N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', N'编号', N'Code', NULL, N'1000.01.01.08.01', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8b9a8b60-36e9-4884-8e8b-2e9bbc32e663', N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', N'名称', N'FullName', NULL, N'仓库组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e5eb31e7-4c08-4dde-8811-a606a8fec16a', N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', N'分类', N'Category', NULL, N'工作组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c8a554d8-bc03-42c2-bf7c-4c0ab96ba428', N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'95ceb013-81ae-4782-8482-6d11ad9e4781', N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c69048b0-69b0-4363-bf28-714ccf4107ca', N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', N'排序吗', N'SortCode', NULL, N'16', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1c40b341-f7ba-4dcb-8d48-fea31690841d', N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd14ce2c7-2e35-41e8-8f2a-033a5652b719', N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', N'创建时间', N'CreateDate', NULL, N'2013-10-20 23:55:16', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f1d86ddc-c90a-46d7-817c-34655ee619c6', N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', N'修改时间', N'ModifyDate', NULL, N'2013-11-3 13:57:44', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'81242c14-8be3-4791-a86c-f4f3d14e2287', N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', N'修改用户主键', N'ModifyUserId', NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7d3c5e66-9387-4f75-81b4-c6ec4a9939fa', N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', N'修改用户', N'ModifyUserName', NULL, N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6c8f0538-2981-4593-afb9-05004be7ceef', N'7277259a-7ccd-4abb-85e0-7b445b68f032', N'组织机构主键', N'OrganizationId', NULL, N'00fdb9af-2f93-476a-8172-d987873f6697', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ff3aab92-ae73-436e-a54f-38d542d3e6fd', N'7277259a-7ccd-4abb-85e0-7b445b68f032', N'父级主键', N'ParentId', NULL, N'31b05701-60ef-405c-87ba-af47049e3f48', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'068739fb-cd8e-4df2-962d-a94ab62577e7', N'7277259a-7ccd-4abb-85e0-7b445b68f032', N'编号', N'Code', NULL, N'1000.01.01.08', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'60d618c6-776b-4185-acad-c3dd5377c9d0', N'7277259a-7ccd-4abb-85e0-7b445b68f032', N'名称', N'FullName', NULL, N'生产部', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'28450b8d-5e85-4062-bcc0-5ee18e160c94', N'7277259a-7ccd-4abb-85e0-7b445b68f032', N'分类', N'Category', NULL, N'部门', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c464fb47-ce67-41ee-b574-68dc5adaffbd', N'7277259a-7ccd-4abb-85e0-7b445b68f032', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'851faac5-2f33-4a59-b4f3-6eaad590d5ed', N'7277259a-7ccd-4abb-85e0-7b445b68f032', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'fb202df6-78b7-4430-a87e-aa2b749150fa', N'7277259a-7ccd-4abb-85e0-7b445b68f032', N'排序吗', N'SortCode', NULL, N'18', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'85682068-3b7b-4696-a844-ea78ce3e73a4', N'7277259a-7ccd-4abb-85e0-7b445b68f032', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd862d4f2-7f76-458b-b9cf-365d0602d2e0', N'7277259a-7ccd-4abb-85e0-7b445b68f032', N'创建时间', N'CreateDate', NULL, N'2013-10-20 22:53:07', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2510e7bc-fd16-4e0f-8ab9-1852b31a72af', N'7277259a-7ccd-4abb-85e0-7b445b68f032', N'修改时间', N'ModifyDate', NULL, N'2013-11-3 13:57:13', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c502332d-b31c-4043-a953-0659fb7e4845', N'7277259a-7ccd-4abb-85e0-7b445b68f032', N'修改用户主键', N'ModifyUserId', NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a4985a7b-be6f-4b68-a7d0-44327ef544fa', N'7277259a-7ccd-4abb-85e0-7b445b68f032', N'修改用户', N'ModifyUserName', NULL, N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'23ca5146-ac9f-442e-af22-0cdf4d829dda', N'fc6eb56e-9087-40f1-a573-71947efd04f6', N'组织机构主键', N'OrganizationId', NULL, N'd8f15b36-9aef-4fac-9115-693017ae0b19', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1c533f6b-537b-4c4e-a041-27a71a653618', N'fc6eb56e-9087-40f1-a573-71947efd04f6', N'父级主键', N'ParentId', NULL, N'31b05701-60ef-405c-87ba-af47049e3f48', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'418e2a5d-902b-4cab-acf5-e6b7f66e8a20', N'fc6eb56e-9087-40f1-a573-71947efd04f6', N'编号', N'Code', NULL, N'1000.01.01.07', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd18776fc-dabc-4b90-bb3c-dad9d6d484e9', N'fc6eb56e-9087-40f1-a573-71947efd04f6', N'名称', N'FullName', NULL, N'采购部', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'41d0d965-b9d9-4bf7-b93d-de8d81bb96b0', N'fc6eb56e-9087-40f1-a573-71947efd04f6', N'分类', N'Category', NULL, N'部门', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1c894fdd-fcfc-46ad-94cc-7247f5b5bdf0', N'fc6eb56e-9087-40f1-a573-71947efd04f6', N'地址', N'Address', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6b28a6d6-d6d8-43f4-840c-8518f0bcf6e6', N'fc6eb56e-9087-40f1-a573-71947efd04f6', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cce8f8f6-cfda-4f1e-9a67-9fe3106da06c', N'fc6eb56e-9087-40f1-a573-71947efd04f6', N'排序吗', N'SortCode', NULL, N'15', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6a6675d1-6f1b-4f63-a3f9-7176bd236463', N'fc6eb56e-9087-40f1-a573-71947efd04f6', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'65b2db0e-3a66-48df-919b-064006b77257', N'fc6eb56e-9087-40f1-a573-71947efd04f6', N'创建时间', N'CreateDate', NULL, N'2013-10-20 22:46:32', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cdff37a3-9a32-4358-852f-861caf85fa96', N'1c8d5a89-2860-4b54-b657-aca7a3aa9470', N'组织机构主键', N'OrganizationId', NULL, N'b5221eb2-6b28-4104-b327-845d0021172b', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5ad8ce02-1a38-4c1f-b402-2ba841d53de2', N'1c8d5a89-2860-4b54-b657-aca7a3aa9470', N'父级主键', N'ParentId', NULL, N'ce65969e-0fa6-4697-acbc-d5bdc417fe99', NULL)
GO
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4bfdabce-af84-401f-8778-aad90cdd4796', N'1c8d5a89-2860-4b54-b657-aca7a3aa9470', N'编号', N'Code', NULL, N'1000.01.01.06.07', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd6aa6c5a-d01c-480c-9bee-9942d83c7ac7', N'1c8d5a89-2860-4b54-b657-aca7a3aa9470', N'名称', N'FullName', NULL, N'技术工程组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'010ae22d-bda5-4064-9181-a6a8a4bce0fb', N'1c8d5a89-2860-4b54-b657-aca7a3aa9470', N'分类', N'Category', NULL, N'工作组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'afa77818-5148-488b-9883-1576989f1d55', N'1c8d5a89-2860-4b54-b657-aca7a3aa9470', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7d6f6112-ab55-4a3f-88c3-9ce2ce4139d3', N'1c8d5a89-2860-4b54-b657-aca7a3aa9470', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'79e23bde-51e0-4dae-ba0c-495d0d7285a4', N'1c8d5a89-2860-4b54-b657-aca7a3aa9470', N'排序吗', N'SortCode', NULL, N'25', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9a392c78-85f5-4515-b62d-0d5cc49b9274', N'1c8d5a89-2860-4b54-b657-aca7a3aa9470', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'54b99c29-f6a4-48d3-98ad-a84a12765f28', N'1c8d5a89-2860-4b54-b657-aca7a3aa9470', N'创建时间', N'CreateDate', NULL, N'2013-10-20 22:57:00', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cdd4fe15-68da-4812-8d1f-fc705db13a84', N'1c8d5a89-2860-4b54-b657-aca7a3aa9470', N'修改时间', N'ModifyDate', NULL, N'2013-10-22 23:59:39', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9a2cc4b8-5e81-41fa-8550-d21e278fa88e', N'd888b3d4-3f2c-42c0-a78b-82aabb8c102a', N'组织机构主键', N'OrganizationId', NULL, N'd3f96507-1bda-4127-bda1-ca60c7f4ce72', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'20030311-917d-4991-9b0b-a62635edbf06', N'd888b3d4-3f2c-42c0-a78b-82aabb8c102a', N'父级主键', N'ParentId', NULL, N'ce65969e-0fa6-4697-acbc-d5bdc417fe99', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c088acd2-344d-4904-aff0-0de77964d6e2', N'd888b3d4-3f2c-42c0-a78b-82aabb8c102a', N'编号', N'Code', NULL, N'1000.01.01.06.06', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'bcd37f6a-da54-40e3-b2e6-b261add8ebc5', N'd888b3d4-3f2c-42c0-a78b-82aabb8c102a', N'名称', N'FullName', NULL, N'技术测试组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'bbcbf600-e1f7-4e3c-9cfd-a63bf7d3cc1e', N'd888b3d4-3f2c-42c0-a78b-82aabb8c102a', N'分类', N'Category', NULL, N'工作组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd12273ea-8454-4dd1-aa60-333fe47ef3b3', N'd888b3d4-3f2c-42c0-a78b-82aabb8c102a', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5871257d-4e51-4417-91ff-8262c99a2afa', N'd888b3d4-3f2c-42c0-a78b-82aabb8c102a', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'fdfe06bd-abe1-4c43-8153-6414fe905678', N'd888b3d4-3f2c-42c0-a78b-82aabb8c102a', N'排序吗', N'SortCode', NULL, N'24', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ef0ac98b-ae35-4e69-8f59-2c3c73de41a4', N'd888b3d4-3f2c-42c0-a78b-82aabb8c102a', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5f28926a-e196-4d42-ac30-e5d8860a03b4', N'd888b3d4-3f2c-42c0-a78b-82aabb8c102a', N'创建时间', N'CreateDate', NULL, N'2013-10-20 22:56:45', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6682bdff-9f4f-4cbe-b4a9-1335f4b38195', N'd888b3d4-3f2c-42c0-a78b-82aabb8c102a', N'修改时间', N'ModifyDate', NULL, N'2013-10-22 23:59:33', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3ab7b5bf-6fdd-44d7-9629-7fcc913154c5', N'2164fc8a-8e45-4323-85fe-61780f525c22', N'组织机构主键', N'OrganizationId', NULL, N'99e0d915-a686-4922-9edd-c8f0ed6e79e9', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e86bb446-d881-4cfc-8803-db3489d72020', N'2164fc8a-8e45-4323-85fe-61780f525c22', N'父级主键', N'ParentId', NULL, N'ce65969e-0fa6-4697-acbc-d5bdc417fe99', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a1691638-8b8c-4c08-b349-73c2f5012efc', N'2164fc8a-8e45-4323-85fe-61780f525c22', N'编号', N'Code', NULL, N'1000.01.01.06.05', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'273b4b8a-75eb-45dc-b7af-df1d66d2f484', N'2164fc8a-8e45-4323-85fe-61780f525c22', N'名称', N'FullName', NULL, N'技术研发组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9263350c-8201-47be-bede-373bcd32b883', N'2164fc8a-8e45-4323-85fe-61780f525c22', N'分类', N'Category', NULL, N'工作组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6e3ce1c0-d1d6-49f0-89f2-7970223a2d7f', N'2164fc8a-8e45-4323-85fe-61780f525c22', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3e97e637-d1fa-4f0f-977a-629d32a37145', N'2164fc8a-8e45-4323-85fe-61780f525c22', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'02336503-7249-4f69-8ce5-58bc2a195371', N'2164fc8a-8e45-4323-85fe-61780f525c22', N'排序吗', N'SortCode', NULL, N'23', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a85e26e8-8b44-4820-a139-b40a0be23d37', N'2164fc8a-8e45-4323-85fe-61780f525c22', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f06807e0-0748-4e5e-8084-f9a9576f6f90', N'2164fc8a-8e45-4323-85fe-61780f525c22', N'创建时间', N'CreateDate', NULL, N'2013-10-20 22:55:02', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a6339de5-08ed-4689-bdc7-e84e0bf9535c', N'2164fc8a-8e45-4323-85fe-61780f525c22', N'修改时间', N'ModifyDate', NULL, N'2013-10-22 23:59:27', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b03e4a74-6de6-4038-a172-da2920543908', N'b928bc83-4368-4008-9f14-d0a0b634195c', N'组织机构主键', N'OrganizationId', NULL, N'f32d187b-31fe-404e-b4ba-1a5a577d896f', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c7a798b1-a844-4719-9224-26b43e0d5573', N'b928bc83-4368-4008-9f14-d0a0b634195c', N'父级主键', N'ParentId', NULL, N'ce65969e-0fa6-4697-acbc-d5bdc417fe99', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0afdf678-0d14-4400-a868-e8817191cfde', N'b928bc83-4368-4008-9f14-d0a0b634195c', N'编号', N'Code', NULL, N'1000.01.01.06.04', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2c06ef7f-0c7e-440f-9f63-2546109c2df4', N'b928bc83-4368-4008-9f14-d0a0b634195c', N'名称', N'FullName', NULL, N'软件四组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd00882c2-0670-4d22-b676-0e1a1bd8a900', N'b928bc83-4368-4008-9f14-d0a0b634195c', N'分类', N'Category', NULL, N'工作组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c8cf8020-955b-48cf-aae5-32681c649e4b', N'b928bc83-4368-4008-9f14-d0a0b634195c', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b4f2e95e-cc8a-461e-b0bf-98aa28803913', N'b928bc83-4368-4008-9f14-d0a0b634195c', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'114adaa0-c7f7-4f85-a8fb-9d9df09e8cd2', N'b928bc83-4368-4008-9f14-d0a0b634195c', N'排序吗', N'SortCode', NULL, N'22', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'64fe998e-928a-4c74-9a66-b4501443310e', N'b928bc83-4368-4008-9f14-d0a0b634195c', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4f2af308-e0c7-4e37-b604-100bf160da43', N'b928bc83-4368-4008-9f14-d0a0b634195c', N'创建时间', N'CreateDate', NULL, N'2013-10-20 22:54:41', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'edbb1f05-7e47-410b-9885-2dea4e23f194', N'b928bc83-4368-4008-9f14-d0a0b634195c', N'修改时间', N'ModifyDate', NULL, N'2013-10-22 23:59:18', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7c4a4aa2-bcf6-4809-b7a4-8d953b22b175', N'8633629b-6fa7-409f-97fc-4bf55aaead0a', N'组织机构主键', N'OrganizationId', NULL, N'28a1477b-9d4b-46c6-95fb-c56f1f160b9d', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1928fcb5-1c57-446c-8464-492138fac82f', N'8633629b-6fa7-409f-97fc-4bf55aaead0a', N'父级主键', N'ParentId', NULL, N'ce65969e-0fa6-4697-acbc-d5bdc417fe99', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'04b0dab5-fb1c-4e77-a98a-2fc9769e4c98', N'8633629b-6fa7-409f-97fc-4bf55aaead0a', N'编号', N'Code', NULL, N'1000.01.01.06.03', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6f1250f0-59ec-4bc4-9287-082c746a3cfd', N'8633629b-6fa7-409f-97fc-4bf55aaead0a', N'名称', N'FullName', NULL, N'软件三组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cea745ca-393c-4f0a-97cb-6d2092a50930', N'8633629b-6fa7-409f-97fc-4bf55aaead0a', N'分类', N'Category', NULL, N'工作组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c73365d0-9773-491b-b894-bb54ad8cd520', N'8633629b-6fa7-409f-97fc-4bf55aaead0a', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'577ee37a-3470-4c14-8f21-b4a0c7c5123f', N'8633629b-6fa7-409f-97fc-4bf55aaead0a', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7ea05310-86c5-49d4-9ee7-cd1c557f7d5d', N'8633629b-6fa7-409f-97fc-4bf55aaead0a', N'排序吗', N'SortCode', NULL, N'21', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'16e529c7-1763-4d12-a899-da1f9892b757', N'8633629b-6fa7-409f-97fc-4bf55aaead0a', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'07ba1e06-5ad8-4d92-95d3-11153acb1aea', N'8633629b-6fa7-409f-97fc-4bf55aaead0a', N'创建时间', N'CreateDate', NULL, N'2013-10-20 22:54:36', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'54b46864-7cb9-4d1f-9bcd-df45b93e03cd', N'8633629b-6fa7-409f-97fc-4bf55aaead0a', N'修改时间', N'ModifyDate', NULL, N'2013-10-22 23:59:10', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'bc2e09f3-4812-4d4d-892a-0aaa46adea60', N'94fa8d2c-0ecd-4a5d-b429-b908816fd729', N'组织机构主键', N'OrganizationId', NULL, N'75789b3b-acbd-4dba-a70f-d16d7d12c634', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8565ce57-55ad-4242-b30f-a7e88ba69bbc', N'94fa8d2c-0ecd-4a5d-b429-b908816fd729', N'父级主键', N'ParentId', NULL, N'ce65969e-0fa6-4697-acbc-d5bdc417fe99', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'dfef7747-91a2-4997-ad0f-69bb00cf62ea', N'94fa8d2c-0ecd-4a5d-b429-b908816fd729', N'编号', N'Code', NULL, N'1000.01.01.06.02', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e877dab9-61a0-4bb5-b585-a5c96996b7df', N'94fa8d2c-0ecd-4a5d-b429-b908816fd729', N'名称', N'FullName', NULL, N'软件二组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'09e19acd-0b70-4f94-a2b1-c5aeaf14c22e', N'94fa8d2c-0ecd-4a5d-b429-b908816fd729', N'分类', N'Category', NULL, N'工作组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c41b7063-aa46-4732-a639-5b0a717ae7e2', N'94fa8d2c-0ecd-4a5d-b429-b908816fd729', N'内部组织', N'IsInnerOrganize', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c369ad85-ae1d-4da3-a65a-2ccd21e62ec2', N'94fa8d2c-0ecd-4a5d-b429-b908816fd729', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e4d43916-5e25-4a38-83f3-50599544d87a', N'94fa8d2c-0ecd-4a5d-b429-b908816fd729', N'排序吗', N'SortCode', NULL, N'20', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'740ef06f-b998-4881-b9ab-ad570e17b9a1', N'94fa8d2c-0ecd-4a5d-b429-b908816fd729', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'08cce8c7-a985-41b7-b5f7-d98e9b9ac1e1', N'94fa8d2c-0ecd-4a5d-b429-b908816fd729', N'创建时间', N'CreateDate', NULL, N'2013-10-20 22:54:32', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'03371f54-2dc4-4015-be81-7e4997bba02e', N'94fa8d2c-0ecd-4a5d-b429-b908816fd729', N'修改时间', N'ModifyDate', NULL, N'2013-10-22 23:59:02', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5b02b1f4-f29d-4cbb-b038-6066f15e9132', N'a12566d0-191d-4d00-8208-9e556a16b285', N'名称', N'FullName', N'技术研发组', N'软件一组', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'47bfb9ec-2f6c-4004-bcd3-3297b100cc8c', N'4888bef8-c200-40f0-accb-2649909ade7a', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/POOrder/POOrderForm.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4b4ba5c2-81d3-4f0b-9559-ce77adad46af', N'e3f8d9e9-ba1b-43dc-9c6b-f6dba73899fb', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/POOrder/POOrderForm.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'88aa5a08-e2f2-4443-8c06-9ffd8988cc96', N'8213b086-efb2-4e09-b51d-dc2a311df45a', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6de88cd3-c2f5-4cc8-ad42-0c04e35aa3fd', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'菜单主键', N'MenuId', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'63e353bc-28e2-44cc-a175-643c34fdc708', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'父级主键', N'ParentId', N'1ff6d07d-3d17-4ae2-8ce2-8a70f240048c', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd6650583-966b-4398-96da-53a598b03b74', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'编号', N'Code', N'1000-05-02', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b1a7d57c-5be3-4b55-b37b-d20fe6b3d4ae', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'名称', N'FullName', N'新闻发布', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd8603177-06a3-4e2d-93d1-12b80e23f038', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'描述', N'Description', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b6d8b84f-0f29-474a-b69d-bd2340e0e0a6', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'图标', N'Img', N'newspaper_go.png', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'fa6c8330-ae85-4d4f-b32d-cdff2b138288', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'导航地址', N'NavigateUrl', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'64563d07-9935-48af-8ea0-2a88490dab6f', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'窗体名', N'FormName', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1f9d7fc4-5f24-4b08-b3cb-775e91f08b0a', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'目标', N'Target', N'Click', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3e8d4c7b-a975-4656-9126-f6b52b297abe', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'是否展开', N'IsUnfold', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'90558bd0-b648-4404-8fbe-b197b8173250', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'允许编辑', N'AllowEdit', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7d35fe84-32fa-4673-86f7-8560c3636c79', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'允许删除', N'AllowDelete', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b421fe93-34eb-4dde-93ac-bb8f01c8d726', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'有效：1-有效，0-无效', N'Enabled', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cc830e86-4e0b-448d-a569-0ad7ca157ca4', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'排序吗', N'SortCode', N'43', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'718cd19b-5e92-49fb-b58c-2faff04aee21', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'创建用户主键', N'CreateUserId', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'50333275-51d9-4314-b5c9-ef79e468247d', N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', N'创建用户', N'CreateUserName', N'佘赐雄', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1fffa51f-2f76-497d-aa58-79a5311e54e3', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'菜单主键', N'MenuId', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3b32f3f6-0a98-4d84-b640-5cd0ec39aa53', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'父级主键', N'ParentId', N'1ff6d07d-3d17-4ae2-8ce2-8a70f240048c', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'04d79ee1-f661-4636-bbd1-d1c9e9bd5c99', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'编号', N'Code', N'1000-05-03', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'33da880e-ebbb-4d00-ba40-67fa01fed7c1', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'名称', N'FullName', N'附件上传', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cb7349d7-6997-455d-802b-5e7eeaa05f32', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'描述', N'Description', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'28c2c87e-a7f3-4705-b65b-18ac69e4c8cd', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'图标', N'Img', N'7.png', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a5e6da95-dcde-45c2-8eed-2432f70de0d1', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'导航地址', N'NavigateUrl', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'31a968cb-e20b-4a95-a79c-92aef727f1fd', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'窗体名', N'FormName', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'705c26d2-375a-4d29-9ae4-60eadc312060', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'目标', N'Target', N'Click', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9ada58bb-da51-4e26-8898-f000be85c4be', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'是否展开', N'IsUnfold', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd30721df-d2c7-4f30-966f-90d98d354952', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'允许编辑', N'AllowEdit', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c78481a3-79b0-42df-aad6-99b439c0441b', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'允许删除', N'AllowDelete', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'880d0ed0-fef9-400d-8977-930630f148c0', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'有效：1-有效，0-无效', N'Enabled', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8a78f527-0a41-424e-8e35-3bbb70eefb79', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'排序吗', N'SortCode', N'44', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'776a45ae-1223-4b95-8608-c082383c27bf', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'创建用户主键', N'CreateUserId', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6cd0d552-0843-4370-8d76-a1f00cdc4b53', N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', N'创建用户', N'CreateUserName', N'佘赐雄', NULL, NULL)
GO
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'16c75df3-406d-4417-94f6-12336aa52977', N'9749a125-050f-4d38-8609-915d42e9eb21', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'33bce622-13ee-4951-981f-9928bfbb0730', N'61d52ce5-1a91-4041-b385-007013999c3d', N'图标', N'Img', N'20131124051527138.png', N'7.png', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c85ffed8-b110-48cd-9b5d-bede28cbd963', N'73f95dd1-1bca-47d6-8ff0-b0017f5df5a6', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c8b3b34c-bb58-4c79-864f-d0c4da4fb9e2', N'7aa14ee0-a241-4256-8484-1b3708863cfc', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9304ccef-cd6f-48ba-a42d-b8098e80a56e', N'616cb3e3-c3ab-4fb6-9718-3b7ce135cc8d', N'图标', N'Img', N'drive_go.png', N'20131124051527138.png', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'303f93e9-7718-42a1-a928-222806036118', N'616cb3e3-c3ab-4fb6-9718-3b7ce135cc8d', N'修改时间', N'ModifyDate', N'2013/11/24 17:16:18', N'2013/11/24 17:14:58', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7f661913-ec3c-4e09-98c7-4cd4ac4fa1c9', N'5c58e0d2-e899-487e-944d-fabcd29ecf99', NULL, NULL, NULL, NULL, N'URL:')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0c8ca9db-cb8e-4b7e-91a3-62b0924b8b35', N'82829a93-fe15-4868-9af8-ff3bd42b7b6a', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c488de10-afe0-488c-a381-1cb7ad97d2d6', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'菜单主键', N'MenuId', N'ff01d1e1-6a9e-4183-aee7-6708d76375d1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'56affbab-5315-4e33-a22f-658d28e8ba5b', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'父级主键', N'ParentId', N'1ff6d07d-3d17-4ae2-8ce2-8a70f240048c', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1335b6ca-4155-4251-98d9-9724d87c4fde', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'编号', N'Code', N'1000-05-04', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'42e96a0c-6466-463f-aa88-8f3b2b1ff20e', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'名称', N'FullName', N'打印单据', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd5bb4374-240a-413f-b549-4cdff41fcd02', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'描述', N'Description', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'880c673c-59b5-4496-bc05-1ee7fe8a2a2b', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'图标', N'Img', N'print.png', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ac842cad-be4f-4f44-8628-602208b30ad2', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'导航地址', N'NavigateUrl', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c688ed08-50ac-4df0-b449-0dcf84dba96d', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'窗体名', N'FormName', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6e737049-3c04-44a9-b5ed-cb4e146b5670', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'目标', N'Target', N'Click', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'129642b9-946f-467a-818e-88e01be546ab', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'是否展开', N'IsUnfold', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4c7e4939-9b34-4166-8dfa-07c4d3edcf78', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'允许编辑', N'AllowEdit', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cc31698d-5169-4df3-95fc-aebd6a3627bc', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'允许删除', N'AllowDelete', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'89870a98-0731-4ef4-a5c9-b0ffd7d88341', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'有效：1-有效，0-无效', N'Enabled', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'283487f1-a723-4fbb-b113-94cc3e5635be', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'排序吗', N'SortCode', N'45', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5ada05d6-79cf-4bd5-af0c-cb3eeae479ba', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'创建用户主键', N'CreateUserId', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'eb687090-60e9-403c-8c8e-c574668062bb', N'046b7e4f-b50b-495c-9806-a977c8d377a2', N'创建用户', N'CreateUserName', N'佘赐雄', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'52bb0674-6fe8-4efd-b5fc-bea86ca5735d', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'菜单主键', N'MenuId', N'd2cd2ce1-294a-47e3-bfc8-c201f7b8c55e', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'930e1b79-0362-4add-be55-8cbf5c95a6aa', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'父级主键', N'ParentId', N'1ff6d07d-3d17-4ae2-8ce2-8a70f240048c', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c4f29dc4-ee8c-4012-87e3-062307c8635d', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'编号', N'Code', N'1000-05-05', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'975117fc-e06b-44c3-ae1e-db279b907a57', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'名称', N'FullName', N'百万数据测试', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'61ad05ca-a63d-406d-8340-6a068647aab5', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'描述', N'Description', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b52a7730-2d95-4178-a6e3-82ae10bee070', N'a12566d0-191d-4d00-8208-9e556a16b285', N'修改时间', N'ModifyDate', N'2015-11-10 14:31:28', N'2013-10-22 23:58:55', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8c005297-05e8-4f17-a259-12b6e16d2e8e', N'1ce78c9d-3959-47e3-bec1-93a61e91d00c', N'名称', N'FullName', N'综合部', N'行政部', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5c7aaa6b-87af-4e48-bccc-651bb28b76a7', N'c9af31f7-80d1-4810-8cd1-0f525da322cb', N'名称', N'FullName', N'总经理', N'总裁办公室', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3dc78a60-8c78-4760-97d2-e16a2d48e8a0', N'c9af31f7-80d1-4810-8cd1-0f525da322cb', N'修改时间', N'ModifyDate', N'2015-11-10 14:33:01', N'2013-10-28 11:28:40', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'81e714c5-0f20-4a87-a30d-ff6332757f1c', N'475c3481-fdf7-4f68-9443-315c262f1880', N'组织机构主键', N'OrganizationId', N'c649bbd2-6c20-445b-ad20-82c3e25b6133', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'54e5b8f2-ee93-4c06-ba92-b2f0454a279d', N'475c3481-fdf7-4f68-9443-315c262f1880', N'父级主键', N'ParentId', N'31b05701-60ef-405c-87ba-af47049e3f48', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4fd083cb-4b60-4ba2-a2d6-a421205f840e', N'475c3481-fdf7-4f68-9443-315c262f1880', N'编号', N'Code', N'1000.01.01.07', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a0f8db05-fdb6-4bf1-a929-787b245966fe', N'475c3481-fdf7-4f68-9443-315c262f1880', N'简称', N'ShortName', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f56fc999-3ce8-46d5-a3b0-e84d6c4b061b', N'475c3481-fdf7-4f68-9443-315c262f1880', N'名称', N'FullName', N'设计部', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd781fafa-908f-47fd-9a81-b89d461a7af9', N'475c3481-fdf7-4f68-9443-315c262f1880', N'分类', N'Category', N'部门', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'97e47e04-005e-4c70-b456-7ac33a8d1102', N'475c3481-fdf7-4f68-9443-315c262f1880', N'内部组织', N'IsInnerOrganize', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'59862e0d-c039-4ce7-8eab-4536eb5eed93', N'475c3481-fdf7-4f68-9443-315c262f1880', N'主负责人', N'Manager', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'39a2ae6b-f785-4741-bfc4-941c636666e9', N'475c3481-fdf7-4f68-9443-315c262f1880', N'副负责人', N'AssistantManager', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f64d0b12-cc9a-4bee-9d90-6647a6c073cc', N'475c3481-fdf7-4f68-9443-315c262f1880', N'电话', N'OuterPhone', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'743b16df-863a-4c87-88ff-d197cf119556', N'475c3481-fdf7-4f68-9443-315c262f1880', N'内线', N'InnerPhone', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f4bb29d0-8420-4840-ab95-a89925cc1c45', N'475c3481-fdf7-4f68-9443-315c262f1880', N'传真', N'Fax', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3c98d072-b5da-4612-8fd1-97f046864b52', N'475c3481-fdf7-4f68-9443-315c262f1880', N'邮编', N'Postalcode', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'307cc5ba-8376-451b-8bc6-80858aedecc6', N'475c3481-fdf7-4f68-9443-315c262f1880', N'地址', N'Address', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2504d484-d3a7-4092-8477-5f308cbf6dbf', N'475c3481-fdf7-4f68-9443-315c262f1880', N'网址', N'Web', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2ec81c88-e35c-4e24-8225-daf7789c5aef', N'475c3481-fdf7-4f68-9443-315c262f1880', N'描述', N'Description', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4710a76e-1156-42bf-ae43-2b46f5f54896', N'475c3481-fdf7-4f68-9443-315c262f1880', N'有效：1-有效，0-无效', N'Enabled', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'76c327d8-62cc-4c0a-969f-3463a37ca88f', N'475c3481-fdf7-4f68-9443-315c262f1880', N'排序吗', N'SortCode', N'20', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'48e213b5-17ec-4356-8f85-a16a6533b6f0', N'475c3481-fdf7-4f68-9443-315c262f1880', N'修改用户主键', N'ModifyUserId', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'86945b46-b5ea-4a35-b9bc-b82c483e2baa', N'475c3481-fdf7-4f68-9443-315c262f1880', N'修改用户', N'ModifyUserName', N'佘赐雄', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'57070901-8993-4218-aa11-b47e9d597d03', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'组织机构主键', N'OrganizationId', N'acdcbd6d-ef33-4001-bda2-cd9b5e7766a0', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0b30bea0-ef1e-4e5a-960d-582d1825b9ab', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'父级主键', N'ParentId', N'31b05701-60ef-405c-87ba-af47049e3f48', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0257e761-dfb3-4ba2-9f41-4b2a219e7dbb', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'编号', N'Code', N'1000.01.01.08', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'99c6f207-4348-4701-a958-81b7e1870cee', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'简称', N'ShortName', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8dfef400-17df-44f5-ab01-f66aa6fcd16c', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'名称', N'FullName', N'品牌部', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f6c512da-9f37-4edf-8ff1-e76223a027a9', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'分类', N'Category', N'部门', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0a95b4ea-2ae6-4171-b9fa-a1d9ff885525', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'内部组织', N'IsInnerOrganize', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'477d4ddd-307c-439c-bbae-e7f6554d86aa', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'主负责人', N'Manager', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'be22b591-0b44-4814-8001-110a9f87b001', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'副负责人', N'AssistantManager', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'743ccbb5-b2a3-4131-adc2-e8d2e78e98ad', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'电话', N'OuterPhone', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ad6cdafe-1935-4b59-918a-d0027ba2be82', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'内线', N'InnerPhone', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4208322e-11b2-4d14-ad3e-7c414c41e9a2', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'传真', N'Fax', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'41a02388-1845-4a95-baaa-1a53c1ec7c4a', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'邮编', N'Postalcode', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e7c76c48-181a-4881-afc3-1405850e2d27', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'地址', N'Address', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'983b8ee3-8d9e-4e90-ab47-68aae8055d8e', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'网址', N'Web', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6152016f-cce5-428d-8e21-b8098c03a2bc', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'描述', N'Description', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5a4528da-e259-4c75-8df4-ace63a907d25', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'有效：1-有效，0-无效', N'Enabled', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'eeca1833-2f43-49c2-93da-ba32a5b089ec', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'排序吗', N'SortCode', N'21', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'108baac6-a9f7-4366-97ae-ae7581fa1bc2', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'修改用户主键', N'ModifyUserId', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0f763f08-db9b-421f-b3de-0cb75bfe4461', N'ff94661f-ab46-426d-bfb7-e2263b3cb061', N'修改用户', N'ModifyUserName', N'佘赐雄', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'72670314-1ed7-497a-b518-14c64ae751bd', N'2db87ba1-9bc2-41a5-aa0d-0c75b49b6213', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd9e33a39-439b-483a-8492-6e64499e2d5d', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'职员主键', N'EmployeeId', NULL, N'd692d240-1843-4d31-82c8-291aecb2e13e', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e2440298-e06c-461f-9758-23c42a83e18c', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'用户主键', N'UserId', NULL, N'3A3E2057-F55E-43B7-B885-45F507C35AE0', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e2961cd8-1a42-47f1-a6e0-a871703910c1', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'编号,工号', N'Code', NULL, N'100284', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'fcdb8015-ec7a-4d20-b3cb-e9eb7b6aec68', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'姓名', N'RealName', NULL, N'陆云松', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'028334d3-aa1a-4a19-9b54-b546f098ec12', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'真实姓名拼音', N'Spell', NULL, N'LYS', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4beba151-bba5-4c93-8f0d-b5055aeb5395', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'性别', N'Gender', NULL, N'女', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1466893a-a629-48ca-88ac-2e2fbdaf193d', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'分支机构主键', N'SubCompanyId', NULL, N'05e85693-14b0-4582-8063-8fbde85371f0', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3b6ede59-226a-4fec-b08b-287f82338744', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'公司主键', N'CompanyId', NULL, N'31b05701-60ef-405c-87ba-af47049e3f48', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'063e7687-a449-409f-932b-2d760a3543d8', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'部门主键', N'DepartmentId', NULL, N'fa3c84c3-805a-48de-9588-dcdd64d4d9ab', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'49c492ba-3622-41a9-a619-441f4a0f7842', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'职位主键', N'DutyId', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f7fee32f-e4b4-4c55-9c11-e701703286e0', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'手机', N'Mobile', NULL, N'13564491500 ', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9b6e2bd1-9c28-47d2-a5cf-1b7ad0bd9fab', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'离职', N'IsDimission', NULL, N'0', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'87c3ad5f-d855-4504-9b56-c3cdd798c8c8', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'72c11517-1ee6-44e7-ac80-534d3d84d4d1', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'排序吗', N'SortCode', NULL, N'505', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5c1e2156-dfb9-494f-a331-233942a0d827', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7f6c7b91-ccda-444f-b114-1d60244652d9', N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', N'创建时间', N'CreateDate', NULL, N'2013-10-22 23:06:36', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8c583af5-ba58-41c7-9472-89f23dea56b3', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'职员主键', N'EmployeeId', NULL, N'db071dfe-3f91-476b-8580-8dcc3e675527', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4ff30657-2887-421d-b147-c672aef564c4', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'用户主键', N'UserId', NULL, N'A1798EA8-4E42-4995-A393-96D06CBB07C7', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7dc47085-cda0-4a3c-aef1-1ced4ed94bfa', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'编号,工号', N'Code', NULL, N'100570', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ec4c6000-c4e5-4fd0-a28a-2c827b6a9c3a', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'图标', N'Img', N'cup_link.png', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'011ff886-354f-447e-a61e-2ff72a7b29b2', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'导航地址', N'NavigateUrl', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c098aca0-65b9-4263-b23a-f6f7bbce78f2', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'窗体名', N'FormName', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd872daba-e026-4bb2-8b5f-a58945238707', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'目标', N'Target', N'Click', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c3c78f24-1c5b-42f6-a626-73ddfe56063f', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'是否展开', N'IsUnfold', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'de4328ac-a3bb-4ac1-850a-248208ae377d', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'允许编辑', N'AllowEdit', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'83331666-c506-4a08-b329-1bb42e9d1cde', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'允许删除', N'AllowDelete', N'1', NULL, NULL)
GO
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'51958a5d-7180-422a-816f-76aa044979a8', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'有效：1-有效，0-无效', N'Enabled', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd40a66e3-b018-4198-8a5c-422ccab13b2e', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'排序吗', N'SortCode', N'46', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7870ae1e-5784-40d4-94af-37cd18e5e475', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'创建用户主键', N'CreateUserId', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'27934cc0-3f4b-490d-8a5a-8da2a3f7d15f', N'8ac29612-f698-43c4-a180-04fbc414c20f', N'创建用户', N'CreateUserName', N'佘赐雄', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'303bda34-7120-41fc-8593-738b3d0afdb4', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'菜单主键', N'MenuId', NULL, N'd2cd2ce1-294a-47e3-bfc8-c201f7b8c55e', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a23cbf6a-be93-4399-8e0b-f93c95c0623f', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'父级主键', N'ParentId', NULL, N'1ff6d07d-3d17-4ae2-8ce2-8a70f240048c', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'fa7bdc4b-3112-47ac-b938-9b902e86bdd0', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'编号', N'Code', NULL, N'1000-05-05', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2afbf6da-b1e5-410f-b149-61706f638aca', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'名称', N'FullName', NULL, N'百万数据测试', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'776d2b73-028e-4787-a76f-afe9222aadc1', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'图标', N'Img', NULL, N'cup_link.png', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0f594cf6-0790-41fa-a80c-7f6662e53a80', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'目标', N'Target', NULL, N'Click', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7508e617-99d6-4a45-ba3b-730e008a43ab', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'是否展开', N'IsUnfold', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd2f16645-ccb0-4a83-b01f-b07866fd1907', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'允许编辑', N'AllowEdit', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1b5dcd7b-2264-48d1-8465-5d46265f3ee8', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'允许删除', N'AllowDelete', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e04a78b2-d90d-4c0a-bf18-479b02120c64', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b3568ee9-e81f-4fa5-ad3c-f8a10516ae2e', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'排序吗', N'SortCode', NULL, N'46', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'bb0e4aaa-0e1a-49e8-91d6-1ff295633a81', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd05f2acf-d2ab-49af-85fc-b9cb7f7018b2', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'创建时间', N'CreateDate', NULL, N'2013/11/24 17:22:08', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'69c27c07-009c-4e59-95cd-68566ba903f9', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'创建用户主键', N'CreateUserId', NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd085e31e-02ad-46ab-8336-db8dcd072cd4', N'99280aaa-b581-4338-a8ab-72de0b9c275a', N'创建用户', N'CreateUserName', NULL, N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a6bdfc7f-8307-4e4d-a5ac-d4f05029afb5', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'姓名', N'RealName', NULL, N'梁胤', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'fea21ec3-3980-4c9f-9de1-283d475d099c', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'真实姓名拼音', N'Spell', NULL, N'LY', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c6547898-65f0-421f-b91a-c4fa302f7493', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'性别', N'Gender', NULL, N'女', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd478bea9-9389-4e39-9bc9-4754e0ad97af', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'分支机构主键', N'SubCompanyId', NULL, N'05e85693-14b0-4582-8063-8fbde85371f0', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ee2eeec3-2143-4606-b10a-eda5bf49e5ca', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'公司主键', N'CompanyId', NULL, N'31b05701-60ef-405c-87ba-af47049e3f48', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'63ac5c62-aa0c-47e8-b046-6188baa4006d', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'部门主键', N'DepartmentId', NULL, N'fa3c84c3-805a-48de-9588-dcdd64d4d9ab', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5f49237f-7eb4-41f6-b879-a79d1dd29f43', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'职位主键', N'DutyId', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2329f7ad-047e-4b37-925d-7b14d1b98a5a', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'手机', N'Mobile', NULL, N'13642325168 ', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd24ad45f-96a0-4449-b75f-9f5649820f92', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'离职', N'IsDimission', NULL, N'0', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a9431888-428e-474a-a9f2-b42e8d161cd0', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0c462ac3-8209-4ce8-8ead-64c12eec88c0', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'排序吗', N'SortCode', NULL, N'219', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd4a13ec4-31ca-4eb6-87ac-b9aa245fa415', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f86a2c80-2f45-4110-bdb2-5cefef7a85f1', N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', N'创建时间', N'CreateDate', NULL, N'2013-10-22 23:06:36', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'61948d8c-0b4a-4ff9-9735-cc73f8d0f895', N'4c3e2d76-350d-4293-9497-86fd086e335e', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Dictionary/DictionaryIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ec5ee9d7-3f89-45b4-bfb1-3613a3064f02', N'e3c769f1-104e-46aa-97e5-35e3e0ecea7a', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'addece78-fa3f-4ac2-9832-9c59048b0810', N'e70b79b7-dea7-4842-b1de-7334126044cd', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a5a5c5e7-a6db-4bf4-92b1-275917e37c31', N'9924f80c-f779-4026-bdc2-44714b031533', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cb6efc2d-c574-4b2d-8245-270d90c755be', N'38413330-1359-45f7-b84a-47c576657dab', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4fc7675d-4c21-42f0-98cd-055f7f0e9e8d', N'957b1e21-2e33-4b67-92a5-e2b3409d6467', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'99de4958-3de3-4340-ac0c-95334201dfae', N'c98b127c-2344-4f73-ba39-2ea04e06d6a5', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b719a7e4-44e7-473c-b759-e495c0d575de', N'6187bca9-bc61-4684-b6eb-94deb1a4f078', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'990f01db-a082-4439-a68c-4e92b3832ee3', N'b551bba5-ded6-472b-9b89-91d3933c2f56', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'696db414-f62b-4fd0-812d-55ff8c7235d3', N'4555d011-272b-48a0-82a0-be10d70b96d6', NULL, NULL, NULL, NULL, N'URL:/CommonModule/DataBase/DataBaseManag.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2be7c432-ef04-43cb-9fc6-32a6d406eeb1', N'c1e1e5d2-326a-4e11-a025-f6f93942ff24', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a914345c-ad5c-4402-8f56-328181b0ded6', N'a2f622df-7aa3-4e60-bfb1-ded8da51bf84', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'53368a26-26ad-4e50-ab4b-bf00c51f7833', N'06872dc1-c8a9-4184-91e3-9b5872dd3f69', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6ee2f76c-8d92-4efc-abcb-e28632c49f5d', N'41f1a1f4-d938-41fa-a79e-663f90cdf7bc', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a99d2f38-be7d-4afd-9a12-36a417b545c2', N'028146b1-9265-4bfc-9ee7-870c19fe89e3', NULL, NULL, NULL, NULL, N'URL:/CommonModule/UserPermission/UserPermissionIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4dd6caee-6f41-4521-b019-631d4bf3ebcf', N'0b81212a-419b-4e89-a037-1e334e320471', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/Individuation.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1e3868c0-d1cc-45c5-9986-07e8c41cbece', N'37850910-ca11-4db0-a7a1-38c92d62b926', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6e8faeac-8bdb-4cba-bed8-9d16a14a959d', N'cca5f9b6-6367-414b-8cb9-bb6a17aa9621', N'名称', N'FullName', N'微企业管理系统', N'通用权限系统', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'57c9c16f-70c2-459d-9ba9-4169d7a18f58', N'cca5f9b6-6367-414b-8cb9-bb6a17aa9621', N'修改时间', N'ModifyDate', N'2015-11-10 14:50:07', N'2013-10-26 11:26:30', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'588593c9-7218-4a1f-bdd4-fad15e53cb46', N'cca5f9b6-6367-414b-8cb9-bb6a17aa9621', N'修改用户主键', N'ModifyUserId', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'ed097525-ba86-4940-934b-9ee1b884fbbd', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0273cab5-d3f8-4ff3-bf28-784433c23923', N'cca5f9b6-6367-414b-8cb9-bb6a17aa9621', N'修改用户', N'ModifyUserName', N'翟双焰', N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'685dcfb8-f6ef-4f41-93f5-553aeaf6e98a', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'菜单主键', N'MenuId', N'4c31de1e-3788-429e-b15e-f9fb70b264b1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'58af7ac4-55cc-4a47-8479-785c33376e96', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'父级主键', N'ParentId', N'9f8ce93a-fc2d-4914-a59c-a6b49494108f', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'74ec3a93-dd7a-4262-b654-1c33519d4730', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'编号', N'Code', N'1000-06', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'76b85047-03c7-4cbd-a201-993acaa73ef2', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'名称', N'FullName', N'企业号管理', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1a2c7a3e-6c9b-4eda-abf0-01ebf4b0e1e0', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'描述', N'Description', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'911b7f75-9d0f-45f5-b597-cc3caa33eab6', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'图标', N'Img', N'delicious.png', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a5841db1-37e2-4814-9a9f-95bda879628e', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'导航地址', N'NavigateUrl', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a18be7a3-12cd-476d-adba-a865ef8483c0', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'窗体名', N'FormName', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'980b1edd-f4b9-4215-acee-cacf13296994', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'目标', N'Target', N'Click', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5d835ead-b14c-452f-bc8f-8d26125545b7', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'是否展开', N'IsUnfold', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'60f789a2-4bcc-4c23-aa2a-6e99176d3bcd', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'允许编辑', N'AllowEdit', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b2cdca61-e2ca-4b7e-bddb-a6c6eb208f12', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'允许删除', N'AllowDelete', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c8b5694f-7c4d-4eab-861f-1446c0bc0845', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'有效：1-有效，0-无效', N'Enabled', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'bc9def98-24a5-4b70-9e8a-a7ba92c9efc7', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'排序吗', N'SortCode', N'46', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1c7d0017-1ca2-4605-98a0-5b436bb16983', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'创建用户主键', N'CreateUserId', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7f37567e-0788-4322-8086-5e913dab4fe6', N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', N'创建用户', N'CreateUserName', N'翟双焰', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6529dc53-2cd3-4363-926b-ff4b5cc2ffa3', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'菜单主键', N'MenuId', N'eb12f51e-91cc-436f-99fa-154841d9f15a', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'09528f72-6172-47b1-974f-e143169a7142', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'父级主键', N'ParentId', N'4c31de1e-3788-429e-b15e-f9fb70b264b1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'56059c89-d35f-4b84-9319-452daee9d7d8', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'编号', N'Code', N'连接配置', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b9f839a9-4fc9-4186-8231-5944f0cb50d5', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'名称', N'FullName', N'1000-06-01', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a8be79d4-ad9d-46db-bd5b-b10efa987a12', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'描述', N'Description', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'589d7336-3581-40e0-9ab0-d0c4bb12fa98', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'图标', N'Img', N'page_white_gear.png', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a6c8bfc1-3313-4442-9b97-5f0983932a80', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'导航地址', N'NavigateUrl', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f79b9bfc-937f-42c9-bb37-e1acd99e7c8d', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'窗体名', N'FormName', N'', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b89bd30c-0a60-41d2-bc70-d2abeddcaeed', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'目标', N'Target', N'Click', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0c16ae23-8ee0-473e-af30-2958365b322e', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'是否展开', N'IsUnfold', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a1de136f-1264-443c-939d-e78ad3ac26d4', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'允许编辑', N'AllowEdit', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ef970a6a-0a60-47e3-8d5c-02656988c7e6', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'允许删除', N'AllowDelete', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6ed31bd2-2ca4-46e8-b300-64a823366bbd', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'有效：1-有效，0-无效', N'Enabled', N'1', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7e9225f2-0532-4cb7-b8e6-22f4e00c4e12', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'排序吗', N'SortCode', N'47', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd42424d7-9a93-42f2-9505-2ae9575b88b2', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'创建用户主键', N'CreateUserId', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1a65b545-01d3-452e-91e7-1e294019dec4', N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', N'创建用户', N'CreateUserName', N'翟双焰', NULL, NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a6195e4e-0f19-42b1-b9ee-8c5feb0bca74', N'496f9633-0bbf-458f-8892-6ce1b896ff47', NULL, NULL, NULL, NULL, N'URL:/CommonModule/UserPermission/UserPermissionIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'20496c9e-22d5-4dbb-b559-c0095d91cf61', N'8d6e4846-d5ed-4a3f-9ab4-d90d2b6c903c', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5fa84b18-1f07-400a-956e-c99eaf7cd2ca', N'02d19846-64d0-4136-9ca8-54889bfd1019', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5a61309d-17f0-4ff6-b062-71b1a81d39e0', N'ffa67ec6-5b6b-4d5e-bd4b-cbd87f86b71f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'36c2a77f-c42a-42f5-8611-440dd35e57f0', N'386e2eff-9bb5-4ae9-be02-032529091dc0', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f132666d-2c31-452f-9d76-b0510612f28e', N'401364c2-bfcd-4443-bfb0-a102710e60db', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4e4a0209-5198-42ce-a7b1-f2c081d86f58', N'4cbe4e61-5d0e-479c-bb81-d0465cc03838', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f1451d70-5f9a-427a-98e1-49ec2f169897', N'35b96509-7f46-43fa-8879-9c31a1f937ab', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a6a068a1-2104-4b5b-96a9-8b9187c28c5a', N'bd377689-2ec6-495f-a649-1509938df8cb', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'25fc4fc4-d749-4613-8f9e-dd22f9db53a8', N'b10de671-4972-443d-b187-0a8407919f19', N'编号', N'Code', N'1000-06-01', N'连接配置', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c1b7f9fe-0930-4850-9e03-f25490e0f3c3', N'b10de671-4972-443d-b187-0a8407919f19', N'名称', N'FullName', N'连接配置', N'1000-06-01', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c1a1d1ec-1c7f-47fe-b1e8-c97cc668fca4', N'b1612788-e57d-41bb-847a-8c3de8bef6a9', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'072b799f-295b-45ca-9ebf-b774811502cd', N'd9ad0465-b1c2-4a82-ac00-dcea2ef9e7a8', NULL, NULL, NULL, NULL, N'URL:')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2229e09e-e29b-4e64-9181-04c1d0c4597e', N'21e24e3c-1703-4490-b8a9-64455d3cf0f8', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'af50dc57-6170-40f5-bf0c-dd278410a6b0', N'224846bf-e641-4f94-9006-010f0a08aafe', NULL, NULL, NULL, NULL, N'URL:/CommonModule/IPManager/IPManagerList.aspx')
GO
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'dd6eaaa8-4765-4636-b925-d4185a0566da', N'bdf2dc07-55cb-4ba5-bfbf-fe21b0bce186', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'583f33b2-baa3-4942-85f7-0d350eeb1706', N'7e976707-b344-4297-aa3c-d6c8d17520e8', NULL, NULL, NULL, NULL, N'URL:')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5f920643-7351-40ed-9afb-898f64bd21c0', N'f49526dd-c63e-485f-9115-5e3c4dbc31e4', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'dd672a9e-3335-475c-a0db-92b312818283', N'c161fd38-5a07-4beb-b2dc-7c6dc93daa56', N'修改时间', N'ModifyDate', N'2015-11-10 16:14:28', N'2015-11-10 14:57:21', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'68667ee4-24f1-4daf-a04c-99e061dfa12a', N'5d485469-7c3a-439d-81e8-5a0409b1cbf7', NULL, NULL, NULL, NULL, N'URL:')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'556ad301-1b4b-428b-af3f-55e56af845d4', N'5a3db1b2-b5a6-49f0-af6f-49ac97c32037', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'18a60f51-3ca8-4cbf-8daa-40bccaa4c617', N'6d3d83a4-8f28-439a-a650-7817778fa95b', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'31f84616-55f9-4948-9dbf-6d699a84cb07', N'0594c3e6-3a61-425e-aa2e-144c3d5e2e89', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5268950e-dc15-4ef6-9f9c-77b46c338959', N'1fa002e2-7bd5-496a-a319-849c5245fdf6', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx?action=GridBindList')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd6e80cff-0cf8-4177-93ed-440d5e121237', N'1bd16215-2012-48e2-992f-e89aef615c20', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx?action=GridBindList')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'53fd0d6a-c351-4451-a822-f2c5ac5e00da', N'150b7715-ff15-4848-a96a-79e2797a6db5', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'bb88e6db-158a-418a-a25c-344c76a4bce9', N'997cb35e-0675-4337-8dfc-e262d1596011', N'导航地址', N'NavigateUrl', N'/QYManager/BPMS_QYNumberList.aspx', N'/QYManager/BPMS_QYNumberList.aspx?action=GridBindList', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4b9d4a4d-9e27-44dd-a1f2-33c83bf605ec', N'997cb35e-0675-4337-8dfc-e262d1596011', N'修改时间', N'ModifyDate', N'2015-11-10 16:18:33', N'2015-11-10 16:14:28', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ba5f8c58-3855-4e36-9744-38e4543e5ab2', N'0a7aa69a-21e7-46ed-b561-e680f8ad1880', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cccb952c-8371-467b-86ba-e0aedf767e24', N'920eb77b-6df0-4600-bd01-270dee593447', N'修改时间', N'ModifyDate', N'2013/11/24 11:34:10', N'2013/11/24 11:34:03', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f9dd2a55-e6d7-48de-a5ce-f5167dc9af58', N'6df4abdd-c040-4a27-afc1-199ca5c63d57', N'修改时间', N'ModifyDate', N'2013/11/24 11:34:20', N'2013/11/24 11:34:10', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3b6dddbb-5462-4afe-8796-b0f78f520ef4', N'b634a856-1448-43f3-a87c-44b0513e6ede', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'eb9c9507-d624-49c5-8812-d359c381b794', N'5f6e361a-2696-40ef-a46e-55de995f49a2', N'修改时间', N'ModifyDate', N'2013/11/24 12:00:25', N'2013/11/24 11:34:20', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4643c277-1ae8-4795-bd61-d0dc26045fe6', N'e9927656-eaa3-4f19-9dd5-b0105c008e8c', NULL, NULL, NULL, NULL, N'URL:/CommonModule/UserPermission/UserPermissionIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'043180f8-7fd7-4f33-bd43-fd5075117bc9', N'5c32624c-29b6-4cee-8844-e1d9b7b1170a', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5f492635-0ec7-402f-a64c-75aeddee3acd', N'7a56bd97-8f4f-4d3e-97de-1f74ee828691', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Log/LogList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4672c5ac-399e-48a8-a4ce-27820091c866', N'44259c8e-e35f-4b9a-a4d1-2fd6f3458baa', NULL, NULL, NULL, NULL, N'URL:/CommonModule/FlexibleForm/FlexibleFormIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'92237c92-41d4-4a33-bd59-546fa6b3b20d', N'ac3ed56a-91b0-4305-8d05-cc46cff1d7dd', NULL, NULL, NULL, NULL, N'URL:/CommonModule/FlexibleForm/FlexibleFormIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'862f67ec-25fd-4bab-be43-5584daaba31e', N'f0eadb3e-4d8c-4774-b5d0-6f5e714dfbab', NULL, NULL, NULL, NULL, N'URL:/CommonModule/FlexibleForm/FlexibleFormIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'18773e32-b572-44b2-a20a-20d383df7cd4', N'd2954a31-6164-47fa-9e8d-3a1c58e4a1e6', NULL, NULL, NULL, NULL, N'URL:/CommonModule/FlexibleForm/FlexibleFormIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'997f0c92-5315-4f75-99ac-167d1a5172a8', N'df9d00ea-3129-4a68-9e9c-6305b9e2333f', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/POOrder/POOrderForm.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5dc3ee64-ae02-4881-8382-20d3884992ba', N'cca2ad1d-2469-4c10-88f7-0ea6330e878a', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/SellOrder/SellOrderForm.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'449e353f-12a3-4e89-8efb-8b7896549e39', N'25e4ebba-135a-4ed7-8594-6386f195c89d', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'd9d5b9ce-55a2-4946-bae6-78cbdf110bdb', N'7ff89137-a707-42e8-9154-72807502a38d', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/POOrder/POOrderForm.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1c6bbe40-7498-418e-b70e-cec413299b80', N'346311fb-40e1-4237-8a38-3836dd7d7e6e', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/POOrder/POOrderForm.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'15b66637-837a-40b1-a9fd-b2ed7348f391', N'6363dffb-8e14-4834-8415-23dc14aa3d9d', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'400ed485-b2a4-4a67-b436-10b3f23198ee', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'菜单主键', N'MenuId', NULL, N'cf123887-2a4f-417c-8f62-3ec77c0fb75b', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'53d1f8c3-78b9-40d8-9781-bffd4313f929', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'父级主键', N'ParentId', NULL, N'1ff6d07d-3d17-4ae2-8ce2-8a70f240048c', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e51aa775-8fb5-4605-a114-550b190ec738', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'编号', N'Code', NULL, N'1000-05-02', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'fa16e770-d233-41a8-aa0f-46ae3a45ddca', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'名称', N'FullName', NULL, N'销售订单', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5a7c48ac-b5d5-45bb-a23a-0134d399ebdb', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'图标', N'Img', NULL, N'20130717121450941.png', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b6c437c9-4873-44a4-9893-6c156b27e7e4', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'导航地址', N'NavigateUrl', NULL, N'/ExampleModule/SellOrder/SellOrderForm.aspx', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ac9ac6e4-b28a-4beb-b7e4-38ca04420152', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'目标', N'Target', NULL, N'Click', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'956af7e5-4a46-433e-87e7-c6f8c6d9e74b', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'是否展开', N'IsUnfold', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'61e3323b-70e1-4e1f-9e47-3b1c445caa38', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'允许编辑', N'AllowEdit', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f8bc1137-062c-446a-8c82-c9c08be3fafd', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'允许删除', N'AllowDelete', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0e0a03fa-b391-4bba-894b-87f46b8e7736', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'有效：1-有效，0-无效', N'Enabled', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ad8a033d-11a2-48ad-ba50-b2cc09c6dd93', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'排序吗', N'SortCode', NULL, N'43', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7f8e3e2a-ac02-4845-8e97-d2d85e34c265', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'删除标记:1-正常，0-删除', N'DeleteMark', NULL, N'1', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f218ff25-e9d8-4326-839a-0b7cb768ca53', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'创建时间', N'CreateDate', NULL, N'2013/11/20 0:36:30', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c1e2ee6b-3e98-4f47-96df-d649909a02f7', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'创建用户主键', N'CreateUserId', NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'85fd48be-0512-490f-bd82-114d74dd0856', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'创建用户', N'CreateUserName', NULL, N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'83981708-792c-4c6a-8104-61f28dd45f20', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'修改时间', N'ModifyDate', NULL, N'2013/11/20 14:20:06', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'14e26bca-e5aa-446f-abcd-4fa80b978d1b', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'修改用户主键', N'ModifyUserId', NULL, N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0c67d590-f052-4a40-b56b-d04e9a3c6e3f', N'7d5667da-00fd-422c-a2ce-45661532e25d', N'修改用户', N'ModifyUserName', NULL, N'佘赐雄', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ad63603d-44ec-4d9b-9a2e-063804881a41', N'f7cf155c-ea23-4a0f-b273-897738dc4604', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5e7b1337-ca5c-41b1-a25c-0619a4803cf1', N'295eb852-1cc0-4c7c-8a2c-0983fe2f18b8', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'361c80af-7b23-49d5-b28b-e78eb0ace73b', N'c2ae7595-ce20-4f33-bac1-27c58394d017', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'92f5e4f7-7844-48c5-8d53-e32611d79b8b', N'40721dc0-ab28-4dd8-a841-4a070c96ef62', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ef82f34f-9d2e-472d-b59a-fbe5c8f60b30', N'10acbd46-38f9-41d6-ab8a-89904041ac8e', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e7beda9d-a611-4f98-a5e7-0c1ba2d05475', N'0c66298c-95ee-4fb6-9ec1-fe63852f3927', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5dd6900a-6577-433d-92c9-7dd0590c11b6', N'a53b1fbe-0a5e-42cd-a4ad-eefe7c4ec087', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9674b2d3-0dfc-458f-abdc-eac81f9e6086', N'f7f95fef-1ea9-41df-90c1-800c2c88440b', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'cc3cd765-41e2-4231-8aad-4cf120a7f537', N'42b43340-377b-463e-aca5-039cbb802b6c', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ebcbe2cf-8cbc-481f-b05b-213eb419e0e5', N'691b0ce1-2c23-49a1-9b7a-090b4a1392cb', N'修改时间', N'ModifyDate', N'2013/11/24 21:30:24', N'2013/11/24 12:00:25', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0f724578-fc5d-4c9a-b377-160fff296d72', N'5e2b5a17-c813-4b81-a5f9-ac6a80391705', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ef83fd9b-0d1e-41e6-b01d-9bc45dfab921', N'367d5100-43de-49b9-a244-fa10ddc6779e', N'描述', N'Description', N'111111', N'111', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7b52e550-5339-4457-9761-d68c9eacbf7c', N'367d5100-43de-49b9-a244-fa10ddc6779e', N'修改时间', N'ModifyDate', N'2013/11/24 21:32:15', N'2013/11/24 21:30:24', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'441443ec-1f74-4e78-9081-88be6d55d64e', N'eadaf594-75b5-4e22-a8ab-5ba63483cf8d', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5fefdf55-b049-427d-8922-0b572e212af8', N'b44045ef-3b2e-43fb-9f27-702ea70e1034', N'描述', N'Description', N'111111333', N'111111', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'654be6a7-9299-48b7-bb15-0570171b7332', N'b44045ef-3b2e-43fb-9f27-702ea70e1034', N'修改时间', N'ModifyDate', N'2013/11/24 21:33:04', N'2013/11/24 21:32:15', NULL)
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f4467719-4837-45f6-817b-812052a01438', N'a65f3184-843a-40dd-a3d0-226db866f553', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'47c2f433-650d-490a-b2dc-d9f1633eaa51', N'7b64a1c9-b86e-4561-ac96-1353f4943be4', NULL, NULL, NULL, NULL, N'URL:/CommonModule/UserPermission/UserPermissionIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2e08668f-2088-4d28-8e2b-b7ad9dd8f090', N'73e2ace1-a569-46e3-9016-75a12dfa0392', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Organize/OrganizeList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'dcfba49f-1e22-4126-957e-1e68595068b2', N'ffbccfd5-78d5-4679-ae5b-9d4d2645eb63', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'2c37019d-f7d9-4a5d-9623-57745cd68f04', N'b101797e-2443-4560-914a-d3bcc38ef264', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e96fa3d4-ed2b-44de-9476-b3fdd4e7d253', N'd1521f3e-77cd-467b-85cd-c2f60d70b849', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1acf7bcd-9798-4a06-9f5a-553e1bba296f', N'd382f065-c087-43dd-b760-f13326e9a383', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'9fba0ad9-2844-48c9-82f9-f2ef7da387b3', N'3d3ea7cb-e036-4486-9c47-5711419a9424', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c2b1848c-afda-48ff-a24b-9f4ec930c3bc', N'c77a4df2-7c06-43eb-b69a-97906365f0aa', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8aef14dd-3da4-4ffd-9831-07d9d731233c', N'f7a0aae5-970a-48a7-b408-200621d5be97', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ab9caf59-28e8-4cf9-83ad-496a4df32a58', N'4d4b3bda-edf4-405c-8705-7497133f676f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'554e3707-c588-4b16-827e-77260c7e504f', N'2989aaa9-b1c6-4822-b0f4-ddea9837fad2', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4c866e67-c0f3-4e50-971b-515fce405de8', N'f0f7b2a5-ee52-4e7a-ac5b-38872bd01cf7', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'1670386e-96c1-4469-83f6-a3d0a4fbdc43', N'ed63fe98-e04c-4cd9-95b4-e6708ff9e045', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'24ba5108-4308-46cf-b999-eead64c66f99', N'b6f07773-6307-44a0-9731-a6495fa3c452', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b4e7f097-eaa0-403e-8183-a00a57170674', N'93097ff0-b8f5-44c6-ba4d-8c341bdc3164', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'12deea51-4691-47cc-ab78-4cc6d3e19a9d', N'e26de991-b75c-42e4-bc7e-095c57fd0180', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3fa5ba05-69c3-4f28-ae4f-c635a7c65e71', N'27668d9d-8a4b-4765-b381-7a3d3cde1ab0', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'4f464901-ea86-46ac-81c1-c9a2bf4cd39a', N'c572afb7-aa85-4199-afca-1ebbb2173984', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e3c7e694-bba9-4efb-9f65-6f0f3bf99400', N'2299352c-68e6-4f7c-9e34-158b6d59f575', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'61d2d3ad-b6c9-4979-ad02-ce74d1e2a2ab', N'b920b933-b4ee-4cc7-9e18-69db986404e4', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'f01be9b1-7e71-4f09-9674-8e76f76917ca', N'4f476067-fb45-4590-a36f-b1e66e0972fe', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'bee1e4b0-3826-44a2-b852-686938ee4d50', N'a6348ac3-ca48-469d-bc4e-f41d7f62c0e6', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5d7141a8-cd71-4590-9bc4-236b4c903490', N'0d8fa86e-0823-4d7c-8fc3-7e1ef23e3d3d', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Role/RoleIndexPermission.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3593acfe-ba7f-4422-9e70-f730f1a9b46b', N'8829bcfc-02b9-473e-a04a-96f3ee30924c', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'97b03756-7bca-4ece-95a6-b9661d595d94', N'dd816651-ad80-4816-b099-15a3c25c8651', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'dafe6b70-7dc7-4cb1-93f2-21353204173c', N'a2cb8a18-3ffe-4845-b189-5ab29422699e', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'fdcacee0-453a-408f-b81a-6db97613a82d', N'52b010ec-45ca-4ff3-a360-55a9b4402044', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0d416c72-535f-4f7f-9414-b6c65fdcc26f', N'd2471d2a-7be2-409a-82f1-ba405ab3e31f', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'5c5beb07-e63b-4946-a475-ba26d810036e', N'69b4940c-02f1-4ad3-a1ee-a1b360bbff1f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/User/UserList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'13813b50-a829-4af6-a3fe-3c9873328958', N'9c8a9532-c74b-41c4-b80d-bdaf472a2e1b', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'aeebfb42-7a03-45c8-b6b7-45b66f88d595', N'25f4b76a-b692-49ee-a478-da40e633ca5e', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a150856a-49cd-4e97-9d63-0ac0b7021603', N'06c219a7-7034-41fa-8010-6d6cb6e70795', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'086287a6-735b-45ee-a76b-ea69c7b0a861', N'fe0d52df-8739-4ff4-a258-78eb4bc9870d', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
GO
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'3f53adb5-888a-4820-8e4a-761187dcfc15', N'ef18bf1e-9f8e-48ad-9b08-b5c7ea0174e8', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0b32b970-369a-47d6-977a-b393beeab668', N'6023c5e9-c262-415d-8d05-2e95d6c2a5b2', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6b1e4307-c6e3-4353-93b4-e1b79c95ff8b', N'299a3d07-4d37-4930-b937-22cf913593e9', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7496d473-7015-4cfa-b652-5f5dae96b746', N'0e8416dd-d74e-42c4-88e8-c08f2a352fb9', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/News/NewsList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'986db0c4-9e33-46b2-af40-23e9dd224bc5', N'b9229067-8a49-4586-bb0f-19a1534a54b8', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'47f1d157-051b-4b1b-9764-c1972743525d', N'0729f0a6-0fc1-46b2-a367-aa910e8c0815', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/POOrder/POOrderForm.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e39b44d3-8cd5-4184-a721-00e8d7b24af1', N'2beb78ab-893e-4ab6-a276-b3d474478799', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e44dee21-d39d-4448-8329-e38ceaec6c5a', N'08014623-390f-4575-bf00-85296bd04c68', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'87c339b8-8666-47d3-a750-96912b51158a', N'b4bf1d41-7116-4a17-a410-e0fd0e5cbdba', NULL, NULL, NULL, NULL, N'URL:/ExampleModule/File/FileList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0b4539b7-8a62-4c13-b697-275cdc5970db', N'66e9a9b0-2e35-4721-9129-8f24fc523c2a', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c9cd0fdc-ad88-4da5-8813-af512e6a32d3', N'f24dfc5e-d811-49aa-8162-282096f56711', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e6562951-5d4e-4b2c-9798-52092b0a1129', N'159c542d-a0a3-4484-8e1c-d62e0c85e824', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ac33f16c-ebce-4fc2-b64b-5c2459571370', N'90366ca8-05e8-404a-8613-3be9a459a354', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'ce0fcd2f-66c7-4fd7-a207-4d69c8d4301d', N'b20a25b5-6150-42e6-8779-512023028821', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Employee/EmployeeIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'e0fcbd6e-85df-48c0-95ce-8ac7a2096c3d', N'2d4a7baf-4811-4fe3-a22f-147aaee072ed', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'0b53f173-25c3-46a3-b7ce-0ba52a993faf', N'4bb2941a-6b13-4389-92cb-e8fe6c47ce3a', NULL, NULL, NULL, NULL, N'URL:/CommonModule/UserPermission/UserPermissionIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'24a00943-187a-4c73-8503-5ed7ee3c7cac', N'8b08db66-ac2a-4bbf-bf15-ba6ccdc00bc4', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/SystemInfoList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'a37f4dce-39ef-46c2-8fde-ae05328add1c', N'ab789786-91d2-4373-9420-0227e0c6a31f', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/ConfigForm.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'856de369-ee5c-4e59-99b9-1d3f272a162d', N'03d8f943-26ed-4de6-bf61-201902cfb928', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Dictionary/DictionaryIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c4cb11d9-0efe-454c-80af-a1cde480d805', N'38b2ed9a-807c-4591-a3dd-c1e7231b354e', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/Individuation.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'8d72a377-09c2-42c7-818f-47e2402150a4', N'54219e56-7e99-4274-a62f-15af06c4962e', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Dictionary/DictionaryIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'7cb30c99-0fee-4199-9d57-50e2f697a548', N'b8019303-42d3-4cc1-86e1-e9db605f5fc8', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/ConfigForm.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'c5c14eaf-d75b-4f49-aa19-669a8b576554', N'5e4cf753-ee10-4c5a-b8e2-81c806ddf41a', NULL, NULL, NULL, NULL, N'URL:/CommonModule/ExceptionLog/ExceptionIndex.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'6451acf1-eea4-49da-b350-0d3571d53486', N'3c17c9e2-1f6b-4708-b390-ca88eb595664', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Log/LogList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b82e9cdd-fa81-4bb8-9d83-6ce2242227c1', N'783d09d3-e31c-4c94-9e09-6fdb595eab0a', NULL, NULL, NULL, NULL, N'URL:/QYManager/BPMS_QYNumberList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b5048b61-6b6b-4df3-85f5-2c532a860df5', N'0febaf2d-0d0e-477d-b210-71c7341f0a01', NULL, NULL, NULL, NULL, N'URL:/CommonModule/IPManager/IPManagerList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'29dddd91-3e04-4aaa-8bf7-21e9cf942b4b', N'10026314-076a-434a-a9cd-d9126798ba86', NULL, NULL, NULL, NULL, N'URL:/CommonModule/InterfaceManage/IAuthorizationList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'78d87962-560f-45f2-8320-d0fa8d830681', N'4bd275af-b535-421c-ab51-ff41753f24ca', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/Individuation.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'b94a4f0a-0d06-464d-af2c-04477a959d5b', N'5b249965-637b-4706-9edc-3ff4aae02f05', NULL, NULL, NULL, NULL, N'URL:/CommonModule/SystemInfo/SystemInfoList.aspx')
INSERT [dbo].[BPMS_SysLogDetails] ([SysLogDetailsId], [SyslogsId], [FieldName], [FieldText], [NewValue], [OldValue], [Remark]) VALUES (N'064c01f6-6c3b-4ffb-a5b4-d0216ef61fa2', N'2aac8e36-5131-4a2c-a689-d4bf38bb5927', NULL, NULL, NULL, NULL, N'URL:/CommonModule/Module/ModuleList.aspx')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'15a0de5a-73d8-4c18-84d8-bbd955ab4c4a', CAST(N'2013-11-27 17:49:34.140' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'b0c2175b-0ccd-4a10-bbc3-4b233460371a', CAST(N'2013-11-27 17:51:27.253' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'e8d022b8-fc6e-4308-8846-b4cc5d628710', CAST(N'2013-11-27 17:53:34.617' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'e82481e6-feca-4721-9e36-92e4241b295b', CAST(N'2013-11-27 17:55:05.940' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'829e1fd1-f63b-4a44-a103-a464895a7553', CAST(N'2013-11-27 17:55:45.847' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'0bfd9772-b6dd-4e36-8441-37d1f93d74c6', CAST(N'2013-11-28 11:32:17.437' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'ae7c00ed-fada-4508-87a9-6ebec3410442', CAST(N'2013-11-28 11:33:34.563' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'55e04f3e-6012-4739-93e4-46b65a50c4d9', CAST(N'2013-11-28 11:38:20.033' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'9eecd39d-57cf-4333-93c3-6d9be1e644fb', CAST(N'2013-11-28 15:57:18.470' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'eaf4eb0a-533c-4267-b23c-d92e666709b5', CAST(N'2013-11-28 16:09:04.060' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'db1fb4bd-b8f3-4d9e-861d-554e0e47b870', CAST(N'2013-11-28 17:59:06.353' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'46ee0622-cfdf-4d3d-bf66-53b8d87ba065', CAST(N'2013-11-28 18:01:04.573' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'47b8e348-de53-4c10-9e8f-4e86e51744d7', CAST(N'2013-11-28 18:08:29.537' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'10dde596-0400-46cd-aff4-eff4331b018a', CAST(N'2013-11-29 13:17:40.947' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'44c2cc87-90b5-4404-a423-c130a610a2c4', CAST(N'2013-11-29 13:37:51.690' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'bb587f19-e869-40a6-a280-fab21d650899', CAST(N'2013-11-29 13:50:31.143' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'a10e9119-e21b-45e2-b26e-03dd76eee21a', CAST(N'2013-11-29 13:53:15.470' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'210c25b8-dccf-4d35-b3a2-662ee0ce9bce', CAST(N'2013-11-29 14:24:03.853' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'7c921343-76bf-4a11-9965-8624fc8bc9ec', CAST(N'2013-11-29 14:25:10.293' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'7c02dcf2-5f36-47e9-888f-f58f81cdbffd', CAST(N'2013-11-29 16:32:32.720' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'97dd7c05-eea8-45ea-98a1-c307e54fb47c', CAST(N'2013-11-29 16:51:43.207' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'60f01d31-bfda-4bd5-9be0-6a969873c81b', CAST(N'2013-11-29 16:54:15.893' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'3ea289dc-a7cd-4aef-aca1-490e5e8503d2', CAST(N'2013-11-29 17:04:00.863' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'ac62ebab-07a6-42c3-a7cf-3ff3edac1592', CAST(N'2013-11-29 17:30:38.420' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'c93f21d1-e038-488b-a8fb-86d8173f2d24', CAST(N'2013-11-29 17:31:22.537' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'b8937c12-329a-4185-9cc7-c9e6c09d9166', CAST(N'2013-11-29 17:38:03.243' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'673157c2-db0c-4142-870b-33acb637ca51', CAST(N'2013-11-29 17:49:03.817' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'91075069-7d6a-49d7-9f7a-34226396df8d', CAST(N'2013-11-29 17:50:45.737' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'3ba21688-152c-495e-a7f3-4e2a5f1e1834', CAST(N'2013-11-29 17:52:10.653' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'2ba52710-fd6e-4828-80fc-a1ee65ccbf9b', CAST(N'2013-11-30 13:37:44.240' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'f5a162ab-bce6-4b00-be74-b4ed0ec05229', CAST(N'2013-11-30 13:47:03.470' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'799fd5a0-a056-430a-a1a6-5cf7855174be', CAST(N'2013-11-30 13:50:46.927' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'2141fd92-b7d1-4369-be56-2d32df931281', CAST(N'2013-11-30 13:59:21.027' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'381e00f4-b2ed-4f8f-93f8-ac438726d6dc', CAST(N'2013-11-30 14:05:43.737' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'e97bd323-b781-4062-935c-06a625e1fcb1', CAST(N'2013-11-30 14:07:41.100' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'1a704665-bdbe-41b8-8a98-6ccc1dd8b7e9', CAST(N'2013-11-30 14:13:21.880' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'b7467fe1-dcde-4401-9e15-fbb853e23528', CAST(N'2013-11-30 14:13:51.470' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'7739d5df-0d32-418a-a723-ee61eb027861', CAST(N'2013-11-30 14:52:50.663' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'02beee48-0704-46e3-9c8d-80f6bcb748df', CAST(N'2013-11-30 14:58:02.657' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'dfb07b0f-81e9-415a-9336-01cceaa9eb6d', CAST(N'2013-11-30 15:12:23.310' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'4909d550-82d9-477c-b608-5f10c076752d', CAST(N'2013-11-30 15:13:08.737' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'7f0e2116-13f1-4240-88de-ff924049423e', CAST(N'2013-11-30 15:29:56.037' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'ccba78e5-b011-483c-b8d1-6fe16e88aaed', CAST(N'2013-11-30 15:32:11.747' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'b1fd955c-e2d0-4e69-abdc-650ab1e44f6f', CAST(N'2013-11-30 15:34:38.937' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'63e7c644-e4d5-48c4-b56c-4c42c2b21bb9', CAST(N'2015-03-17 18:29:02.070' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'76f13b77-19dd-4f59-8ef7-b0d8734b1c9b', CAST(N'2015-04-01 18:51:47.993' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'e19efd77-79f1-420d-bc7d-b3e37f3e2f8a', CAST(N'2015-04-01 18:51:57.817' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'1e0a69f0-b663-434a-91ae-5f79792bf923', CAST(N'2015-04-01 18:52:05.657' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'ba1e9286-c145-4e53-b0bd-90ef55ff78cd', CAST(N'2015-04-01 18:52:12.933' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'01f9dcca-3e7c-4abd-bc32-684f7c737607', CAST(N'2015-04-01 19:25:42.193' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'547873ef-8bd0-428e-9fce-692b8d414c58', CAST(N'2015-11-10 11:17:09.230' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'e93292e1-a5c1-4c4c-81e0-c98165053d2e', CAST(N'2015-11-10 11:17:30.007' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'2e1ae49d-9078-42a7-9bc7-28fccf7c8497', CAST(N'2015-11-10 11:17:43.620' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'73e6f759-45a7-42f0-8b1b-04ab28994ee0', CAST(N'2015-11-10 11:18:01.977' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'b77ee6a1-b4b0-4110-a30b-5d29483a1ed4', CAST(N'2015-11-10 11:18:25.650' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'069a4c55-9708-487d-82b3-5921cec72448', CAST(N'2015-11-10 11:18:45.033' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'50b16fe5-f997-46b9-be44-b4461c6547ee', CAST(N'2015-11-10 11:19:07.873' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'3c2d37d6-0a08-4de9-a1ab-a69ebca68fea', CAST(N'2015-11-10 11:19:26.117' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'd1adad70-d997-4a6f-81a8-4e26f7373f67', CAST(N'2015-11-10 11:37:08.063' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'6cf2bda3-f5c5-4707-a4cf-d14bb1eff889', CAST(N'2015-11-10 11:37:36.550' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'032e7daa-3e71-42e8-9bd0-4f9c53b1d91f', CAST(N'2015-11-10 11:37:36.943' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'f76d6b34-3136-49d0-83a4-fd1e99441278', CAST(N'2015-11-10 13:05:46.600' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'5f1c0eaa-051f-4a91-a5cb-77fced6ced40', CAST(N'2015-11-10 13:05:46.783' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'2dd3d1b0-2536-425a-a717-f7f027896b39', CAST(N'2015-11-10 13:12:34.543' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'0b0dee3a-6a30-4d35-8b0b-2c235b13b439', CAST(N'2015-11-10 13:49:24.027' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'f711ffcf-89eb-461d-b86b-c958a3b23ec0', CAST(N'2015-11-10 13:49:24.117' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'6bdbe0c9-ad18-46f5-aac2-a5a9aa2d2f6e', CAST(N'2015-11-10 14:20:52.090' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'3b918354-a4e8-46cb-b827-9e7cc9e09017', CAST(N'2015-11-10 14:20:52.240' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'ca9c3290-a774-48fd-8c8d-8cf8a0fce80d', CAST(N'2015-11-10 14:35:27.500' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'58c941ed-9360-4197-9adc-226a7067003a', CAST(N'2015-11-10 14:35:27.903' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'9df9fea5-4b77-4527-95c6-c06a9143bd85', CAST(N'2015-11-10 16:12:54.633' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'235ef765-0ca9-48c8-9ea7-0efe884500c6', CAST(N'2015-11-10 16:43:57.053' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'07b3f708-356d-4e50-8aec-2b8d911d2c09', CAST(N'2015-11-17 13:28:58.520' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'f361adf7-91b1-4d0d-95b4-6bfd08226f9b', CAST(N'2015-11-17 13:28:59.047' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'cacd449b-8b54-4d5e-9bb9-de2cbd8ec83b', CAST(N'2015-04-01 19:25:50.470' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'ff6481d4-bf8c-480a-ba27-aff2e0c6465a', CAST(N'2015-11-17 13:28:59.150' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'1d8b9e78-247b-405c-bfca-f386781fa0f4', CAST(N'2015-11-17 13:28:59.240' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'65845efa-9750-498f-aa0f-c02d63f0b3f4', CAST(N'2015-11-17 15:00:32.657' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'6b805924-da8f-4787-b2bf-14ab59c71cfd', CAST(N'2015-11-17 16:36:29.593' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'6159978c-5e9d-44fe-bbc5-6ce3f2edff1e', CAST(N'2015-11-17 16:53:45.047' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'afeb5970-c59d-4e3a-be6f-195fd549e484', CAST(N'2015-11-17 16:55:37.643' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'a368be43-07f8-4105-89b2-054f27804c00', CAST(N'2015-11-18 09:14:03.423' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'db37c086-7755-4102-894c-50a623cb9837', CAST(N'2015-11-18 09:14:03.843' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'd5804421-4e15-4fe6-a938-df33e13617f4', CAST(N'2015-11-18 10:21:15.760' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'fbf89dee-5c97-47c4-9cbc-d56cf7307143', CAST(N'2015-11-18 10:48:37.177' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'c75115e7-36ab-4728-be0e-0880f9a3ba0f', CAST(N'2015-11-18 10:48:37.273' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'6a27184d-0641-4363-97c0-3eb9249a46d6', CAST(N'2016-03-04 09:56:25.703' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'6bb3eb5a-a0f1-4cd6-983f-06c9dd43942e', CAST(N'2015-04-01 19:27:02.563' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'5b3a307f-aaf2-454e-84c5-8b2850198c29', CAST(N'2015-11-17 14:15:12.767' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'a823f3eb-fe40-4c4a-a686-3f7e6fae9cc1', CAST(N'2013-11-24 01:06:25.780' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'd6e92ac4-8ff9-4e70-b791-9e9360bdd125', CAST(N'2013-11-24 01:06:50.890' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'7cafdd0d-a268-40c6-b815-fbafe1ebb7b0', CAST(N'2013-11-24 17:05:40.623' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'd83cd8a1-8201-415d-8fa0-98410cfeea88', CAST(N'2013-11-24 17:08:59.967' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'5e80e9cd-5772-43e1-8dfb-c8dd22676ff2', CAST(N'2013-11-24 17:14:10.437' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'668a1e0b-29eb-494d-95e5-bce324479dad', CAST(N'2013-11-24 17:14:58.047' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'c3884641-dd52-42b7-a3b7-97b3ce9642a4', CAST(N'2013-11-24 17:16:03.653' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'a58772ef-1ad8-4dea-b297-e668a0f387ad', CAST(N'2015-04-01 19:08:57.000' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'a740434a-8500-41fb-9101-a34524ccb635', CAST(N'2015-04-01 19:09:05.203' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'8955bcfb-ed26-44b9-90f9-5978490e5d0e', CAST(N'2015-04-01 19:09:15.857' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'0dfb363b-d701-4f45-8397-3a1f53b725c0', CAST(N'2015-04-01 19:09:21.990' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
GO
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'29674416-f7e8-4500-a9b2-0442907a1511', CAST(N'2015-04-01 19:09:27.810' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'57546a33-151f-415f-bec3-f58656927101', CAST(N'2015-04-01 19:10:02.773' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'73dd584c-1322-4f40-aaf6-b11105350951', CAST(N'2015-04-01 19:10:09.097' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'f58aa8ea-7a9c-48d2-9634-bf6fc54d0f88', CAST(N'2015-04-01 19:10:20.657' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'3b87d580-494f-4425-8ecf-6630445ed7d0', CAST(N'2015-04-01 19:10:54.290' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'b6596b57-ef38-4190-ac40-425f6110a4b3', CAST(N'2015-04-01 19:11:04.367' AS DateTime), N'admin', N'登录失败', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'c39322f9-23e4-40e3-a32f-855358d26985', CAST(N'2016-03-04 11:02:43.320' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'c91cb646-300f-4a7d-9769-04a64f8735be', CAST(N'2016-03-04 11:03:23.747' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'ef8f2d6a-74d4-4f04-a070-01262f991c85', CAST(N'2015-11-11 08:54:07.827' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'0187e9fe-e4a5-4bb7-966a-83e80383dc00', CAST(N'2015-11-11 15:39:18.000' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'1de30a42-2000-49f3-9be2-13ea7d231f45', CAST(N'2015-11-11 15:39:18.123' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'5b8d6e54-b4f7-4882-8d0c-09c4db316ec1', CAST(N'2013-11-23 17:32:08.420' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'a6f28043-47ad-422d-8666-713cdf8ea94e', CAST(N'2013-11-23 17:33:39.340' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'84decb60-dd1a-4c78-afb1-f0849a5a1290', CAST(N'2013-11-23 17:35:35.047' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'3b126ea4-06f0-4f7b-bd53-3334068fb6ca', CAST(N'2013-11-23 17:51:24.967' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'60b4dd64-da37-4def-baab-f6132c5946c0', CAST(N'2013-11-23 17:53:00.390' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'4f2f3d31-bd43-4978-a521-7edf3468557c', CAST(N'2013-11-23 17:53:01.357' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'583814bc-ce70-4b37-a779-14ec1a97f6f7', CAST(N'2013-11-23 17:53:01.420' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'e6af91fa-40c5-4bbf-96f0-33c6d9760a52', CAST(N'2013-11-23 17:53:35.263' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'1a32fa3c-b96f-4569-9fdc-2debd6276fe7', CAST(N'2013-11-23 17:55:01.590' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'bcde7e78-9ec1-4341-bbdd-f7b48a785478', CAST(N'2013-11-23 17:57:38.250' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'1aee461c-bb96-4565-9a77-5c24248f72a3', CAST(N'2013-11-24 00:49:22.467' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'28ad4170-f08f-44ff-a9f0-5511c70bea97', CAST(N'2013-11-24 00:51:27.297' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'757a9568-6ff8-4d4f-88c0-122ed267dc42', CAST(N'2013-11-24 00:52:19.607' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'22a45101-91af-4b2f-87e6-a7ae74633c12', CAST(N'2013-11-24 00:53:25.950' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'2fb678cf-7918-49d1-9de5-fe1819d33283', CAST(N'2013-11-24 00:53:53.000' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'3b2401f9-4c53-45e4-b0f8-3ad688613989', CAST(N'2013-11-24 01:03:29.590' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'1af16d10-8b37-46ab-8f3f-3a9f93d2fbae', CAST(N'2013-11-24 01:12:13.530' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'27e9e4d2-479e-410e-bae9-cb18c3ccf7d6', CAST(N'2013-11-24 01:15:23.153' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'b95965c7-c58d-476a-947a-baccac96c974', CAST(N'2013-11-24 01:16:04.920' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'07005680-a47e-448c-a56c-7197ef63722a', CAST(N'2013-11-24 01:16:42.810' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'256d33b4-5292-49a8-b910-c0fe4512dab0', CAST(N'2013-11-24 01:20:16.700' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'97e8b7fb-6c01-44fc-b3ff-ad1ad747eb9d', CAST(N'2013-11-24 01:22:12.233' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'fcf79524-fd8b-487b-aa1a-97fec4af7b03', CAST(N'2013-11-24 01:23:30.903' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'799958c8-d493-4d90-a0b6-cd8530777158', CAST(N'2013-11-24 01:24:47.247' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'0156d901-9eec-46ff-98e4-6590678d7dfc', CAST(N'2013-11-24 11:32:46.810' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'9665f0cb-68e4-417f-adf4-c851ee463543', CAST(N'2013-11-24 14:05:18.373' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'772644aa-77bd-43f3-9e7a-f4710a81eee7', CAST(N'2013-11-24 14:18:12.497' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'2585aedb-ce22-4978-a7c2-be9967b9d4fa', CAST(N'2013-11-24 17:01:45.280' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'c3aeb35a-cccb-4893-86a1-56a339926a5a', CAST(N'2013-11-24 17:02:46.607' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'bde2bf3f-80be-492c-93ed-a206546029eb', CAST(N'2013-11-24 18:28:06.420' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'f636b962-5e11-4487-bf48-cf6874fe2078', CAST(N'2013-11-24 18:29:35.263' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'999955b5-35f0-4b2b-aab8-dff747556728', CAST(N'2013-11-24 21:26:15.060' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'9c73f797-694f-4f67-8259-0f3d4c1c834d', CAST(N'2013-11-24 21:31:39.280' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'dcb91805-dc72-45dc-a028-1c788ee527f9', CAST(N'2013-11-24 21:32:28.653' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'ba956237-9de4-474d-9751-be08fe40fb00', CAST(N'2013-11-24 21:52:48.107' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'c239ed8c-af28-492e-94f2-c6e7e8c03a15', CAST(N'2013-11-24 22:01:45.170' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'934d1b52-1dd4-4ebd-9198-3c6e218cfc63', CAST(N'2013-11-26 20:46:59.890' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'ee63b75f-da10-451b-b06d-39afdc6616ba', CAST(N'2013-11-27 13:42:08.827' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'7cacf157-1a05-46e6-951d-ef115ee66c30', CAST(N'2013-11-27 14:21:04.640' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'60d7aac5-8053-469f-81e6-d0e4760668d8', CAST(N'2013-11-27 14:31:08.153' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'12c46756-0608-4f11-9cdc-80c0611b4f26', CAST(N'2013-11-27 14:41:41.780' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'8a615106-3f93-4e5a-91b6-28fd5f4c30a9', CAST(N'2013-11-27 14:50:57.077' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLoginLog] ([SysLoginLogId], [CreateDate], [Account], [Status], [IPAddress], [IPAddressName]) VALUES (N'5833c449-fef9-4c29-989d-f2bc8f7fd876', CAST(N'2013-11-27 14:58:03.403' AS DateTime), N'admin', N'登录成功', N'127.0.0.1', N'本机地址 CZ88.NET')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ff18dc20-fe9e-455b-b614-a938c9cdf913', 5, NULL, N'登录日志管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:22:06.327' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'107eca29-c8f0-4fe1-a18d-396710d87ccf', 5, NULL, N'操作日志管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:24:40.840' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0c7b38d2-9748-4abd-a5dc-76f7eb7340e8', 5, NULL, N'系统异常情况', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:24:49.030' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a624168b-b7ac-46c0-9ba9-e902749316d6', 5, NULL, N'操作日志管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:25:28.047' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5d4dd39f-e769-4d7a-845a-e33ca25545c9', 5, NULL, N'个性设置', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:25:30.700' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b5a67933-31fe-4516-ac97-bf24784446c8', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:26:00.700' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'01aed648-7bd1-42c6-9370-b642fbd81de4', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:26:09.200' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ecb3dbe5-ddbc-4337-856b-3d1a624077cc', 5, NULL, N'系统接口控制', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:26:27.233' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'9cafffdf-48c1-4640-8157-88d58e7cfe26', 5, NULL, N'系统接口控制', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:32:31.140' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5c6d1100-5edb-4146-9852-125ef662b5c4', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:33:43.123' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'fe098575-6dd3-4497-90ed-f77d0d29ff43', 5, NULL, N'系统接口控制', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:33:50.920' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'92a5c187-2fcf-4bfc-857f-d1eb5e1caa7a', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:35:50.200' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b7f57a47-695a-4342-9978-bd6714cfee29', 5, NULL, N'系统接口控制', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:36:13.653' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0b477554-34a0-48d4-ac97-f57928f697a9', 5, NULL, N'系统访问控制', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:48:31.467' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'43e64e39-fef5-42c2-aa90-5dfd15dcf143', 5, NULL, N'辅助资料管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:48:41.153' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e6c049bb-93f5-48cf-8dbc-e480bd4eda86', 5, NULL, N'动态表单管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:48:44.433' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'85b9a099-9f33-411e-88f2-8beb3b5e9973', 5, NULL, N'登录日志管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:48:54.577' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'2b9d1661-98eb-408c-8496-20ad80fd4d62', 5, NULL, N'操作按钮', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:49:03.280' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'1f5ab8f5-fa08-400d-acd8-e69a89e21456', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:49:23.653' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'af934471-747b-4f5c-b21f-d12c72cf3c29', 5, NULL, N'操作按钮', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:49:29.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6dab2032-5a3b-4d87-ada4-b3d032b14e33', 2, N'BPMS.Entity.BPMS_Button', N'操作按钮', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', N'127.0.0.1', CAST(N'2013-11-23 17:49:40.467' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a8d0e126-6e9e-4083-86b2-57883b675e4d', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:51:35.327' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'8e79541c-9488-4631-84dc-02b13cd8b52f', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:51:41.170' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c9c44404-325c-4be1-b4f3-39d7ab18d032', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:53:20.297' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'413227ac-efad-4727-b551-2b905dbe2dcc', 2, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'127.0.0.1', CAST(N'2013-11-23 17:53:28.403' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'573d4dee-121b-40b2-800c-00fb2f29875e', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:53:42.403' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'de834279-a9b6-4003-bc9f-128eab28d0f6', 2, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'127.0.0.1', CAST(N'2013-11-23 17:53:48.263' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'21d9596e-a8d4-4604-a437-3055a5325c28', 5, NULL, N'操作按钮', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:53:51.013' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'89191c3d-a14f-47a9-ac5e-b0e160898fc5', 2, N'BPMS.Entity.BPMS_Button', N'操作按钮', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', N'127.0.0.1', CAST(N'2013-11-23 17:53:59.420' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'78f33c45-1e10-49bf-ad2e-69824bbc745f', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:54:03.187' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd4d3cf9d-91d8-421e-889c-744ad618a05f', 5, NULL, N'数据资源库', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:54:05.450' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'90521472-4d8f-440e-9c37-f2756c2b934b', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:54:14.153' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'49685c7b-e79e-43b1-9aaa-b183d72025df', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:54:40.983' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'aac45980-149f-4b8e-8357-d27dfc5ef714', 5, NULL, N'数据资源库', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:55:06.577' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'47950c3e-b4a2-4c1e-9b10-a4cc49523867', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:55:25.733' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6d323481-7afd-4989-b526-604b9d95ffde', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:55:49.483' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'2a4d4027-c737-4801-8eee-78f8d7e96a9a', 5, NULL, N'数据资源库', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:56:13.750' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'19892226-a2fb-4a9b-ad6a-a6f0e6abc471', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:56:17.327' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'146d4111-8d16-4dae-92f1-ad7f0c4a29d4', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:56:22.450' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'cdc8e8a3-2b8d-42ac-a54c-1ab83d424681', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:56:28.390' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'8da3532b-6714-42b1-94b4-fa781d2341c2', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:56:58.107' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'02fdd6aa-a7cc-4477-b3d2-e85d07160f14', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:57:10.170' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'3eeb6314-8ba9-41eb-a8e6-b94dad57dc3a', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:57:17.543' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c15da0ec-5262-4fa6-ae35-7470476868b3', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2013-11-23 17:57:44.780' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'02fa81a1-b2e1-44d7-a234-c5eade3c5f97', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 11:33:03.450' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e595334e-0249-4552-b160-b20a2a076ba8', 2, N'BPMS.Entity.BPMS_User', N'用户管理', N'0026924E-F94F-43DC-B95F-13CEC7C1ED5C', N'127.0.0.1', CAST(N'2013-11-24 11:33:32.047' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'884d0c15-f45d-438a-975f-857c73c45dd4', 2, N'BPMS.Entity.BPMS_User', N'用户管理', N'0026924E-F94F-43DC-B95F-13CEC7C1ED5C', N'127.0.0.1', CAST(N'2013-11-24 11:33:38.390' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'920eb77b-6df0-4600-bd01-270dee593447', 2, N'BPMS.Entity.BPMS_User', N'用户管理', N'0026924E-F94F-43DC-B95F-13CEC7C1ED5C', N'127.0.0.1', CAST(N'2013-11-24 11:33:45.763' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6df4abdd-c040-4a27-afc1-199ca5c63d57', 2, N'BPMS.Entity.BPMS_User', N'用户管理', N'0026924E-F94F-43DC-B95F-13CEC7C1ED5C', N'127.0.0.1', CAST(N'2013-11-24 11:33:54.983' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b634a856-1448-43f3-a87c-44b0513e6ede', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 11:59:44.750' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5f6e361a-2696-40ef-a46e-55de995f49a2', 2, N'BPMS.Entity.BPMS_User', N'用户管理', N'0026924E-F94F-43DC-B95F-13CEC7C1ED5C', N'127.0.0.1', CAST(N'2013-11-24 12:00:00.013' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e9927656-eaa3-4f19-9dd5-b0105c008e8c', 5, NULL, N'用户权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-24 14:05:25.060' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5c32624c-29b6-4cee-8844-e1d9b7b1170a', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-24 14:05:30.280' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'7a56bd97-8f4f-4d3e-97de-1f74ee828691', 5, NULL, N'操作日志管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 14:07:03.873' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'44259c8e-e35f-4b9a-a4d1-2fd6f3458baa', 5, NULL, N'动态表单管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 14:07:41.857' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ac3ed56a-91b0-4305-8d05-cc46cff1d7dd', 5, NULL, N'动态表单管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 14:08:05.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd2954a31-6164-47fa-9e8d-3a1c58e4a1e6', 5, NULL, N'动态表单管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 14:08:09.607' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'df9d00ea-3129-4a68-9e9c-6305b9e2333f', 5, NULL, N'采购订单', NULL, N'127.0.0.1', CAST(N'2013-11-24 14:09:52.403' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'cca2ad1d-2469-4c10-88f7-0ea6330e878a', 5, NULL, N'销售订单', NULL, N'127.0.0.1', CAST(N'2013-11-24 14:09:55.890' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'25e4ebba-135a-4ed7-8594-6386f195c89d', 5, NULL, N'角色管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 14:18:16.200' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'7ff89137-a707-42e8-9154-72807502a38d', 5, NULL, N'采购订单', NULL, N'127.0.0.1', CAST(N'2013-11-24 17:01:50.060' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'346311fb-40e1-4237-8a38-3836dd7d7e6e', 5, NULL, N'采购订单', NULL, N'127.0.0.1', CAST(N'2013-11-24 17:02:51.390' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6363dffb-8e14-4834-8415-23dc14aa3d9d', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 17:03:07.467' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'7d5667da-00fd-422c-a2ce-45661532e25d', 3, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'cf123887-2a4f-417c-8f62-3ec77c0fb75b', N'127.0.0.1', CAST(N'2013-11-24 17:03:16.107' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f7cf155c-ea23-4a0f-b273-897738dc4604', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-24 18:28:18.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'295eb852-1cc0-4c7c-8a2c-0983fe2f18b8', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 18:28:50.170' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c2ae7595-ce20-4f33-bac1-27c58394d017', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 18:28:53.123' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'40721dc0-ab28-4dd8-a841-4a070c96ef62', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 18:29:02.437' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'10acbd46-38f9-41d6-ab8a-89904041ac8e', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 18:29:09.403' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0c66298c-95ee-4fb6-9ec1-fe63852f3927', 5, NULL, N'角色管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 18:29:15.340' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a53b1fbe-0a5e-42cd-a4ad-eefe7c4ec087', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2013-11-24 18:29:18.310' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f7f95fef-1ea9-41df-90c1-800c2c88440b', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-24 21:26:20.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'42b43340-377b-463e-aca5-039cbb802b6c', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 21:29:52.373' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'691b0ce1-2c23-49a1-9b7a-090b4a1392cb', 2, N'BPMS.Entity.BPMS_User', N'用户管理', N'0026924E-F94F-43DC-B95F-13CEC7C1ED5C', N'127.0.0.1', CAST(N'2013-11-24 21:29:58.340' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5e2b5a17-c813-4b81-a5f9-ac6a80391705', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 21:31:42.123' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'367d5100-43de-49b9-a244-fa10ddc6779e', 2, N'BPMS.Entity.BPMS_User', N'用户管理', N'0026924E-F94F-43DC-B95F-13CEC7C1ED5C', N'127.0.0.1', CAST(N'2013-11-24 21:31:49.047' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'eadaf594-75b5-4e22-a8ab-5ba63483cf8d', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 21:32:31.920' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b44045ef-3b2e-43fb-9f27-702ea70e1034', 2, N'BPMS.Entity.BPMS_User', N'用户管理', N'0026924E-F94F-43DC-B95F-13CEC7C1ED5C', N'127.0.0.1', CAST(N'2013-11-24 21:32:37.687' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a65f3184-843a-40dd-a3d0-226db866f553', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-24 21:52:53.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'7b64a1c9-b86e-4561-ac96-1353f4943be4', 5, NULL, N'用户权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-24 21:55:05.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'73e2ace1-a569-46e3-9016-75a12dfa0392', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2013-11-24 21:55:15.030' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ffbccfd5-78d5-4679-ae5b-9d4d2645eb63', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-24 21:55:37.357' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b101797e-2443-4560-914a-d3bcc38ef264', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 22:01:51.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'af643387-64ce-41c5-984f-4eac4e3d6059', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-26 20:47:04.937' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'21ba3e33-cf0a-4a4c-bf44-89d3338a77a6', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 13:48:43.763' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'9514bfac-d5a0-4359-b238-fe256e6792e0', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 13:49:19.327' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c7300c2d-2d6a-48b5-a43f-fb07057c3bea', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 14:21:12.090' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd812853e-4cb0-41f5-a03d-43eab304d277', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 14:21:23.140' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'4c0c861b-0f7f-4ed0-832d-187a7375a05c', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 14:31:18.263' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e22dac68-343a-4aae-9d89-049699f5dd6e', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 14:41:47.483' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a08212d8-ab1e-4d21-a5f3-49c0cbf99579', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2013-11-27 14:50:38.013' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c3ccd42b-34ad-4909-8ca0-50829686140b', 2, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'31b05701-60ef-405c-87ba-af47049e3f48', N'127.0.0.1', CAST(N'2013-11-27 14:50:47.357' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'3cb06a79-da23-4449-a433-577d19044fc1', 5, NULL, N'用户权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-27 14:51:05.840' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'4747665e-40cb-460a-9ca8-cead0d634e36', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2013-11-27 14:58:34.233' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'cc8a984e-9147-41b6-b985-b985a8f2e92d', 2, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'31b05701-60ef-405c-87ba-af47049e3f48', N'127.0.0.1', CAST(N'2013-11-27 14:58:51.560' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6e7a66e3-41df-470d-888c-a6291a59eb0c', 5, NULL, N'用户权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-27 14:59:05.467' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'7ef3c322-115e-423d-8aea-8bb420f3b4de', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-27 14:59:25.530' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e4cf93d2-26fd-4eeb-b087-27fc92d051af', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:49:42.960' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'edd7c238-bea7-468e-83bf-ef8a31715f5f', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:49:51.433' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'acd263ad-8608-4622-832f-7aaa32969ba6', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:49:58.247' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
GO
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'94383ffd-5bd9-4788-a219-935857194c4a', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:50:06.033' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f9cd854d-c402-4f7a-838d-ed6e81c1cbbd', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:50:11.437' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd2a92569-4b20-455c-aab2-b38b2fd31783', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:51:32.820' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'4da794df-ef0c-4542-8f7c-46652a54e41c', 5, NULL, N'角色管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:51:54.943' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'dc3f571c-f464-4fd0-8397-61d7806a13f4', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:52:02.553' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'7611c462-1398-4007-80b0-2ddc773a625d', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:52:05.770' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a67c18cf-20af-403b-afc7-db641c3cdf60', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:52:08.613' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c2dddda6-0876-4a45-8e04-3f37d51faa51', 5, NULL, N'用户权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:52:11.260' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6d902587-b845-442e-8145-8e3160b20885', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:52:20.870' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f0eadb3e-4d8c-4774-b5d0-6f5e714dfbab', 5, NULL, N'动态表单管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 14:08:07.450' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd431c3a0-9d6b-4d20-af1b-659935e6df72', 5, NULL, N'系统接口控制', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:52:32.623' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'30fcfd11-2bef-4713-bca5-7456b1199ac0', 5, NULL, N'系统访问控制', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:52:38.100' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5169d9e4-976f-45eb-81fe-fbb3af8758b2', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:55:10.697' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'bb3d469a-a169-4566-8f30-f068a81bfcce', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:55:17.720' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6ab10383-a3b9-4938-a9ff-1fb955165d62', 5, NULL, N'角色管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:55:31.760' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0b655aa2-50ac-47b3-b3dd-bb39fd26b68a', 5, NULL, N'动态表单管理', NULL, N'127.0.0.1', CAST(N'2013-11-27 17:56:20.967' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6244f111-2c4b-4da8-995a-489e6ac8a39a', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-28 11:32:26.100' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'20ad77e4-35ef-4f3b-92af-125be73d4f93', 2, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', N'127.0.0.1', CAST(N'2013-11-28 11:32:54.867' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c861b6b1-1b0b-44bc-9c76-909007f3f96f', 5, NULL, N'操作按钮', NULL, N'127.0.0.1', CAST(N'2013-11-28 11:33:16.203' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'2ead14a0-a5c0-4654-bb56-cb4b00922611', 5, NULL, N'新闻发布', NULL, N'127.0.0.1', CAST(N'2013-11-28 11:33:58.693' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd5509af8-5338-4970-b10d-9f969a7cfa95', 5, NULL, N'新闻发布', NULL, N'127.0.0.1', CAST(N'2013-11-28 11:38:27.243' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'feef798e-970a-4192-a688-044bdda114bc', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-28 11:39:02.963' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'99e286a4-b95f-410b-addc-f7db4e6e437f', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-28 11:39:32.963' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'50faf9d5-b84f-444b-8db9-8c99f1bac404', 5, NULL, N'新闻发布', NULL, N'127.0.0.1', CAST(N'2013-11-28 11:40:41.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'8727ab9c-1ec2-4fbb-8743-c029612aea92', 5, NULL, N'新闻发布', NULL, N'127.0.0.1', CAST(N'2013-11-28 15:57:25.423' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'62391c44-3a32-4521-b219-7b01ce29f81f', 5, NULL, N'新闻发布', NULL, N'127.0.0.1', CAST(N'2013-11-28 16:09:09.680' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5c7f43f2-30d2-4515-bb36-51aee86358d4', 5, NULL, N'新闻发布', NULL, N'127.0.0.1', CAST(N'2013-11-28 17:53:31.800' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'bc6247a6-57a7-4287-b582-586334ad82d7', 5, NULL, N'新闻发布', NULL, N'127.0.0.1', CAST(N'2013-11-28 17:59:21.740' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'757a9846-0905-4ae8-9fb8-8a1b1703e1f3', 5, NULL, N'新闻发布', NULL, N'127.0.0.1', CAST(N'2013-11-28 18:01:10.100' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'695b18d7-073d-4f6e-b29b-87e0e6bf08d8', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-29 13:18:11.773' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f5359f48-105d-4ebd-9411-d9a804e69aaa', 5, NULL, N'新闻发布', NULL, N'127.0.0.1', CAST(N'2013-11-29 13:18:52.170' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'7967c660-cfb4-4e8f-8d7c-970467afde98', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 13:19:06.560' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'80ed37bd-b335-4bb7-943c-dac382036e54', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-29 13:37:59.723' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'52453adf-4424-4a85-8b2c-0e7124b4b86a', 2, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'127.0.0.1', CAST(N'2013-11-29 13:38:31.730' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd10fffdd-da94-4af1-8a5b-91cd6d5cfa98', 5, NULL, N'操作按钮', NULL, N'127.0.0.1', CAST(N'2013-11-29 13:39:40.053' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'2f68f5b0-e867-4489-ab88-d62df77ad724', 1, N'BPMS.Entity.BPMS_Button', N'操作按钮', N'c7e7d4b3-d21e-4dcf-9e39-20e099ce4375', N'127.0.0.1', CAST(N'2013-11-29 13:42:55.083' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'08b47950-8292-40d9-a77c-5c22ab421ab0', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-29 13:50:41.750' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'3286ebf3-a8ca-442f-ae23-5971d11958b9', 5, NULL, N'操作按钮', NULL, N'127.0.0.1', CAST(N'2013-11-29 13:50:44.477' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'66e42cde-06d7-4e7d-961e-3fa7c3d802e0', 2, N'BPMS.Entity.BPMS_Button', N'操作按钮', N'c7e7d4b3-d21e-4dcf-9e39-20e099ce4375', N'127.0.0.1', CAST(N'2013-11-29 13:50:59.977' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'42688e23-8626-4e4a-beb3-8a68fea8eaad', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-29 13:51:38.677' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'1d092859-fb76-478a-8dea-c036d31e0f0c', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 13:52:48.577' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'eaedb52d-5279-4c46-b391-36f185b70ad9', 5, NULL, N'操作按钮', NULL, N'127.0.0.1', CAST(N'2013-11-29 13:53:01.460' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e27bcb14-bec2-41a6-8eaa-650f2a7be2de', 2, N'BPMS.Entity.BPMS_Button', N'操作按钮', N'c7e7d4b3-d21e-4dcf-9e39-20e099ce4375', N'127.0.0.1', CAST(N'2013-11-29 13:53:09.267' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6c67ef56-a8c0-44d2-addf-71ad142ba394', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 13:53:20.927' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'76d4f76f-991d-45e5-9745-f74ede44d6ae', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-29 14:03:42.083' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f54ae556-9b36-47ec-8fca-a66192b80b5f', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-29 14:04:26.360' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd7b66edf-caed-44a8-8e9c-93ebbeee28fd', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-29 14:08:08.303' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'32f4182e-87d3-4f20-9831-0ba0e79ae2e8', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 14:24:32.200' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'429be051-d063-4388-b671-37cf96de9540', 5, NULL, N'操作按钮', NULL, N'127.0.0.1', CAST(N'2013-11-29 14:24:55.553' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'549744b3-205a-44df-945d-ac8e953d22a9', 2, N'BPMS.Entity.BPMS_Button', N'操作按钮', N'c7e7d4b3-d21e-4dcf-9e39-20e099ce4375', N'127.0.0.1', CAST(N'2013-11-29 14:25:04.317' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0cea6b64-3b48-4995-94f4-dcf534627cb9', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 14:25:58.540' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'9417cfc8-8472-4bb6-91c9-367d2215163c', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 16:32:54.857' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a36d3cf8-88c0-4a60-85c3-7072f1ff3786', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 16:51:48.693' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6792972c-779f-42c2-8873-88a1665713b5', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 16:54:52.133' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'fb89f543-05dd-447b-b02a-a51dfbed5e61', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 17:05:06.437' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a785e0cb-7237-4a46-ba69-e36cb20b2533', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 17:30:43.413' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6c82ec69-c9cf-493e-8bb0-dcbc02c2bc9b', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 17:31:27.607' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c7980a21-2f53-40e7-a6cc-e23b27b39650', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 17:38:08.330' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'eb28f370-7521-431f-86f0-f3c225d25a14', 5, NULL, N'新闻发布', NULL, N'127.0.0.1', CAST(N'2013-11-29 17:45:56.200' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c250d635-f940-4fdb-aca6-fb8c7cca8767', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 17:46:00.460' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a0f703b8-5d80-4348-a5a3-101df17f02fb', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 17:49:13.567' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c2ad5768-6cb6-4f51-b0a1-3749022ea843', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 17:50:52.643' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5018e49f-e9d1-430a-a19b-825b828538d0', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 17:52:15.833' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'40696537-8ea7-4b97-938f-3782990fefae', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-29 17:54:01.357' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'630394f8-eb96-4cdf-98e8-84b104837b4f', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-30 13:37:52.187' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'630907e6-9029-43a5-940a-d778a6653dc7', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-30 13:39:21.397' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f078da88-3d6b-42ed-b23d-5920535af2c3', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-30 13:49:07.650' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e13fdd10-3d60-4372-bb3c-d0d40107034c', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2013-11-30 13:51:16.117' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a0f716fa-0941-475b-b0ac-973af19a8b3e', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2013-11-30 13:51:21.383' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'efe4ad6a-5f37-47c2-8821-06eac0c26e08', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-30 13:51:28.670' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'36b52f5b-58ed-4e5f-aa02-da3ffa44934e', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-30 14:02:10.613' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b84f9a26-973e-4dd1-950f-e31ea3cf5d0d', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-30 14:06:07.843' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'cfefd258-5891-4dc1-9cd3-0ee10b2b7d53', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-30 14:07:45.930' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c80b8cc4-cd5b-40e1-8029-31a0d5712063', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-30 14:13:26.010' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a6abdcca-dc3a-4fb0-8e9c-03b743a2dbb2', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-30 14:13:55.837' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f0628867-fbea-4c0d-ab9c-3dea66eebbb0', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-30 14:14:34.993' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'73dfa4a4-1f60-4e57-83d5-29de001de2eb', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-30 14:56:29.593' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'313afd83-ae9c-4cd1-aeeb-c4aac8c03d87', 2, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'ff01d1e1-6a9e-4183-aee7-6708d76375d1', N'127.0.0.1', CAST(N'2013-11-30 14:56:44.427' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ffb07f66-432f-4130-ad96-9b977ae9b82f', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-30 15:12:32.577' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e000e7f1-1245-4bfb-8323-4f1c6653d347', 2, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'ff01d1e1-6a9e-4183-aee7-6708d76375d1', N'127.0.0.1', CAST(N'2013-11-30 15:13:01.173' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'4d50551a-0da0-4955-8b73-1fed0db403b2', 5, NULL, N'打印功能', NULL, N'127.0.0.1', CAST(N'2013-11-30 15:13:12.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'8ce7287e-c067-4ab9-ba4f-2a59c25341ae', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-30 15:13:20.757' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ae9b9bf7-0813-42ca-99a4-03288c4f816c', 5, NULL, N'新闻发布', NULL, N'127.0.0.1', CAST(N'2013-11-30 15:13:22.550' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'3906a1c4-b3bd-4700-8e3b-b656611b36de', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:29:43.403' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'326a4271-c1ed-41c8-b21d-b3520a72e9cf', 5, NULL, N'接口管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:29:56.673' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e00f3bd4-710b-4581-bc25-c26d8a3237ee', 5, NULL, N'采购订单', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:30:05.887' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0ff5c047-06ba-4d06-a373-d9b9a76ddc74', 5, NULL, N'接口管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:32:32.773' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd877951c-10a3-4c88-9cae-4cbc4ea55c4f', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:33:51.097' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5a769c53-2b88-4e79-bd32-c35302269e00', 5, NULL, N'接口管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:34:01.377' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'deb32ef3-5cdb-4bfb-96ab-c6fc0fdf92aa', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:34:21.550' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'8ac011fd-1127-48d3-8c18-424483e41c6c', 5, NULL, N'角色管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:34:51.017' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a25c3478-f924-4b6e-bb45-16c4e59523f0', 5, NULL, N'角色管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:35:28.550' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'42c1b4d5-63fd-4cc0-89a9-3a6043b40ede', 5, NULL, N'接口管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:35:42.060' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b7633009-ba35-4ab1-8b8f-c3029a9875ea', 5, NULL, N'用户权限控制', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:35:45.827' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c88c5327-f133-4f73-8fa9-f36645ceffa5', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:35:49.937' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0377c8b2-d5ec-4478-8193-ded5bad7194d', 5, NULL, N'系统访问控制', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:36:59.243' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'78c9bc9a-d11f-43c6-bf13-39fac941236f', 5, NULL, N'系统接口控制', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:37:08.823' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'fe12a6f9-f029-4e5e-967f-261497556cba', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:37:16.033' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b4316b39-e9cd-4b54-9f21-f8843dab7e04', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:37:21.943' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0f66a346-b138-4fa3-9ba9-af51c583da8a', 5, NULL, N'动态表单管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:37:38.840' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
GO
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd94a6c4a-f93f-4bdb-890e-f3b6a106a35f', 5, NULL, N'辅助资料管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:38:26.157' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'71e28a07-615d-4ad3-a094-5ebd31916392', 5, NULL, N'操作日志管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:38:41.193' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0bd97d8c-d721-436c-b421-7d19959225e5', 5, NULL, N'个性设置', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:38:47.327' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'03951c6d-4eb9-4d7e-9543-3aa95d7ff7ad', 5, NULL, N'操作按钮', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:38:54.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'be29687f-bf5e-4330-a696-6e451a047f93', 5, NULL, N'操作按钮', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:39:13.283' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'04639133-50e7-463e-81a2-cca23751eab7', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:39:24.273' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c6007473-2b77-4aeb-a7a1-4946470d31ff', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:39:32.067' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd3709d9b-b245-4bda-9ac6-45e769744d2b', 5, NULL, N'数据资源库', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:40:02.563' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a0ca01c3-2336-4ba7-9faa-223165055b16', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:41:36.180' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'55193471-b44a-4ec5-9ac8-5ee986e850d1', 5, NULL, N'多级菜单测试', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:41:40.610' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'64529956-2647-4313-9f39-c62d318950e2', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:41:45.790' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6445429f-4981-4022-8d2d-e3d7ee9498da', 5, NULL, N'打印功能', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:41:58.960' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f5053bcc-d235-46c1-aa47-37aa294f3aa3', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:43:49.623' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'7d0273c9-2a82-4d92-b3ff-33765a2463eb', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:43:50.877' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f1cf2b56-fa7b-4713-b678-b641bcc69c9e', 5, NULL, N'接口管理', NULL, N'127.0.0.1', CAST(N'2015-03-17 18:43:51.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'bbc37bc9-72b5-4dcc-af42-2e55a69a0bce', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2015-04-01 19:27:30.643' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'4d724813-54c8-490e-8c40-552919efd148', 5, NULL, N'动态表单管理', NULL, N'127.0.0.1', CAST(N'2015-04-01 19:30:55.927' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'11f9c919-a73d-4671-a8c0-52e40045e709', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2015-04-01 19:31:26.227' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e79409a3-869c-4663-80ad-26cc1c3afbbf', 5, NULL, N'数据资源库', NULL, N'127.0.0.1', CAST(N'2015-04-01 19:32:49.500' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'acb2d88f-fad6-471a-9c65-e9716ccfae4e', 5, NULL, N'数据资源库', NULL, N'127.0.0.1', CAST(N'2015-04-01 19:32:59.470' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'9bbba87f-578a-4c42-bfda-987e715d0864', 5, NULL, N'系统接口控制', NULL, N'127.0.0.1', CAST(N'2015-04-01 19:33:14.033' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'79be5ab3-8e1d-4906-a61f-bb42e87b9011', 5, NULL, N'系统接口控制', NULL, N'127.0.0.1', CAST(N'2015-04-01 19:34:32.083' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd203d315-e678-45bb-868a-45c7d127a570', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 11:37:50.670' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ff04a921-c48b-4571-a765-cc6c978400b5', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 11:38:27.137' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f9127b79-47e7-4e6c-9758-bb3de1951210', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2015-11-10 11:38:38.867' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'56b97c16-c81f-4c6a-b480-6e14224b807d', 5, NULL, N'新闻发布', NULL, N'127.0.0.1', CAST(N'2015-11-10 11:39:02.940' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'49c40e0c-348f-44a9-96e9-5e30e34b1e5e', 5, NULL, N'动态表单管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 11:39:28.207' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'217c1940-a7f2-4abe-88f8-06e676aa3829', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 11:39:34.990' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'820a24a5-bf20-4528-97fe-e630824894cd', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2015-11-10 11:39:36.077' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c3884fb3-d6be-449d-956f-a18c69cc991c', 5, NULL, N'个性设置', NULL, N'127.0.0.1', CAST(N'2015-11-10 11:39:39.210' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'978d4197-c8f8-4890-9d0b-3cbecea158cb', 5, NULL, N'动态表单管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 11:40:01.693' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'3b77e3f7-8e84-4815-9165-4d646021bbed', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2015-11-10 11:40:02.407' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'59123598-7cf0-4940-a66a-8f5b23d271cc', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 12:53:48.157' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'da280751-f950-47a5-8f08-a4d3f2bba107', 5, NULL, N'接口管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 12:54:25.493' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'70dab01f-4e75-4ee2-83c0-e04fa965b687', 5, NULL, N'打印功能', NULL, N'127.0.0.1', CAST(N'2015-11-10 12:55:16.133' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'1ecdf7f1-6238-464e-b2e7-23876a1a18fc', 5, NULL, N'打印功能', NULL, N'127.0.0.1', CAST(N'2015-11-10 12:55:36.957' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e7dfda70-1be0-46d3-a87a-5df8c1835164', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2015-11-10 12:55:57.270' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'1eb03960-8ec4-47ad-950c-d6a0ae3b7fe4', 5, NULL, N'系统参数设置', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:16:52.230' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6df4ac62-65dd-4429-bb60-39195ce83bae', 5, NULL, N'系统信息', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:17:08.917' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b15086ff-a954-4c50-b046-299e9b244567', 5, NULL, N'系统参数设置', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:17:17.117' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'2cee74b7-850a-467d-b696-37991c328290', 5, NULL, N'系统异常情况', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:17:21.457' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'8f59170e-5b71-459c-bb16-1dffcc7b0e4b', 5, NULL, N'系统信息', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:17:26.213' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'3838474b-2a1e-4700-9e42-4cdd7db87175', 5, NULL, N'系统参数设置', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:17:29.300' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f63980dc-2f5e-46e4-b861-b69e4d25947f', 5, NULL, N'个性设置', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:21:05.030' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'da11f37e-1e3d-4a3f-bfb1-3daa88ab4af6', 5, NULL, N'系统信息', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:21:10.670' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'cac6c82b-ad57-4f52-951a-c0c8bf898d2f', 5, NULL, N'系统参数设置', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:21:20.207' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5f80b897-93a8-4e08-97ed-ef037a19e7eb', 5, NULL, N'系统信息', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:23:30.953' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0d475463-533a-44a2-a104-8536bb09a3b8', 5, NULL, N'系统信息', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:23:36.327' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'37793632-8d1b-4049-967a-0edd86bce06c', 5, NULL, N'系统信息', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:23:42.160' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'1fd61457-5d3d-4c4c-8242-c5bcafde728f', 5, NULL, N'个性设置', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:23:42.670' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd0583ec7-54d0-452e-a346-84f1398e4aa9', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:23:56.820' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'67b4ae6e-73d8-427a-acc1-7850a1cc81a1', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:25:28.183' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ca433267-92e7-4468-be90-153d5c68932f', 2, N'BPMS.Entity.BPMS_User', N'用户管理', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'127.0.0.1', CAST(N'2015-11-10 14:26:46.930' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'57a279fe-8e05-4e81-b49f-b4a68f201b30', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:27:02.200' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'76195a9c-88b7-487c-9679-7ca01b724490', 2, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'05e85693-14b0-4582-8063-8fbde85371f0', N'127.0.0.1', CAST(N'2015-11-10 14:28:26.180' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0c54c544-a9c8-48cc-894c-f815e8b88e3d', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'ef5e8b48-5ef4-4e07-bd70-d5c1e6414b20', N'127.0.0.1', CAST(N'2015-11-10 14:28:38.383' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f1d2a8c8-ae59-4b61-afe6-5e0787a37bff', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'e572a3bd-8aba-4ddd-a794-a14303692df1', N'127.0.0.1', CAST(N'2015-11-10 14:28:54.180' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'880d7bb0-0c51-4c8a-9a21-f89cff98706d', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'c62c6939-74dc-4f67-ac5b-5ab1c2b0d85b', N'127.0.0.1', CAST(N'2015-11-10 14:28:59.317' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'1602d285-9475-46b4-950b-d1367ec98342', 2, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'31b05701-60ef-405c-87ba-af47049e3f48', N'127.0.0.1', CAST(N'2015-11-10 14:29:18.997' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ee9f1341-0a5b-42be-8c8c-e137a8dcb965', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'cd235612-a279-45df-aaa8-d25cbbbab87d', N'127.0.0.1', CAST(N'2015-11-10 14:29:43.543' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'332a81b1-cf2e-4e9c-a8b3-3a34f3e26792', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'65a13460-75a1-4753-98f2-0d810f00bf43', N'127.0.0.1', CAST(N'2015-11-10 14:29:48.480' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b0ec9e6e-31c6-4308-90b7-53c502f2ff12', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'39764083-a0bd-4cd6-8ead-3ea689831ed3', N'127.0.0.1', CAST(N'2015-11-10 14:29:53.110' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5a169740-78a7-4426-8063-a98f9ea9be46', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'901659a9-e671-4b2f-b7fa-0d77144fb4c3', N'127.0.0.1', CAST(N'2015-11-10 14:29:59.377' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'9e4dbc1a-dd27-4ee0-965f-e18a47bc4226', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'2c5d2b38-2300-411d-979f-b65eb25846aa', N'127.0.0.1', CAST(N'2015-11-10 14:30:06.080' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a0709ff5-9e59-45ba-a341-2778fd3cebd1', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'75cdb572-da20-4e52-b727-be7c65ec4c72', N'127.0.0.1', CAST(N'2015-11-10 14:30:10.837' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'2ae8a3df-2f9f-4155-a713-c8dd17bc23a1', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'4ec5c981-9f75-48c3-8217-03eb68db11b8', N'127.0.0.1', CAST(N'2015-11-10 14:30:17.790' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'7277259a-7ccd-4abb-85e0-7b445b68f032', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'00fdb9af-2f93-476a-8172-d987873f6697', N'127.0.0.1', CAST(N'2015-11-10 14:30:21.920' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'fc6eb56e-9087-40f1-a573-71947efd04f6', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'd8f15b36-9aef-4fac-9115-693017ae0b19', N'127.0.0.1', CAST(N'2015-11-10 14:30:31.343' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'1c8d5a89-2860-4b54-b657-aca7a3aa9470', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'b5221eb2-6b28-4104-b327-845d0021172b', N'127.0.0.1', CAST(N'2015-11-10 14:30:50.640' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd888b3d4-3f2c-42c0-a78b-82aabb8c102a', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'd3f96507-1bda-4127-bda1-ca60c7f4ce72', N'127.0.0.1', CAST(N'2015-11-10 14:30:54.350' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'4888bef8-c200-40f0-accb-2649909ade7a', 5, NULL, N'采购订单', NULL, N'127.0.0.1', CAST(N'2013-11-24 17:05:45.467' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e3f8d9e9-ba1b-43dc-9c6b-f6dba73899fb', 5, NULL, N'采购订单', NULL, N'127.0.0.1', CAST(N'2013-11-24 17:07:00.513' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'8213b086-efb2-4e09-b51d-dc2a311df45a', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 17:09:06.780' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'9a62ecc4-70e2-4237-b60a-24a20a4464ca', 1, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', N'127.0.0.1', CAST(N'2013-11-24 17:10:01.373' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'34e70a98-74f0-4b38-851e-12f3cf3aa71c', 1, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'127.0.0.1', CAST(N'2013-11-24 17:13:09.577' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'9749a125-050f-4d38-8609-915d42e9eb21', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 17:14:15.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'61d52ce5-1a91-4041-b385-007013999c3d', 2, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'127.0.0.1', CAST(N'2013-11-24 17:14:32.623' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'73f95dd1-1bca-47d6-8ff0-b0017f5df5a6', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2013-11-24 17:14:42.437' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'7aa14ee0-a241-4256-8484-1b3708863cfc', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 17:15:16.640' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'616cb3e3-c3ab-4fb6-9718-3b7ce135cc8d', 2, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'127.0.0.1', CAST(N'2013-11-24 17:15:53.013' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5c58e0d2-e899-487e-944d-fabcd29ecf99', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2013-11-24 17:16:08.763' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'82829a93-fe15-4868-9af8-ff3bd42b7b6a', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2013-11-24 17:17:54.123' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'046b7e4f-b50b-495c-9806-a977c8d377a2', 1, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'ff01d1e1-6a9e-4183-aee7-6708d76375d1', N'127.0.0.1', CAST(N'2013-11-24 17:18:58.857' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'8ac29612-f698-43c4-a180-04fbc414c20f', 1, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'd2cd2ce1-294a-47e3-bfc8-c201f7b8c55e', N'127.0.0.1', CAST(N'2013-11-24 17:22:08.590' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'99280aaa-b581-4338-a8ab-72de0b9c275a', 3, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'd2cd2ce1-294a-47e3-bfc8-c201f7b8c55e', N'127.0.0.1', CAST(N'2013-11-24 17:30:50.547' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'2164fc8a-8e45-4323-85fe-61780f525c22', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'99e0d915-a686-4922-9edd-c8f0ed6e79e9', N'127.0.0.1', CAST(N'2015-11-10 14:31:03.583' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b928bc83-4368-4008-9f14-d0a0b634195c', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'f32d187b-31fe-404e-b4ba-1a5a577d896f', N'127.0.0.1', CAST(N'2015-11-10 14:31:06.957' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'8633629b-6fa7-409f-97fc-4bf55aaead0a', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'28a1477b-9d4b-46c6-95fb-c56f1f160b9d', N'127.0.0.1', CAST(N'2015-11-10 14:31:10.900' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'94fa8d2c-0ecd-4a5d-b429-b908816fd729', 3, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'75789b3b-acbd-4dba-a70f-d16d7d12c634', N'127.0.0.1', CAST(N'2015-11-10 14:31:15.013' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a12566d0-191d-4d00-8208-9e556a16b285', 2, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'3d7259f9-7991-4c58-8064-27f020bf0659', N'127.0.0.1', CAST(N'2015-11-10 14:31:28.300' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'1ce78c9d-3959-47e3-bec1-93a61e91d00c', 2, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'f1c24b87-e007-4399-be49-fb1ed07c96d6', N'127.0.0.1', CAST(N'2015-11-10 14:32:37.190' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c9af31f7-80d1-4810-8cd1-0f525da322cb', 2, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'fa3c84c3-805a-48de-9588-dcdd64d4d9ab', N'127.0.0.1', CAST(N'2015-11-10 14:33:01.040' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'475c3481-fdf7-4f68-9443-315c262f1880', 1, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'c649bbd2-6c20-445b-ad20-82c3e25b6133', N'127.0.0.1', CAST(N'2015-11-10 14:33:45.507' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ff94661f-ab46-426d-bfb7-e2263b3cb061', 1, N'BPMS.Entity.BPMS_Organization', N'组织机构、部门', N'acdcbd6d-ef33-4001-bda2-cd9b5e7766a0', N'127.0.0.1', CAST(N'2015-11-10 14:34:42.197' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'2db87ba1-9bc2-41a5-aa0d-0c75b49b6213', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:35:38.970' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a640a3b1-829b-480e-8b5e-e83c6de8bd88', 3, N'BPMS.Entity.BPMS_Employee', N'员工管理', N'd692d240-1843-4d31-82c8-291aecb2e13e', N'127.0.0.1', CAST(N'2015-11-10 14:36:29.417' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ed257b7e-afc1-4f38-b285-1e4f3860f6b3', 3, N'BPMS.Entity.BPMS_Employee', N'员工管理', N'db071dfe-3f91-476b-8580-8dcc3e675527', N'127.0.0.1', CAST(N'2015-11-10 14:36:36.697' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'4c3e2d76-350d-4293-9497-86fd086e335e', 5, NULL, N'辅助资料管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:37:10.167' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e3c769f1-104e-46aa-97e5-35e3e0ecea7a', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:37:30.503' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e70b79b7-dea7-4842-b1de-7334126044cd', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:40:26.127' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
GO
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'9924f80c-f779-4026-bdc2-44714b031533', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:40:47.787' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'38413330-1359-45f7-b84a-47c576657dab', 5, NULL, N'角色管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:42:08.347' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'957b1e21-2e33-4b67-92a5-e2b3409d6467', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:42:23.087' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c98b127c-2344-4f73-ba39-2ea04e06d6a5', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:42:26.317' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6187bca9-bc61-4684-b6eb-94deb1a4f078', 5, NULL, N'角色管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:42:37.243' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b551bba5-ded6-472b-9b89-91d3933c2f56', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:43:01.883' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'4555d011-272b-48a0-82a0-be10d70b96d6', 5, NULL, N'数据库管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:43:43.200' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c1e1e5d2-326a-4e11-a025-f6f93942ff24', 5, NULL, N'角色管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:43:43.277' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a2f622df-7aa3-4e60-bfb1-ded8da51bf84', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:43:43.540' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'06872dc1-c8a9-4184-91e3-9b5872dd3f69', 5, NULL, N'角色管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:47:08.917' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'41f1a1f4-d938-41fa-a79e-663f90cdf7bc', 5, NULL, N'组织机构', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:47:16.920' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'028146b1-9265-4bfc-9ee7-870c19fe89e3', 5, NULL, N'用户权限控制', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:47:29.770' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0b81212a-419b-4e89-a037-1e334e320471', 5, NULL, N'个性设置', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:48:18.153' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'37850910-ca11-4db0-a7a1-38c92d62b926', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:49:18.983' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'cca5f9b6-6367-414b-8cb9-bb6a17aa9621', 2, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'9f8ce93a-fc2d-4914-a59c-a6b49494108f', N'127.0.0.1', CAST(N'2015-11-10 14:50:07.347' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd1fc1961-721e-4de7-bf76-62ba23ca3e29', 1, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'4c31de1e-3788-429e-b15e-f9fb70b264b1', N'127.0.0.1', CAST(N'2015-11-10 14:52:40.150' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'af1d47e7-a30e-41de-8ad7-4e0033e6d384', 1, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'127.0.0.1', CAST(N'2015-11-10 14:54:31.980' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'496f9633-0bbf-458f-8892-6ce1b896ff47', 5, NULL, N'用户权限控制', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:55:07.063' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'8d6e4846-d5ed-4a3f-9ab4-d90d2b6c903c', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:55:33.510' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'02d19846-64d0-4136-9ca8-54889bfd1019', 5, NULL, N'角色管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:55:39.103' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ffa67ec6-5b6b-4d5e-bd4b-cbd87f86b71f', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:55:59.780' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'386e2eff-9bb5-4ae9-be02-032529091dc0', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:56:17.950' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'401364c2-bfcd-4443-bfb0-a102710e60db', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:56:55.603' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'4cbe4e61-5d0e-479c-bb81-d0465cc03838', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:56:55.640' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'35b96509-7f46-43fa-8879-9c31a1f937ab', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:56:55.660' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'bd377689-2ec6-495f-a649-1509938df8cb', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:57:03.080' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b10de671-4972-443d-b187-0a8407919f19', 2, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'127.0.0.1', CAST(N'2015-11-10 14:57:21.970' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b1612788-e57d-41bb-847a-8c3de8bef6a9', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:57:30.617' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd9ad0465-b1c2-4a82-ac00-dcea2ef9e7a8', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:58:23.400' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'21e24e3c-1703-4490-b8a9-64455d3cf0f8', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:58:40.640' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'224846bf-e641-4f94-9006-010f0a08aafe', 5, NULL, N'系统访问控制', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:58:53.160' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'bdf2dc07-55cb-4ba5-bfbf-fe21b0bce186', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:59:00.660' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'7e976707-b344-4297-aa3c-d6c8d17520e8', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-10 14:59:06.840' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f49526dd-c63e-485f-9115-5e3c4dbc31e4', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:13:06.780' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c161fd38-5a07-4beb-b2dc-7c6dc93daa56', 2, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'127.0.0.1', CAST(N'2015-11-10 16:14:28.267' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5d485469-7c3a-439d-81e8-5a0409b1cbf7', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:14:43.090' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5a3db1b2-b5a6-49f0-af6f-49ac97c32037', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:14:50.490' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6d3d83a4-8f28-439a-a650-7817778fa95b', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:15:08.463' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0594c3e6-3a61-425e-aa2e-144c3d5e2e89', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:16:14.587' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'1fa002e2-7bd5-496a-a319-849c5245fdf6', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:17:43.930' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'1bd16215-2012-48e2-992f-e89aef615c20', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:17:58.483' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'150b7715-ff15-4848-a96a-79e2797a6db5', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:18:17.587' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'997cb35e-0675-4337-8dfc-e262d1596011', 2, N'BPMS.Entity.BPMS_SysMenu', N'模块（菜单导航）', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'127.0.0.1', CAST(N'2015-11-10 16:18:33.197' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0a7aa69a-21e7-46ed-b561-e680f8ad1880', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:18:44.337' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd1521f3e-77cd-467b-85cd-c2f60d70b849', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:19:25.667' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd382f065-c087-43dd-b760-f13326e9a383', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:19:51.513' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'3d3ea7cb-e036-4486-9c47-5711419a9424', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:20:41.090' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c77a4df2-7c06-43eb-b69a-97906365f0aa', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:25:54.837' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f7a0aae5-970a-48a7-b408-200621d5be97', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:27:39.643' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'4d4b3bda-edf4-405c-8705-7497133f676f', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:30:18.797' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'2989aaa9-b1c6-4822-b0f4-ddea9837fad2', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-10 16:36:34.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f0f7b2a5-ee52-4e7a-ac5b-38872bd01cf7', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-11 08:54:27.027' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ed63fe98-e04c-4cd9-95b4-e6708ff9e045', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-11 15:39:36.367' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b6f07773-6307-44a0-9731-a6495fa3c452', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 13:29:20.653' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'93097ff0-b8f5-44c6-ba4d-8c341bdc3164', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 14:15:21.210' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'e26de991-b75c-42e4-bc7e-095c57fd0180', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2015-11-17 14:16:01.630' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'27668d9d-8a4b-4765-b381-7a3d3cde1ab0', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 14:17:31.223' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'c572afb7-aa85-4199-afca-1ebbb2173984', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 14:17:54.513' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'2299352c-68e6-4f7c-9e34-158b6d59f575', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 14:20:56.693' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b920b933-b4ee-4cc7-9e18-69db986404e4', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 14:43:29.007' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'4f476067-fb45-4590-a36f-b1e66e0972fe', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2015-11-17 14:47:13.573' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a6348ac3-ca48-469d-bc4e-f41d7f62c0e6', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2015-11-17 14:48:09.320' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0d8fa86e-0823-4d7c-8fc3-7e1ef23e3d3d', 5, NULL, N'角色权限控制', NULL, N'127.0.0.1', CAST(N'2015-11-17 14:51:44.127' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'8829bcfc-02b9-473e-a04a-96f3ee30924c', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 14:51:55.947' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'dd816651-ad80-4816-b099-15a3c25c8651', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 15:00:45.527' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'a2cb8a18-3ffe-4845-b189-5ab29422699e', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 15:01:57.397' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'52b010ec-45ca-4ff3-a360-55a9b4402044', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 15:07:05.280' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'd2471d2a-7be2-409a-82f1-ba405ab3e31f', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 15:08:20.820' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'69b4940c-02f1-4ad3-a1ee-a1b360bbff1f', 5, NULL, N'用户管理', NULL, N'127.0.0.1', CAST(N'2015-11-17 15:13:45.700' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'9c8a9532-c74b-41c4-b80d-bdaf472a2e1b', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 15:14:58.463' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'25f4b76a-b692-49ee-a478-da40e633ca5e', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 16:36:35.480' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'06c219a7-7034-41fa-8010-6d6cb6e70795', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 16:53:49.570' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'fe0d52df-8739-4ff4-a258-78eb4bc9870d', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-17 16:55:43.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ef18bf1e-9f8e-48ad-9b08-b5c7ea0174e8', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-18 09:14:25.500' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'6023c5e9-c262-415d-8d05-2e95d6c2a5b2', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-18 09:14:51.797' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'299a3d07-4d37-4930-b937-22cf913593e9', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2015-11-18 09:16:36.090' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0e8416dd-d74e-42c4-88e8-c08f2a352fb9', 5, NULL, N'新闻发布', NULL, N'127.0.0.1', CAST(N'2015-11-18 09:17:00.880' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b9229067-8a49-4586-bb0f-19a1534a54b8', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2015-11-18 09:17:16.890' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0729f0a6-0fc1-46b2-a367-aa910e8c0815', 5, NULL, N'采购订单', NULL, N'127.0.0.1', CAST(N'2015-11-18 09:17:22.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'2beb78ab-893e-4ab6-a276-b3d474478799', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2015-11-18 09:29:03.570' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'08014623-390f-4575-bf00-85296bd04c68', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-18 09:34:03.707' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b4bf1d41-7116-4a17-a410-e0fd0e5cbdba', 5, NULL, N'附件上传', NULL, N'127.0.0.1', CAST(N'2015-11-18 09:34:30.623' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'66e9a9b0-2e35-4721-9129-8f24fc523c2a', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-18 10:21:20.680' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'f24dfc5e-d811-49aa-8162-282096f56711', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-18 10:23:42.090' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'159c542d-a0a3-4484-8e1c-d62e0c85e824', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2015-11-18 10:48:57.350' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'90366ca8-05e8-404a-8613-3be9a459a354', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2016-03-04 09:56:36.830' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b20a25b5-6150-42e6-8779-512023028821', 5, NULL, N'职员管理', NULL, N'127.0.0.1', CAST(N'2016-03-04 09:56:53.563' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'2d4a7baf-4811-4fe3-a22f-147aaee072ed', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:05:47.107' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'4bb2941a-6b13-4389-92cb-e8fe6c47ce3a', 5, NULL, N'用户权限控制', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:09:51.193' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'8b08db66-ac2a-4bbf-bf15-ba6ccdc00bc4', 5, NULL, N'系统信息', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:21:35.193' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'ab789786-91d2-4373-9420-0227e0c6a31f', 5, NULL, N'系统参数设置', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:21:47.440' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'03d8f943-26ed-4de6-bf61-201902cfb928', 5, NULL, N'辅助资料管理', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:26:15.447' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'38b2ed9a-807c-4591-a3dd-c1e7231b354e', 5, NULL, N'个性设置', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:26:46.167' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'54219e56-7e99-4274-a62f-15af06c4962e', 5, NULL, N'辅助资料管理', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:26:58.113' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'b8019303-42d3-4cc1-86e1-e9db605f5fc8', 5, NULL, N'系统参数设置', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:27:04.607' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5e4cf753-ee10-4c5a-b8e2-81c806ddf41a', 5, NULL, N'系统异常情况', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:28:01.917' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'3c17c9e2-1f6b-4708-b390-ca88eb595664', 5, NULL, N'操作日志管理', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:28:22.270' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'783d09d3-e31c-4c94-9e09-6fdb595eab0a', 5, NULL, N'连接配置', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:28:52.320' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'0febaf2d-0d0e-477d-b210-71c7341f0a01', 5, NULL, N'系统访问控制', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:29:06.470' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'10026314-076a-434a-a9cd-d9126798ba86', 5, NULL, N'系统接口控制', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:29:21.530' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
GO
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'4bd275af-b535-421c-ab51-ff41753f24ca', 5, NULL, N'个性设置', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:29:41.053' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'5b249965-637b-4706-9edc-3ff4aae02f05', 5, NULL, N'系统信息', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:45:17.563' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysLogs] ([SyslogsId], [OperationType], [TableName], [BusinessName], [Object_ID], [OperationIp], [CreateDate], [CreateUserId], [CreateUserName], [Result]) VALUES (N'2aac8e36-5131-4a2c-a689-d4bf38bb5927', 5, NULL, N'模块管理', NULL, N'127.0.0.1', CAST(N'2016-03-04 11:45:56.287' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', N'')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'3885ba7f-c246-493f-9053-7aa70a642662', N'9f8ce93a-fc2d-4914-a59c-a6b49494108f', N'1000-01', N'权限应用', N'', N'eye.png', N'后台应用', N'', N'', N'Click', 1, 1, 1, 1, 1, 1, CAST(N'2013-10-18 10:22:30.693' AS DateTime), NULL, NULL, CAST(N'2013-11-20 00:43:57.797' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'545d2450-4dac-4377-afbe-d9aa451f795f', N'9f8ce93a-fc2d-4914-a59c-a6b49494108f', N'1000-02', N'系统应用', N'', N'cog.png', N'后台应用', N'', N'', N'Click', 1, 1, 1, 1, 2, 1, CAST(N'2013-10-18 10:22:54.590' AS DateTime), NULL, NULL, CAST(N'2013-11-20 00:48:07.317' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'9f8ce93a-fc2d-4914-a59c-a6b49494108f', N'1000-03', N'智能开发', N'', N'featured.png', N'后台应用', N'', N'', N'Click', 1, 1, 1, 1, 3, 1, CAST(N'2013-10-18 10:23:01.023' AS DateTime), NULL, NULL, CAST(N'2013-11-20 00:44:11.777' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'e620450b-6d17-4192-bee0-66fbd114e82a', N'9f8ce93a-fc2d-4914-a59c-a6b49494108f', N'1000-04', N'测试模块', N'', N'joystick.png', N'后台应用', N'', N'', N'Click', 1, 1, 1, 1, 8, 1, CAST(N'2013-10-18 10:23:05.200' AS DateTime), NULL, NULL, CAST(N'2013-11-17 00:56:16.497' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'1ff6d07d-3d17-4ae2-8ce2-8a70f240048c', N'9f8ce93a-fc2d-4914-a59c-a6b49494108f', N'1000-05', N'实例模块', N'', N'storage1.png', NULL, N'', N'', N'Click', 1, 1, 1, 1, 41, 1, CAST(N'2013-11-20 00:34:29.107' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-20 00:47:50.987' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'3885ba7f-c246-493f-9053-7aa70a642662', N'1000-01-01', N'职员管理', N'', N'people.png', N'后台应用', N'/CommonModule/Employee/EmployeeIndex.aspx', N'', N'Iframe', 0, 1, 0, 1, 1, 1, CAST(N'2013-10-18 10:23:12.240' AS DateTime), NULL, NULL, CAST(N'2013-11-20 00:19:38.700' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'3885ba7f-c246-493f-9053-7aa70a642662', N'1000-01-02', N'用户管理', N'', N'4957_customers.png', N'后台应用', N'/CommonModule/User/UserList.aspx', N'', N'Iframe', 1, 1, 1, 1, 2, 1, CAST(N'2013-10-18 10:23:15.890' AS DateTime), NULL, NULL, CAST(N'2013-11-23 17:54:09.153' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'7996cea4-5503-4807-87ba-d2da553c4341', N'3885ba7f-c246-493f-9053-7aa70a642662', N'1000-01-03', N'角色管理', NULL, N'20131012030416621.png', N'后台应用', N'/CommonModule/Role/RoleIndex.aspx', NULL, N'Iframe', 1, 1, 1, 1, 3, 1, CAST(N'2013-10-18 10:23:20.683' AS DateTime), NULL, NULL, CAST(N'2013-10-28 10:57:35.273' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'c108ef45-b8b6-493e-951a-9050706e2bba', N'3885ba7f-c246-493f-9053-7aa70a642662', N'1000-01-04', N'组织机构', NULL, N'chart_organisation.png', N'后台应用', N'/CommonModule/Organize/OrganizeList.aspx', NULL, N'Iframe', 1, 1, 1, 1, 4, 1, CAST(N'2013-10-18 10:23:24.003' AS DateTime), NULL, NULL, CAST(N'2013-10-28 10:57:49.993' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'8104bfa2-fc85-4459-b533-7f58b7541155', N'3885ba7f-c246-493f-9053-7aa70a642662', N'1000-01-05', N'用户权限控制', NULL, N'20131030111304984.png', N'后台应用', N'/CommonModule/UserPermission/UserPermissionIndex.aspx', NULL, N'Iframe', 1, 1, 1, 1, 5, 1, CAST(N'2013-10-18 10:23:27.420' AS DateTime), NULL, NULL, CAST(N'2013-10-28 10:59:53.277' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'5c5077f0-7703-4fee-927a-b765e1edf900', N'3885ba7f-c246-493f-9053-7aa70a642662', N'1000-01-06', N'角色权限控制', NULL, N'group_key.png', N'后台应用', N'/CommonModule/Role/RoleIndexPermission.aspx', NULL, N'Iframe', 1, 1, 1, 1, 6, 1, CAST(N'2013-10-18 10:23:31.550' AS DateTime), NULL, NULL, CAST(N'2013-10-28 11:00:03.887' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'5477b88b-3393-4d39-ba2d-f219f486bd38', N'3885ba7f-c246-493f-9053-7aa70a642662', N'1000-01-07', N'系统接口控制', N'', N'201310180320016982.png', N'后台应用', N'/CommonModule/InterfaceManage/IAuthorizationList.aspx', N'', N'Iframe', 1, 1, 1, 1, 7, 1, CAST(N'2013-10-18 10:23:32.487' AS DateTime), NULL, NULL, CAST(N'2013-11-02 17:24:39.373' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'2b057961-5ed1-4785-b808-1f366085f406', N'3885ba7f-c246-493f-9053-7aa70a642662', N'1000-01-08', N'系统访问控制', N'', N'424.png', N'后台应用', N'/CommonModule/IPManager/IPManagerList.aspx', N'', N'Iframe', 1, 1, 1, 1, 8, 1, CAST(N'2013-10-18 10:25:39.207' AS DateTime), NULL, NULL, CAST(N'2013-10-31 22:45:45.027' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'c0969b4f-8925-43f3-b664-f1114a4e9aed', N'e620450b-6d17-4192-bee0-66fbd114e82a', N'1000-04-01-01', N'多级菜单测试', N'', N'10.png', NULL, N'', N'', N'Click', 1, 1, 1, 1, 36, 1, CAST(N'2013-11-13 23:02:34.933' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-13 23:17:11.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'1000-02-02', N'辅助资料管理', N'', N'document_library.png', N'后台应用', N'/CommonModule/Dictionary/DictionaryIndex.aspx', N'', N'Iframe', 1, 1, 1, 1, 2, 1, CAST(N'2013-10-18 10:26:01.630' AS DateTime), NULL, NULL, CAST(N'2013-10-28 14:29:17.897' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'1af02b2d-bb66-4716-9ed5-ec3fcff9f5e2', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'1000-02-03', N'动态表单管理', N'自定义表单字段', N'application_form.png', N'后台应用', N'/CommonModule/FlexibleForm/FlexibleFormIndex.aspx', N'', N'Iframe', 1, 1, 1, 1, 3, 1, CAST(N'2013-10-18 10:26:05.480' AS DateTime), NULL, NULL, CAST(N'2013-10-30 16:37:12.417' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'd7a9f7e6-f004-4d39-b54c-0ad4215115a9', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'1000-02-04', N'登录日志管理', N'', N'report_key.png', N'后台应用', N'/CommonModule/Log/LoginLogList.aspx', N'', N'Iframe', 1, 1, 1, 1, 4, 1, CAST(N'2013-10-18 10:26:09.523' AS DateTime), NULL, NULL, CAST(N'2013-11-20 22:01:20.670' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'1000-02-05', N'操作日志管理', N'', N'20130725112128475.png', N'后台应用', N'/CommonModule/Log/LogList.aspx', N'', N'Iframe', 1, 1, 1, 1, 5, 1, CAST(N'2013-10-18 10:26:13.407' AS DateTime), NULL, NULL, CAST(N'2013-11-20 22:01:27.427' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'e84c0fca-d912-4f5c-a25e-d5765e33b0d2', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'1000-02-06', N'系统异常情况', N'', N'Exception.png', N'后台应用', N'/CommonModule/ExceptionLog/ExceptionIndex.aspx', N'', N'Iframe', 1, 1, 1, 1, 6, 1, CAST(N'2013-10-18 10:26:17.270' AS DateTime), NULL, NULL, CAST(N'2013-10-29 14:35:03.890' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'cef74b80-24a5-4d77-9ede-bbbc75cdb431', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'1000-02-07', N'系统参数设置', N'动态配置系统参数', N'4968_config.png', N'后台应用', N'/CommonModule/SystemInfo/ConfigForm.aspx', N'', N'Iframe', 1, 1, 1, 1, 7, 1, CAST(N'2013-10-18 10:26:20.883' AS DateTime), NULL, NULL, CAST(N'2013-10-31 17:30:10.177' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'eb0c4d65-4757-4892-b2e9-35882704e592', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'1000-03-01', N'操作按钮', NULL, N'button.png', N'后台应用', N'/CommonModule/Button/ButtonList.aspx', NULL, N'Iframe', 1, 1, 1, 1, 23, 1, CAST(N'2013-10-18 10:26:22.637' AS DateTime), NULL, NULL, CAST(N'2013-10-28 10:59:17.253' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'b863d076-37bb-45aa-8318-37942026921e', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'1000-03-02', N'模块管理', NULL, N'brick.png', N'后台应用', N'/CommonModule/Module/ModuleList.aspx', N'', N'Iframe', 1, 1, 1, 1, 24, 1, CAST(N'2013-10-18 10:28:24.910' AS DateTime), NULL, NULL, CAST(N'2013-10-28 11:17:41.890' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'1000-03-03', N'数据资源库', N'动态数据库', N'database_gear.png', N'后台应用', N'/CommonModule/DataBase/DataBaseIndex.aspx', N'', N'Iframe', 1, 1, 1, 1, 25, 1, CAST(N'2013-10-18 10:28:29.413' AS DateTime), NULL, NULL, CAST(N'2013-10-30 22:31:56.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'1000-03-04', N'数据库管理', N'', N'database_lightning.png', N'后台应用', N'/CommonModule/DataBase/DataBaseManag.aspx', N'', N'Iframe', 1, 1, 1, 1, 26, 1, CAST(N'2013-10-18 10:28:39.743' AS DateTime), NULL, NULL, CAST(N'2013-10-30 22:33:27.443' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'8fcead5e-991a-4904-99ac-2c9d9269040b', N'1000-03-05', N'接口管理', N'系统动态接口', N'disconnect.png', N'后台应用', N'/CommonModule/InterfaceManage/InterfaceManageList.aspx', N'', N'Iframe', 1, 1, 1, 1, 27, 1, CAST(N'2013-10-18 10:28:44.090' AS DateTime), NULL, NULL, CAST(N'2013-11-04 11:02:20.640' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'9f8ce93a-fc2d-4914-a59c-a6b49494108f', N'0', N'1000', N'微企业管理系统', N'', N'application_view_tile.png', N'后台应用', N'', N'', N'Click', 1, 1, 1, 1, 1, 1, CAST(N'2013-10-18 14:55:33.160' AS DateTime), NULL, NULL, CAST(N'2015-11-10 14:50:07.323' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'4d864415-aa4f-4621-ac86-87578c7861a5', N'c0969b4f-8925-43f3-b664-f1114a4e9aed', N'1000-04-01-02', N'多级菜单测试一', N'', N'10.png', NULL, N'', N'', N'Click', 1, 1, 1, 1, 37, 1, CAST(N'2013-11-13 23:02:53.543' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-13 23:17:23.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'2969f5af-6c78-44fc-93ea-c1b96fb3db50', N'c0969b4f-8925-43f3-b664-f1114a4e9aed', N'1000-04-01-023', N'多级菜单测试二', N'', N'10.png', NULL, N'', N'', N'Click', 1, 1, 1, 1, 38, 1, CAST(N'2013-11-13 23:16:13.007' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-13 23:17:29.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'677f2fc2-2456-49eb-8bd6-c5142a420c48', N'1ff6d07d-3d17-4ae2-8ce2-8a70f240048c', N'1000-05-02', N'新闻发布', N'', N'newspaper_go.png', NULL, N'/ExampleModule/News/NewsList.aspx', N'', N'Click', 1, 1, 1, 1, 43, 1, CAST(N'2013-11-24 17:10:01.357' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-28 11:32:54.823' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'4de3b54c-7d8f-4928-802b-852bd8c2d9fa', N'1ff6d07d-3d17-4ae2-8ce2-8a70f240048c', N'1000-05-01', N'采购订单', N'', N'20130717121539279.png', NULL, N'/ExampleModule/POOrder/POOrderForm.aspx', N'', N'Click', 1, 1, 1, 1, 42, 1, CAST(N'2013-11-20 00:37:05.370' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-20 14:19:58.720' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'd8775515-d8df-45f1-9369-8d62bfbf1fd1', N'c0969b4f-8925-43f3-b664-f1114a4e9aed', N'1000-04-01-04', N'多级菜单测试三', N'', N'10.png', NULL, N'', N'', N'Click', 1, 1, 1, 1, 39, 1, CAST(N'2013-11-13 23:16:26.217' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-13 23:17:50.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'ba0d11ba-9747-41fe-b5bc-e0f4469508bf', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'1000-02-08', N'系统信息', N'', N'about.png', N'后台应用', N'/CommonModule/SystemInfo/SystemInfoList.aspx', N'', N'Click', 1, 1, 1, 1, 34, 1, CAST(N'2013-10-31 14:30:11.207' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-10-31 16:50:07.343' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'20078172-7a2a-491b-91c3-97c25b3a58dc', N'545d2450-4dac-4377-afbe-d9aa451f795f', N'1000-02-09', N'个性设置', N'美化界面风格', N'5030_drawings.png', N'后台应用', N'/CommonModule/SystemInfo/Individuation.aspx', N'', N'Click', 1, 1, 1, 1, 35, 1, CAST(N'2013-11-01 14:12:06.353' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-01 14:22:59.467' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'6f796e95-c177-4070-a6b5-8ced973c0111', N'c0969b4f-8925-43f3-b664-f1114a4e9aed', N'1000-04-01-05', N'多级菜单测试四', N'', N'10.png', NULL, N'', N'', N'Click', 1, 1, 1, 1, 40, 1, CAST(N'2013-11-13 23:16:36.210' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-13 23:17:56.000' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'1ff6d07d-3d17-4ae2-8ce2-8a70f240048c', N'1000-05-03', N'附件上传', N'', N'drive_go.png', NULL, N'/ExampleModule/File/FileList.aspx', N'', N'Click', 1, 1, 1, 1, 44, 1, CAST(N'2013-11-24 17:13:09.560' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-29 13:38:31.720' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'ff01d1e1-6a9e-4183-aee7-6708d76375d1', N'1ff6d07d-3d17-4ae2-8ce2-8a70f240048c', N'1000-05-04', N'打印功能', N'', N'print.png', NULL, N'/ExampleModule/Printpage/index.html', N'', N'Click', 1, 1, 1, 1, 45, 1, CAST(N'2013-11-24 17:18:58.840' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', CAST(N'2013-11-30 15:13:01.163' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'4c31de1e-3788-429e-b15e-f9fb70b264b1', N'9f8ce93a-fc2d-4914-a59c-a6b49494108f', N'1000-06', N'企业号管理', N'', N'delicious.png', NULL, N'', N'', N'Click', 1, 1, 1, 1, 46, 1, CAST(N'2015-11-10 14:52:40.137' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', NULL, NULL, NULL)
INSERT [dbo].[BPMS_SysMenu] ([MenuId], [ParentId], [Code], [FullName], [Description], [Img], [Category], [NavigateUrl], [FormName], [Target], [IsUnfold], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'4c31de1e-3788-429e-b15e-f9fb70b264b1', N'1000-06-01', N'连接配置', N'', N'page_white_gear.png', NULL, N'/QYManager/BPMS_QYNumberList.aspx', N'', N'Click', 1, 1, 1, 1, 47, 1, CAST(N'2015-11-10 14:54:31.963' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', CAST(N'2015-11-10 16:18:33.117' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰')
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'5c0c717e-a6c2-440e-bf94-902b8ea42d29', N'c108ef45-b8b6-493e-951a-9050706e2bba', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-05 23:48:15.817' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'e71ad4a5-c267-49d8-8bc7-3193ac03e0d7', N'c108ef45-b8b6-493e-951a-9050706e2bba', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2013-11-05 23:48:15.817' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'6a2c920d-abfe-4497-ac90-789461c91802', N'c108ef45-b8b6-493e-951a-9050706e2bba', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2013-11-05 23:48:15.817' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'926ce615-6795-4235-ae3a-4b317d0db3ab', N'c108ef45-b8b6-493e-951a-9050706e2bba', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-05 23:48:15.817' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'2b2a54f7-4176-464e-a1b4-68794a1af216', N'c108ef45-b8b6-493e-951a-9050706e2bba', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-05 23:48:15.817' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 5)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'4fbab8bf-06ed-4d57-ba08-0b96fa9b5877', N'8104bfa2-fc85-4459-b533-7f58b7541155', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-05 23:48:25.003' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'0ac44573-9b12-4870-8dd2-7fbab53536d9', N'8104bfa2-fc85-4459-b533-7f58b7541155', N'f70649d1-0740-4ed9-8d7d-de5c525efa38', CAST(N'2013-11-05 23:48:25.003' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'19c83cac-8f75-4cb9-a5db-e565b22bb6e6', N'8104bfa2-fc85-4459-b533-7f58b7541155', N'1a089561-0e3c-4e2a-a4c6-375d4fc74a9b', CAST(N'2013-11-05 23:48:25.003' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'523bb659-4115-48a0-9d41-80977c6f30dd', N'5c5077f0-7703-4fee-927a-b765e1edf900', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-05 23:51:12.110' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'f1257158-6d9f-41f3-8924-de0a41d7b290', N'1af02b2d-bb66-4716-9ed5-ec3fcff9f5e2', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2013-11-05 23:49:40.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'f1515a55-3c1d-4f9d-b7bc-1524c4ba8db1', N'1af02b2d-bb66-4716-9ed5-ec3fcff9f5e2', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2013-11-05 23:49:40.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'ce749096-7fa0-4530-a840-10cbc24f89d7', N'1af02b2d-bb66-4716-9ed5-ec3fcff9f5e2', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-05 23:49:40.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'c1675772-0b18-4fc0-878e-0893f97f3fec', N'd7a9f7e6-f004-4d39-b54c-0ad4215115a9', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-05 23:49:49.120' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'cdcfd5a3-9331-4785-8d60-680bb85a6033', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2013-11-20 21:12:13.437' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'592df05c-7105-4856-8934-f468968ead08', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2013-11-20 21:12:13.437' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'4a4d31ca-a966-47cc-9c65-22ea759596c2', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-20 21:12:13.437' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'f9b251f1-d5f9-416e-9e8d-3cb57922800a', N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-05 23:49:53.163' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'd748e22e-f7e1-460f-8875-6bb7b9ad6436', N'5c5077f0-7703-4fee-927a-b765e1edf900', N'e9ea8e5a-887d-484b-b8b3-99993f7f20c2', CAST(N'2013-11-05 23:51:12.110' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'59a5269a-423b-4218-9ed0-5b2ae32514e7', N'5c5077f0-7703-4fee-927a-b765e1edf900', N'3b505abe-a0ca-4743-a226-cb8432f4aff4', CAST(N'2013-11-05 23:51:12.110' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'e77cda07-6701-4608-8ebc-67589127d24e', N'b863d076-37bb-45aa-8318-37942026921e', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-20 21:13:15.433' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'785d4f49-d35e-46fb-82a3-060d24f21b2a', N'b863d076-37bb-45aa-8318-37942026921e', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2013-11-20 21:13:15.433' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'd41588bc-5624-459d-9d4e-f9545d692a6a', N'b863d076-37bb-45aa-8318-37942026921e', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2013-11-20 21:13:15.433' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'199152dc-547c-434a-a0ca-d5ced675ad4e', N'b863d076-37bb-45aa-8318-37942026921e', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-20 21:13:15.433' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'374475b5-f206-4f3c-be00-ca29955fd82a', N'b863d076-37bb-45aa-8318-37942026921e', N'44b5dce0-be25-46cb-be31-e985c3e0fbe7', CAST(N'2013-11-20 21:13:15.433' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 5)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'71aec222-c956-4ecd-9ef2-46b05c81dae0', N'b863d076-37bb-45aa-8318-37942026921e', N'a5f5181f-55d5-4671-ab39-3a56a4b494e2', CAST(N'2013-11-20 21:13:15.433' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 6)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'cd26dee9-14bf-4227-ad3d-887583e3677a', N'5c5077f0-7703-4fee-927a-b765e1edf900', N'f70649d1-0740-4ed9-8d7d-de5c525efa38', CAST(N'2013-11-05 23:51:12.110' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'6402e299-c53b-4fc6-81d1-1332dcdad106', N'5c5077f0-7703-4fee-927a-b765e1edf900', N'1a089561-0e3c-4e2a-a4c6-375d4fc74a9b', CAST(N'2013-11-05 23:51:12.123' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 5)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'f8cc0c01-9dae-452d-8ed8-061b49442a11', N'1af02b2d-bb66-4716-9ed5-ec3fcff9f5e2', N'745d7aaf-f1e4-4463-879a-daa9c23bc700', CAST(N'2013-11-05 23:49:40.580' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'f752a2e9-ff35-4e69-93a1-88977f4eb4a5', N'eb0c4d65-4757-4892-b2e9-35882704e592', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-05 23:50:09.750' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'349f6d6b-668c-4fa9-9680-35759b0f4727', N'eb0c4d65-4757-4892-b2e9-35882704e592', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2013-11-05 23:50:09.750' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'7b0bcc85-a203-49b6-8668-d71643ae8234', N'eb0c4d65-4757-4892-b2e9-35882704e592', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2013-11-05 23:50:09.750' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'f64b566f-2da7-4bec-aeaa-b353e4cd46a5', N'eb0c4d65-4757-4892-b2e9-35882704e592', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-05 23:50:09.750' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'd7535988-18bb-4c70-a1c7-a2b6647dce6b', N'eb0c4d65-4757-4892-b2e9-35882704e592', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-05 23:50:09.750' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 5)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'c15ed933-c9c0-4e80-817f-4b7b489169ba', N'b863d076-37bb-45aa-8318-37942026921e', N'4d866304-9d1d-4549-93fb-1505a869ba94', CAST(N'2013-11-20 21:13:15.433' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 7)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'594789dc-f7b9-4050-a853-75025228a571', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-23 17:57:08.310' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'c1703765-0823-45aa-8810-0a38c82dfbc9', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'71b392ae-091d-44a8-86f8-cdeba38b9c59', CAST(N'2013-11-23 17:57:08.310' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'25be640a-882f-4f6d-8db2-54f74083776d', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-23 17:57:08.310' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'd197e01e-588b-470a-954b-4b2da014c349', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'61cec1d0-9697-4875-a822-4fe6b8cf9916', CAST(N'2013-11-23 17:57:08.310' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'c79b8d32-bb14-42a8-b64e-c0fd138d1f63', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'38aee003-4318-460f-9f95-f3afbce9ccd2', CAST(N'2013-11-23 17:57:08.327' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 5)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'3571cfb4-3226-4c9d-8867-f46bffb0c617', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-02 10:59:43.743' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 21)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'7aa6c99c-c804-4724-b635-161c4a0a35ec', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2013-11-02 10:59:43.760' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 43)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'fdbe0fea-7732-4032-affe-34440670436f', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2013-11-02 10:59:43.777' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 89)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'aaeaf5c2-7afb-4d56-af9a-79967201aba5', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-02 10:59:43.790' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 66)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'98c1c30e-249c-4a8c-b6ba-37185765de52', N'd7a9f7e6-f004-4d39-b54c-0ad4215115a9', N'1a473b17-a822-4f9f-8391-bfc07671b837', CAST(N'2013-11-05 23:49:49.120' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'3e242ec2-fb11-4fbf-b533-1cb3206aa3dd', N'd7a9f7e6-f004-4d39-b54c-0ad4215115a9', N'4b2f23d7-cdfc-422d-b403-b08583560d00', CAST(N'2013-11-05 23:49:49.120' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'8eb841aa-d13d-4b2f-8020-6d3d0b5ff655', N'd7a9f7e6-f004-4d39-b54c-0ad4215115a9', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-05 23:49:49.120' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'0dd9b79c-b03c-4bdb-a528-4b00f94366df', N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b', N'1a473b17-a822-4f9f-8391-bfc07671b837', CAST(N'2013-11-05 23:49:53.163' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'be33b032-7186-4d67-9bac-71b2dee63284', N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b', N'4b2f23d7-cdfc-422d-b403-b08583560d00', CAST(N'2013-11-05 23:49:53.163' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'98a3d1a6-0d77-409b-9877-972472ddee09', N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-05 23:49:53.163' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'95c2eeb1-5ccf-47ab-baf1-6a268b277e41', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-02 10:59:43.807' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 54)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'40515271-efd8-4777-9c55-400e360ebcfb', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-28 11:39:26.623' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'82e4bc1a-90ad-4609-b2b8-7481e737bc99', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'e5395221-1860-41c0-a9b1-a369d06dff12', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'd5513d89-66da-4013-99a9-6c361d546ee1', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'720f1132-4458-4408-b416-8de3cae1f523', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'61caf24c-9537-4c9d-a7e8-e90fe12ffe0a', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'a2faad97-7e02-45b3-9e81-33e3ac25780a', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 5)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'2e992ba1-6d4a-4ba8-93c1-97988835608e', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'14f278eb-1bff-415b-9b12-ca952fb3dd13', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 6)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'39e0e62c-0f77-4d82-92c1-9ec183d22835', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'07b9464c-18c8-4e0f-933a-fd78d461e76d', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 7)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'3761f772-acbd-4c25-b8c3-08b3cad02547', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'ddf2d18a-f90d-490b-8c02-fe91b47c9825', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 8)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'4589258b-b125-443b-b903-748802cf3f13', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'4b2f23d7-cdfc-422d-b403-b08583560d00', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 9)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'56bf80b9-5872-4f4a-970b-e2b9cd85eee4', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 10)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'2bbf8c86-38ec-4779-93a8-cd9c93cc0023', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'13da7fa6-eb94-48cb-a8e2-4f135b385bee', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 11)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'c82f7fdd-09ee-4f4c-b4ae-8ead4bec044b', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'2ef108e1-1fd7-43c7-86b9-a5d2207e96c1', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 12)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'787bbdf2-72f0-46d9-abc3-aa12b9dcae94', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'cc5cbb4c-b9f5-4d3d-9dbd-0cde87cbfaf8', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 13)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'0b04a83c-5cb0-4737-907e-7a9b8443712c', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-23 17:54:28.200' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'5a5c17da-4f73-445d-8399-2ced2aa3a11b', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'a3bbc612-9c33-4101-bc18-f1553b2e09d0', CAST(N'2013-11-23 17:54:28.200' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'5a1196cb-bccb-4b25-bb9b-4fee1d556986', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-23 17:54:28.200' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'48f25865-0046-42d5-b6ff-a6122f9cfbde', N'2b057961-5ed1-4785-b808-1f366085f406', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-05 23:49:29.880' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'74a0c631-54ab-4213-ac84-8369997309ef', N'2b057961-5ed1-4785-b808-1f366085f406', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2013-11-05 23:49:29.880' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'87e7bb47-8f5e-4c0c-a2cd-c2aad631672a', N'2b057961-5ed1-4785-b808-1f366085f406', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2013-11-05 23:49:29.880' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'0d59558c-c30c-44be-8364-fca10b781d2d', N'2b057961-5ed1-4785-b808-1f366085f406', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-05 23:49:29.880' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'b6346a1b-8efa-4cc2-8cac-d3fbae7a1abf', N'2b057961-5ed1-4785-b808-1f366085f406', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-05 23:49:29.880' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 5)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'84b6a6bf-54b3-4042-a562-2d9cbd599c4c', N'5477b88b-3393-4d39-ba2d-f219f486bd38', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-14 21:14:16.927' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'3a4b08cb-ba7f-4b75-9871-1395769b38f5', N'7996cea4-5503-4807-87ba-d2da553c4341', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-05 23:48:10.490' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'3e523e18-cfc1-47c3-b235-657fb2955716', N'7996cea4-5503-4807-87ba-d2da553c4341', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2013-11-05 23:48:10.490' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'78b8ee35-6459-4943-b117-ac6fcc7b13a1', N'7996cea4-5503-4807-87ba-d2da553c4341', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2013-11-05 23:48:10.490' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'85c0c829-a756-4d36-9047-af697a40b5f1', N'7996cea4-5503-4807-87ba-d2da553c4341', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-05 23:48:10.490' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'8de02ac4-5f17-433b-83f1-11a83fbc07e4', N'5477b88b-3393-4d39-ba2d-f219f486bd38', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2013-11-14 21:14:16.927' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'fde7e075-7d3e-4d0e-8da8-20120c66cc75', N'5477b88b-3393-4d39-ba2d-f219f486bd38', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2013-11-14 21:14:16.927' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'3782575d-0b35-43eb-8953-986486a28c21', N'5477b88b-3393-4d39-ba2d-f219f486bd38', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-14 21:14:16.927' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'fc07dca1-f118-4dde-9246-0c7004113dcd', N'5477b88b-3393-4d39-ba2d-f219f486bd38', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-14 21:14:16.927' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 5)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'851df2bd-5d78-4ced-aac8-7da9bc0767a9', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-07 18:46:08.840' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'5b14945c-7465-4536-bfb3-9b04ac65e463', N'5c5077f0-7703-4fee-927a-b765e1edf900', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-05 23:51:12.123' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 6)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'0a0f1c8e-b7b9-4514-8301-7981a363f837', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2013-11-07 18:46:08.840' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'22d5aef4-d2c3-4dde-b060-1e44ee12d88f', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2013-11-07 18:46:08.840' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'32cf10a8-fd9a-4432-8914-e01fe0d4ef0c', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-07 18:46:08.840' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'83720e88-b55c-48d8-8079-4fd134300115', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-07 18:46:08.840' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 5)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'057d021c-4f92-4dc8-b1e6-159ee2aa3ec6', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'169e4d12-83d0-4d08-b38f-6bc5f66037a8', CAST(N'2013-11-07 18:47:02.813' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 14)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'8e3aa853-140a-43b6-8ad6-fc427574c953', N'b863d076-37bb-45aa-8318-37942026921e', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-20 21:13:15.433' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 8)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'48109e37-c45e-4ab0-a1e3-2d13c4b092f2', N'7996cea4-5503-4807-87ba-d2da553c4341', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-05 23:48:10.490' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 5)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'b60cac6c-9cd2-41f3-a5bc-b88cf811cb9e', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-23 17:57:08.327' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 6)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'01ab94d5-5480-446a-80b9-6a79eb2b452d', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2013-11-28 11:39:26.623' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'7020e3f8-a2e5-48a5-b48c-0d729bab7118', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2013-11-28 11:39:26.627' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'7b973adc-4700-4b71-98d0-0bcf40746040', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-28 11:39:26.627' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'3e9875c5-5615-4c26-9df4-e8fdac0ef587', N'677f2fc2-2456-49eb-8bd6-c5142a420c48', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-28 11:39:26.627' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 5)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'a7097891-b087-4cc5-853b-3919a4f4c4e8', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2013-11-29 13:51:32.203' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'2daa45df-32e1-49cf-9a29-7b413d91bf36', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'c7e7d4b3-d21e-4dcf-9e39-20e099ce4375', CAST(N'2013-11-29 13:51:32.203' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'8d317d0b-3f67-4ba4-91d3-6ac9900f3b3d', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'61cec1d0-9697-4875-a822-4fe6b8cf9916', CAST(N'2013-11-29 13:51:32.203' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'b5e01529-884d-49f1-8885-225ebf52e292', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-11-29 13:51:32.203' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'7d8019b0-08fc-48fd-96ba-eefcfdaac20a', N'2be1d8a6-b4d6-4088-aee7-3994fb8e4445', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2013-11-29 13:51:32.203' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄', 5)
GO
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'c2f390d7-a31a-46ab-ac8a-ea09f438465e', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2015-11-17 14:51:39.783' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', 1)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'2a292a4f-8777-496d-8660-047f6cd1ecf4', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2015-11-17 14:51:39.783' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', 2)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'bf86d20a-04dd-4446-a2f9-b22b589437c5', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2015-11-17 14:51:39.783' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', 3)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'f6ba0e7c-c54c-4e56-b2d9-61e6ef9816d8', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'2abd13c2-3160-49a2-9814-9eb31a0e1677', CAST(N'2015-11-17 14:51:39.787' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', 4)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'171f17b6-49e3-477d-a597-a0a9a3cc968f', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'c381916d-cbbf-4a56-a02c-7480b94c900b', CAST(N'2015-11-17 14:51:39.787' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', 5)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'9588362c-5b7d-404e-823b-7adc30c01778', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'13da7fa6-eb94-48cb-a8e2-4f135b385bee', CAST(N'2015-11-17 14:51:39.787' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', 6)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'45e79d18-0590-4386-af95-8084f5587731', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'2ef108e1-1fd7-43c7-86b9-a5d2207e96c1', CAST(N'2015-11-17 14:51:39.787' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', 7)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'b91b6846-31c6-47b6-b594-c5af325f2862', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'cc5cbb4c-b9f5-4d3d-9dbd-0cde87cbfaf8', CAST(N'2015-11-17 14:51:39.787' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', 8)
INSERT [dbo].[BPMS_SysMenuButton] ([SysMenuButtonId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName], [SortCode]) VALUES (N'fc789846-fb3d-48b9-bf09-6ed3330e4b51', N'eb12f51e-91cc-436f-99fa-154841d9f15a', N'169e4d12-83d0-4d08-b38f-6bc5f66037a8', CAST(N'2015-11-17 14:51:39.787' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'翟双焰', 9)
INSERT [dbo].[BPMS_TableColumns] ([TableColumnsId], [MenuId], [Title], [Field], [Width], [IsHidden], [Align], [Custom], [IsPublic], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'357a0e22-e960-464f-af50-2969750c007c', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'主键', N'EmployeeId', 100, 1, N'left', NULL, 1, NULL, 1, 1, 1, 1, 1, CAST(N'2013-10-19 17:44:48.437' AS DateTime), NULL, NULL, CAST(N'2013-10-19 18:12:35.510' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_TableColumns] ([TableColumnsId], [MenuId], [Title], [Field], [Width], [IsHidden], [Align], [Custom], [IsPublic], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'7f17c513-a0a7-4b4a-95ec-ddde26bdfc2c', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'姓名', N'RealName', 100, 1, N'center', NULL, 1, NULL, 1, 1, 1, 3, 1, CAST(N'2013-10-19 18:01:24.610' AS DateTime), NULL, NULL, CAST(N'2013-10-20 17:47:52.467' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_TableColumns] ([TableColumnsId], [MenuId], [Title], [Field], [Width], [IsHidden], [Align], [Custom], [IsPublic], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'7ca8cef2-6f99-446e-93b8-5045b0a8535b', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'性别', N'Gender', 50, 0, N'center', N'1-男;0-女', 1, NULL, 1, 1, 1, 4, 1, CAST(N'2013-10-19 18:02:50.083' AS DateTime), NULL, NULL, CAST(N'2013-10-20 13:38:37.947' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_TableColumns] ([TableColumnsId], [MenuId], [Title], [Field], [Width], [IsHidden], [Align], [Custom], [IsPublic], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'a3b63486-3e37-497f-b21d-6ff4582ae3cf', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'出生日期', N'Birthday', 100, 0, N'center', NULL, 1, NULL, 1, 1, 1, 5, 1, CAST(N'2013-10-19 18:03:34.573' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_TableColumns] ([TableColumnsId], [MenuId], [Title], [Field], [Width], [IsHidden], [Align], [Custom], [IsPublic], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'e045147b-8abe-4e3a-8ecb-90e7799d55a7', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'手机', N'Mobile', 80, 0, N'center', NULL, 1, NULL, 1, 1, 1, 6, 1, CAST(N'2013-10-19 18:04:00.237' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_TableColumns] ([TableColumnsId], [MenuId], [Title], [Field], [Width], [IsHidden], [Align], [Custom], [IsPublic], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'1f030c27-979a-4646-925e-ee4449544222', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'办公电话', N'OfficePhone', 80, 0, N'center', NULL, 1, NULL, 1, 1, 1, 7, 1, CAST(N'2013-10-19 18:04:18.470' AS DateTime), NULL, NULL, CAST(N'2013-10-19 18:14:59.273' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_TableColumns] ([TableColumnsId], [MenuId], [Title], [Field], [Width], [IsHidden], [Align], [Custom], [IsPublic], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'60c43b77-7cbf-44e1-848c-9f9059528b10', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'电子邮件', N'Email', 100, 0, N'center', NULL, 1, NULL, 1, 1, 1, 8, 1, CAST(N'2013-10-19 18:04:37.677' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_TableColumns] ([TableColumnsId], [MenuId], [Title], [Field], [Width], [IsHidden], [Align], [Custom], [IsPublic], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'f2c1f5d2-a596-4735-905d-9051bff8b10c', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'编号,工号', N'Code', 80, 0, N'center', NULL, 1, NULL, 1, 1, 1, 2, 1, CAST(N'2013-10-19 18:05:23.717' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BPMS_TableColumns] ([TableColumnsId], [MenuId], [Title], [Field], [Width], [IsHidden], [Align], [Custom], [IsPublic], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'f211ef34-52da-4423-ada1-a30d7410ab72', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'有效', N'Enabled', 60, 0, N'center', NULL, 1, NULL, 1, 1, 1, 9, 1, CAST(N'2013-10-19 18:14:23.280' AS DateTime), NULL, NULL, CAST(N'2013-10-19 18:14:52.490' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_TableColumns] ([TableColumnsId], [MenuId], [Title], [Field], [Width], [IsHidden], [Align], [Custom], [IsPublic], [Description], [AllowEdit], [AllowDelete], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'8a8afe7d-4af4-4472-b196-e598abcb2291', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', N'描述', N'Description', 300, 0, N'left', NULL, 1, NULL, 1, 1, 1, 10, 1, CAST(N'2013-10-19 18:14:47.587' AS DateTime), NULL, NULL, CAST(N'2013-10-20 13:44:36.927' AS DateTime), NULL, NULL)
INSERT [dbo].[BPMS_User] ([UserId], [Code], [Account], [Password], [Secretkey], [RealName], [Spell], [Alias], [RoleId], [Gender], [Mobile], [Telephone], [Birthday], [Email], [OICQ], [DutyId], [TitleId], [CompanyId], [DepartmentId], [WorkgroupId], [Description], [SecurityLevel], [ChangePasswordDate], [OpenId], [IPAddress], [MACAddress], [LogOnCount], [FirstVisit], [PreviousVisit], [LastVisit], [Enabled], [SortCode], [DeleteMark], [CreateDate], [CreateUserId], [CreateUserName], [ModifyDate], [ModifyUserId], [ModifyUserName]) VALUES (N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'admin', N'admin', N'4C510207F5A4A7760FF26D530ABD81AD', N'9A1CBCE1A182F63D', N'翟双焰', N'ZSY,DSY', N'', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', N'男', N'18769369446', N'', CAST(N'2013-10-28 00:00:00.000' AS DateTime), N'1454904486@qq.com', N'1454904486', N'1', N'5', N'31b05701-60ef-405c-87ba-af47049e3f48', N'ce65969e-0fa6-4697-acbc-d5bdc417fe99', N'3d7259f9-7991-4c58-8064-27f020bf0659', N'测试', N'', CAST(N'2013-10-28 18:49:32.000' AS DateTime), NULL, N'', N'', 1237, CAST(N'2013-10-28 18:49:32.000' AS DateTime), CAST(N'2016-03-04 11:02:43.000' AS DateTime), CAST(N'2016-03-04 11:03:23.717' AS DateTime), 1, 790, 1, CAST(N'2013-10-28 18:49:32.000' AS DateTime), N'', N'', CAST(N'2015-11-10 14:26:46.717' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'a942322a-d933-4b55-a6f2-ef5a991fd673', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'9f8ce93a-fc2d-4914-a59c-a6b49494108f', CAST(N'2013-10-28 10:24:51.440' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'e1480752-63fb-4873-927c-13705f38bace', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'3885ba7f-c246-493f-9053-7aa70a642662', CAST(N'2013-10-28 10:24:51.440' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'4140196a-0d77-4028-ae8a-3d1f9bceb9c6', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', CAST(N'2013-10-28 10:24:51.440' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'573cda09-4e16-4407-b449-6ddeeb62c535', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', CAST(N'2013-10-28 10:24:51.440' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'1f131be3-ab38-442b-a648-237dfa4e1c0d', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'7996cea4-5503-4807-87ba-d2da553c4341', CAST(N'2013-10-28 10:24:51.440' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'fa6806bb-26e7-4027-bea2-30380a4bff53', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'9f8ce93a-fc2d-4914-a59c-a6b49494108f', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'b41e2120-b7f6-401a-b0e5-56428f1ea7f5', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'3885ba7f-c246-493f-9053-7aa70a642662', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'378c124d-533d-402e-865d-671283d42500', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'7183d9c5-d48b-436a-9f62-7f30f5a02c5c', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'cd6a6f5b-ed35-4ad1-9473-533cfc3cb084', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'22f463c1-7666-4e9d-9932-31e9288029c8', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'7996cea4-5503-4807-87ba-d2da553c4341', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'6584c14f-3c8d-4d2f-9052-ca49ec0d97be', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'c108ef45-b8b6-493e-951a-9050706e2bba', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'49be3f5b-a570-46a0-b3cb-185f20a6b741', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'8104bfa2-fc85-4459-b533-7f58b7541155', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'75790196-c548-4878-b68f-da1ac16da442', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'5c5077f0-7703-4fee-927a-b765e1edf900', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'3cb9b5df-bc51-4661-b5e9-e43267c24570', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'5477b88b-3393-4d39-ba2d-f219f486bd38', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'd0fc7fcd-2f81-46c2-b207-938e245bcdd3', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'2b057961-5ed1-4785-b808-1f366085f406', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'07103902-ce8c-420b-838f-b1cd9efa51c1', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'545d2450-4dac-4377-afbe-d9aa451f795f', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'9a21c4d3-f7d9-466f-b49b-a69e9469fd4d', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'437ea961-0f7b-49d8-9ed2-eb1a118342dc', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'2bcaf5e1-257b-4645-bb99-bb5cc34097ec', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'758429ec-3ae9-4a9e-a994-efe7c5395b4a', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'2bbb13f7-e6b5-4063-9d85-30c497414cbe', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'1af02b2d-bb66-4716-9ed5-ec3fcff9f5e2', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'2d03fbd0-76db-4455-a6ad-edaf73831592', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'd7a9f7e6-f004-4d39-b54c-0ad4215115a9', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'b7546dc6-a8b1-49f1-a01e-24bc1d74ee30', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'b29cabd8-ffb6-4d34-9d08-ee1dba2b5b6b', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'eec097aa-f2f8-44f6-a28f-516417e3b9f0', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'e84c0fca-d912-4f5c-a25e-d5765e33b0d2', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'f4ddabf2-94d5-4220-99fd-ce29a55e904c', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'cef74b80-24a5-4d77-9ede-bbbc75cdb431', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'b367f0dc-45c2-4817-802c-55ebc1c5bd39', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'8fcead5e-991a-4904-99ac-2c9d9269040b', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'0fa1f1fc-19c5-4234-a46e-08801ecb8398', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'eb0c4d65-4757-4892-b2e9-35882704e592', CAST(N'2013-10-30 14:23:39.793' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'23481025-d554-477a-bf2f-713cefd28564', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'b863d076-37bb-45aa-8318-37942026921e', CAST(N'2013-10-30 14:23:39.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'54b100a0-71bd-403e-94bb-a938f3783428', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'58e86c4c-8022-4d30-95d5-b3d0eedcc878', CAST(N'2013-10-30 14:23:39.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'fc60428d-7bce-45a0-8aeb-95d8832adf96', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'5d896550-fde2-47fe-bb72-95cd5d3a2edb', CAST(N'2013-10-30 14:23:39.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'899f9121-26e2-4890-8b64-7bfcc6dc8d1a', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'bd959bfa-797c-48ff-b72b-241c84cd03a8', CAST(N'2013-10-30 14:23:39.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'88b6fae5-3fc5-43a8-8d24-8d77712bd381', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'f7c61bd2-47db-4655-a888-83c64c4c285e', CAST(N'2013-10-30 14:23:39.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'cd30007a-d852-4114-b168-fd46270d047f', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'e620450b-6d17-4192-bee0-66fbd114e82a', CAST(N'2013-10-30 14:23:39.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'2dcea189-6581-4f87-bcf4-985e9fbd75fe', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'2f0cf499-edfc-4eed-981c-913e0a46f771', CAST(N'2013-10-30 14:23:39.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'8dc62ea0-fdb3-4b9c-aaf4-8f030e47a312', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'07bf6fc9-2bef-4c8f-b2f1-b9a8a6cbe29f', CAST(N'2013-10-30 14:23:39.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'fe2e60fa-0c07-4c7d-924e-94ff3d3b2d31', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'68f77b34-a581-44d4-8e91-98df7d299184', CAST(N'2013-10-30 14:23:39.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'53fcc23e-d906-4302-8ee9-fb425f0a1d40', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'91af7a00-8630-4001-b7eb-19890caaf337', CAST(N'2013-10-30 14:23:39.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'2fca5f50-0770-4aeb-8fc3-283d9a62b067', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'3c6ac984-067f-4d27-bea5-6b6589e26c5c', CAST(N'2013-10-30 14:23:39.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenu] ([UserMenuId], [UserId], [MenuId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'89c4556e-8fb7-456a-afed-1f817311ce7e', N'08AF3277-1879-44FF-9B3F-77243F5F1353', N'b6df0ad2-0a72-49c5-9501-47e818ddfbcd', CAST(N'2013-10-30 14:23:39.810' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenuButton] ([UserMenuButtonId], [UserId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'd8319eb6-f658-4a41-b7c3-dd5837718d0a', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'067b2de9-037f-4bb9-8a41-285eb3fc7267', CAST(N'2013-10-28 10:07:08.903' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenuButton] ([UserMenuButtonId], [UserId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'd460f509-c598-4753-929e-2170b5668406', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'e452d1ef-bde7-4f66-a525-4067a4ec7e49', CAST(N'2013-10-28 10:07:08.903' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenuButton] ([UserMenuButtonId], [UserId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'c27721ed-c4dc-425f-9619-3abaaa9ce20a', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'13f9189c-ccbe-4e4a-8292-d408fa8d119f', CAST(N'2013-10-28 10:07:08.903' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserMenuButton] ([UserMenuButtonId], [UserId], [MenuId], [ButtonId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'7dfe4aa1-72e9-4b52-a0da-b605a5cef772', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'599cbed1-45c4-4792-978c-d5bbcd2819e2', N'14f278eb-1bff-415b-9b12-ca952fb3dd13', CAST(N'2013-10-28 10:07:08.903' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
INSERT [dbo].[BPMS_UserRole] ([UserRoleId], [UserId], [RoleId], [CreateDate], [CreateUserId], [CreateUserName]) VALUES (N'dda62202-bfde-4f57-884e-d045dc5f90ed', N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'c3aaa9e8-b707-40ec-a88c-3df260c38bca', CAST(N'2013-10-28 10:00:23.833' AS DateTime), N'3cd1cd06-3d77-4efb-a78d-ad9a9cea3d80', N'佘赐雄')
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BASE_FILE]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BASE_File] ADD  CONSTRAINT [PK_BASE_FILE] PRIMARY KEY NONCLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BASE_INTERFACEMANAGE]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BASE_InterfaceManage] ADD  CONSTRAINT [PK_BASE_INTERFACEMANAGE] PRIMARY KEY NONCLUSTERED 
(
	[InterfaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BASE_INTERFACEMANAGEDETAILS]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BASE_InterfaceManageDetails] ADD  CONSTRAINT [PK_BASE_INTERFACEMANAGEDETAILS] PRIMARY KEY NONCLUSTERED 
(
	[InterfaceDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BASE_NEWS]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BASE_News] ADD  CONSTRAINT [PK_BASE_NEWS] PRIMARY KEY NONCLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_APPENDPROPERTY]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_AppendProperty] ADD  CONSTRAINT [PK_BPMS_APPENDPROPERTY] PRIMARY KEY NONCLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_APPENDPROPERTYINSTANCE]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_AppendPropertyInstance] ADD  CONSTRAINT [PK_BPMS_APPENDPROPERTYINSTANCE] PRIMARY KEY NONCLUSTERED 
(
	[PropertyInstanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_BUTTON]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_Button] ADD  CONSTRAINT [PK_BPMS_BUTTON] PRIMARY KEY NONCLUSTERED 
(
	[ButtonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_DATEPERMISSION]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_DataPermission] ADD  CONSTRAINT [PK_BPMS_DATEPERMISSION] PRIMARY KEY NONCLUSTERED 
(
	[DataPermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_STAFF]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_Employee] ADD  CONSTRAINT [PK_BPMS_STAFF] PRIMARY KEY NONCLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_EXCEPTION]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_Exception] ADD  CONSTRAINT [PK_BPMS_EXCEPTION] PRIMARY KEY NONCLUSTERED 
(
	[ExceptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_INTERFACEACCESS]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_InterfaceAccess] ADD  CONSTRAINT [PK_BPMS_INTERFACEACCESS] PRIMARY KEY NONCLUSTERED 
(
	[IAccessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_IPBLACKLIST]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_IPBlacklist] ADD  CONSTRAINT [PK_BPMS_IPBLACKLIST] PRIMARY KEY NONCLUSTERED 
(
	[IPBlacklistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_ITEMDETAILS]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_ItemDetails] ADD  CONSTRAINT [PK_BPMS_ITEMDETAILS] PRIMARY KEY NONCLUSTERED 
(
	[ItemDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_ITEMS]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_Items] ADD  CONSTRAINT [PK_BPMS_ITEMS] PRIMARY KEY NONCLUSTERED 
(
	[ItemsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_ORGANIZATION]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_Organization] ADD  CONSTRAINT [PK_BPMS_ORGANIZATION] PRIMARY KEY NONCLUSTERED 
(
	[OrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_ROLEMENU]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_RoleMenu] ADD  CONSTRAINT [PK_BPMS_ROLEMENU] PRIMARY KEY NONCLUSTERED 
(
	[RoleMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_ROLEMENUBUTTON]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_RoleMenuButton] ADD  CONSTRAINT [PK_BPMS_ROLEMENUBUTTON] PRIMARY KEY NONCLUSTERED 
(
	[RoleMenuButtonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_ROLES]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_Roles] ADD  CONSTRAINT [PK_BPMS_ROLES] PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_SHORTCUT]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_Shortcut] ADD  CONSTRAINT [PK_BPMS_SHORTCUT] PRIMARY KEY NONCLUSTERED 
(
	[ShortcutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_STAFFORGANIZE]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_StaffOrganize] ADD  CONSTRAINT [PK_BPMS_STAFFORGANIZE] PRIMARY KEY NONCLUSTERED 
(
	[StaffOrganizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_SYSLOGDETAILS]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_SysLogDetails] ADD  CONSTRAINT [PK_BPMS_SYSLOGDETAILS] PRIMARY KEY NONCLUSTERED 
(
	[SysLogDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_SYSLOGINLOG]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_SysLoginLog] ADD  CONSTRAINT [PK_BPMS_SYSLOGINLOG] PRIMARY KEY NONCLUSTERED 
(
	[SysLoginLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_SYSLOGS]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_SysLogs] ADD  CONSTRAINT [PK_BPMS_SYSLOGS] PRIMARY KEY NONCLUSTERED 
(
	[SyslogsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_SYSMENU]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_SysMenu] ADD  CONSTRAINT [PK_BPMS_SYSMENU] PRIMARY KEY NONCLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_SYSMENUBUTTON]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_SysMenuButton] ADD  CONSTRAINT [PK_BPMS_SYSMENUBUTTON] PRIMARY KEY NONCLUSTERED 
(
	[SysMenuButtonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_TABLECOLUMNS]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_TableColumns] ADD  CONSTRAINT [PK_BPMS_TABLECOLUMNS] PRIMARY KEY NONCLUSTERED 
(
	[TableColumnsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_USER]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_User] ADD  CONSTRAINT [PK_BPMS_USER] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_USERMENU]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_UserMenu] ADD  CONSTRAINT [PK_BPMS_USERMENU] PRIMARY KEY NONCLUSTERED 
(
	[UserMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_USERMENUBUTTON]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_UserMenuButton] ADD  CONSTRAINT [PK_BPMS_USERMENUBUTTON] PRIMARY KEY NONCLUSTERED 
(
	[UserMenuButtonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_BPMS_USERROLE]    Script Date: 2016-3-7 10:00:44 ******/
ALTER TABLE [dbo].[BPMS_UserRole] ADD  CONSTRAINT [PK_BPMS_USERROLE] PRIMARY KEY NONCLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BPMS_Employee] ADD  CONSTRAINT [DF_BPMS_Staff_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[BPMS_Employee] ADD  CONSTRAINT [DF_BPMS_Staff_DeleteMark]  DEFAULT ((1)) FOR [DeleteMark]
GO
ALTER TABLE [dbo].[BPMS_Employee] ADD  CONSTRAINT [DF_BPMS_Staff_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BPMS_Exception] ADD  CONSTRAINT [DF_BPMS_Exception_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BPMS_StaffOrganize] ADD  CONSTRAINT [DF_BPMS_StaffOrganize_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BASE_InterfaceManageDetails]  WITH CHECK ADD  CONSTRAINT [FK_BASE_InterfaceManageDetails_BASE_InterfaceManage] FOREIGN KEY([InterfaceId])
REFERENCES [dbo].[BASE_InterfaceManage] ([InterfaceId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BASE_InterfaceManageDetails] CHECK CONSTRAINT [FK_BASE_InterfaceManageDetails_BASE_InterfaceManage]
GO
ALTER TABLE [dbo].[BPMS_SysLogDetails]  WITH CHECK ADD  CONSTRAINT [FK_BPMS_SysLogDetails_BPMS_SysLogs] FOREIGN KEY([SyslogsId])
REFERENCES [dbo].[BPMS_SysLogs] ([SyslogsId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BPMS_SysLogDetails] CHECK CONSTRAINT [FK_BPMS_SysLogDetails_BPMS_SysLogs]
GO
/****** Object:  StoredProcedure [dbo].[PROC_Commit_ScanLog]    Script Date: 2016-3-7 10:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		刘晓雷
-- Create date: 2013-10-31
-- Description:	提交PDA扫描记录
-- =============================================
CREATE PROCEDURE [dbo].[PROC_Commit_ScanLog]
    @ScanId VARCHAR(50) ,--日志ID
    @Scanner VARCHAR(50) ,     --扫描人ID
    @ScanDate DATETIME ,        --扫描日期
    @ScanType VARCHAR(50) ,        --扫描类型
    @BoxCode VARCHAR(50) ,        --箱号
    @StokPlace VARCHAR(50) ,  --库位
    @Remark VARCHAR(50)        --自定义
AS 
    BEGIN
    
        IF EXISTS ( SELECT  1
                    FROM    dbo.EDMS_ScanLog
                    WHERE   BoxCode = @BoxCode
                            AND ScanType = @ScanType ) 
            BEGIN
                RETURN
            END
            
        IF NOT EXISTS ( SELECT  1
                        FROM    dbo.EDMS_Contrast
                        WHERE   BoxCode = @BoxCode ) 
            BEGIN
                RETURN
            END
            
        INSERT  INTO EDMS_ScanLog
        VALUES  ( @ScanId, @Scanner, @ScanDate, @ScanType, @BoxCode,
                  @StokPlace, @Remark )
                  
        UPDATE  dbo.EDMS_Contrast
        SET     [Status] = @ScanType
        WHERE   BoxCode = @BoxCode          
       
        IF ( @ScanType = '问题件' ) 
            BEGIN
                UPDATE  EDMS_Contrast
                SET     Remark = @Remark
                WHERE   BoxCode = @BoxCode
            END
        ELSE 
            IF ( @ScanType = '出库' ) 
                BEGIN
                    UPDATE  dbo.EDMS_PickingList
                    SET     [Status] = '出库'
                    WHERE   BoxCode = @BoxCode
                END
            ELSE 
                IF ( @ScanType = '入库' ) 
                    BEGIN
                        UPDATE  dbo.EDMS_Contrast
                        SET     [Status] = '入库' ,
                                StokPlace = @StokPlace
                        WHERE   BoxCode = @BoxCode
                    END

        
                 
                
    END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'FileId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'FileName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'FilePath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'Introduction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'FileType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件大小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'FileSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'FileImg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'后缀名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'Extensions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_File'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口配置设置主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'InterfaceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动作类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'约束达式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'PermissionConstraint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许编辑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'AllowEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'AllowDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效：1-有效，0-无效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记:1-正常，0-删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动态接口配置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口参数明细主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManageDetails', @level2type=N'COLUMN',@level2name=N'InterfaceDetailsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口配置设置主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManageDetails', @level2type=N'COLUMN',@level2name=N'InterfaceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManageDetails', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManageDetails', @level2type=N'COLUMN',@level2name=N'Field'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManageDetails', @level2type=N'COLUMN',@level2name=N'FieldMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参数类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManageDetails', @level2type=N'COLUMN',@level2name=N'FieldType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大长度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManageDetails', @level2type=N'COLUMN',@level2name=N'FieldMaxLength'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许空：0-是，1-否' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManageDetails', @level2type=N'COLUMN',@level2name=N'FieldMinLength'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'约束达式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManageDetails', @level2type=N'COLUMN',@level2name=N'PermissionConstraint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManageDetails', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效：1-有效，0-无效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManageDetails', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动态接口配置参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_InterfaceManageDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'NewsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容简介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'Introduction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关键字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'Keywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'AuditStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被阅读次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'ReadCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BASE_News'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附加属性信息主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'PropertyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控件ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'Control_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控件类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控件数据源类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'DataSourceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控件数据源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'DataSource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控件长度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控件高度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'Height'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控件样式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'Style'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证控件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'Validator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大显示长度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'Showlength'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'Defaults'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定义属性' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'Custom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'Event'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效：1-有效，0-无效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记:1-正常，0-删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附加属性信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendProperty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性实例主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendPropertyInstance', @level2type=N'COLUMN',@level2name=N'PropertyInstanceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附加属性信息主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendPropertyInstance', @level2type=N'COLUMN',@level2name=N'PropertyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对象属性值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendPropertyInstance', @level2type=N'COLUMN',@level2name=N'PropertyInstance_Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对象业务属性主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendPropertyInstance', @level2type=N'COLUMN',@level2name=N'PropertyInstance_Key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附加属性信息实例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_AppendPropertyInstance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'ButtonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'Img'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮事件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'Event'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控件ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'Control_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否分开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'Split'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效：1-有效，0-无效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记:1-正常，0-删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作按钮' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Button'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据权限存储主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_DataPermission', @level2type=N'COLUMN',@level2name=N'DataPermissionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_DataPermission', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_DataPermission', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对什么资源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_DataPermission', @level2type=N'COLUMN',@level2name=N'ResourceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存储对象主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_DataPermission', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_DataPermission', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_DataPermission', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_DataPermission', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据权限存储表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_DataPermission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'EmployeeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号,工号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名拼音' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Spell'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Alias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分支机构主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'SubCompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'DepartmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作组主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'WorkgroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职位主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'DutyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'IDCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工资卡' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'BankCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'ShortNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Telephone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'OICQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'办公电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'OfficePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'办公邮编' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'OfficeZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'办公地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'OfficeAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'办公传真' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'OfficeFax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年龄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Age'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出生日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最高学历' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Education'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'毕业院校' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'School'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'毕业时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'GraduationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所学专业' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Major'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最高学位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Degree'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职称主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'TitleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职称评定日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'TitleDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TitleLevel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'TitleLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'WorkingDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加入本单位时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'JoinInDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'家庭住址邮编' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'HomeZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'家庭住址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'HomeAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'住宅电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'HomePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'家庭传真' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'HomeFax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'籍贯省' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'籍贯市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'籍贯区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'籍贯' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'NativePlace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'政治面貌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Party'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'国籍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Nation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'民族' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Nationality'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用工性质' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'WorkingProperty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职业资格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Competency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'紧急联系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'EmergencyContact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'离职' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'IsDimission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'离职日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'DimissionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'离职原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'DimissionCause'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'离职去向' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'DimissionWhither'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效：1-有效，0-无效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记:1-正常，0-删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工、职员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Employee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统异常主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Exception', @level2type=N'COLUMN',@level2name=N'ExceptionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'异常信息来源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Exception', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'异常信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Exception', @level2type=N'COLUMN',@level2name=N'Exception'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'异常信息描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Exception', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Exception', @level2type=N'COLUMN',@level2name=N'OperationIp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作IP所在城市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Exception', @level2type=N'COLUMN',@level2name=N'OperationIpCity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Exception', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统异常' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Exception'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统接口访问主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'IAccessId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'AuthorizationUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'AuthorizationUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权模块编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'AuthorizationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生效日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'过期日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统接口访问' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_InterfaceAccess'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP黑名单主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'IPBlacklistId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规则类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'起始IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'StartIp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'EndIp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'失效时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'Failuretime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP黑名单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_IPBlacklist'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据字典明细表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'ItemDetailsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据字典主表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'ItemsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'ItemCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许编辑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'AllowEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'AllowDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效：1-有效，0-无效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记:1-正常，0-删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据字典明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_ItemDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据字典主表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'ItemsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'树型结构' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'IsTree'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许编辑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'AllowEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'AllowDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效：1-有效，0-无效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记:1-正常，0-删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据字典主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Items'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织机构主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'OrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'简称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'ShortName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内部组织' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'IsInnerOrganize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主负责人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'Manager'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'副负责人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'AssistantManager'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'OuterPhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内线' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'InnerPhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'传真' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮编' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'Postalcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'Web'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效：1-有效，0-无效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记:1-正常，0-删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织机构、部门' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Organization'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业号ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_QYNumber', @level2type=N'COLUMN',@level2name=N'QYId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业号名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_QYNumber', @level2type=N'COLUMN',@level2name=N'QYName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业号描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_QYNumber', @level2type=N'COLUMN',@level2name=N'QYDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业号logo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_QYNumber', @level2type=N'COLUMN',@level2name=N'QYLogo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业号二维码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_QYNumber', @level2type=N'COLUMN',@level2name=N'QYEwm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CorpID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_QYNumber', @level2type=N'COLUMN',@level2name=N'CorpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_QYNumber', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SortCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_QYNumber', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_QYNumber', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_QYNumber', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_QYNumber', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_QYNumber', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_QYNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色权限主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenu', @level2type=N'COLUMN',@level2name=N'RoleMenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenu', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenu', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenu', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenu', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统角色菜单关系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统角色菜单按钮关系主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenuButton', @level2type=N'COLUMN',@level2name=N'RoleMenuButtonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenuButton', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenuButton', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenuButton', @level2type=N'COLUMN',@level2name=N'ButtonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenuButton', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenuButton', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenuButton', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统角色菜单按钮关系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_RoleMenuButton'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织机构主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'OrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许编辑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'AllowEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'AllowDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效：1-有效，0-无效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记:1-正常，0-删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Roles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'首页快捷功能主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Shortcut', @level2type=N'COLUMN',@level2name=N'ShortcutId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Shortcut', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Shortcut', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Shortcut', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'首页快捷功能' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_Shortcut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组织关系主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_StaffOrganize', @level2type=N'COLUMN',@level2name=N'StaffOrganizeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织机构主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_StaffOrganize', @level2type=N'COLUMN',@level2name=N'OrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_StaffOrganize', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_StaffOrganize', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_StaffOrganize', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_StaffOrganize', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户账户部门关系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_StaffOrganize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日志明细主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogDetails', @level2type=N'COLUMN',@level2name=N'SysLogDetailsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日志主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogDetails', @level2type=N'COLUMN',@level2name=N'SyslogsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogDetails', @level2type=N'COLUMN',@level2name=N'FieldName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogDetails', @level2type=N'COLUMN',@level2name=N'FieldText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogDetails', @level2type=N'COLUMN',@level2name=N'NewValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'旧值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogDetails', @level2type=N'COLUMN',@level2name=N'OldValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogDetails', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统操作日志明细' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录系统日志主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLoginLog', @level2type=N'COLUMN',@level2name=N'SysLoginLogId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLoginLog', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录账户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLoginLog', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLoginLog', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLoginLog', @level2type=N'COLUMN',@level2name=N'IPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP地址所在地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLoginLog', @level2type=N'COLUMN',@level2name=N'IPAddressName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录系统日志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLoginLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日志主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogs', @level2type=N'COLUMN',@level2name=N'SyslogsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogs', @level2type=N'COLUMN',@level2name=N'OperationType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogs', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogs', @level2type=N'COLUMN',@level2name=N'BusinessName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对象主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogs', @level2type=N'COLUMN',@level2name=N'Object_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogs', @level2type=N'COLUMN',@level2name=N'OperationIp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogs', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogs', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogs', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统操作日志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysLogs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'Img'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'NavigateUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'窗体名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'FormName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'Target'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否展开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'IsUnfold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许编辑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'AllowEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'AllowDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效：1-有效，0-无效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记:1-正常，0-删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块（菜单导航）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单导航按钮关系主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenuButton', @level2type=N'COLUMN',@level2name=N'SysMenuButtonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenuButton', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenuButton', @level2type=N'COLUMN',@level2name=N'ButtonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenuButton', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenuButton', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenuButton', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenuButton', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单导航操作按钮关系表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_SysMenuButton'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块列表表头定义主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'TableColumnsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'Field'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'宽度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'Width'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否隐藏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'IsHidden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对齐方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'Align'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定义' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'Custom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是公开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'IsPublic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许编辑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'AllowEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'AllowDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效：1-有效，0-无效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记:1-正常，0-删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块列表表头定义' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_TableColumns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录账户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名拼音' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'Spell'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'Alias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'固定电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'Telephone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出生日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'OICQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'DutyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'TitleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'DepartmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作组主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'WorkgroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'SecurityLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改密码日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'ChangePasswordDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单点登录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'OpenId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'IPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MAC地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'MACAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'LogOnCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第一次访问时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'FirstVisit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上一次访问时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'PreviousVisit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后访问时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'LastVisit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效：1-有效，0-无效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'Enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序吗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记:1-正常，0-删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'ModifyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User', @level2type=N'COLUMN',@level2name=N'ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户、帐户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户菜单关系主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenu', @level2type=N'COLUMN',@level2name=N'UserMenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenu', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenu', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenu', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenu', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户菜单关系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户菜单按钮关系主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenuButton', @level2type=N'COLUMN',@level2name=N'UserMenuButtonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenuButton', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenuButton', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenuButton', @level2type=N'COLUMN',@level2name=N'ButtonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenuButton', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenuButton', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenuButton', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户菜单按钮关系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserMenuButton'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帐户角色关系主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserRole', @level2type=N'COLUMN',@level2name=N'UserRoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserRole', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserRole', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserRole', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserRole', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserRole', @level2type=N'COLUMN',@level2name=N'CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户帐户角色关系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BPMS_UserRole'
GO
USE [master]
GO
ALTER DATABASE [WeiBMS] SET  READ_WRITE 
GO
