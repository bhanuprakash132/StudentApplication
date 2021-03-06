USE [master]
GO
/****** Object:  Database [StudentApplication]    Script Date: 11-02-2022 13:37:13 ******/
CREATE DATABASE [StudentApplication]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentApplication', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\StudentApplication.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentApplication_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\StudentApplication_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StudentApplication] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentApplication].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentApplication] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentApplication] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentApplication] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentApplication] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentApplication] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentApplication] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentApplication] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentApplication] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentApplication] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentApplication] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentApplication] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentApplication] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentApplication] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentApplication] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentApplication] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentApplication] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentApplication] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentApplication] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentApplication] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentApplication] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentApplication] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentApplication] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentApplication] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentApplication] SET  MULTI_USER 
GO
ALTER DATABASE [StudentApplication] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentApplication] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentApplication] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentApplication] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentApplication] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentApplication', N'ON'
GO
ALTER DATABASE [StudentApplication] SET QUERY_STORE = OFF
GO
USE [StudentApplication]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11-02-2022 13:37:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 11-02-2022 13:37:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[MarkId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[SubId] [int] NULL,
	[Marks] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[MarkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 11-02-2022 13:37:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[ClassName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 11-02-2022 13:37:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220207103816_First', N'5.0.8')
SET IDENTITY_INSERT [dbo].[Marks] ON 

INSERT [dbo].[Marks] ([MarkId], [StudentId], [SubId], [Marks]) VALUES (1, 2, 2, CAST(92.00 AS Decimal(18, 2)))
INSERT [dbo].[Marks] ([MarkId], [StudentId], [SubId], [Marks]) VALUES (2, 2, 5, CAST(90.00 AS Decimal(18, 2)))
INSERT [dbo].[Marks] ([MarkId], [StudentId], [SubId], [Marks]) VALUES (3, 4, 1, CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[Marks] ([MarkId], [StudentId], [SubId], [Marks]) VALUES (4, 4, 3, CAST(82.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Marks] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [ClassName]) VALUES (2, N'Sakshi', N'Singhal', N'11th')
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [ClassName]) VALUES (4, N'Nehal', N'Sharma', N'11th')
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([SubjectId], [SubjectName]) VALUES (1, N'Hindi')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName]) VALUES (2, N'English')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName]) VALUES (3, N'Maths')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName]) VALUES (4, N'Science')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName]) VALUES (5, N'Social Science')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
/****** Object:  Index [IX_Marks_StudentId]    Script Date: 11-02-2022 13:37:14 ******/
CREATE NONCLUSTERED INDEX [IX_Marks_StudentId] ON [dbo].[Marks]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Marks_SubId]    Script Date: 11-02-2022 13:37:14 ******/
CREATE NONCLUSTERED INDEX [IX_Marks_SubId] ON [dbo].[Marks]
(
	[SubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Students_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Students_StudentId]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Subjects_SubId] FOREIGN KEY([SubId])
REFERENCES [dbo].[Subjects] ([SubjectId])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Subjects_SubId]
GO
USE [master]
GO
ALTER DATABASE [StudentApplication] SET  READ_WRITE 
GO
