/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.2027)
    Source Database Engine Edition : Microsoft SQL Server Standard Edition
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
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/13/2019 9:08:51 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[OpenFriendships]    Script Date: 12/13/2019 9:08:51 AM ******/
DROP TABLE IF EXISTS [dbo].[OpenFriendships]
GO
/****** Object:  Table [dbo].[Friendships]    Script Date: 12/13/2019 9:08:51 AM ******/
DROP TABLE IF EXISTS [dbo].[Friendships]
GO
/****** Object:  Table [dbo].[Cliques]    Script Date: 12/13/2019 9:08:51 AM ******/
DROP TABLE IF EXISTS [dbo].[Cliques]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/13/2019 9:08:51 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/13/2019 9:08:51 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/13/2019 9:08:51 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/13/2019 9:08:51 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/13/2019 9:08:51 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[ApplicationStatuses]    Script Date: 12/13/2019 9:08:51 AM ******/
DROP TABLE IF EXISTS [dbo].[ApplicationStatuses]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 12/13/2019 9:08:51 AM ******/
DROP TABLE IF EXISTS [dbo].[Applications]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/13/2019 9:08:51 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/13/2019 9:08:51 AM ******/
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
/****** Object:  Table [dbo].[Applications]    Script Date: 12/13/2019 9:08:52 AM ******/
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
/****** Object:  Table [dbo].[ApplicationStatuses]    Script Date: 12/13/2019 9:08:52 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/13/2019 9:08:53 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/13/2019 9:08:53 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/13/2019 9:08:53 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/13/2019 9:08:53 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/13/2019 9:08:54 AM ******/
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
/****** Object:  Table [dbo].[Cliques]    Script Date: 12/13/2019 9:08:54 AM ******/
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
/****** Object:  Table [dbo].[Friendships]    Script Date: 12/13/2019 9:08:54 AM ******/
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
/****** Object:  Table [dbo].[OpenFriendships]    Script Date: 12/13/2019 9:08:54 AM ******/
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
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/13/2019 9:08:55 AM ******/
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

INSERT [dbo].[Applications] ([ApplicationId], [OpenFriendshipId], [UserId], [ApplicationDate], [ManagerNotes], [ApplicationStatusId], [ResumeFilename]) VALUES (1008, 12, N'8f48d92d-7d0f-4fef-8766-1794d55d7231', CAST(N'2019-12-13' AS Date), N'William seems like a great a guy. I''ve looked over his resume and I''ll be calling him this afternoon.', 2, N'f2af4470-c784-43cb-abbb-36fc6a40545c.pdf')
SET IDENTITY_INSERT [dbo].[Applications] OFF
SET IDENTITY_INSERT [dbo].[ApplicationStatuses] ON 

