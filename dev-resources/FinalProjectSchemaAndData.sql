/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenFriendships]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenFriendships] DROP CONSTRAINT IF EXISTS [FK_OpenFriendships_Friendships]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenFriendships]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenFriendships] DROP CONSTRAINT IF EXISTS [FK_OpenFriendships_Cliques]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliques]') AND type in (N'U'))
ALTER TABLE [dbo].[Cliques] DROP CONSTRAINT IF EXISTS [FK_Cliques_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_OpenFriendships]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_ApplicationStatuses]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/11/2019 8:59:56 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[OpenFriendships]    Script Date: 12/11/2019 8:59:56 AM ******/
DROP TABLE IF EXISTS [dbo].[OpenFriendships]
GO
/****** Object:  Table [dbo].[Friendships]    Script Date: 12/11/2019 8:59:56 AM ******/
DROP TABLE IF EXISTS [dbo].[Friendships]
GO
/****** Object:  Table [dbo].[Cliques]    Script Date: 12/11/2019 8:59:56 AM ******/
DROP TABLE IF EXISTS [dbo].[Cliques]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/11/2019 8:59:56 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/11/2019 8:59:56 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/11/2019 8:59:56 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/11/2019 8:59:56 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/11/2019 8:59:56 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[ApplicationStatuses]    Script Date: 12/11/2019 8:59:56 AM ******/
DROP TABLE IF EXISTS [dbo].[ApplicationStatuses]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 12/11/2019 8:59:56 AM ******/
DROP TABLE IF EXISTS [dbo].[Applications]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/11/2019 8:59:56 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/11/2019 8:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 12/11/2019 8:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Applications](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[OpenFriendshipId] [int] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ApplicationDate] [date] NOT NULL,
	[ManagerNotes] [varchar](2000) NULL,
	[ApplicationStatusId] [int] NOT NULL,
	[ResumeFilename] [varchar](75) NOT NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ApplicationStatuses]    Script Date: 12/11/2019 8:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationStatuses](
	[ApplicationStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
	[StatusDescription] [varchar](250) NULL,
 CONSTRAINT [PK_ApplicationStatuses] PRIMARY KEY CLUSTERED 
(
	[ApplicationStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/11/2019 8:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/11/2019 8:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/11/2019 8:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/11/2019 8:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/11/2019 8:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Cliques]    Script Date: 12/11/2019 8:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliques]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliques](
	[CliqueId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[BetaId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Cliques] PRIMARY KEY CLUSTERED 
(
	[CliqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Friendships]    Script Date: 12/11/2019 8:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Friendships]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Friendships](
	[FriendshipId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_Friendships] PRIMARY KEY CLUSTERED 
(
	[FriendshipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OpenFriendships]    Script Date: 12/11/2019 8:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenFriendships]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OpenFriendships](
	[OpenFriendshipId] [int] IDENTITY(1,1) NOT NULL,
	[FriendshipId] [int] NOT NULL,
	[CliqueId] [int] NOT NULL,
 CONSTRAINT [PK_OpenFriendships] PRIMARY KEY CLUSTERED 
(
	[OpenFriendshipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/11/2019 8:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ResumeFilename] [varchar](75) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201912021926286_InitialCreate', N'IdentitySample.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE4B8117D0F907F10F49404DE962F99C1C468EFC2DBB61323E30BA6ED41DE066C89DD1646A2B412E5B511EC97E5219F945F4851A22EBCE9D22D77B7170B2CDC2279AA583C248BC5E2FCEF3FFF9DFEF41206D6334E523F2267F6D1E4D0B6307123CF27AB333BA3CB1F3ED93FFDF8C73F4C2FBDF0C5FA5AD63B61F5A02549CFEC274AE353C749DD271CA27412FA6E12A5D1924EDC2874901739C787877F738E8E1C0C10366059D6F44B46A81FE2FC07FC9C45C4C531CD507013793848F9772899E7A8D62D0A711A23179FD9D71E86B6F4758EC238C093A2816D9D073E0265E63858DA162224A28882AAA78F299ED32422AB790C1F50F0F01A63A8B744418A79174EEBEA7D7B7378CC7AE3D40D4B28374B69140E043C3AE1E671E4E66B19D9AECC0706BCCC8DC57A9D1BB1B6DF97280003C8024F6741C22A9FD9379588F334BEC57452369C14905709C0FD1A25DF274DC403AB77BB838A4EC79343F6DF8135CB029A25F88CE08C262838B0EEB345E0BBFFC4AF0FD1774CCE4E8E16CB934F1F3E22EFE4E35FF1C987664FA1AF504FF8009FEE9328C609E8869755FF6DCB11DB3972C3AA59A34D6115E012CC0CDBBA412F9F3159D1279833C79F6CEBCA7FC15EF98593EB91F83091A0114D32F8799B05015A04B82A775A65B2FFB7483DFEF07114A9B7E8D95FE5432FC9878993C0BCFA8283BC347DF2E3627A09E3FD8D57BB4AA290FD16F955947E9B4759E2B2CE44C62A0F2859612A6A37756AF2F6A234831A9FD625EAFE539B69AAD25B5B9575689D99508AD8F66C28F57D5BB9BD19771EC7307839B59845DA08A7DDAF2612C0014C201F132F789D3C5E4F6EBECE6A061DF56510819EFD9E17C4CB10F9C1082B620F29E08F2CFD24C4552F7F8E807F880CD6F91EA5292C08DE3F50FAD4A23AFC3982EA73EC6609631A05AABDB9B4FBA788E0DB2C5C30FA6F4FD66843F3F06B74855C1A259784B5DA18EF73E47E8F327A49BC0B44F123754B40F6F3C10FFB038CA2CEB9EBE234BD0232636F1681BB5D025E137A723C188E2D52BBF6486601F243BD4B222DA7DFCAAAB55BA2AFA1B826866A3AF7A44DD5CFD1CA27FD542DAB9A552D6A74AACAAB0D559581F5D394D7342B9A57E8D4B3A8359AC3978FD0F81E5F0EBBFF2EDF669BB7692D6898710E2B24FE3B26388165CCBB4794E284D423D067DDD885B3900F1F13FAE67B532EE92B0AB2B145AD351BF24560FCD990C3EEFF6CC8D584CFCFBEC7BC921EE7A0B232C0F7AAAF3F6275CF3949B36D4F07A19BDB16BE9D35C0345DCED33472FD7C166822603C7E21EA0F3E9CD51DCC287A230744A06340749F6D79F005FA66CBA4BA231738C0145BE76E11219CA1D4459E6A46E8903740B17247D52856074644E5FEA2C804A6E3843542EC1094C24CF50955A7854F5C3F4641A795A4963DB730D6F74A865C728163382883C04E4BF411AE8F8330052A39D2A0745968EA3418D74E4483D76A1AF32E17B61E77253CB1154E76F8CE065E72FFED4D88D96EB12D90B3DD247D1430C6F47641507E56E94B00F9E0B26F04954E4C068272976A2B04152DB603828A267977042D8EA87DC75F3AAFEE1B3DC583F2F6B7F55673ED809B823DF68C9A85EF096D28B4C0894ACF8B052BC42F547338033DF9F92CE5AEAE4C91FC020153316453FBBB5A3FD469079149D4065813AD0394DF062A40CA841AA05C19CB6BD58E7B110360CBB85B2B2C5FFB25D8060754ECE6AD68A3A2F9EE542667AFD347D5B38A0D0AC97B1D161A381A42C88B97D8F11E4631C56555C3F4F1858778C38D8EF1C168315087E76A3052D999D1AD5452B3DB4A3A876C884BB6919524F7C960A5B233A35B8973B4DB481AA760805BB09189C42D7CA4C956463AAADDA62A9B3A45BE14FF30750C8955D31B14C73E593512ADF8176B5E6459CD7E980FCF3D0A0B0CC74D35294895B695241A256885A552100D9A5EF9494A2F10450BC4E23C332F54AA69F756C3F25F8A6C6E9FEA2096FB40599BFD2DAEEDE21DBEB0DDAAFE0887B9824E86CCA9C923E91A0AE89B5B2CF70D0528D104EF67519085C4EC63995B175778CDF6C5171561EA48FA2B3E946230C5D315ADDF6B6CD47931DE38555ECCFA6365863059BCF4419B3637F9A56694324CD5443185AE763676267766E878C9CEE2F0E1EA44789BD9C533549A00FCD3408C46928302D628EB8F2AE6A13431C592FE8852B24913522A1AA06533A54450B259B0169EC1A2FA1AFD25A849244D74B5B43FB2269DA409AD295E035BA3B35CD61F559371D204D614F7C7AED34FE475748FF72FE31166930DAC38E86EB6831930DE66511C67036CDCE737811A9F0762F11B7B058C7FDF4B42194F7B9B10AA08716C4628038679FD112EC3C5E5A7F506DF8C29DC700B4B7CDB0DBF196F186DDF941CCA794FAE5249AFCE7DD2F96ECACF5ADDAF6B94C35751C5B64A33C2F6FE9A521C4E5885C9FC976016F8982DE665851B44FC254E6991D5611F1F1E1D4BAF73F6E7A58C93A65EA039AB9A9ECB8863B685042DF28C12F709256ABAC406AF496A5025127D4D3CFC7266FF3B6F759A0735D85FF9E703EB3A7D24FE2F19143C2419B67E53D33FC7C9AEEFF19EA352F4B777F150A2BFC9AFFFF5AD687A60DD25309D4EAD43C9D0EB0CBFF87C62903645D30DB459FB51C5FB9D6DC253052DAA345BD67F99B0F0E928AF124A2DFF14A2973F0F554DFBF2602344CDEB82B1F04631A1E9F5C03A58C697031EFCA4F9CB81619DD5BF24584735E32B029F0C0793DF10F45F86CA963BDC873467A66D2C49B99D3B73B0374AC8DCF5DEA4A46A6F34D1D574EC0170A3A65C6FE6A2BCB354E6D1B64E4DA6F268D8BBE4FD9BA727EF4B4672EDB4EF3611799BB9C72D374BBFAB94E33D4892D324FDEC3EB178DB5C330581F73C3B7358FAF09E918D6FF3BB4F12DE36D94C01E23D27DBA054E03DE3DAAEF6CF1D33ADF716BAF3C45E3547C97099A38B227725EE16217738FE2F222041E15116EF2DF59962266135598C02EB2A66A1E6143559B0327114B94A8D76B1C3FACA37FCD6CEF23AED620D899D6DB2F9FADF2A9BD769976D4897DC45CAB13661519706DEB18EB5E551BDA71463A1271D19ED5D3E6BEBCDFC7BCA281EC528C2EC31DC2EBF9F04E2514C32E6D4199030AC5E14C3DED9F8C71A61FF4EFD550DC1FEE946825D61D7ACEA5C9365546EDE924665152942738329F2604B3D4FA8BF442E85621680CE1F8CE7413D760DB2C0DE35B9CB689C51E8320E178110F0624E409BFC3C2B5AD4797A17B35FE9185D00357D16B8BF233F677EE0557A5F6962420608E65DF0702F1B4BCAC2BEABD70AE936223D81B8F92AA7E80187710060E91D99A367BC8E6E40BFCF7885DCD73A026802E91E08D1ECD30B1FAD1214A61CA36E0F3F81C35EF8F2E3FF01581EBBFEB3540000, N'6.2.0-61023')
SET IDENTITY_INSERT [dbo].[Applications] ON 

INSERT [dbo].[Applications] ([ApplicationId], [OpenFriendshipId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatusId], [ResumeFilename]) VALUES (1, 1, N'1af2215e-8c4d-493a-bef6-f1fdc3092a33', CAST(N'2019-12-04' AS Date), N'Edit these notes', 2, N'37540a52-5f8d-4b9e-9139-72dafe688845.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenFriendshipId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatusId], [ResumeFilename]) VALUES (2, 3, N'1af2215e-8c4d-493a-bef6-f1fdc3092a33', CAST(N'2019-12-04' AS Date), N'I don''t think he would be a great fit. We''ll have to take a look at his portfolio though.', 2, N'37540a52-5f8d-4b9e-9139-72dafe688845.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenFriendshipId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatusId], [ResumeFilename]) VALUES (3, 6, N'1af2215e-8c4d-493a-bef6-f1fdc3092a33', CAST(N'2019-12-04' AS Date), NULL, 2, N'37540a52-5f8d-4b9e-9139-72dafe688845.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenFriendshipId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatusId], [ResumeFilename]) VALUES (4, 2, N'1af2215e-8c4d-493a-bef6-f1fdc3092a33', CAST(N'2019-12-04' AS Date), NULL, 3, N'37540a52-5f8d-4b9e-9139-72dafe688845.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenFriendshipId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatusId], [ResumeFilename]) VALUES (5, 5, N'1af2215e-8c4d-493a-bef6-f1fdc3092a33', CAST(N'2019-12-05' AS Date), NULL, 3, N'37540a52-5f8d-4b9e-9139-72dafe688845.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenFriendshipId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatusId], [ResumeFilename]) VALUES (6, 3, N'1af2215e-8c4d-493a-bef6-f1fdc3092a33', CAST(N'2019-12-05' AS Date), NULL, 2, N'37540a52-5f8d-4b9e-9139-72dafe688845.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenFriendshipId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatusId], [ResumeFilename]) VALUES (7, 3, N'1e4d1ff5-adbe-486f-bfb7-d2d878fa3c0b', CAST(N'2019-12-05' AS Date), NULL, 3, N'85f13364-7ba5-492b-b662-e0226b283746.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenFriendshipId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatusId], [ResumeFilename]) VALUES (8, 1, N'1e4d1ff5-adbe-486f-bfb7-d2d878fa3c0b', CAST(N'2019-12-06' AS Date), NULL, 1, N'85f13364-7ba5-492b-b662-e0226b283746.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenFriendshipId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatusId], [ResumeFilename]) VALUES (9, 2, N'1e4d1ff5-adbe-486f-bfb7-d2d878fa3c0b', CAST(N'2019-12-06' AS Date), NULL, 3, N'85f13364-7ba5-492b-b662-e0226b283746.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenFriendshipId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatusId], [ResumeFilename]) VALUES (10, 5, N'1e4d1ff5-adbe-486f-bfb7-d2d878fa3c0b', CAST(N'2019-12-06' AS Date), NULL, 3, N'85f13364-7ba5-492b-b662-e0226b283746.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenFriendshipId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatusId], [ResumeFilename]) VALUES (1002, 4, N'1af2215e-8c4d-493a-bef6-f1fdc3092a33', CAST(N'2019-12-10' AS Date), NULL, 2, N'37540a52-5f8d-4b9e-9139-72dafe688845.pdf')
INSERT [dbo].[Applications] ([ApplicationId], [OpenFriendshipId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatusId], [ResumeFilename]) VALUES (1003, 8, N'1af2215e-8c4d-493a-bef6-f1fdc3092a33', CAST(N'2019-12-10' AS Date), N'sdgsdghsdgsdgsdgsdgs', 2, N'37540a52-5f8d-4b9e-9139-72dafe688845.pdf')
SET IDENTITY_INSERT [dbo].[Applications] OFF
SET IDENTITY_INSERT [dbo].[ApplicationStatuses] ON 

