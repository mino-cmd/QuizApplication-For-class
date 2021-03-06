USE [master]
GO
/****** Object:  Database [QuizApp]    Script Date: 7/10/2020 1:09:29 AM ******/
CREATE DATABASE [QuizApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuizApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QuizApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuizApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QuizApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QuizApp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuizApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuizApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizApp] SET RECOVERY FULL 
GO
ALTER DATABASE [QuizApp] SET  MULTI_USER 
GO
ALTER DATABASE [QuizApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuizApp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuizApp', N'ON'
GO
ALTER DATABASE [QuizApp] SET QUERY_STORE = OFF
GO
USE [QuizApp]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 7/10/2020 1:09:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuizType] [varchar](50) NULL,
	[Question_Text] [varchar](max) NULL,
	[OptionA] [varchar](50) NULL,
	[OptionB] [varchar](50) NULL,
	[OptionC] [varchar](50) NULL,
	[OptionD] [varchar](50) NULL,
	[Answer] [varchar](50) NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizScore]    Script Date: 7/10/2020 1:09:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizScore](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Score] [int] NULL,
	[QuizDate] [date] NULL,
 CONSTRAINT [PK_QuizScore] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysUser]    Script Date: 7/10/2020 1:09:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[FullName] [varchar](100) NULL,
 CONSTRAINT [PK_SysUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (1, N'Country', N'Which of the following group of countries together called ''Scandinavia''?', N'Spain and Portugal', N'Norway, Sweden, Iceland and Denmark', N'England, Spain', N'Sweden, Austria', N'Norway, Sweden, Iceland and Denmark')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (2, N'Country', N'Which of the following countries of the Europe are known as Baltic States?', N'Estonia', N'Lithuania', N'Latvia', N'All', N'All')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (3, N'Country', N'Per Capital GDP per Year in Germany ?', N'$65,458', N'$66,458', N'$47,201', N'$46,201', N'$47,201')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (4, N'Country', N'Germany Rank in Military Expenditure rank in the World ?', N'98', N'50', N'110', N'101', N'98')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (5, N'Country', N'Which country has largest Population?', N'India', N'USA', N'China', N'England', N'China')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (6, N'Country', N'Which one of the following is South Asian Country?', N'Nepal', N'Turkey', N'Iran', N'Syria', N'Nepal')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (7, N'Country', N'Which country has largest GDP?', N'USA', N'China', N'Japan', N'Germany', N'USA')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (8, N'Country', N'49 is International Calling Code of', N'Spain', N'England', N'Germany', N'Latvia', N'Germany')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (9, N'Country', N'Largest Country in the World is?', N'Canada', N'Russia', N'USA', N'China', N'Russia')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (10, N'Country', N'Angela Merkel is president of', N'Spain', N'Germany', N'Pakistan', N'India', N'Germany')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (11, N'Capital', N'Capital name of Germany', N'Berlin', N'Frankfurt', N'London', N'Munich', N'Berlin')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (12, N'Capital', N'Most Beautiful capital', N'New York ', N'Ottawa', N'Tokyo', N'London', N'London')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (13, N'Capital', N'2nd Most Beautiful capital', N'Ottawa', N'Islamabad', N'Tokyo', N'Paris', N'Islamabad')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (14, N'Capital', N'What is the capital city of Argentina ?', N'Kathmandu', N'Buenos Aires', N'Lima', N'Bombay', N'Buenos Aires')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (15, N'Capital', N'What is the capital city of Armenia ?', N'Manama', N'Yerevan', N'Bridgetown', N'Tokyo', N'Yerevan')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (16, N'Capital', N'Canberra is the capital city of ?', N'Austria', N'Malaysia', N'Australia', N'Canada', N'Australia')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (17, N'Capital', N'Brussels is the capital city of ?', N'Belgium', N'Spain', N'Italy', N'Greece', N'Belgium')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (18, N'Capital', N'What is the capital city of Brazil ?', N'Sofia', N'Brasilia', N'Venice', N'Manama', N'Brasilia')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (19, N'Capital', N'What is the capital city of Brunei ?', N'Stockholm', N'Brasilia', N'Bandar Seri Begawan', N'Bridgetown', N'Bandar Seri Begawan')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (20, N'Capital', N'What is the capital city of Bulgaria ?', N'Tokyo', N'Paris', N'Sofia', N'Bern', N'Sofia')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (21, N'Flag', N'This is the Flag of country', N'Austria', N'England', N'USA', N'France', N'Austria')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (22, N'Flag', N'This is the Flag of country', N'Belgium', N'Greece', N'Austria', N'Canada', N'Belgium')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (23, N'Flag', N'This is the Flag of country', N'Croatia', N'Italy', N'Czech', N'Finland', N'Croatia')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (24, N'Flag', N'This is the Flag of country', N'Argentina', N'Greece', N'Czech', N'Austria', N'Czech')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (25, N'Flag', N'This is the Flag of country', N'Ireland', N'Argentina', N'France', N'Finland', N'Finland')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (26, N'Flag', N'This is the Flag of country', N'Belgium', N'Ireland', N'France', N'Ireland', N'France')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (27, N'Flag', N'This is the Flag of country', N'Spain', N'Germany', N'Denmark', N'Brasil', N'Germany')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (28, N'Flag', N'This is the Flag of country', N'Canada', N'Spain', N'Hungary', N'England', N'Hungary')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (29, N'Flag', N'This is the Flag of country', N'Crotia', N'Greece', N'Italy', N'Iceland', N'Iceland')
INSERT [dbo].[Quiz] ([Id], [QuizType], [Question_Text], [OptionA], [OptionB], [OptionC], [OptionD], [Answer]) VALUES (30, N'Flag', N'This is the Flag of country', N'Germany', N'Finland', N'Italy', N'Greece', N'Italy')
SET IDENTITY_INSERT [dbo].[Quiz] OFF
SET IDENTITY_INSERT [dbo].[QuizScore] ON 

INSERT [dbo].[QuizScore] ([Id], [UserId], [Score], [QuizDate]) VALUES (1, 1, 60, CAST(N'2020-07-10' AS Date))
INSERT [dbo].[QuizScore] ([Id], [UserId], [Score], [QuizDate]) VALUES (2, 1, 40, CAST(N'2020-07-10' AS Date))
SET IDENTITY_INSERT [dbo].[QuizScore] OFF
SET IDENTITY_INSERT [dbo].[SysUser] ON 

INSERT [dbo].[SysUser] ([Id], [Username], [Password], [FullName]) VALUES (1, N'fajar', N'123', N'Fajar')
SET IDENTITY_INSERT [dbo].[SysUser] OFF
ALTER TABLE [dbo].[QuizScore]  WITH CHECK ADD  CONSTRAINT [FK_QuizScore_QuizScore] FOREIGN KEY([UserId])
REFERENCES [dbo].[SysUser] ([Id])
GO
ALTER TABLE [dbo].[QuizScore] CHECK CONSTRAINT [FK_QuizScore_QuizScore]
GO
USE [master]
GO
ALTER DATABASE [QuizApp] SET  READ_WRITE 
GO