INSERT [dbo].[ApplicationStatuses] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (1, N'Pending', N'This application has not yet been reviewed')
INSERT [dbo].[ApplicationStatuses] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (2, N'Accepted', N'Congratulations! You''re now our friend')
INSERT [dbo].[ApplicationStatuses] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (3, N'Rejected', N'Sorry pal, you didn''t make the cut')
SET IDENTITY_INSERT [dbo].[ApplicationStatuses] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'98bc1520-4a1a-4b7e-8a84-28915b3221d6', N'Alpha')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b42e5255-1fde-4f52-89c5-e4b351675b72', N'Friend')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'e7cdc4be-4243-4b57-b8c3-0429f11a9900', N'Beta')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'25890b9a-a7c7-441c-bca0-b0282a5a79c2', N'b42e5255-1fde-4f52-89c5-e4b351675b72')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4d21fe5c-b56c-40a5-be5d-606466e10484', N'e7cdc4be-4243-4b57-b8c3-0429f11a9900')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8f48d92d-7d0f-4fef-8766-1794d55d7231', N'b42e5255-1fde-4f52-89c5-e4b351675b72')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cfd10459-8050-40ae-b93d-29b19c2fab14', N'e7cdc4be-4243-4b57-b8c3-0429f11a9900')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f369c99f-60c2-41ef-8123-fcd128826c73', N'98bc1520-4a1a-4b7e-8a84-28915b3221d6')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'25890b9a-a7c7-441c-bca0-b0282a5a79c2', N'friend1@friendly.com', 0, N'ALdGjijAxFB2MPKdvIRjyLy8VmaDTFbjTFetV9pvVZDSwUxbSlY7tksx07m7P+/YeA==', N'dc15f43d-b008-4b15-ab95-cb59cb154750', NULL, 0, 0, NULL, 1, 0, N'friend1@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4d21fe5c-b56c-40a5-be5d-606466e10484', N'superior2@friendly.com', 0, N'ANgfXhVRf1DAuLmI0uk8tYJROzC/wA4AThLyIPluApGPJ2nGYeSsfD+R2yMeUCt89A==', N'52ff1cb1-913c-4876-a73a-3608a82aae04', NULL, 0, 0, NULL, 1, 0, N'superior2@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8f48d92d-7d0f-4fef-8766-1794d55d7231', N'friend2@friendly.com', 0, N'AO1LnCN0c/HWraYl40HT1qRK/veqctN3BnPDAuxB8YqErvZrqXwXK8CKhMjAUrQp1g==', N'8b97b577-28d9-4b01-8b65-e0770a4bc745', NULL, 0, 0, NULL, 1, 0, N'friend2@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cfd10459-8050-40ae-b93d-29b19c2fab14', N'superior1@friendly.com', 0, N'ANgxxQtnrpYxt2JWXu8VcsQ2SLIuF3KgCArx3cVz+D03d2kYulYj47akcek+WH1pUw==', N'7e6ac7f5-ac8e-4774-a7eb-d5f03471d815', NULL, 0, 0, NULL, 1, 0, N'superior1@friendly.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f369c99f-60c2-41ef-8123-fcd128826c73', N'admin@friendly.com', 0, N'ADm/y3d+cc3HdpSF7wqykJQXrGZjJ+3s6L+YL0+ZQrxP0Bv5mugJh3VjOzPB/ML2OA==', N'f51c42c4-7926-4e9c-a2d6-dc0aebc011a1', NULL, 0, 0, NULL, 1, 0, N'admin@friendly.com')
SET IDENTITY_INSERT [dbo].[Cliques] ON 

INSERT [dbo].[Cliques] ([CliqueId], [Name], [City], [State], [BetaId]) VALUES (8, N'Sports Fans', N'Kansas City', N'MO', N'cfd10459-8050-40ae-b93d-29b19c2fab14')
INSERT [dbo].[Cliques] ([CliqueId], [Name], [City], [State], [BetaId]) VALUES (9, N'The Finer Things Club', N'Scranton', N'PA', N'4d21fe5c-b56c-40a5-be5d-606466e10484')
INSERT [dbo].[Cliques] ([CliqueId], [Name], [City], [State], [BetaId]) VALUES (10, N'The Artists', N'Scranton', N'PA', N'4d21fe5c-b56c-40a5-be5d-606466e10484')
SET IDENTITY_INSERT [dbo].[Cliques] OFF
SET IDENTITY_INSERT [dbo].[Friendships] ON 

INSERT [dbo].[Friendships] ([FriendshipId], [Title], [Description]) VALUES (5, N'Snack Bringer', N'The person who always brings the best snacks')
INSERT [dbo].[Friendships] ([FriendshipId], [Title], [Description]) VALUES (6, N'Lunch Buddy', N'We need another person to sit with us at lunch. And that''s you!')
INSERT [dbo].[Friendships] ([FriendshipId], [Title], [Description]) VALUES (7, N'Chauffeur', N'If you ever do anything with your clique, you''re driving')
INSERT [dbo].[Friendships] ([FriendshipId], [Title], [Description]) VALUES (8, N'Ping Pong Partner', N'Each time we play ping pong, you''ll be playing too')
SET IDENTITY_INSERT [dbo].[Friendships] OFF
SET IDENTITY_INSERT [dbo].[OpenFriendships] ON 

INSERT [dbo].[OpenFriendships] ([OpenFriendshipId], [FriendshipId], [CliqueId]) VALUES (12, 5, 8)
SET IDENTITY_INSERT [dbo].[OpenFriendships] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'25890b9a-a7c7-441c-bca0-b0282a5a79c2', N'Jack', N'Riley', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'4d21fe5c-b56c-40a5-be5d-606466e10484', N'Jane', N'Doe', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'8f48d92d-7d0f-4fef-8766-1794d55d7231', N'William', N'Minard', N'f2af4470-c784-43cb-abbb-36fc6a40545c.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'cfd10459-8050-40ae-b93d-29b19c2fab14', N'John', N'Doe', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'f369c99f-60c2-41ef-8123-fcd128826c73', N'Troy', N'Baker', NULL)
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