INSERT [dbo].[ApplicationStatuses] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (1, N'Pending', N'This application has not yet been reviewed')
INSERT [dbo].[ApplicationStatuses] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (2, N'Accepted', N'Congratulations! You''re now our friend')
INSERT [dbo].[ApplicationStatuses] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (3, N'Rejected', N'Sorry pal, you didn''t make the cut')
SET IDENTITY_INSERT [dbo].[ApplicationStatuses] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'98bc1520-4a1a-4b7e-8a84-28915b3221d6', N'Alpha')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'e7cdc4be-4243-4b57-b8c3-0429f11a9900', N'Beta')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b42e5255-1fde-4f52-89c5-e4b351675b72', N'Friend')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b4ffa56e-e31f-4b22-834f-5ea5cebdc800', N'98bc1520-4a1a-4b7e-8a84-28915b3221d6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0780da27-fc89-48fb-9331-c60311c309ac', N'b42e5255-1fde-4f52-89c5-e4b351675b72')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1af2215e-8c4d-493a-bef6-f1fdc3092a33', N'b42e5255-1fde-4f52-89c5-e4b351675b72')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1e4d1ff5-adbe-486f-bfb7-d2d878fa3c0b', N'b42e5255-1fde-4f52-89c5-e4b351675b72')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'65e31bab-7a62-474b-af5e-439f82ee860f', N'b42e5255-1fde-4f52-89c5-e4b351675b72')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7739ce78-8e61-4089-a589-073804aa26d7', N'b42e5255-1fde-4f52-89c5-e4b351675b72')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'50f6b06a-0b23-4b04-bc02-b20d380204b9', N'e7cdc4be-4243-4b57-b8c3-0429f11a9900')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'79d2dac3-ae5f-4c95-801b-a0c52b07cb54', N'e7cdc4be-4243-4b57-b8c3-0429f11a9900')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c87946e3-4135-4a25-a4aa-b28422d6b1ca', N'e7cdc4be-4243-4b57-b8c3-0429f11a9900')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0780da27-fc89-48fb-9331-c60311c309ac', N'superior@friendly.com', 0, N'AB4dkZ7ucN2ZpZklSKUdgEnxbggPykGTdEhgK26GLppC0s3DOS2tas8k6Cz8MzKRWg==', N'7f3217d9-596a-482d-b145-b53d9d7012e7', NULL, 0, 0, NULL, 1, 0, N'superior@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1af2215e-8c4d-493a-bef6-f1fdc3092a33', N'friend@friendly.com', 0, N'AFbYnW8j1UJ7M4ot3LZH6LtpTSzc+MuiyJbC7eH3vXwf1lBA+VWz9GrFz33Sa0OdjA==', N'f2372bdb-3a20-4243-8347-f950f0c0ccac', NULL, 0, 0, NULL, 1, 0, N'friend@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1e4d1ff5-adbe-486f-bfb7-d2d878fa3c0b', N'friend2@friendly.com', 0, N'AO94lgH05A97LX6FR6MPRQt3Bc72H4JMbPcWHrDO7Wh9OUDB3lAKzQfspdFmLUGZPA==', N'6575db1e-7e3d-4e06-aaf5-5a8596835638', NULL, 0, 0, NULL, 1, 0, N'friend2@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'350369f6-8f45-48b0-b3fa-859adf6ed718', N'test4@friendly.com', 0, N'AAt11xrmTthvRzSJjSG6qvw9kA0IHBlXXmoA8/g8cVPwHfxKJd6fnW1KLoOsWWIMqQ==', N'd5f20599-79fb-4f23-b05f-794a3a86857f', NULL, 0, 0, NULL, 1, 0, N'test4@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3da8ba64-8f92-449b-8253-eb845c5e2a77', N'test3@friendly.com', 0, N'ABs2NxJ6fbkWMjQWh5lM0aLJCfKZdlgBzhLF4GLgkTgRZDjHQlGhla6ArF82beftNA==', N'f45387ae-856e-42da-b629-186b2206fba1', NULL, 0, 0, NULL, 1, 0, N'test3@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'50f6b06a-0b23-4b04-bc02-b20d380204b9', N'beta2@friendly.com', 0, N'ANVfPfExPoQnWhtv6Ew5kZhM7RiGwWLSvVDlHpleX680oP+V8XOng3eTOdGcxo7ukg==', N'e496a116-5c5d-41e3-abae-5299c4ed77dc', NULL, 0, 0, NULL, 1, 0, N'beta2@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5fa866f0-9dd6-4e81-8218-ac1af2148e3b', N'test2@friendly.com', 1, N'AGZPPlJG86m1zNpX1I14eBRBB8J9XUuNUGZyrRZiRhh/2kZUH1hz8u9ngqu1pfOrTA==', N'846e962e-ebdb-41a3-8825-19560b3987e5', NULL, 0, 0, NULL, 1, 0, N'test2@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'65e31bab-7a62-474b-af5e-439f82ee860f', N'test6@friendly.com', 0, N'AH40r5c717+xuJOIIvL0OUyp9W3hC9I09L1w7rtnvfLSi/3x3W5mYtayJRUoO2B7JA==', N'5a5d9b6f-0b2d-4f29-9f92-9dfccefdfe43', NULL, 0, 0, NULL, 1, 0, N'test6@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7739ce78-8e61-4089-a589-073804aa26d7', N'test5@friendly.com', 0, N'ACJnxwYf8kt8N1mKX8/Elq6lWWgYfpBEWX/PmuO7iC/QY2H6LxUPmCysAiE8bpgEtQ==', N'02702949-295b-4997-807a-6f0b65d09e1f', NULL, 0, 0, NULL, 1, 0, N'test5@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'79d2dac3-ae5f-4c95-801b-a0c52b07cb54', N'nicholas@friendly.com', 0, N'AJQyQ/385oOWUyc/MACJ8Ca21/hI5aqMiTa0hOU9LiCMThHf2mq0Xpjpd2BXen/WBw==', N'9427e3c1-868e-467b-9a50-aecdde1b51bc', NULL, 0, 0, NULL, 1, 0, N'nicholas@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'851c8d41-1daf-4276-8afd-4387f35da726', N'test1@friendly.com', 0, N'AGhhevrpj7d9IKZziIGJqj8s7ZTtaOTKy25emUL30dAe8Vt8QY+gb6CUCEsdfRoBnA==', N'a44bd00d-e05e-4078-899a-d6b74080b5ad', NULL, 0, 0, NULL, 1, 0, N'test1@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b4ffa56e-e31f-4b22-834f-5ea5cebdc800', N'alpha@friendly.com', 0, N'AFPmvmsn30XixKGfA3MIFCI5LaiAg84aG0w8MYOVNiX74voiTbGynL15VKqONklvvA==', N'f6358384-b9ea-4f7c-ade5-79abb5b5c749', NULL, 0, 0, NULL, 1, 0, N'alpha@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c87946e3-4135-4a25-a4aa-b28422d6b1ca', N'beta@friendly.com', 0, N'ANAd9FIBEw30ZdIdbbBc0RvcNfqIEsLyVmia/+UIjR8xy2+zqzRRDnlFHOu786Mp7w==', N'a36dfbbd-59da-4fa9-a527-12ebd7a7cd80', NULL, 0, 0, NULL, 1, 0, N'beta@friendly.com')
SET IDENTITY_INSERT [dbo].[Cliques] ON 

