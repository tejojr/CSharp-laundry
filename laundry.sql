USE [master]
GO
/****** Object:  Database [laundry]    Script Date: 24/10/2018 03.43.52 ******/
CREATE DATABASE [laundry]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'laundry', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\laundry.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'laundry_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\laundry_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [laundry] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [laundry].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [laundry] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [laundry] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [laundry] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [laundry] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [laundry] SET ARITHABORT OFF 
GO
ALTER DATABASE [laundry] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [laundry] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [laundry] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [laundry] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [laundry] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [laundry] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [laundry] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [laundry] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [laundry] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [laundry] SET  DISABLE_BROKER 
GO
ALTER DATABASE [laundry] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [laundry] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [laundry] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [laundry] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [laundry] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [laundry] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [laundry] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [laundry] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [laundry] SET  MULTI_USER 
GO
ALTER DATABASE [laundry] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [laundry] SET DB_CHAINING OFF 
GO
ALTER DATABASE [laundry] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [laundry] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [laundry] SET DELAYED_DURABILITY = DISABLED 
GO
USE [laundry]
GO
/****** Object:  Table [dbo].[tb_category]    Script Date: 24/10/2018 03.43.52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_customer]    Script Date: 24/10/2018 03.43.52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Adrress] [varchar](200) NOT NULL,
 CONSTRAINT [PK_tb_customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Detail_Deposit]    Script Date: 24/10/2018 03.43.52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Detail_Deposit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDeposit] [int] NOT NULL,
	[IdService] [int] NOT NULL,
	[IdPrepaidPackage] [int] NULL,
	[PriceUnit] [int] NOT NULL,
	[TotalUnit] [float] NOT NULL,
	[CompleteDateTime] [datetime] NULL,
 CONSTRAINT [PK_tb_Detail_Deposit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_employee]    Script Date: 24/10/2018 03.43.52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[DateofBirth] [date] NOT NULL,
	[IdJob] [int] NOT NULL,
	[Salaray] [money] NOT NULL,
 CONSTRAINT [PK_tb_employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Header_Deposit]    Script Date: 24/10/2018 03.43.52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Header_Deposit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCustomer] [int] NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[TransactionDateTime] [datetime] NOT NULL,
	[CompleteEstimationDatetime] [datetime] NULL,
 CONSTRAINT [PK_tb_Header_Deposit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_job]    Script Date: 24/10/2018 03.43.52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Package]    Script Date: 24/10/2018 03.43.52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Package](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdService] [int] NOT NULL,
	[TotalUnit] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_tb_Package] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Prepaidpackage]    Script Date: 24/10/2018 03.43.52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Prepaidpackage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCustomer] [int] NOT NULL,
	[IdPackage] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[StartDatetime] [datetime] NOT NULL,
	[CompletedDatetime] [datetime] NULL,
 CONSTRAINT [PK_tb_Prepaidpackage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_service]    Script Date: 24/10/2018 03.43.52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IdCategory] [int] NOT NULL,
	[IdUnit] [int] NOT NULL,
	[PriceUnit] [int] NOT NULL,
	[EstimationDuration] [int] NOT NULL,
 CONSTRAINT [PK_tb_service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Unit]    Script Date: 24/10/2018 03.43.52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[v_deposit]    Script Date: 24/10/2018 03.43.53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_deposit]
AS
SELECT        dbo.tb_Header_Deposit.Id, dbo.tb_customer.Name AS Customer, dbo.tb_employee.Name AS Employee, dbo.tb_Header_Deposit.TransactionDateTime, dbo.tb_Header_Deposit.CompleteEstimationDatetime
FROM            dbo.tb_Header_Deposit INNER JOIN
                         dbo.tb_customer ON dbo.tb_Header_Deposit.IdCustomer = dbo.tb_customer.Id INNER JOIN
                         dbo.tb_employee ON dbo.tb_Header_Deposit.IdEmployee = dbo.tb_employee.Id

GO
/****** Object:  View [dbo].[v_detaildeposit]    Script Date: 24/10/2018 03.43.53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_detaildeposit]
AS
SELECT        dbo.tb_Detail_Deposit.Id, dbo.tb_Detail_Deposit.IdDeposit, dbo.tb_service.Name AS ServiceName, dbo.tb_Detail_Deposit.IdPrepaidPackage, dbo.tb_Detail_Deposit.PriceUnit, dbo.tb_Detail_Deposit.TotalUnit, 
                         dbo.tb_Detail_Deposit.CompleteDateTime
FROM            dbo.tb_Detail_Deposit INNER JOIN
                         dbo.tb_service ON dbo.tb_Detail_Deposit.IdService = dbo.tb_service.Id

GO
/****** Object:  View [dbo].[v_detailpackage]    Script Date: 24/10/2018 03.43.53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_detailpackage]
AS
SELECT        dbo.tb_Detail_Deposit.Id, dbo.tb_service.Name AS ServiceName, dbo.tb_Prepaidpackage.IdPackage, dbo.tb_Detail_Deposit.PriceUnit, dbo.tb_Detail_Deposit.TotalUnit, 
                         dbo.tb_Detail_Deposit.CompleteDateTime
FROM            dbo.tb_Detail_Deposit INNER JOIN
                         dbo.tb_Prepaidpackage ON dbo.tb_Detail_Deposit.IdPrepaidPackage = dbo.tb_Prepaidpackage.Id INNER JOIN
                         dbo.tb_service ON dbo.tb_Detail_Deposit.Id = dbo.tb_service.Id

GO
/****** Object:  View [dbo].[v_employee]    Script Date: 24/10/2018 03.43.53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_employee]
AS
SELECT        dbo.tb_employee.Id, dbo.tb_employee.Password, dbo.tb_employee.Name, dbo.tb_employee.Email, dbo.tb_employee.Address, dbo.tb_employee.PhoneNumber, dbo.tb_employee.DateofBirth, 
                         dbo.tb_job.Name AS Job, dbo.tb_employee.Salaray
FROM            dbo.tb_employee INNER JOIN
                         dbo.tb_job ON dbo.tb_employee.IdJob = dbo.tb_job.Id

GO
/****** Object:  View [dbo].[v_package]    Script Date: 24/10/2018 03.43.53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_package]
AS
SELECT        dbo.tb_Package.Id, dbo.tb_service.Name, dbo.tb_Package.TotalUnit, dbo.tb_Package.Price
FROM            dbo.tb_Package INNER JOIN
                         dbo.tb_service ON dbo.tb_Package.IdService = dbo.tb_service.Id

GO
/****** Object:  View [dbo].[v_ppackage]    Script Date: 24/10/2018 03.43.53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ppackage]
AS
SELECT        dbo.tb_Prepaidpackage.Id, dbo.tb_customer.Name AS Customer, dbo.tb_service.Name AS Service, dbo.tb_Package.TotalUnit, dbo.tb_Unit.Name AS Unit, dbo.tb_Package.Price, 
                         dbo.tb_Prepaidpackage.StartDatetime, dbo.tb_Prepaidpackage.CompletedDatetime
FROM            dbo.tb_Package INNER JOIN
                         dbo.tb_service ON dbo.tb_Package.IdService = dbo.tb_service.Id INNER JOIN
                         dbo.tb_Unit ON dbo.tb_service.IdUnit = dbo.tb_Unit.Id INNER JOIN
                         dbo.tb_Prepaidpackage ON dbo.tb_Package.Id = dbo.tb_Prepaidpackage.IdPackage INNER JOIN
                         dbo.tb_customer ON dbo.tb_Prepaidpackage.IdCustomer = dbo.tb_customer.Id

GO
/****** Object:  View [dbo].[v_service]    Script Date: 24/10/2018 03.43.53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_service]
AS
SELECT        dbo.tb_service.Id, dbo.tb_service.Name, dbo.tb_category.Name AS Category, dbo.tb_Unit.Name AS Unit, dbo.tb_service.PriceUnit, dbo.tb_service.EstimationDuration
FROM            dbo.tb_category INNER JOIN
                         dbo.tb_service ON dbo.tb_category.Id = dbo.tb_service.IdCategory INNER JOIN
                         dbo.tb_Unit ON dbo.tb_service.IdUnit = dbo.tb_Unit.Id

GO
SET IDENTITY_INSERT [dbo].[tb_category] ON 

INSERT [dbo].[tb_category] ([Id], [Name]) VALUES (1, N'Laundry Kiloan')
INSERT [dbo].[tb_category] ([Id], [Name]) VALUES (2, N'Laundry Satuan
')
INSERT [dbo].[tb_category] ([Id], [Name]) VALUES (3, N'Laundry Perlengkapan Bayi
')
INSERT [dbo].[tb_category] ([Id], [Name]) VALUES (4, N'Laundry Helm
L')
INSERT [dbo].[tb_category] ([Id], [Name]) VALUES (5, N'Laundry Sepatu
')
SET IDENTITY_INSERT [dbo].[tb_category] OFF
SET IDENTITY_INSERT [dbo].[tb_customer] ON 

INSERT [dbo].[tb_customer] ([Id], [Name], [PhoneNumber], [Adrress]) VALUES (2, N'Xavier Duignan
', N'+5054833171021', N'0589 Pierstorff Pass
')
INSERT [dbo].[tb_customer] ([Id], [Name], [PhoneNumber], [Adrress]) VALUES (4, N'Dagny Hubbock
', N'+78619014746
', N'66994 Mesta Hill
')
INSERT [dbo].[tb_customer] ([Id], [Name], [PhoneNumber], [Adrress]) VALUES (6, N'Consalve Wilprecht
', N'+78457744373
', N'5 Derek Point
')
INSERT [dbo].[tb_customer] ([Id], [Name], [PhoneNumber], [Adrress]) VALUES (7, N'Ammar', N'+6285848236298', N'sdsd')
SET IDENTITY_INSERT [dbo].[tb_customer] OFF
SET IDENTITY_INSERT [dbo].[tb_Detail_Deposit] ON 

INSERT [dbo].[tb_Detail_Deposit] ([Id], [IdDeposit], [IdService], [IdPrepaidPackage], [PriceUnit], [TotalUnit], [CompleteDateTime]) VALUES (1, 1, 2, 1, 0, 2, CAST(N'2018-10-22 07:39:23.227' AS DateTime))
INSERT [dbo].[tb_Detail_Deposit] ([Id], [IdDeposit], [IdService], [IdPrepaidPackage], [PriceUnit], [TotalUnit], [CompleteDateTime]) VALUES (4, 1, 2, 1, 8000, 1, CAST(N'2018-10-22 07:39:27.297' AS DateTime))
INSERT [dbo].[tb_Detail_Deposit] ([Id], [IdDeposit], [IdService], [IdPrepaidPackage], [PriceUnit], [TotalUnit], [CompleteDateTime]) VALUES (7, 47, 2, NULL, 8000, 2, CAST(N'2018-10-22 13:07:46.313' AS DateTime))
INSERT [dbo].[tb_Detail_Deposit] ([Id], [IdDeposit], [IdService], [IdPrepaidPackage], [PriceUnit], [TotalUnit], [CompleteDateTime]) VALUES (8, 47, 3, NULL, 15000, 2, CAST(N'2018-10-22 13:07:47.660' AS DateTime))
INSERT [dbo].[tb_Detail_Deposit] ([Id], [IdDeposit], [IdService], [IdPrepaidPackage], [PriceUnit], [TotalUnit], [CompleteDateTime]) VALUES (9, 48, 3, NULL, 15000, 2, CAST(N'2018-10-22 13:07:50.153' AS DateTime))
INSERT [dbo].[tb_Detail_Deposit] ([Id], [IdDeposit], [IdService], [IdPrepaidPackage], [PriceUnit], [TotalUnit], [CompleteDateTime]) VALUES (10, 48, 3, NULL, 15000, 2, CAST(N'2018-10-22 13:07:51.557' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_Detail_Deposit] OFF
SET IDENTITY_INSERT [dbo].[tb_employee] ON 

INSERT [dbo].[tb_employee] ([Id], [Password], [Name], [Email], [Address], [PhoneNumber], [DateofBirth], [IdJob], [Salaray]) VALUES (2, N'fkuXmGlww', N'Aldin Defrain
', N'adefrain0@diigo.com
', N'75 Commercial Avenue
', N'+637735336970', CAST(N'1989-06-18' AS Date), 1, 3911000.0000)
INSERT [dbo].[tb_employee] ([Id], [Password], [Name], [Email], [Address], [PhoneNumber], [DateofBirth], [IdJob], [Salaray]) VALUES (3, N'PPtnCadt
', N'Patti de Keyser
', N'pde1@ehow.com
', N'2 South Alley
', N'+868346105623', CAST(N'1991-01-05' AS Date), 2, 3442000.0000)
INSERT [dbo].[tb_employee] ([Id], [Password], [Name], [Email], [Address], [PhoneNumber], [DateofBirth], [IdJob], [Salaray]) VALUES (4, N'dfjklAP', N'Ammar Annajih Pasifiky', N'ammar.fiky@gmail.com', N'Jl Magnolia 10 Fiore', N'+6285647723211', CAST(N'2001-08-08' AS Date), 1, 9999000.0000)
SET IDENTITY_INSERT [dbo].[tb_employee] OFF
SET IDENTITY_INSERT [dbo].[tb_Header_Deposit] ON 

INSERT [dbo].[tb_Header_Deposit] ([Id], [IdCustomer], [IdEmployee], [TransactionDateTime], [CompleteEstimationDatetime]) VALUES (1, 2, 2, CAST(N'2017-11-15 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tb_Header_Deposit] ([Id], [IdCustomer], [IdEmployee], [TransactionDateTime], [CompleteEstimationDatetime]) VALUES (4, 6, 4, CAST(N'2018-10-22 09:21:13.760' AS DateTime), CAST(N'2018-10-22 09:21:13.760' AS DateTime))
INSERT [dbo].[tb_Header_Deposit] ([Id], [IdCustomer], [IdEmployee], [TransactionDateTime], [CompleteEstimationDatetime]) VALUES (15, 6, 4, CAST(N'2018-10-22 11:37:24.527' AS DateTime), CAST(N'2018-10-22 11:37:24.527' AS DateTime))
INSERT [dbo].[tb_Header_Deposit] ([Id], [IdCustomer], [IdEmployee], [TransactionDateTime], [CompleteEstimationDatetime]) VALUES (21, 2, 4, CAST(N'2018-10-22 12:03:59.703' AS DateTime), CAST(N'2018-10-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tb_Header_Deposit] ([Id], [IdCustomer], [IdEmployee], [TransactionDateTime], [CompleteEstimationDatetime]) VALUES (43, 2, 4, CAST(N'2018-10-22 12:56:51.080' AS DateTime), CAST(N'2018-10-26 12:56:50.000' AS DateTime))
INSERT [dbo].[tb_Header_Deposit] ([Id], [IdCustomer], [IdEmployee], [TransactionDateTime], [CompleteEstimationDatetime]) VALUES (44, 2, 4, CAST(N'2018-10-22 12:58:05.270' AS DateTime), CAST(N'2018-10-28 12:58:05.000' AS DateTime))
INSERT [dbo].[tb_Header_Deposit] ([Id], [IdCustomer], [IdEmployee], [TransactionDateTime], [CompleteEstimationDatetime]) VALUES (45, 6, 4, CAST(N'2018-10-22 13:00:43.963' AS DateTime), CAST(N'2018-10-28 13:00:43.000' AS DateTime))
INSERT [dbo].[tb_Header_Deposit] ([Id], [IdCustomer], [IdEmployee], [TransactionDateTime], [CompleteEstimationDatetime]) VALUES (46, 2, 4, CAST(N'2018-10-22 13:02:09.937' AS DateTime), CAST(N'2018-10-30 13:02:09.000' AS DateTime))
INSERT [dbo].[tb_Header_Deposit] ([Id], [IdCustomer], [IdEmployee], [TransactionDateTime], [CompleteEstimationDatetime]) VALUES (47, 6, 4, CAST(N'2018-10-22 13:05:26.307' AS DateTime), CAST(N'2018-10-28 13:05:26.000' AS DateTime))
INSERT [dbo].[tb_Header_Deposit] ([Id], [IdCustomer], [IdEmployee], [TransactionDateTime], [CompleteEstimationDatetime]) VALUES (48, 4, 4, CAST(N'2018-10-22 13:07:21.547' AS DateTime), CAST(N'2018-10-26 13:07:21.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_Header_Deposit] OFF
SET IDENTITY_INSERT [dbo].[tb_job] ON 

INSERT [dbo].[tb_job] ([Id], [Name]) VALUES (1, N'Cashier
')
INSERT [dbo].[tb_job] ([Id], [Name]) VALUES (2, N'Laundress
')
SET IDENTITY_INSERT [dbo].[tb_job] OFF
SET IDENTITY_INSERT [dbo].[tb_Package] ON 

INSERT [dbo].[tb_Package] ([Id], [IdService], [TotalUnit], [Price]) VALUES (4, 2, 10, 75000)
INSERT [dbo].[tb_Package] ([Id], [IdService], [TotalUnit], [Price]) VALUES (5, 2, 20, 150000)
INSERT [dbo].[tb_Package] ([Id], [IdService], [TotalUnit], [Price]) VALUES (6, 3, 10, 145000)
SET IDENTITY_INSERT [dbo].[tb_Package] OFF
SET IDENTITY_INSERT [dbo].[tb_Prepaidpackage] ON 

INSERT [dbo].[tb_Prepaidpackage] ([Id], [IdCustomer], [IdPackage], [Price], [StartDatetime], [CompletedDatetime]) VALUES (1, 2, 4, 75000, CAST(N'2017-11-15 07:08:09.000' AS DateTime), NULL)
INSERT [dbo].[tb_Prepaidpackage] ([Id], [IdCustomer], [IdPackage], [Price], [StartDatetime], [CompletedDatetime]) VALUES (2, 4, 4, 75000, CAST(N'2016-11-17 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tb_Prepaidpackage] ([Id], [IdCustomer], [IdPackage], [Price], [StartDatetime], [CompletedDatetime]) VALUES (4, 4, 6, 145000, CAST(N'2018-10-21 23:40:23.877' AS DateTime), NULL)
INSERT [dbo].[tb_Prepaidpackage] ([Id], [IdCustomer], [IdPackage], [Price], [StartDatetime], [CompletedDatetime]) VALUES (5, 6, 5, 150000, CAST(N'2018-10-21 23:40:58.410' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tb_Prepaidpackage] OFF
SET IDENTITY_INSERT [dbo].[tb_service] ON 

INSERT [dbo].[tb_service] ([Id], [Name], [IdCategory], [IdUnit], [PriceUnit], [EstimationDuration]) VALUES (2, N'Cuci Komplit Reguler (2 HARI)
', 1, 1, 8000, 48)
INSERT [dbo].[tb_service] ([Id], [Name], [IdCategory], [IdUnit], [PriceUnit], [EstimationDuration]) VALUES (3, N'Cuci Komplit Kilat –  Laundry 1 Hari Selesai
', 1, 1, 15000, 24)
INSERT [dbo].[tb_service] ([Id], [Name], [IdCategory], [IdUnit], [PriceUnit], [EstimationDuration]) VALUES (11, N'Cuci Kering Reguler (2 HARI)
', 1, 1, 6000, 48)
SET IDENTITY_INSERT [dbo].[tb_service] OFF
SET IDENTITY_INSERT [dbo].[tb_Unit] ON 

INSERT [dbo].[tb_Unit] ([Id], [Name]) VALUES (1, N'Kg')
INSERT [dbo].[tb_Unit] ([Id], [Name]) VALUES (2, N'Piece')
SET IDENTITY_INSERT [dbo].[tb_Unit] OFF
ALTER TABLE [dbo].[tb_Detail_Deposit]  WITH CHECK ADD  CONSTRAINT [FK_tb_Detail_Deposit_tb_Header_Deposit] FOREIGN KEY([IdDeposit])
REFERENCES [dbo].[tb_Header_Deposit] ([Id])
GO
ALTER TABLE [dbo].[tb_Detail_Deposit] CHECK CONSTRAINT [FK_tb_Detail_Deposit_tb_Header_Deposit]
GO
ALTER TABLE [dbo].[tb_Detail_Deposit]  WITH CHECK ADD  CONSTRAINT [FK_tb_Detail_Deposit_tb_Prepaidpackage] FOREIGN KEY([IdPrepaidPackage])
REFERENCES [dbo].[tb_Prepaidpackage] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_Detail_Deposit] CHECK CONSTRAINT [FK_tb_Detail_Deposit_tb_Prepaidpackage]
GO
ALTER TABLE [dbo].[tb_Detail_Deposit]  WITH CHECK ADD  CONSTRAINT [FK_tb_Detail_Deposit_tb_service] FOREIGN KEY([IdService])
REFERENCES [dbo].[tb_service] ([Id])
GO
ALTER TABLE [dbo].[tb_Detail_Deposit] CHECK CONSTRAINT [FK_tb_Detail_Deposit_tb_service]
GO
ALTER TABLE [dbo].[tb_employee]  WITH CHECK ADD  CONSTRAINT [FK_tb_employee_tb_job] FOREIGN KEY([IdJob])
REFERENCES [dbo].[tb_job] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_employee] CHECK CONSTRAINT [FK_tb_employee_tb_job]
GO
ALTER TABLE [dbo].[tb_Header_Deposit]  WITH CHECK ADD  CONSTRAINT [FK_tb_Header_Deposit_tb_customer] FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[tb_customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_Header_Deposit] CHECK CONSTRAINT [FK_tb_Header_Deposit_tb_customer]
GO
ALTER TABLE [dbo].[tb_Header_Deposit]  WITH CHECK ADD  CONSTRAINT [FK_tb_Header_Deposit_tb_employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[tb_employee] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_Header_Deposit] CHECK CONSTRAINT [FK_tb_Header_Deposit_tb_employee]
GO
ALTER TABLE [dbo].[tb_Package]  WITH CHECK ADD  CONSTRAINT [FK_tb_Package_tb_service] FOREIGN KEY([IdService])
REFERENCES [dbo].[tb_service] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_Package] CHECK CONSTRAINT [FK_tb_Package_tb_service]
GO
ALTER TABLE [dbo].[tb_Prepaidpackage]  WITH CHECK ADD  CONSTRAINT [FK_tb_Prepaidpackage_tb_customer] FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[tb_customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_Prepaidpackage] CHECK CONSTRAINT [FK_tb_Prepaidpackage_tb_customer]
GO
ALTER TABLE [dbo].[tb_Prepaidpackage]  WITH CHECK ADD  CONSTRAINT [FK_tb_Prepaidpackage_tb_Package] FOREIGN KEY([IdPackage])
REFERENCES [dbo].[tb_Package] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_Prepaidpackage] CHECK CONSTRAINT [FK_tb_Prepaidpackage_tb_Package]
GO
ALTER TABLE [dbo].[tb_service]  WITH CHECK ADD  CONSTRAINT [FK_tb_service_tb_category] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[tb_category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_service] CHECK CONSTRAINT [FK_tb_service_tb_category]
GO
ALTER TABLE [dbo].[tb_service]  WITH CHECK ADD  CONSTRAINT [FK_tb_service_tb_Unit] FOREIGN KEY([IdUnit])
REFERENCES [dbo].[tb_Unit] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_service] CHECK CONSTRAINT [FK_tb_service_tb_Unit]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_Header_Deposit"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 283
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tb_customer"
            Begin Extent = 
               Top = 6
               Left = 321
               Bottom = 136
               Right = 491
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_employee"
            Begin Extent = 
               Top = 6
               Left = 529
               Bottom = 136
               Right = 699
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_deposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_deposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_Detail_Deposit"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "tb_service"
            Begin Extent = 
               Top = 6
               Left = 268
               Bottom = 136
               Right = 459
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_detaildeposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_detaildeposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_Detail_Deposit"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "tb_Prepaidpackage"
            Begin Extent = 
               Top = 6
               Left = 551
               Bottom = 136
               Right = 747
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tb_service"
            Begin Extent = 
               Top = 6
               Left = 785
               Bottom = 136
               Right = 976
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_detailpackage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_detailpackage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "tb_job"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_employee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_employee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_Package"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_service"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_package'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_package'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_Package"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_service"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tb_Unit"
            Begin Extent = 
               Top = 6
               Left = 475
               Bottom = 102
               Right = 645
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Prepaidpackage"
            Begin Extent = 
               Top = 6
               Left = 683
               Bottom = 136
               Right = 879
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tb_customer"
            Begin Extent = 
               Top = 102
               Left = 475
               Bottom = 232
               Right = 645
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 3270
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ppackage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N's = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ppackage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ppackage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_category"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_service"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tb_Unit"
            Begin Extent = 
               Top = 6
               Left = 475
               Bottom = 102
               Right = 645
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_service'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_service'
GO
USE [master]
GO
ALTER DATABASE [laundry] SET  READ_WRITE 
GO
