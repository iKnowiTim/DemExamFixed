USE [master]
GO
/****** Object:  Database [DemServer]    Script Date: 3/13/2021 9:45:13 AM ******/
CREATE DATABASE [DemServer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemServer', FILENAME = N'D:\SQLSERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\DemServer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemServer_log', FILENAME = N'D:\SQLSERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\DemServer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DemServer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemServer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemServer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemServer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemServer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemServer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemServer] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemServer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemServer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemServer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemServer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemServer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemServer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemServer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemServer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemServer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemServer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemServer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemServer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemServer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemServer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemServer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemServer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemServer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemServer] SET RECOVERY FULL 
GO
ALTER DATABASE [DemServer] SET  MULTI_USER 
GO
ALTER DATABASE [DemServer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemServer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemServer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemServer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemServer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemServer] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DemServer', N'ON'
GO
ALTER DATABASE [DemServer] SET QUERY_STORE = OFF
GO
USE [DemServer]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Import_good]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Import_good](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[ClientPhoto] [nvarchar](50) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[RegistrationDate] [datetime2](7) NOT NULL,
	[TagID] [int] NULL,
 CONSTRAINT [PK_Client_Import_good] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientServiceGood]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientServiceGood](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Client] [nvarchar](255) NULL,
	[StartServiceTime] [datetime] NULL,
	[Service] [nvarchar](255) NULL,
	[ClientID] [int] NULL,
	[ServiceID] [int] NULL,
 CONSTRAINT [PK_ClientServiceGood] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service_good]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_good](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameService] [nvarchar](100) NOT NULL,
	[Time(min)] [int] NOT NULL,
	[Prive] [nvarchar](50) NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_Service_good] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 3/13/2021 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client_Import_good] ON 

INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (1, N'Голубев	', N'Иосиф	', N'Тимофеевич	', N'м', N'7789727311 ', N'Клиенты\m18.jpg', CAST(N'1982-05-06T00:00:00.0000000' AS DateTime2), N'smcnabb@att.net', CAST(N'2018-08-18T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (2, N'Ермакова', N'Алла', N'Мироновна	', N'ж', N'7064371373 ', N'Клиенты\48.jpg', CAST(N'1976-01-22T00:00:00.0000000' AS DateTime2), N'whimsy@aol.com', CAST(N'2017-02-09T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (3, N'Селиверстов', N'Глеб', N'Максимович	', N'м', N'7205542868 ', N'Клиенты\m37.jpg', CAST(N'1999-06-20T00:00:00.0000000' AS DateTime2), N'jigsaw@sbcglobal.net', CAST(N'2016-01-07T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (4, N'Агафонов	', N'Юстиниан	', N'Олегович	', N'м', N'73038102878 ', N'Клиенты\m1.jpg', CAST(N'1997-02-02T00:00:00.0000000' AS DateTime2), N'staffelb@sbcglobal.net', CAST(N'2016-06-08T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (5, N'Колобова	', N'Злата	', N'Романовна	', N'ж', N'7508840735 ', N'Клиенты\18.jpg', CAST(N'1994-08-25T00:00:00.0000000' AS DateTime2), N'sinkou@aol.com', CAST(N'2016-12-03T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (6, N'Сысоева', N'Дарина', N'Ярославовна	', N'ж', N'706983879604 ', N'Клиенты\32.jpg', CAST(N'1982-02-03T00:00:00.0000000' AS DateTime2), N'treit@verizon.net', CAST(N'2016-05-13T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (7, N'Некрасов', N'Варлам', N'Михайлович	', N'м', N'70192580635 ', N'Клиенты\m42.jpg', CAST(N'2000-11-12T00:00:00.0000000' AS DateTime2), N'dogdude@verizon.net', CAST(N'2017-12-03T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (8, N'Крюков	', N'Наум	', N'Ильяович	', N'м', N'7816578892 ', N'Клиенты\m30.jpg', CAST(N'1993-11-17T00:00:00.0000000' AS DateTime2), N'floxy@hotmail.com', CAST(N'2017-02-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (9, N'Сидорова', N'Татьяна', N'Михайловна	', N'ж', N'7517329179 ', N'Клиенты\42.jpg', CAST(N'1974-04-24T00:00:00.0000000' AS DateTime2), N'tbeck@mac.com', CAST(N'2018-10-03T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (10, N'Трофимова', N'Альжбета', N'Якововна	', N'ж', N'710846589295 ', N'Клиенты\25.jpg', CAST(N'1988-10-22T00:00:00.0000000' AS DateTime2), N'gbacon@mac.com', CAST(N'2017-09-21T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (11, N'Новиков', N'Адриан', N'Аркадьевич	', N'м', N'7705723362 ', N'Клиенты\m40.jpg', CAST(N'1974-01-15T00:00:00.0000000' AS DateTime2), N'multiplx@verizon.net', CAST(N'2018-11-23T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (12, N'Мишина', N'Иветта', N'Андреевна	', N'ж', N'739262448196 ', N'Клиенты\30.jpg', CAST(N'2002-10-05T00:00:00.0000000' AS DateTime2), N'aukjan@yahoo.com', CAST(N'2016-01-24T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (13, N'Шестаков', N'Геннадий', N'Рубенович	', N'м', N'720660371160 ', N'Клиенты\m41.jpg', CAST(N'2001-07-01T00:00:00.0000000' AS DateTime2), N'tokuhirom@live.com', CAST(N'2018-12-08T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (14, N'Зуев', N'Матвей', N'Иванович	', N'м', N'753838930466 ', N'Клиенты\m38.jpg', CAST(N'1981-03-28T00:00:00.0000000' AS DateTime2), N'brickbat@verizon.net', CAST(N'2018-12-18T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (15, N'Турова', N'Георгина', N'Семёновна	', N'ж', N'75553214299 ', N'Клиенты\27.jpg', CAST(N'1974-05-28T00:00:00.0000000' AS DateTime2), N'yruan@optonline.net', CAST(N'2018-02-22T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (16, N'Анисимов', N'Валентин', N'Пантелеймонович	', N'м', N'77003267024 ', N'Клиенты\m99.jpg', CAST(N'2000-12-10T00:00:00.0000000' AS DateTime2), N'aaribaud@hotmail.com', CAST(N'2018-01-20T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (17, N'Анисимова	', N'Тамара	', N'Витальевна	', N'ж', N'7661280410 ', N'Клиенты\2.jpg', CAST(N'1988-06-16T00:00:00.0000000' AS DateTime2), N'schwaang@mac.com', CAST(N'2016-02-25T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (18, N'Колобов	', N'Орест	', N'Юлианович	', N'м', N'716805085826 ', N'Клиенты\m27.jpg', CAST(N'2001-07-14T00:00:00.0000000' AS DateTime2), N'parkes@verizon.net', CAST(N'2017-01-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (19, N'Филатов', N'Аристарх', N'Дмитриевич	', N'м', N'76962352924 ', N'Клиенты\m43.jpg', CAST(N'1989-05-29T00:00:00.0000000' AS DateTime2), N'hampton@att.net', CAST(N'2017-01-11T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (20, N'Орлова', N'Влада', N'Мартыновна	', N'ж', N'725064333835 ', N'Клиенты\22.jpg', CAST(N'1990-06-26T00:00:00.0000000' AS DateTime2), N'rnelson@yahoo.ca', CAST(N'2016-03-21T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (21, N'Алексеева	', N'Элина	', N'Матвеевна	', N'ж', N'780862456481 ', N'Клиенты\1.jpg', CAST(N'2002-05-07T00:00:00.0000000' AS DateTime2), N'pthomsen@verizon.net', CAST(N'2018-03-28T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (22, N'Бобров', N'Агафон', N'Лаврентьевич	', N'м', N'721595073957 ', N'Клиенты\m35.jpg', CAST(N'1995-07-29T00:00:00.0000000' AS DateTime2), N'petersen@comcast.net', CAST(N'2017-05-09T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (23, N'Бирюкова	', N'Инара	', N'Улебовна	', N'ж', N'70983465058 ', N'Клиенты\5.jpg', CAST(N'1978-07-21T00:00:00.0000000' AS DateTime2), N'smpeters@hotmail.com', CAST(N'2017-10-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (24, N'Панфилов', N'Марк', N'Рудольфович	', N'м', N'77642825522 ', N'Клиенты\m45.jpg', CAST(N'1991-04-13T00:00:00.0000000' AS DateTime2), N'cremonini@optonline.net', CAST(N'2016-02-23T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (25, N'Колесникова', N'Алина', N'Еремеевна	', N'ж', N'7749773971 ', N'Клиенты\40.jpg', CAST(N'2001-04-19T00:00:00.0000000' AS DateTime2), N'gfxguy@outlook.com', CAST(N'2017-01-18T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (26, N'Морозов', N'Наум', N'Валерьянович	', N'м', N'76360509613 ', N'Клиенты\m49.jpg', CAST(N'1985-07-04T00:00:00.0000000' AS DateTime2), N'salesgeek@mac.com', CAST(N'2016-05-02T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (27, N'Горбачёв', N'Давид', N'Тимурович	', N'м', N'7536028541 ', N'Клиенты\m36.jpg', CAST(N'1983-05-22T00:00:00.0000000' AS DateTime2), N'hedwig@att.net', CAST(N'2018-12-17T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (28, N'Васильев	', N'Оскар	', N'Богданович	', N'м', N'75858019429 ', N'Клиенты\m15.jpg', CAST(N'1971-01-30T00:00:00.0000000' AS DateTime2), N'miturria@verizon.net', CAST(N'2017-05-28T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (29, N'Ершова	', N'Номи	', N'Андреевна	', N'ж', N'777573159099 ', N'Клиенты\14.jpg', CAST(N'2001-09-13T00:00:00.0000000' AS DateTime2), N'miltchev@mac.com', CAST(N'2016-06-30T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (30, N'Медведев	', N'Святослав	', N'Юлианович	', N'м', N'735204352120 ', N'Клиенты\m13.jpg', CAST(N'1972-10-04T00:00:00.0000000' AS DateTime2), N'hllam@comcast.net', CAST(N'2018-10-13T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (31, N'Баранова	', N'Эльмира	', N'Дмитриевна	', N'ж', N'792406431550 ', N'Клиенты\4.jpg', CAST(N'1977-01-15T00:00:00.0000000' AS DateTime2), N'jgmyers@comcast.net', CAST(N'2016-07-08T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (32, N'Попова', N'Харита', N'Якуновна	', N'ж', N'73353868106 ', N'Клиенты\36.jpg', CAST(N'1997-12-16T00:00:00.0000000' AS DateTime2), N'firstpr@verizon.net', CAST(N'2016-07-05T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (33, N'Кудряшов', N'Аверкий', N'Константинович	', N'м', N'7887329630 ', N'Клиенты\m33.jpg', CAST(N'1991-07-26T00:00:00.0000000' AS DateTime2), N'nanop@msn.com', CAST(N'2018-03-08T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (34, N'Горшкова	', N'Марта	', N'Иосифовна	', N'ж', N'75446505903', N'Клиенты\9.jpg', CAST(N'2001-02-13T00:00:00.0000000' AS DateTime2), N'gbacon@mac.com', CAST(N'2016-08-04T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (35, N'Кудрявцев	', N'Богдан	', N'Христофорович	', N'м', N'7201318409 ', N'Клиенты\m31.jpg', CAST(N'1988-02-27T00:00:00.0000000' AS DateTime2), N'lukka@hotmail.com', CAST(N'2016-10-07T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (36, N'Гусев	', N'Яков	', N'Авксентьевич	', N'м', N'709727811137 ', N'Клиенты\m20.jpg', CAST(N'1995-12-10T00:00:00.0000000' AS DateTime2), N'jdhedden@icloud.com', CAST(N'2017-11-20T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (37, N'Крюкова	', N'Авигея	', N'Святославовна	', N'ж', N'74993188853 ', N'Клиенты\19.jpg', CAST(N'2000-08-10T00:00:00.0000000' AS DateTime2), N'simone@gmail.com', CAST(N'2018-01-03T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (38, N'Степанова	', N'Амелия	', N'Робертовна	', N'ж', N'712174412842 ', N'Клиенты\15.jpg', CAST(N'1970-06-06T00:00:00.0000000' AS DateTime2), N'rasca@hotmail.com', CAST(N'2017-09-27T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (39, N'Суворова', N'Божена', N'Анатольевна	', N'ж', N'73478958657 ', N'Клиенты\34.jpg', CAST(N'1981-03-09T00:00:00.0000000' AS DateTime2), N'attwood@aol.com', CAST(N'2016-01-28T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (40, N'Борисов	', N'Аввакум	', N'Артемович	', N'м', N'722969300888 ', N'Клиенты\m12.jpg', CAST(N'1974-04-25T00:00:00.0000000' AS DateTime2), N'chlim@live.com', CAST(N'2017-03-11T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (41, N'Бобылёв	', N'Георгий	', N'Витальевич	', N'м', N'7886851351 ', N'Клиенты\m11.jpg', CAST(N'1983-12-19T00:00:00.0000000' AS DateTime2), N'csilvers@mac.com', CAST(N'2018-04-06T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (42, N'Дроздов	', N'Вольдемар	', N'Артемович	', N'м', N'73074569905 ', N'Клиенты\m21.jpg', CAST(N'1976-02-07T00:00:00.0000000' AS DateTime2), N'smpeters@me.com', CAST(N'2017-07-18T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (43, N'Беляева', N'Сабрина', N'Федосеевна	', N'ж', N'765805343258 ', N'Клиенты\47.jpg', CAST(N'1972-07-26T00:00:00.0000000' AS DateTime2), N'agapow@gmail.com', CAST(N'2017-06-14T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (44, N'Блохин	', N'Пантелеймон	', N'Феликсович	', N'м', N'795245564898 ', N'Клиенты\m8.jpg', CAST(N'1978-03-06T00:00:00.0000000' AS DateTime2), N'balchen@comcast.net', CAST(N'2018-02-14T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (45, N'Шашкова', N'Гелла', N'Эдуардовна	', N'ж', N'7574462104 ', N'Клиенты\43.jpg', CAST(N'1979-02-24T00:00:00.0000000' AS DateTime2), N'jadavis@mac.com', CAST(N'2016-11-16T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (46, N'Калашников	', N'Артур	', N'Юрьевич	', N'м', N'71479474721 ', N'Клиенты\m10.jpg', CAST(N'1972-12-13T00:00:00.0000000' AS DateTime2), N'oevans@aol.com', CAST(N'2017-08-20T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (47, N'Корнилова', N'Анэля', N'Михайловна	', N'ж', N'7209800160 ', N'Клиенты\26.jpg', CAST(N'1973-04-02T00:00:00.0000000' AS DateTime2), N'jonathan@aol.com', CAST(N'2016-05-22T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (48, N'Гущина	', N'Янита	', N'Федоровна	', N'ж', N'745447166896 ', N'Клиенты\11.jpg', CAST(N'1999-03-02T00:00:00.0000000' AS DateTime2), N'lishoy@att.net', CAST(N'2018-02-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (49, N'Волков', N'Людвиг', N'Витальевич	', N'м', N'784595920558 ', N'Клиенты\m50.jpg', CAST(N'1977-12-27T00:00:00.0000000' AS DateTime2), N'jrkorson@msn.com', CAST(N'2016-04-27T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (50, N'Князев	', N'Терентий	', N'Валерьевич	', N'м', N'7983972323 ', N'Клиенты\m26.jpg', CAST(N'1991-06-19T00:00:00.0000000' AS DateTime2), N'rjones@aol.com', CAST(N'2018-06-25T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (51, N'Силин', N'Гаянэ', N'Анатольевич	', N'м', N'745476152269 ', N'Клиенты\m46.jpg', CAST(N'1976-05-27T00:00:00.0000000' AS DateTime2), N'multiplx@comcast.net', CAST(N'2017-05-05T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (52, N'Казаков', N'Дмитрий', N'Русланович	', N'м', N'7516821940 ', N'Клиенты\m44.jpg', CAST(N'1978-12-15T00:00:00.0000000' AS DateTime2), N'ozawa@verizon.net', CAST(N'2016-05-21T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (53, N'Гусева	', N'Роза	', N'Дмитриевна	', N'ж', N'7230645184 ', N'Клиенты\10.jpg', CAST(N'1999-02-13T00:00:00.0000000' AS DateTime2), N'martyloo@live.com', CAST(N'2017-12-12T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (54, N'Мамонтова', N'Марфа', N'Мироновна	', N'ж', N'7380956418 ', N'Клиенты\29.jpg', CAST(N'1984-10-19T00:00:00.0000000' AS DateTime2), N'rfoley@verizon.net', CAST(N'2018-02-27T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (55, N'Галкин	', N'Эрик	', N'Онисимович	', N'м', N'77598737739 ', N'Клиенты\m16.jpg', CAST(N'1975-01-18T00:00:00.0000000' AS DateTime2), N'snunez@verizon.net', CAST(N'2016-07-19T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (56, N'Архипова', N'Прасковья', N'Валерьевна	', N'ж', N'7865401021 ', N'Клиенты\33.jpg', CAST(N'1979-01-09T00:00:00.0000000' AS DateTime2), N'cgcra@live.com', CAST(N'2018-07-23T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (57, N'Овчинникова', N'Лаура', N'Еремеевна	', N'ж', N'7858293379 ', N'Клиенты\35.jpg', CAST(N'1992-04-03T00:00:00.0000000' AS DateTime2), N'carcus@yahoo.ca', CAST(N'2018-11-24T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (58, N'Андреева', N'Патрисия', N'Валерьевна	', N'ж', N'796489538126 ', N'Клиенты\37.jpg', CAST(N'1993-11-18T00:00:00.0000000' AS DateTime2), N'jigsaw@aol.com', CAST(N'2016-07-17T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (59, N'Авдеев', N'Самуил', N'Улебович	', N'м', N'731680436331 ', N'Клиенты\m96.jpg', CAST(N'1996-07-04T00:00:00.0000000' AS DateTime2), N'cliffordj@mac.com', CAST(N'2016-02-11T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (60, N'Бурова', N'Светлана', N'Лукьевна	', N'ж', N'73581738221 ', N'Клиенты\39.jpg', CAST(N'1979-01-04T00:00:00.0000000' AS DateTime2), N'wsnyder@aol.com', CAST(N'2016-10-13T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (61, N'Ершов	', N'Глеб	', N'Федорович	', N'м', N'726082984082 ', N'Клиенты\m23.jpg', CAST(N'1970-06-14T00:00:00.0000000' AS DateTime2), N'sjava@aol.com', CAST(N'2016-09-14T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (62, N'Игнатов', N'Захар', N'Павлович	', N'м', N'75785747336 ', N'Клиенты\m98.jpg', CAST(N'1998-10-07T00:00:00.0000000' AS DateTime2), N'dieman@icloud.com', CAST(N'2017-11-10T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (63, N'Комиссарова	', N'Амалия	', N'Робертовна	', N'ж', N'7226474632 ', N'Клиенты\17.jpg', CAST(N'1971-08-18T00:00:00.0000000' AS DateTime2), N'jorgb@msn.com', CAST(N'2017-08-04T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (64, N'Быков	', N'Трофим	', N'Константинович	', N'м', N'734144601205 ', N'Клиенты\m14.jpg', CAST(N'1994-12-20T00:00:00.0000000' AS DateTime2), N'jguyer@aol.com', CAST(N'2016-04-17T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (65, N'Кузьмин	', N'Леонтий	', N'Валерьянович	', N'м', N'713401489068 ', N'Клиенты\m17.jpg', CAST(N'2000-05-05T00:00:00.0000000' AS DateTime2), N'msloan@hotmail.com', CAST(N'2017-10-12T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (66, N'Белозёрова	', N'Диана	', N'Антоновна	', N'ж', N'799001745987 ', N'Клиенты\7.jpg', CAST(N'1989-02-27T00:00:00.0000000' AS DateTime2), N'dialworld@aol.com', CAST(N'2017-01-30T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (67, N'Блинов	', N'Евгений	', N'Мэлсович	', N'м', N'708523218264 ', N'Клиенты\m7.jpg', CAST(N'1994-01-05T00:00:00.0000000' AS DateTime2), N'moxfulder@outlook.com', CAST(N'2017-05-07T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (68, N'Лазарев', N'Алексей', N'Богданович	', N'м', N'700557373748 ', N'Клиенты\m48.jpg', CAST(N'1977-03-10T00:00:00.0000000' AS DateTime2), N'claesjac@me.com', CAST(N'2017-01-02T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (69, N'Афанасьева', N'Розалия', N'Макаровна	', N'ж', N'706614132332 ', N'Клиенты\31.jpg', CAST(N'1977-05-01T00:00:00.0000000' AS DateTime2), N'malattia@hotmail.com', CAST(N'2017-09-06T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (70, N'Дементьева', N'Эдита', N'Онисимовна	', N'ж', N'71989222876 ', N'Клиенты\38.jpg', CAST(N'1975-09-17T00:00:00.0000000' AS DateTime2), N'frosal@hotmail.com', CAST(N'2018-11-24T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (71, N'Калинин', N'Петр', N'Иванович	', N'м', N'7903160717 ', N'Клиенты\m47.jpg', CAST(N'1993-09-08T00:00:00.0000000' AS DateTime2), N'aschmitz@hotmail.com', CAST(N'2016-05-26T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (72, N'Андреев	', N'Станислав	', N'Максович	', N'м', N'7029939128 ', N'Клиенты\m3.jpg', CAST(N'1975-10-10T00:00:00.0000000' AS DateTime2), N'budinger@mac.com', CAST(N'2017-12-26T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (73, N'Киселёв	', N'Устин	', N'Яковлевич	', N'м', N'7833345276 ', N'Клиенты\m25.jpg', CAST(N'1985-01-08T00:00:00.0000000' AS DateTime2), N'dalamb@verizon.net', CAST(N'2018-06-21T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (74, N'Гордеев	', N'Павел	', N'Семенович	', N'м', N'752435996672 ', N'Клиенты\m19.jpg', CAST(N'1984-09-06T00:00:00.0000000' AS DateTime2), N'dawnsong@verizon.net', CAST(N'2016-07-19T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (75, N'Горбачёва	', N'Никки	', N'Еремеевна	', N'ж', N'7947896920 ', N'Клиенты\8.jpg', CAST(N'1987-04-21T00:00:00.0000000' AS DateTime2), N'chinthaka@att.net', CAST(N'2018-08-16T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (76, N'Копылов	', N'Касьян	', N'Робертович	', N'м', N'757746798206 ', N'Клиенты\m29.jpg', CAST(N'1983-08-04T00:00:00.0000000' AS DateTime2), N'crobles@sbcglobal.net', CAST(N'2018-03-18T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (77, N'Ефремов	', N'Витольд	', N'Авксентьевич	', N'м', N'7939221403 ', N'Клиенты\m28.jpg', CAST(N'1975-12-02T00:00:00.0000000' AS DateTime2), N'kwilliams@yahoo.ca', CAST(N'2018-04-09T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (78, N'Баранов	', N'Михаил	', N'Романович	', N'м', N'77509859413 ', N'Клиенты\m5.jpg', CAST(N'1997-07-12T00:00:00.0000000' AS DateTime2), N'bigmauler@outlook.com', CAST(N'2018-10-07T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (79, N'Дмитриева	', N'Элина	', N'Даниловна	', N'ж', N'77871404884 ', N'Клиенты\12.jpg', CAST(N'1988-12-10T00:00:00.0000000' AS DateTime2), N'vmalik@live.com', CAST(N'2017-02-11T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (80, N'Федотов	', N'Осип	', N'Анатольевич	', N'м', N'75907023306 ', N'Клиенты\m9.jpg', CAST(N'1971-04-13T00:00:00.0000000' AS DateTime2), N'breegster@hotmail.com', CAST(N'2018-07-23T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (81, N'Быкова	', N'Тала	', N'Георгьевна	', N'ж', N'7139155353 ', N'Клиенты\6.jpg', CAST(N'2000-02-22T00:00:00.0000000' AS DateTime2), N'ganter@optonline.net', CAST(N'2016-08-13T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (82, N'Дементьев', N'Вадим', N'Ростиславович	', N'м', N'7793304615 ', N'Клиенты\m39.jpg', CAST(N'1993-07-10T00:00:00.0000000' AS DateTime2), N'jacks@aol.com', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (83, N'Евсеев	', N'Макар	', N'Васильевич	', N'м', N'721410778570 ', N'Клиенты\m22.jpg', CAST(N'1977-09-13T00:00:00.0000000' AS DateTime2), N'parsimony@sbcglobal.net', CAST(N'2018-12-05T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (84, N'Абрамов', N'Станислав', N'Филатович	', N'м', N'765454788779 ', N'Клиенты\m32.jpg', CAST(N'1989-05-18T00:00:00.0000000' AS DateTime2), N'solomon@att.net', CAST(N'2016-12-08T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (85, N'Артемьева	', N'Лиза	', N'Максимовна	', N'ж', N'76969727021 ', N'Клиенты\3.jpg', CAST(N'1996-05-17T00:00:00.0000000' AS DateTime2), N'snunez@yahoo.ca', CAST(N'2018-10-07T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (86, N'Кузьмина', N'Дэнна', N'Витальевна	', N'ж', N'799409774573 ', N'Клиенты\20.jpg', CAST(N'1993-08-24T00:00:00.0000000' AS DateTime2), N'nichoj@mac.com', CAST(N'2016-03-27T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (87, N'Ефимова	', N'Магда	', N'Платоновна	', N'ж', N'792613861592 ', N'Клиенты\16.jpg', CAST(N'1995-08-16T00:00:00.0000000' AS DateTime2), N'rbarreira@me.com', CAST(N'2017-08-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (88, N'Ефимов	', N'Альберт	', N'Проклович	', N'м', N'74163759719 ', N'Клиенты\m6.jpg', CAST(N'1997-10-29T00:00:00.0000000' AS DateTime2), N'houle@live.com', CAST(N'2018-06-21T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (89, N'Лазарева', N'Эльвина', N'Робертовна	', N'ж', N'755646098137 ', N'Клиенты\28.jpg', CAST(N'1996-02-16T00:00:00.0000000' AS DateTime2), N'ahuillet@comcast.net', CAST(N'2018-04-11T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (90, N'Воронова', N'Изабелла', N'Вячеславовна	', N'ж', N'7174334498 ', N'Клиенты\21.jpg', CAST(N'1999-09-24T00:00:00.0000000' AS DateTime2), N'kildjean@sbcglobal.net', CAST(N'2017-12-21T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (91, N'Куликова', N'Эвелина', N'Вячеславовна	', N'ж', N'702366824278 ', N'Клиенты\23.jpg', CAST(N'1997-11-14T00:00:00.0000000' AS DateTime2), N'ilikered@hotmail.com', CAST(N'2018-02-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (92, N'Егорова	', N'Амалия	', N'Дамировна	', N'ж', N'774864081226 ', N'Клиенты\13.jpg', CAST(N'1999-09-28T00:00:00.0000000' AS DateTime2), N'drezet@yahoo.com', CAST(N'2016-06-30T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (93, N'Александров	', N'Станислав	', N'Эдуардович	', N'м', N'7181640512 ', N'Клиенты\m2.jpg', CAST(N'1981-07-04T00:00:00.0000000' AS DateTime2), N'bigmauler@aol.com', CAST(N'2018-11-08T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (94, N'Цветков	', N'Демьян	', N'Львович	', N'м', N'7935464373 ', N'Клиенты\m4.jpg', CAST(N'1996-03-29T00:00:00.0000000' AS DateTime2), N'hauma@icloud.com', CAST(N'2016-02-12T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (95, N'Устинова', N'Юнона', N'Валентиновна	', N'ж', N'7333671307', N'Клиенты\44.jpg', CAST(N'1982-08-08T00:00:00.0000000' AS DateTime2), N'kempsonc@live.com', CAST(N'2017-05-28T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (96, N'Костина', N'Любава', N'Авксентьевна	', N'ж', N'764199592187 ', N'Клиенты\41.jpg', CAST(N'1972-07-13T00:00:00.0000000' AS DateTime2), N'gordonjcp@hotmail.com', CAST(N'2016-02-26T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (97, N'Смирнов', N'Мартын', N'Арсеньевич	', N'м', N'762515890243 ', N'Клиенты\m34.jpg', CAST(N'1996-06-25T00:00:00.0000000' AS DateTime2), N'haddawy@live.com', CAST(N'2017-02-07T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (98, N'Федотова', N'Сандра', N'Владленовна	', N'ж', N'71261952586 ', N'Клиенты\24.jpg', CAST(N'1985-03-29T00:00:00.0000000' AS DateTime2), N'penna@verizon.net', CAST(N'2016-11-08T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (99, N'Журавлёв	', N'Леонтий	', N'Яковлевич	', N'м', N'744033085696 ', N'Клиенты\m24.jpg', CAST(N'2000-03-02T00:00:00.0000000' AS DateTime2), N'cmdrgravy@me.com', CAST(N'2018-01-15T00:00:00.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (100, N'Большаков', N'Вадим', N'Данилович	', N'м', N'73866411337 ', N'Клиенты\m97.jpg', CAST(N'1970-05-15T00:00:00.0000000' AS DateTime2), N'uncle@gmail.com', CAST(N'2018-08-04T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Client_Import_good] ([ID], [Surname], [Name], [LastName], [Gender], [Phone], [ClientPhoto], [DateOfBirth], [Email], [RegistrationDate], [TagID]) VALUES (102, N'Федотов', N'Федя', N'Федотович', N'м', N'65464644', N'Клиенты', CAST(N'1985-05-15T00:00:00.0000000' AS DateTime2), N'СтранныйЕмаил', CAST(N'2018-08-04T00:00:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Client_Import_good] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientServiceGood] ON 

INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (1, N'Ефимова', CAST(N'2019-12-22T15:10:00.000' AS DateTime), N'Урок в группе немецкого языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (2, N'Бобылёв', CAST(N'2019-06-07T17:20:00.000' AS DateTime), N'Киноклуб португальского языка для студентов', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (3, N'Зуев', CAST(N'2019-03-04T17:20:00.000' AS DateTime), N'Индивидуальный урок испанского языка с преподавателем-носителем языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (4, N'Колобова', CAST(N'2019-12-01T14:40:00.000' AS DateTime), N'Киноклуб итальянского языка для студентов', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (5, N'Калашников', CAST(N'2019-06-26T10:10:00.000' AS DateTime), N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (6, N'Голубев', CAST(N'2019-12-05T10:20:00.000' AS DateTime), N'Занятие с русскоязычным репетитором английского языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (7, N'Суворова', CAST(N'2019-11-16T11:20:00.000' AS DateTime), N'Урок в группе французского языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (8, N'Калинин', CAST(N'2019-01-01T14:50:00.000' AS DateTime), N'Киноклуб итальянского языка для детей', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (9, N'Калашников', CAST(N'2019-02-01T18:00:00.000' AS DateTime), N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (10, N'Агафонов', CAST(N'2019-06-23T08:00:00.000' AS DateTime), N'Киноклуб французского языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (11, N'Попова', CAST(N'2019-08-18T16:00:00.000' AS DateTime), N'Киноклуб немецкого языка для детей', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (12, N'Морозов', CAST(N'2019-11-27T18:50:00.000' AS DateTime), N'Урок в группе итальянского языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (13, N'Медведев', CAST(N'2019-09-06T19:20:00.000' AS DateTime), N'Киноклуб немецкого языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (14, N'Калашников', CAST(N'2019-12-31T08:30:00.000' AS DateTime), N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (15, N'Горбачёв', CAST(N'2019-12-28T16:00:00.000' AS DateTime), N'Киноклуб китайского языка для детей', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (16, N'Федотова', CAST(N'2019-01-29T16:30:00.000' AS DateTime), N'Урок в группе японского языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (17, N'Бобров', CAST(N'2019-11-12T18:50:00.000' AS DateTime), N'Интенсивный курс с преподавателем-носителем немецкого языка для компаний', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (18, N'Калашников', CAST(N'2019-01-10T08:30:00.000' AS DateTime), N'Подготовка к экзамену TOEFL', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (19, N'Егорова', CAST(N'2019-09-29T13:40:00.000' AS DateTime), N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (20, N'Александров', CAST(N'2019-03-23T19:50:00.000' AS DateTime), N'Киноклуб португальского языка для студентов', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (21, N'Федотова', CAST(N'2019-04-29T15:00:00.000' AS DateTime), N'Урок в группе немецкого языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (22, N'Костина', CAST(N'2019-09-04T08:10:00.000' AS DateTime), N'Интенсивный курс с преподавателем-носителем английского языка для компаний', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (23, N'Казаков', CAST(N'2019-01-23T18:30:00.000' AS DateTime), N'Занятие с репетитором-носителем немецкого языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (24, N'Бобров', CAST(N'2019-01-16T09:00:00.000' AS DateTime), N'Урок в группе английского языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (25, N'Евсеев', CAST(N'2019-07-15T14:10:00.000' AS DateTime), N'Киноклуб португальского языка для детей', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (26, N'Бобылёв', CAST(N'2019-04-04T09:10:00.000' AS DateTime), N'Занятие с репетитором-носителем французского языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (27, N'Воронова', CAST(N'2019-04-30T18:10:00.000' AS DateTime), N'Урок в группе английского языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (28, N'Некрасов', CAST(N'2019-05-25T17:10:00.000' AS DateTime), N'Интенсивный курс с преподавателем-носителем английского языка для компаний', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (29, N'Голубев', CAST(N'2019-08-11T12:50:00.000' AS DateTime), N'Занятие с репетитором-носителем французского языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (30, N'Ершов', CAST(N'2019-01-09T10:20:00.000' AS DateTime), N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (31, N'Горбачёв', CAST(N'2019-04-09T11:10:00.000' AS DateTime), N'Урок в группе китайского языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (32, N'Степанова', CAST(N'2019-05-22T16:10:00.000' AS DateTime), N'Урок в группе английского языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (33, N'Турова', CAST(N'2019-09-28T10:00:00.000' AS DateTime), N'Урок в группе итальянского языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (34, N'Ершов', CAST(N'2019-01-05T16:00:00.000' AS DateTime), N'Урок в группе китайского языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (35, N'Ефремов', CAST(N'2019-05-08T14:10:00.000' AS DateTime), N'Урок в группе испанского языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (36, N'Федотова', CAST(N'2019-11-09T13:00:00.000' AS DateTime), N'Киноклуб немецкого языка для детей', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (37, N'Комиссарова', CAST(N'2019-01-16T14:20:00.000' AS DateTime), N'Урок в группе немецкого языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (38, N'Колобова', CAST(N'2019-01-11T18:10:00.000' AS DateTime), N'Индивидуальный онлайн-урок немецкого языка по Skype', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (39, N'Комиссарова', CAST(N'2019-08-29T19:00:00.000' AS DateTime), N'Индивидуальный урок испанского языка с преподавателем-носителем языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (40, N'Ефимова', CAST(N'2019-12-31T19:10:00.000' AS DateTime), N'Киноклуб французского языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (41, N'Воронова', CAST(N'2019-05-17T13:30:00.000' AS DateTime), N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (42, N'Киселёв', CAST(N'2019-10-02T10:10:00.000' AS DateTime), N'Киноклуб немецкого языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (43, N'Корнилова', CAST(N'2019-11-27T11:30:00.000' AS DateTime), N'Киноклуб немецкого языка для детей', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (44, N'Корнилова', CAST(N'2019-07-10T15:30:00.000' AS DateTime), N'Киноклуб португальского языка для детей', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (45, N'Блинов', CAST(N'2019-04-16T13:20:00.000' AS DateTime), N'Урок в группе китайского языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (46, N'Андреев', CAST(N'2019-11-19T15:50:00.000' AS DateTime), N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (47, N'Абрамов', CAST(N'2019-06-13T11:30:00.000' AS DateTime), N'Индивидуальный урок итальянского языка с русскоязычным преподавателем', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (48, N'Киселёв', CAST(N'2019-12-31T18:00:00.000' AS DateTime), N'Урок в группе японского языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (49, N'Бобров', CAST(N'2019-12-19T19:30:00.000' AS DateTime), N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (50, N'Костина', CAST(N'2019-03-16T11:30:00.000' AS DateTime), N'Индивидуальный онлайн-урок немецкого языка по Skype', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (51, N'Морозов', CAST(N'2019-11-23T18:40:00.000' AS DateTime), N'Урок в группе японского языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (52, N'Васильев', CAST(N'2019-12-14T08:40:00.000' AS DateTime), N'Киноклуб итальянского языка для детей', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (53, N'Баранова', CAST(N'2019-07-04T17:10:00.000' AS DateTime), N'Индивидуальный урок французского языка с преподавателем-носителем языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (54, N'Куликова', CAST(N'2019-02-13T18:00:00.000' AS DateTime), N'Урок в группе китайского языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (55, N'Калинин', CAST(N'2019-08-29T10:10:00.000' AS DateTime), N'Урок в группе испанского языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (56, N'Большаков', CAST(N'2019-01-11T12:50:00.000' AS DateTime), N'Киноклуб португальского языка для детей', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (57, N'Гущина', CAST(N'2019-03-01T11:50:00.000' AS DateTime), N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (58, N'Куликова', CAST(N'2019-02-12T19:40:00.000' AS DateTime), N'Урок в группе китайского языка для студентов', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (59, N'Горбачёв', CAST(N'2019-12-26T16:30:00.000' AS DateTime), N'Урок в группе английского языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (60, N'Гущина', CAST(N'2019-12-22T09:20:00.000' AS DateTime), N'Урок в группе итальянского языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (61, N'Евсеев', CAST(N'2019-11-09T18:50:00.000' AS DateTime), N'Интенсивный курс с преподавателем-носителем английского языка для компаний', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (62, N'Агафонов', CAST(N'2019-08-27T11:40:00.000' AS DateTime), N'Подготовка к экзамену ACT', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (63, N'Блохин', CAST(N'2019-01-22T16:50:00.000' AS DateTime), N'Киноклуб португальского языка для детей', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (64, N'Кузьмина', CAST(N'2019-07-31T18:10:00.000' AS DateTime), N'Урок в группе французского языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (65, N'Лазарев', CAST(N'2019-08-15T18:30:00.000' AS DateTime), N'Занятие с репетитором-носителем немецкого языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (66, N'Колобова', CAST(N'2019-02-11T13:30:00.000' AS DateTime), N'Интенсивный онлайн-курс португальского языка для компаний по Skype', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (67, N'Бобров', CAST(N'2019-01-05T08:40:00.000' AS DateTime), N'Киноклуб немецкого языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (68, N'Куликова', CAST(N'2019-06-06T19:20:00.000' AS DateTime), N'Интенсивный курс итальянского языка с русскоязычным преподавателем для компаний', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (69, N'Дмитриева', CAST(N'2019-01-06T15:00:00.000' AS DateTime), N'Киноклуб немецкого языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (70, N'Волков', CAST(N'2019-03-20T10:40:00.000' AS DateTime), N'Занятие с репетитором-носителем французского языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (71, N'Федотова', CAST(N'2019-08-06T16:50:00.000' AS DateTime), N'Занятие с репетитором-носителем французского языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (72, N'Лазарев', CAST(N'2019-10-17T13:30:00.000' AS DateTime), N'Киноклуб итальянского языка для студентов', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (73, N'Игнатов', CAST(N'2019-04-07T10:40:00.000' AS DateTime), N'Индивидуальный онлайн-урок немецкого языка по Skype', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (74, N'Зуев', CAST(N'2019-06-28T14:20:00.000' AS DateTime), N'Подготовка к экзамену IELTS Speaking Club', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (75, N'Степанова', CAST(N'2019-01-03T18:50:00.000' AS DateTime), N'Киноклуб итальянского языка для студентов', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (76, N'Ефимова', CAST(N'2019-01-22T10:50:00.000' AS DateTime), N'Киноклуб китайского языка для студентов', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (77, N'Андреева', CAST(N'2019-01-31T12:00:00.000' AS DateTime), N'Индивидуальный онлайн-урок немецкого языка по Skype', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (78, N'Федотова', CAST(N'2019-07-17T08:20:00.000' AS DateTime), N'Киноклуб немецкого языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (79, N'Корнилова', CAST(N'2019-04-29T12:40:00.000' AS DateTime), N'Урок в группе французского языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (80, N'Большаков', CAST(N'2019-02-18T18:20:00.000' AS DateTime), N'Интенсивный онлайн-курс китайского языка для компаний по Skype', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (81, N'Казаков', CAST(N'2019-03-15T10:50:00.000' AS DateTime), N'Урок в группе немецкого языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (82, N'Селиверстов', CAST(N'2019-09-10T18:20:00.000' AS DateTime), N'Урок в группе китайского языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (83, N'Киселёв', CAST(N'2019-08-06T11:50:00.000' AS DateTime), N'Индивидуальный онлайн-урок немецкого языка по Skype', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (84, N'Попова', CAST(N'2019-08-20T19:10:00.000' AS DateTime), N'Урок в группе китайского языка для школьников', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (85, N'Гущина', CAST(N'2019-11-15T17:50:00.000' AS DateTime), N'Подготовка к экзамену ACT', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (86, N'Ершов', CAST(N'2019-03-03T17:20:00.000' AS DateTime), N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (87, N'Ефимова', CAST(N'2019-10-21T10:20:00.000' AS DateTime), N'Индивидуальный урок испанского языка с преподавателем-носителем языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (88, N'Агафонов', CAST(N'2019-10-12T08:50:00.000' AS DateTime), N'Киноклуб немецкого языка для детей', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (89, N'Суворова', CAST(N'2019-11-11T18:50:00.000' AS DateTime), N'Интенсивный онлайн-курс китайского языка для компаний по Skype', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (90, N'Орлова', CAST(N'2019-01-03T14:40:00.000' AS DateTime), N'Киноклуб немецкого языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (91, N'Блохин', CAST(N'2019-07-06T11:30:00.000' AS DateTime), N'Киноклуб английского языка для студентов', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (92, N'Турова', CAST(N'2019-03-25T18:20:00.000' AS DateTime), N'Занятие с русскоязычным репетитором японского языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (93, N'Беляева', CAST(N'2019-10-27T16:20:00.000' AS DateTime), N'Индивидуальный урок итальянского языка с русскоязычным преподавателем', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (94, N'Киселёв', CAST(N'2019-05-15T09:20:00.000' AS DateTime), N'Урок в группе испанского языка для взрослых', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (95, N'Андреев', CAST(N'2019-08-30T11:40:00.000' AS DateTime), N'Киноклуб португальского языка для детей', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (96, N'Бобылёв', CAST(N'2019-02-16T18:50:00.000' AS DateTime), N'Индивидуальный урок английского языка с преподавателем-носителем языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (97, N'Воронова', CAST(N'2019-09-24T13:40:00.000' AS DateTime), N'Занятие с русскоязычным репетитором английского языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (98, N'Колобова', CAST(N'2019-06-09T13:40:00.000' AS DateTime), N'Занятие с русскоязычным репетитором японского языка', NULL, NULL)
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (99, N'Куликова', CAST(N'2019-04-13T09:00:00.000' AS DateTime), N'Урок в группе французского языка для школьников', NULL, NULL)
GO
INSERT [dbo].[ClientServiceGood] ([ID], [Client], [StartServiceTime], [Service], [ClientID], [ServiceID]) VALUES (100, N'Селиверстов', CAST(N'2019-04-05T13:20:00.000' AS DateTime), N'Урок в группе китайского языка для школьников', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ClientServiceGood] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'ж', N'Женский')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'м', N'Мужской')
GO
SET IDENTITY_INSERT [dbo].[Service_good] ON 

INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (1, N'Коррекция нарощенных ресниц', 45, N'1 310,00 ₽', 5)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (2, N'Подготовка к экзамену ACT', 50, N'1 440,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (3, N'Киноклуб итальянского языка для студентов', 30, N'1 760,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (4, N'Урок в группе французского языка для школьников', 100, N'1 970,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (5, N'Ультразвуковой пилинг', 45, N'1 440,00 ₽', 20)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (6, N'Киноклуб немецкого языка для детей', 120, N'1 670,00 ₽', 5)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (7, N'Урок в группе испанского языка для взрослых', 30, N'1 730,00 ₽', 5)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (8, N'Интенсивный онлайн-курс португальского языка для компаний по Skype', 70, N'1 610,00 ₽', 5)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (9, N'Киноклуб английского языка для студентов', 80, N'980,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (10, N'Интенсивный курс с преподавателем-носителем немецкого языка для компаний', 120, N'1 180,00 ₽', 20)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (11, N'Подготовка к экзамену IELTS Speaking Club', 90, N'1 430,00 ₽', 20)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (12, N'Ремонт подвески (ходовой)', 180, N'680,00 ₽', 5)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (13, N'Химический пилинг', 25, N'1 880,00 ₽', 15)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (14, N'Киноклуб немецкого языка для студентов', 50, N'1 140,00 ₽', 15)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (15, N'Интенсивный курс с преподавателем-носителем английского языка для компаний', 110, N'1 670,00 ₽', 10)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (16, N'Киноклуб итальянского языка для детей', 70, N'1 480,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (17, N'Урок в группе японского языка для школьников', 80, N'1 300,00 ₽', 5)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (18, N'Интенсивный курс итальянского языка с русскоязычным преподавателем для компаний', 110, N'900,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (19, N'Индивидуальный урок французского языка с преподавателем-носителем языка', 40, N'1 410,00 ₽', 20)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (20, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', 30, N'1 580,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (21, N'Снятие и установка колес', 390, N'3 130,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (22, N'Урок в группе английского языка для школьников', 110, N'900,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (23, N'Занятие с русскоязычным репетитором японского языка', 40, N'1 260,00 ₽', 10)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (24, N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', 30, N'990,00 ₽', 5)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (25, N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', 70, N'1 840,00 ₽', 10)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (26, N'Индивидуальный онлайн-урок немецкого языка по Skype', 90, N'970,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (27, N'Урок в группе китайского языка для взрослых', 70, N'1 730,00 ₽', 25)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (28, N'Киноклуб французского языка для взрослых', 90, N'1 770,00 ₽', 10)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (29, N'Ремонт автоэлектрики', 450, N'4 230,00 ₽', 10)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (30, N'Урок в группе китайского языка для школьников', 50, N'1 180,00 ₽', 15)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (31, N'Удаление катализатора', 510, N'1 930,00 ₽', 10)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (32, N'Киноклуб китайского языка для студентов', 100, N'1 990,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (33, N'Урок в группе китайского языка для студентов', 40, N'2 000,00 ₽', 20)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (34, N'Индивидуальный урок итальянского языка с русскоязычным преподавателем', 30, N'1 330,00 ₽', 20)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (35, N'Киноклуб китайского языка для детей', 100, N'1 120,00 ₽', 10)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (36, N'Подготовка к экзамену TOEFL', 100, N'1 070,00 ₽', 5)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (37, N'Урок в группе итальянского языка для взрослых', 40, N'1 290,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (38, N'Индивидуальный урок английского языка с преподавателем-носителем языка', 120, N'1 300,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (39, N'Миндальный пилинг', 45, N'2 430,00 ₽', 15)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (40, N'Занятие с репетитором-носителем французского языка', 50, N'2 040,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (41, N'Занятие с русскоязычным репетитором английского языка', 90, N'1 950,00 ₽', 15)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (42, N'Индивидуальный урок испанского языка с преподавателем-носителем языка', 90, N'1 200,00 ₽', 10)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (43, N'Интенсивный онлайн-курс китайского языка для компаний по Skype', 120, N'1 760,00 ₽', 15)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (44, N'Занятие с репетитором-носителем немецкого языка', 120, N'1 120,00 ₽', 0)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (45, N'Киноклуб португальского языка для детей', 90, N'1 710,00 ₽', 15)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (46, N'Киноклуб португальского языка для студентов', 30, N'1 170,00 ₽', 15)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (47, N'Киноклуб немецкого языка для взрослых', 100, N'1 560,00 ₽', 10)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (48, N'Урок в группе немецкого языка для школьников', 30, N'1 570,00 ₽', 15)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (49, N'Урок в группе английского языка для взрослых', 50, N'1 010,00 ₽', 25)
INSERT [dbo].[Service_good] ([ID], [NameService], [Time(min)], [Prive], [Discount]) VALUES (50, N'Ремонт кронштейна глушителя', 570, N'1 410,00 ₽', 0)
SET IDENTITY_INSERT [dbo].[Service_good] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (1, N'Buuueeeno', N'Green ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (2, N'Shit', N'Red   ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (3, N'ILoveU', N'Blue  ')
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (1, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (2, 1)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (3, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (5, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (50, 3)
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client_Import_good]  WITH CHECK ADD  CONSTRAINT [FK_Client_Import_good_Gender] FOREIGN KEY([Gender])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client_Import_good] CHECK CONSTRAINT [FK_Client_Import_good_Gender]
GO
ALTER TABLE [dbo].[Client_Import_good]  WITH CHECK ADD  CONSTRAINT [FK_Client_Import_good_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[Client_Import_good] CHECK CONSTRAINT [FK_Client_Import_good_Tag]
GO
ALTER TABLE [dbo].[ClientServiceGood]  WITH CHECK ADD  CONSTRAINT [FK_ClientServiceGood_Client_Import_good] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client_Import_good] ([ID])
GO
ALTER TABLE [dbo].[ClientServiceGood] CHECK CONSTRAINT [FK_ClientServiceGood_Client_Import_good]
GO
ALTER TABLE [dbo].[ClientServiceGood]  WITH CHECK ADD  CONSTRAINT [FK_ClientServiceGood_Service_good] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service_good] ([ID])
GO
ALTER TABLE [dbo].[ClientServiceGood] CHECK CONSTRAINT [FK_ClientServiceGood_Service_good]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientServiceGood] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientServiceGood] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientServiceGood]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientServiceGood] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ClientServiceGood] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientServiceGood]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service_good] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service_good] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service_good]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client_Import_good] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client_Import_good] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client_Import_good]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [DemServer] SET  READ_WRITE 
GO