INSERT [dbo].[Cliques] ([CliqueId], [Name], [City], [State], [BetaId]) VALUES (1, N'The Dogs', N'Gardner', N'KS', N'79d2dac3-ae5f-4c95-801b-a0c52b07cb54')
INSERT [dbo].[Cliques] ([CliqueId], [Name], [City], [State], [BetaId]) VALUES (3, N'The Circle', N'Gilroy', N'CA', N'c87946e3-4135-4a25-a4aa-b28422d6b1ca')
INSERT [dbo].[Cliques] ([CliqueId], [Name], [City], [State], [BetaId]) VALUES (5, N'Baseball Fanatics', N'Dallas', N'TX', N'c87946e3-4135-4a25-a4aa-b28422d6b1ca')
INSERT [dbo].[Cliques] ([CliqueId], [Name], [City], [State], [BetaId]) VALUES (6, N'Pirates', N'Cupertino', N'CA', N'50f6b06a-0b23-4b04-bc02-b20d380204b9')
SET IDENTITY_INSERT [dbo].[Cliques] OFF
SET IDENTITY_INSERT [dbo].[Friendships] ON 

INSERT [dbo].[Friendships] ([FriendshipId], [Title], [Description]) VALUES (1, N'Water boy', N'Get water for the rest of us')
INSERT [dbo].[Friendships] ([FriendshipId], [Title], [Description]) VALUES (2, N'Chauffeur', N'The person who always ends up driving')
INSERT [dbo].[Friendships] ([FriendshipId], [Title], [Description]) VALUES (3, N'Fantasy Sports Player', N'Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports. Someone who is proficient or passionate about playing fantasy sports.')
INSERT [dbo].[Friendships] ([FriendshipId], [Title], [Description]) VALUES (4, N'Hacker', N'The super geek')
SET IDENTITY_INSERT [dbo].[Friendships] OFF
SET IDENTITY_INSERT [dbo].[OpenFriendships] ON 

