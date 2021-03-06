IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT IF EXISTS [FK_LessonViews_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT IF EXISTS [FK_LessonViews_Lessons]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
ALTER TABLE [dbo].[Lessons] DROP CONSTRAINT IF EXISTS [FK_Lessons_Courses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT IF EXISTS [FK_CourseCompletions_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT IF EXISTS [FK_CourseCompletions_Courses]
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
/****** Object:  Index [UserNameIndex]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP INDEX IF EXISTS [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP INDEX IF EXISTS [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP INDEX IF EXISTS [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP TABLE IF EXISTS [dbo].[LessonViews]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP TABLE IF EXISTS [dbo].[Lessons]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP TABLE IF EXISTS [dbo].[Courses]
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP TABLE IF EXISTS [dbo].[CourseCompletions]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Database [LMS]    Script Date: 12/2/2020 9:02:54 AM ******/
DROP DATABASE IF EXISTS [LMS]
GO
/****** Object:  Database [LMS]    Script Date: 12/2/2020 9:02:54 AM ******/
CREATE DATABASE [LMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\LMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\LMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LMS] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [LMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LMS] SET  MULTI_USER 
GO
ALTER DATABASE [LMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LMS] SET QUERY_STORE = OFF
GO
USE [LMS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/2/2020 9:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/2/2020 9:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/2/2020 9:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/2/2020 9:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/2/2020 9:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/2/2020 9:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 12/2/2020 9:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCompletions](
	[CourseCompletionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CourseID] [int] NOT NULL,
	[DateCompleted] [date] NOT NULL,
 CONSTRAINT [PK_CourseCompletions] PRIMARY KEY CLUSTERED 
(
	[CourseCompletionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12/2/2020 9:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](200) NOT NULL,
	[CourseDescription] [varchar](500) NULL,
	[CourseImage] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 12/2/2020 9:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[LessonTitle] [varchar](200) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Introduction] [varchar](300) NULL,
	[VideoURL] [varchar](250) NULL,
	[PdfFilename] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 12/2/2020 9:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonViews](
	[LessonViewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[LessonID] [int] NOT NULL,
	[DateViewed] [date] NOT NULL,
 CONSTRAINT [PK_LessonViews] PRIMARY KEY CLUSTERED 
(
	[LessonViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/2/2020 9:02:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202011170305388_InitialCreate', N'LMS.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416592B97EE621BD85BA44ED206CD0DEB64D1B7052DD18EB012A54A549AA0E897F5A19FD45FE850A26EBCE8622BB6532CB0B0C8E199E170480E87C3FCFBF73FE31F9F7CCF78C451EC0664621E8CF64D03133B705CB29C98095DBC796FFEF8E1EBAFC6678EFF647CCAE98E181DB424F1C47CA0343CB6ACD87EC03E8A47BE6B47411C2CE8C80E7C0B398175B8BFFF8375706061803001CB30C61F13425D1FA71FF0390D888D439A20EF2A70B017F372A899A5A8C635F2711C221B4FCCCBABD9E8FE6274F5693ACA884DE3C473110832C3DEC2341021014514C43CBE8FF18C460159CE422840DEDD7388816E81BC1873F18F4BF2AE3DD93F643DB1CA8639949DC434F07B021E1C71D55862F395146C16AA03E59D8192E933EB75AAC08979E1E0B4E863E081024486C7532F62C413F3AA60711287D7988EF286A30CF23C02B83F82E8CBA88AB867746EB75798D2E1689FFDDB33A6894793084F084E6884BC3DE336997BAEFD2B7EBE0BBE6032393A982F8EDEBF7D879CA377DFE3A3B7D59E425F81AE560045B75110E20864C38BA2FFA661D5DB5962C3A259A54DA615B0259815A671859E2E3159D207982F87EF4DE3DC7DC24E5EC28DEB9EB83089A0118D12F8BC4E3C0FCD3D5CD45B8D3CD9FF0D5C0FDFBE1B84EB357A7497E9D00BFC61E24430AF3E622FAD8D1FDC309B5EB5F1FECCC9CEA3C067DF75FBCA6A3FCF8224B25967022DC91D8A9698D6A51B5BA5F17632690635BC59E7A8BB6FDA4C52D9BC95A4AC43ABCC849CC5A667432EEFCBF2ED6C7127610883979A16D34893C1497BD54868BC679424A5E11C74351C021DFA3FAF83673E72BD0116C20E5CC00559B8918F8B5EFE1480D921D25BE65B14C7B00E38BFA0F8A14174F83980E8336C271198E78C223F7C716EB70F01C1D7893F6756BF395E830DCDDD1FC139B269109D11D66A6DBCCBC0FE1224F48C38A788E27B6AE780ECF3CEF5BB030C22CE896DE3383E0763C6CE34000F3B07BC20F4E8B0371C5B9FB6ED884C3DE4FA6A4F4458493FE7A4A537A2A6903C120D99CA2B6912F53258BAA49BA839A95ED48CA255544ED6575406D64D524EA9173425689533A31ACCCF4B476878472F85DD7D4F6FBDCD5BB71654D438831512FF8C098E6019736E11A53822E508745937B6E12CA4C3C798BEF8DE9472FA84BC6468562BCD867411187E36A4B0BB3F1B5231A1F8D1759857D2E1F89313037C277AF5C9AA7DCE09926D7A3AD4BAB969E69B590374D3E5248E03DB4D678122F0C5C31675F9C18733DA6318596FC43808740C0CDD655B1E9440DF4CD1A86EC829F630C5C6899D0506A728B69123AB113AE4F4102CDF51158295F190BA70DF493CC1D271C41A2176088A61A6BA84CAD3C225B61B22AF554B42CB8E5B18EB7BC143AC39C521268C61AB26BA3057873F9800051F6150DA3434B62A16D76C881AAF5537E66D2E6C39EE5254622336D9E23B6BEC92FB6F2F6298CD1ADB807136ABA48B00DA50DE360C949F55BA1A807870D93503154E4C1A03E52ED5460CB4AEB12D18685D25AFCE40B3236AD7F117CEABBB669EF583F2E6B7F546756DC1366BFAD831D3CC7C4F6843A1058E64F33C9DB34AFC4415873390939FCF62EEEA8A26C2C06798D64336A5BFABF443AD6610D1889A004B436B01E59780129034A17A0897C7F21AA5E35E440FD83CEED608CBD77E01B662033276F532B442A8BF32158DB3D3E9A3E859610D9291773A2C54701406212E5EF58E77508A2E2E2B2BA68B2FDCC71BAE748C0F4683825A3C578D92F2CE0CAEA5DC34DBB5A472C8FAB8646B6949709F345ACA3B33B896B88DB62B49E114F4700BD652517D0B1F68B2E5918E62B729EAC6569622C50BC69626976A7C85C2D025CB4A6E152F31665962D5F4CDAC7FCA919F615876ACC83C2AA42D38D120424B2CD4026B90F4DC8D627A8A289A2316E7993ABE44A6DC5B35CB7FCEB2BA7DCA8398EF033935FBCDA377D2D57D6DAB957D110E710E1DF499439346D115C3AF6E6EB05437E4A14811B89F065EE213BD7FA56F9D5DDF55DB672532C2D812E497FC27495992975BD77CA77191E7C4306354782FAB8F931E42A7EDDCF7ACEA5BE78FEA51F2F054154517B2DADAB8E9DC983E63253A88FD87AA15E1656615CF4AA902F0A29E1895C40609AC52D71DB59E7B52C5ACD7744714124CAA9042550F29AB69243521AB152BE16934AAA6E8CE414E1CA9A2CBB5DD91152924556845F50AD80A99C5BAEEA88A2C932AB0A2BA3B76997222AEA13BBC6F698F2DAB6E5CD9C176BD9D4B83F1320BE2301B5FE5FEBE0A5429EE89C56FE825305EBE93C6A43DDDAD6A4C5938633D63D260E8D79DDAC5777DD969BCADD763D66EB36B4B7BD36DBE1EAF9FC9BEA86148673B91A4E05E9CF184B3DC989FABDA1FCF4807AD8CC4347235C2B6FE1C53EC8F18C168F6BB37F55CCC16F19CE00A117781639A65709887FB0787C2039CDD790C63C5B1E329CEA5BA1731F531DB403216794491FD80223935628D072325A81475BE200E7E9A987FA6AD8ED30006FB9516EF1917F13D717F4FA0E22E4AB0F1979CEA394C027D87271B85A07FBD8AB710DD557EF1DBE7ACE99E7113C1743A36F60545AF32FCF51712BDA4C99AAE21CDCAEF265EEF6CAB3D4B50A20AB365F5570873970EF2022197F21B1F3D7DDB5734E52B83B510152F0986C21B4485BA9702AB60695F0938F049D35702FD3AAB7E35B08A68DA17032EE90F26BE17E8BE0CE52DB7B80F29CE4B9B5892523DB7E65BAF957CB9EDBD494ACB5E6BA2CBA9D73DE0064DAF5ECF45796569CB836D9D8AACE4C1B0B769F72F9E8ABC2BD9C7A5D3BEDDA4E34DE61937DC26FDAFD28B7720214E91E0B3FD24E24DDB9A2E00BCE39998FD528577CCD8F836BFFD84E04D1B9B2E40BCE3C6D62BED77C76C6D5BFBE7962DADF316BAF5245E391F497391A38A22B725E966217738FECF033082CCA3CCDE56AAB3C29A325A5B1896247AA6FA743491B1347124BE124533DB7E7DE51B7E6367394D335B4D1267136FBEFE37F2E634CDBC35A991DB482F562627AA52BE5BD6B1A6DCA9D7944E5CEB494BF67A9BCFDA782BFF9AB28707514A6DF6686E975F4FB2F0202A1972EAF4480E962F8A61EFACFC2D46D8BF63775942B0BFCC48B05DDB350B9A0BB208F2CD5B90282711223457982207B6D49388BA0B6453A86601E8F471781AD463D72073EC5C909B848609852E637FEED5025ECC0968E29F6640D7651EDF84EC2B1EA20B20A6CB02F737E4A7C4F59C42EE73454C4803C1BC0B1EEE65634959D877F95C205D07A42310575FE114DD613FF4002CBE2133F48857910DCCEF122F91FD5C46007520ED035157FBF8D445CB08F931C728DBC327D8B0E33F7DF80FC7CEDEAC92540000, N'6.2.0-61023')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'889f8155-e6b0-4415-8c73-79e4cd58b44d', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'40918047-9497-4037-ad97-af40becadf8e', N'Manager')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ce9eaae5-c161-4403-9ae1-aa7f14c17e76', N'Talent')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ffc68c40-5053-4f91-8c89-467f66ac0445', N'40918047-9497-4037-ad97-af40becadf8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'61a26e91-2219-4305-8af6-a49f1452ec78', N'889f8155-e6b0-4415-8c73-79e4cd58b44d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd5572e31-2f3f-470a-b1b3-d14d46de2de5', N'889f8155-e6b0-4415-8c73-79e4cd58b44d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'20bbbf3a-391f-4f62-a6dd-4c956a2e09b4', N'ce9eaae5-c161-4403-9ae1-aa7f14c17e76')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5d1b95c2-864f-40ca-9c8c-5140af009f8f', N'ce9eaae5-c161-4403-9ae1-aa7f14c17e76')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6f936972-a0bd-48ad-806d-982376c336bd', N'ce9eaae5-c161-4403-9ae1-aa7f14c17e76')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c45b3090-6410-422e-a2db-d9e4978488ae', N'ce9eaae5-c161-4403-9ae1-aa7f14c17e76')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'20bbbf3a-391f-4f62-a6dd-4c956a2e09b4', N'gambit@gambit.com', 0, N'AHhD1EnJ/WPU+NFzceTYxJtncToJIfe18QTAVJKssvzuJes9i3kXN6LYpP1hmvNBaQ==', N'fb903e2b-fd0a-46b5-9544-689fa3ee59c3', NULL, 0, 0, NULL, 1, 0, N'gambit@gambit.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5d1b95c2-864f-40ca-9c8c-5140af009f8f', N'owen@owen.com', 0, N'AJNW0ce//IA0ssf2IRhtii39BEtlVk0yU0447l8VtOmY8JmQymIPjKBXoiY7uPdsSQ==', N'05bf4ca1-12be-4238-9696-01ade82ccd82', NULL, 0, 0, NULL, 1, 0, N'owen@owen.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'61a26e91-2219-4305-8af6-a49f1452ec78', N'justin.l.kennedy@outlook.com', 0, N'AL9F5ekGTWPCRxBpvKGxb58+jq/lzyCdA2yeNIwZEKRXdFBHlgytFnGxDUWTE2xlrw==', N'5f69fa7d-fff7-4897-9769-bfa44d4755b8', NULL, 0, 0, NULL, 1, 0, N'justin.l.kennedy@outlook.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6f936972-a0bd-48ad-806d-982376c336bd', N'talent@justact.com', 0, N'AGv39IwBIZiQsBD6rcCafXWxs9BgbZ7DMTNzNkV2EW3UkwG7v2RiaipqJz4QS4nmAw==', N'9ea0e841-f26f-4d17-90f3-5bb278804061', NULL, 0, 0, NULL, 1, 0, N'talent@justact.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c45b3090-6410-422e-a2db-d9e4978488ae', N'ashleytriciaburns@gmail.com', 0, N'ABJ9iWNdLRK6QO5AN99B6n3PLk+vri5UUh/bhgjZvSKn4C0gh1HAS6oXpA6bhzKALg==', N'921f6c6d-50e4-41d0-a579-eea5bf31fee0', NULL, 0, 0, NULL, 1, 0, N'ashleytriciaburns@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd5572e31-2f3f-470a-b1b3-d14d46de2de5', N'admin@justact.com', 0, N'ADIllXjIbmsdP4l9obyHibOZoYA7o+gLe01YaRp85YHg7bDuOkL9E5jaKwLzcS+1GA==', N'2a40cd7d-b9b6-45a2-a440-9e1e28061b2b', NULL, 0, 0, NULL, 1, 0, N'admin@justact.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ffc68c40-5053-4f91-8c89-467f66ac0445', N'manager@justact.com', 0, N'AFsLtbpQKRBsJIj0wPDy9rF7l8IIHnmJuc1Xj5E7UZyLcnbQvKufzEOFz+mjEq2sEg==', N'923d8a27-2c66-43b6-a268-9e3d1f3ae760', NULL, 0, 0, NULL, 1, 0, N'manager@justact.com')
GO
SET IDENTITY_INSERT [dbo].[CourseCompletions] ON 

INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (9, N'20bbbf3a-391f-4f62-a6dd-4c956a2e09b4', 1, CAST(N'2020-11-30' AS Date))
SET IDENTITY_INSERT [dbo].[CourseCompletions] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [CourseImage], [IsActive]) VALUES (1, N'Audition Prep', N'Audition Prep will cover the basics on the audition process. From what to prepare and how to present yourself, to headshots and resumes, and how to handle rejection.', N'AuditionPrep.jpg', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [CourseImage], [IsActive]) VALUES (2, N'Monologues', N'Learn how to pick the right monologue, develop memorization techniques and how to tell a story.', N'Monologues.jpg', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [CourseImage], [IsActive]) VALUES (3, N'Acting For Stage', N'Stage directions and anatomy. Creating character and working on your craft.', N'ActingForStage.jpg', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [CourseImage], [IsActive]) VALUES (4, N'Acting For TV/Film', N'Learn set etiquette. Overacting and breaking the 4th wall. Becoming your character and acting off one another.', N'ActingForFilm.jpg', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [CourseImage], [IsActive]) VALUES (5, N'Improv', N'Short form and long form. The rules of improv.', N'Improv.jpg', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [CourseImage], [IsActive]) VALUES (6, N'Acting Techniques', N'Methods and techniques.', N'ActingTechniques.jpg', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [CourseImage], [IsActive]) VALUES (7, N'Commercials', N'Commercial Acting 101', N'Commercials.jpg', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [CourseImage], [IsActive]) VALUES (8, N'Voice-over', N'Normalizing your voice and how to be successful.', N'Voiceover.jpg', 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription], [CourseImage], [IsActive]) VALUES (9, N'Dialects', N'Dialects vs Accents', N'Dialects.jpg', 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (1, N'What Material To Prepare', 1, N'When you have an acting audition that allows you to choose audition material, you must choose EXPERTLY.', N'https://youtu.be/KxdtzOzC9zQ', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (2, N'How To Present Yourself', 1, N'Emmy Award Winning Casting Director Holly Powell guides actors through the importance of how they walk in to the audition room.', N'https://youtu.be/iziXTRkGNgg', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (3, N'Making It', 1, N'Stories straight from the mouth of professional actors on Making It.', N'https://youtu.be/YlqafzWTirQ', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (4, N'Résumé', 1, N'An acting résumé is a really important tool for actors that lists all of your prior performance experience and training. It''s a great way to show that you''re a professional right off the bat AND it can be the difference between whether or not you even get called in for an audition!', N'https://youtu.be/lvWjaDDrBCU', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (5, N'Type Casting', 1, N'CASTING TYPES - What they are, how to figure out your character type, and answer some acting type FAQs.  Plus, I''ll give my top tips on how to get cast OUTSIDE of your type!', N'https://youtu.be/wt0toIsjz2g', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (6, N'How To Handle Rejection', 1, N'How to handle rejection - a different outlook on auditioning', N'https://youtu.be/YlqafzWTirQ', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (7, N'Picking The Right Monologue', 2, N'How should you pick a monologue for an audition? What is a casting director looking for? Casting director/producer Erica Arvold, CSA, and acting coach Richard Warner give some tips on what to look for and where to look for the perfect choice.', N'https://youtu.be/YvykACeVI3c', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (8, N'How To Memorize Lines', 2, N'Professional actors would never limit their spontaneity when performing JUST because they memorized their lines a certain way. And neither should you.', N'https://youtu.be/uirjevmT_IA', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (9, N'Memorization Techniques', 2, N'The concept of this memory training technique is that you select places in your room to be locations where you mental store data. The first step is to turn the lines that you want to memorize into pictures and then visualize these images around the rooms in your mind.', N'https://youtu.be/Qm4ZjFxTCs0', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (10, N'How To Tell Stories', 2, N'Six tips to tell better stories. Telling good stories is huge when it comes to attraction as women love a man that can captivate an audience. If you learn how to tell stories effectively, you will have women all over you. So how does one tell a story properly?', N'https://youtu.be/dr9Beq0WjB0', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (11, N'How To Move Your Audience', 2, N'The ability to share your story with grace and finesse while moving your audience to their core is of paramount importance. You must know how to tell your story with relevance and power. In this video, you''ll discover the hows and whys to do exactly that.', N'https://youtu.be/Sl_65PK6rmE', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (12, N'Stage Directions', 3, N'In this video we take a very quick look at basic stage directions and how to find your way around a performance area.', N'https://youtu.be/0wzBPwhn-30', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (13, N'Stage Anatomy', 3, N'The topic of this video is stage anatomy. In this lesson we discuss some basic parts of a proscenium theatre.', N'https://youtu.be/ju6Q_0jXFE0', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (14, N'Creating Character', 3, N'Vanessa Ewan leads this movement direction masterclass, guiding an actor playing Nora from A Doll''s House using techniques to explore physicality and enhance character transformation.', N'https://youtu.be/1RRc4tq2kpE', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (15, N'Work On Your Craft', 3, N'Larry Moss is one of the most renowned acting coaches alive today. In our interview we ask Larry what actors can do everyday to work on their craft.', N'https://youtu.be/vqspj-jL-Q0', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (16, N'Set Etiquette', 4, N'Everything you need to know about working on a TV set so you can stop being nervous on your first day.', N'https://youtu.be/PuZ6w0o_BmM', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (17, N'How To Avoid Overacting', 4, N'What is overacting and how do we prevent it? Here are a few tips on how to direct actors and how to prevent overacting and indicating.', N'https://youtu.be/UqSjLHqK9x0', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (18, N'Become Your Character', 4, N'Various famous actors and actresses tell us what inspires and drives them when taking on new roles.', N'https://youtu.be/Ul_wE953yPQ', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (19, N'Acting Is Reacting', 4, N'Acting is reacting to your scene partner, your environment, your circumstances, everything.  Often times the best moments happen when an actor is in the moment, being silent and and reacting to everything that is happening in the scene.', N'https://youtu.be/q1Tyy3ljZ4s', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (20, N'Breaking The Fourth Wall', 4, N'Breaking the Fourth Wall is such a creative and unique cinematic technique, but just how much potential does it have? Let''s take a look at the various emotional effects a fourth wall break can have in film.', N'https://youtu.be/JLAaUvsKljc', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (21, N'Rules of Improvisation', 5, N'10 Basic Rules for Improvisation', N'https://youtu.be/StESLTnGyHM', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (22, N'Short Form & Long Form', 5, N'This episode takes a look at two types of Improv most commonly referred to as Short Form and Long Form. We''ll define them both, talk about their differences, their similarities, and address the all too common question - which type of Improv is "better"...', N'https://youtu.be/t4tDifULJTg', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (23, N'Improv 101', 5, N'Take a peak inside Chicago''s Second City, where Sonia Gil learns about the comedy club''s origins and takes an Improv 101 course!', N'https://youtu.be/u-cmV0eO6Bw', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (24, N'Stanislavski Method', 6, N'Stanislavski’s conception of “psychological realism” in performance challenged ideas about the essential features of the actor’s craft that had been held for centuries.', N'https://youtu.be/iB1fPZX5Zgk', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (25, N'Method Acting Technique', 6, N'A technique of acting in which an actor aspires to complete emotional identification with a part, based on the system evolved by Stanislavsky and brought into prominence by Lee Strasberg.', N'https://youtu.be/OBd_-ks6Mls', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (26, N'Meisner Technique', 6, N'The focus of the Meisner approach is for the actor to "get out of their head", such that the actor is behaving instinctively to the surrounding environment.', N'https://youtu.be/ShC2nc98Jw0', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (27, N'Chekhov Technique', 6, N'The Chekhov Technique seeks a connection between making an outer physical action and sensing how this movement evokes an inner response. All physical exercises are done with the intention of awakening an inner psychological response.', N'https://youtu.be/PufzXM820w4', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (28, N'Practical Aesthetics', 6, N'Practical Aesthetics is an acting technique originally conceived by David Mamet and William H. Macy, aimed at making the experience of acting entirely based on the will of the actor, and asks an actor only to commit his will to the pursuit of an action based on the other actor.', N'https://youtu.be/NYXbkleQawc', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (29, N'Uta Hagen Technique', 6, N'The key elements of Hagen’s technique are substitution, transference, specificity, authenticity, and preparation. Above all, Hagen spoke about honesty, making choices and actions not to "show" any acting but to truly be in the moment.', N'https://youtu.be/r7v5zB-jg40', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (30, N'Types Of Commercials', 7, N'1. Emotion
2. Bandwagon
3.Testimonial 
4. Family
5. Plain Appeal
6. Sex Appeal', N'https://youtu.be/_5IO5UGcN5g', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (31, N'Commercial Acting 101', 7, N'Hey guys, here''s a great video for you to watch if you''re interested in doing commercials, but you have some questions or don''t know where to start.', N'https://youtu.be/t-qgMCk7YAU', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (32, N'How To Use The Frame', 7, N'How actors can set up self-tapes at home, and learn to use what the camera sees (aka the "frame") to their advantage.', N'https://youtu.be/PCRiYyHzTyw', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (33, N'Commercial Basics', 7, N'Commercials are only one way for voice actors to make a living, but they’re a good one. Anything that you hear advertising a product on television or radio is a commercial.', N'https://youtu.be/jAxJk0XyaFE', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (34, N'Audition Tips', 8, N'In this video, we are going to go over 8 of the best tips for auditioning. We are going to cover exactly what the professional voice actors do and shed some light on their workflow to help you book more work.', N'https://youtu.be/wrpNBp5kU8U', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (35, N'Create Different Voices', 8, N'Most people are only able to speak in their own voice, accent and language. Very few can make careers using multiple voices...but the ones that do make an absolute killing.', N'https://youtu.be/FVmAEezr6ao', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (36, N'How To Be Successful', 8, N'25 VOICE OVER TIPS Explained with Examples', N'https://youtu.be/x8q_fiXFLpw', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (37, N'Dialect vs Accent', 9, N'How do you keep them all straight? The differences between these three linguistic terms can be confusing, but they don''t have to be.', N'https://youtu.be/jxR2188FvLE', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (38, N'Idiolect, Dialect, & Accent', 9, N'The difference between Accent & Dialect, and moving from Idiolect to Accent to Idiolect.', N'https://youtu.be/Lceb-lCJSSI', N'JustinLKennedyResume.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFilename], [IsActive]) VALUES (39, N'Prioritizing Accents', 9, N'What accent should you learn when it''s not immediately demanded by a project? Jim Johnson leads you through a list of which accents and dialects to work on as a part of your personal "Accent University."', N'https://youtu.be/OpFi3GPgwRo', N'JustinLKennedyResume.pdf', 1)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
GO
SET IDENTITY_INSERT [dbo].[LessonViews] ON 

INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (1, N'20bbbf3a-391f-4f62-a6dd-4c956a2e09b4', 1, CAST(N'2020-11-29' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (2, N'20bbbf3a-391f-4f62-a6dd-4c956a2e09b4', 2, CAST(N'2020-11-29' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3, N'5d1b95c2-864f-40ca-9c8c-5140af009f8f', 1, CAST(N'2020-11-30' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (4, N'20bbbf3a-391f-4f62-a6dd-4c956a2e09b4', 3, CAST(N'2020-11-30' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5, N'20bbbf3a-391f-4f62-a6dd-4c956a2e09b4', 4, CAST(N'2020-11-30' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (6, N'20bbbf3a-391f-4f62-a6dd-4c956a2e09b4', 5, CAST(N'2020-11-30' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (17, N'5d1b95c2-864f-40ca-9c8c-5140af009f8f', 2, CAST(N'2020-11-30' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (18, N'5d1b95c2-864f-40ca-9c8c-5140af009f8f', 3, CAST(N'2020-11-30' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (19, N'5d1b95c2-864f-40ca-9c8c-5140af009f8f', 4, CAST(N'2020-11-30' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (20, N'5d1b95c2-864f-40ca-9c8c-5140af009f8f', 5, CAST(N'2020-11-30' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (22, N'20bbbf3a-391f-4f62-a6dd-4c956a2e09b4', 6, CAST(N'2020-11-30' AS Date))
SET IDENTITY_INSERT [dbo].[LessonViews] OFF
GO
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'20bbbf3a-391f-4f62-a6dd-4c956a2e09b4', N'Gambit', N'Kennedy')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'5d1b95c2-864f-40ca-9c8c-5140af009f8f', N'Owen', N'Kennedy')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'61a26e91-2219-4305-8af6-a49f1452ec78', N'Justin', N'Kennedy')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'c45b3090-6410-422e-a2db-d9e4978488ae', N'Ashley', N'Burns')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/2/2020 9:02:54 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/2/2020 9:02:54 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/2/2020 9:02:54 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/2/2020 9:02:54 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/2/2020 9:02:54 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/2/2020 9:02:54 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_Courses]
GO
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_UserDetails]
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Courses]
GO
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_Lessons] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lessons] ([LessonID])
GO
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_Lessons]
GO
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_UserDetails]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
ALTER DATABASE [LMS] SET  READ_WRITE 
GO