INSERT [dbo].[OpenFriendships] ([OpenFriendshipId], [FriendshipId], [CliqueId]) VALUES (1, 1, 1)
INSERT [dbo].[OpenFriendships] ([OpenFriendshipId], [FriendshipId], [CliqueId]) VALUES (2, 2, 3)
INSERT [dbo].[OpenFriendships] ([OpenFriendshipId], [FriendshipId], [CliqueId]) VALUES (3, 1, 3)
INSERT [dbo].[OpenFriendships] ([OpenFriendshipId], [FriendshipId], [CliqueId]) VALUES (4, 2, 5)
INSERT [dbo].[OpenFriendships] ([OpenFriendshipId], [FriendshipId], [CliqueId]) VALUES (5, 3, 5)
INSERT [dbo].[OpenFriendships] ([OpenFriendshipId], [FriendshipId], [CliqueId]) VALUES (6, 1, 5)
INSERT [dbo].[OpenFriendships] ([OpenFriendshipId], [FriendshipId], [CliqueId]) VALUES (8, 1, 6)
INSERT [dbo].[OpenFriendships] ([OpenFriendshipId], [FriendshipId], [CliqueId]) VALUES (9, 4, 6)
SET IDENTITY_INSERT [dbo].[OpenFriendships] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'1af2215e-8c4d-493a-bef6-f1fdc3092a33', N'Parker', N'Tenove', N'c555c07f-708f-4dfd-8c49-3b3881791a3b.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'1e4d1ff5-adbe-486f-bfb7-d2d878fa3c0b', N'John', N'Franks', N'85f13364-7ba5-492b-b662-e0226b283746.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'350369f6-8f45-48b0-b3fa-859adf6ed718', N'Jacob', N'Brokaw', N'8c8b09db-3b29-4b17-b625-b0be11deead2.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'3da8ba64-8f92-449b-8253-eb845c5e2a77', N'Eric', N'Sharman', N'1425bfeb-008d-4ea3-9778-b45eda35e2fd.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'50f6b06a-0b23-4b04-bc02-b20d380204b9', N'Steven', N'Jobs', N'32319070-71c5-49f6-85ba-a4817b163c73.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'5fa866f0-9dd6-4e81-8218-ac1af2148e3b', N'Johnny', N'Appleseed', N'4c12557c-e830-4c4e-b138-f85bb2b8e55f.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'65e31bab-7a62-474b-af5e-439f82ee860f', N'Bob', N'Boi', N'd0f56eb6-1476-418e-8fa7-565c85a6720a.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'7739ce78-8e61-4089-a589-073804aa26d7', N'Bill', N'Minard', N'1bdfd2c0-8a37-40f0-906f-e3094c917be0.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'79d2dac3-ae5f-4c95-801b-a0c52b07cb54', N'Nicholas', N'Brokaw', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'851c8d41-1daf-4276-8afd-4387f35da726', N'JOHN', N'SMITH', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'b4ffa56e-e31f-4b22-834f-5ea5cebdc800', N'Alpha', N'User', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'c87946e3-4135-4a25-a4aa-b28422d6b1ca', N'Jacob', N'Brokaw', NULL)
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_ApplicationStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_ApplicationStatuses] FOREIGN KEY([ApplicationStatusId])
REFERENCES [dbo].[ApplicationStatuses] ([ApplicationStatusId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_ApplicationStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_ApplicationStatuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_OpenFriendships]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_OpenFriendships] FOREIGN KEY([OpenFriendshipId])
REFERENCES [dbo].[OpenFriendships] ([OpenFriendshipId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_OpenFriendships]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_OpenFriendships]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Applications_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Applications]'))
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cliques_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cliques]'))
ALTER TABLE [dbo].[Cliques]  WITH CHECK ADD  CONSTRAINT [FK_Cliques_UserDetails] FOREIGN KEY([BetaId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cliques_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cliques]'))
ALTER TABLE [dbo].[Cliques] CHECK CONSTRAINT [FK_Cliques_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenFriendships_Cliques]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenFriendships]'))
ALTER TABLE [dbo].[OpenFriendships]  WITH CHECK ADD  CONSTRAINT [FK_OpenFriendships_Cliques] FOREIGN KEY([CliqueId])
REFERENCES [dbo].[Cliques] ([CliqueId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenFriendships_Cliques]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenFriendships]'))
ALTER TABLE [dbo].[OpenFriendships] CHECK CONSTRAINT [FK_OpenFriendships_Cliques]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenFriendships_Friendships]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenFriendships]'))
ALTER TABLE [dbo].[OpenFriendships]  WITH CHECK ADD  CONSTRAINT [FK_OpenFriendships_Friendships] FOREIGN KEY([FriendshipId])
REFERENCES [dbo].[Friendships] ([FriendshipId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OpenFriendships_Friendships]') AND parent_object_id = OBJECT_ID(N'[dbo].[OpenFriendships]'))
ALTER TABLE [dbo].[OpenFriendships] CHECK CONSTRAINT [FK_OpenFriendships_Friendships]
GO
