USE [master]
GO
/****** Object:  Database [stg]    Script Date: 3/20/2024 2:25:54 PM ******/
CREATE DATABASE [stg]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sample', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSQLSERVER\MSSQL\DATA\stg.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sample_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSQLSERVER\MSSQL\DATA\stg_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [stg] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [stg].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [stg] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [stg] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [stg] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [stg] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [stg] SET ARITHABORT OFF 
GO
ALTER DATABASE [stg] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [stg] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [stg] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [stg] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [stg] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [stg] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [stg] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [stg] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [stg] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [stg] SET  DISABLE_BROKER 
GO
ALTER DATABASE [stg] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [stg] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [stg] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [stg] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [stg] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [stg] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [stg] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [stg] SET RECOVERY FULL 
GO
ALTER DATABASE [stg] SET  MULTI_USER 
GO
ALTER DATABASE [stg] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [stg] SET DB_CHAINING OFF 
GO
ALTER DATABASE [stg] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [stg] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [stg] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [stg] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'stg', N'ON'
GO
ALTER DATABASE [stg] SET QUERY_STORE = OFF
GO
USE [stg]
GO
/****** Object:  Table [dbo].[account]    Script Date: 3/20/2024 2:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [int] NOT NULL,
	[customer_id] [int] NULL,
	[account_type] [varchar](10) NULL,
	[balance] [int] NULL,
	[date_opened] [datetime2](0) NULL,
	[status] [varchar](10) NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[branch]    Script Date: 3/20/2024 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branch](
	[branch_id] [int] NOT NULL,
	[branch_name] [varchar](50) NULL,
	[branch_location] [varchar](50) NULL,
 CONSTRAINT [PK_branch] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city]    Script Date: 3/20/2024 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[city_id] [int] NOT NULL,
	[city_name] [varchar](50) NULL,
	[state_id] [int] NOT NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 3/20/2024 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] NOT NULL,
	[customer_name] [varchar](50) NULL,
	[address] [varchar](max) NULL,
	[city_id] [int] NULL,
	[age] [varchar](3) NULL,
	[gender] [varchar](10) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 3/20/2024 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[state_id] [int] NOT NULL,
	[state_name] [varchar](50) NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaction_db]    Script Date: 3/20/2024 2:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction_db](
	[transaction_id] [int] NOT NULL,
	[account_id] [int] NULL,
	[transaction_date] [datetime2](0) NULL,
	[amount] [int] NULL,
	[transaction_type] [varchar](50) NULL,
	[branch_id] [int] NULL,
 CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (1, 1, N'saving', 1500000, CAST(N'2020-05-01T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (2, 2, N'saving', 500000, CAST(N'2020-06-01T10:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (3, 1, N'checking', 25000000, CAST(N'2020-06-21T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (4, 3, N'checking', 4500000, CAST(N'2021-06-24T11:00:00.0000000' AS DateTime2), N'terminated')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (5, 4, N'saving', 75000000, CAST(N'2020-06-29T13:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (6, 5, N'checking', 1500000, CAST(N'2020-07-01T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (7, 6, N'saving', 15000000, CAST(N'2020-07-14T09:00:00.0000000' AS DateTime2), N'terminated')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (8, 7, N'checking', 25000000, CAST(N'2020-07-15T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (9, 8, N'saving', 80000000, CAST(N'2020-07-15T11:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (10, 9, N'checking', 25000000, CAST(N'2020-07-16T10:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (11, 10, N'saving', 75000000, CAST(N'2020-07-24T11:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (12, 11, N'checking', 25000000, CAST(N'2020-08-08T10:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (13, 12, N'saving', 55000000, CAST(N'2020-08-15T11:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (14, 13, N'checking', 25000000, CAST(N'2020-08-15T14:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (15, 14, N'saving', 45000000, CAST(N'2020-09-25T08:00:00.0000000' AS DateTime2), N'terminated')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (16, 15, N'checking', 25000000, CAST(N'2020-09-26T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (17, 15, N'saving', 10000000, CAST(N'2020-10-19T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (18, 17, N'checking', 25000000, CAST(N'2020-10-21T10:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (19, 18, N'saving', 55000000, CAST(N'2020-11-11T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (20, 19, N'checking', 25000000, CAST(N'2020-11-19T08:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (21, 20, N'checking', 6000000, CAST(N'2020-11-29T08:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (22, 3, N'checking', 4000000, CAST(N'2022-08-18T10:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[account] ([account_id], [customer_id], [account_type], [balance], [date_opened], [status]) VALUES (23, 6, N'checking', 5000000, CAST(N'2022-01-10T12:00:00.0000000' AS DateTime2), N'active')
GO
INSERT [dbo].[branch] ([branch_id], [branch_name], [branch_location]) VALUES (1, N'KC Jakarta', N'Jl. Gatot Subroto No 13')
INSERT [dbo].[branch] ([branch_id], [branch_name], [branch_location]) VALUES (2, N'KC Bogor', N'Jl. Padjajaran No 43')
INSERT [dbo].[branch] ([branch_id], [branch_name], [branch_location]) VALUES (3, N'KC Depok', N'Jl. Raya Sawangan No 34')
INSERT [dbo].[branch] ([branch_id], [branch_name], [branch_location]) VALUES (4, N'KC Tangerang', N'Jl. Cisauk No 50')
INSERT [dbo].[branch] ([branch_id], [branch_name], [branch_location]) VALUES (5, N'KC Bekas', N'Jl. Ahmad Yani No 23')
GO
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (1, N'Cilincing', 1)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (2, N'Kelapa Gading', 1)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (3, N'Tanjung Priok', 1)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (4, N'Koja', 1)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (5, N'Pademangan', 1)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (6, N'Penjaringan', 1)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (7, N'Cilandak', 2)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (8, N'Jagakarsa', 2)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (9, N'Mampang Prapatan', 2)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (10, N'Pancoran', 2)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (11, N'Tebet', 2)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (12, N'Setiabudi', 2)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (13, N'Gambir', 3)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (14, N'Sawah Besar', 3)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (15, N'Kemayoran', 3)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (16, N'Menteng', 3)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (17, N'Senen', 3)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (18, N'Tanah Abang', 3)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (19, N'Gambir', 3)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (20, N'Cakung', 4)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (21, N'Ciracas', 4)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (22, N'Duren Sawit', 4)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (23, N'Jatinegara', 4)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (24, N'Pasar Rebo', 4)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (25, N'Pulo Gadung', 4)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (26, N'Cengkareng', 5)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (27, N'Grogol Petamburan', 5)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (28, N'Kebon Jeruk', 5)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (29, N'Palmerah', 5)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (30, N'Kalideres', 5)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (31, N'Bojonggede', 6)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (32, N'Ciawi', 6)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (33, N'Cibinong', 6)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (34, N'Cileungsi', 6)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (35, N'Ciomas', 6)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (36, N'Tajurhalang', 6)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (37, N'Beji', 7)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (38, N'Cilodong', 7)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (39, N'Cinere', 7)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (40, N'Cimanggis', 7)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (41, N'Sawangan', 7)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (42, N'Sukmajaya', 7)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (43, N'Balaraja', 8)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (44, N'Cisauk', 8)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (45, N'Tigaraksa', 8)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (46, N'Legok', 8)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (47, N'Kosambi', 8)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (48, N'Babelan', 9)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (49, N'Cibitung', 9)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (50, N'Tambun Selatan', 9)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (51, N'Cikarang Selatan', 9)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (52, N'Sukatani', 9)
GO
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (1, N'Shelly Juwita', N'Jl. Boulevard No. 31', 2, N'25', N'female', N'shelly@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (2, N'Bobi Rinaldo', N'Jl. Mangga No. 1', 3, N'31', N'male', N'Bobi@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (3, N'Adam Malik', N'Jl. Kincir Angin No. 50', 5, N'23', N'male', N'Adam@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (4, N'Susi Rahmawati', N'Jl. Kenanga No. 11', 7, N'45', N'female', N'Susi@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (5, N'Dimas Prasetyo', N'Jl. Niagara No. 69', 8, N'32', N'male', N'Dimas@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (6, N'Aji Pangestu', N'Jl. Sempurna No. 2', 9, N'40', N'male', N'Aji@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (7, N'Bunga Malika', N'Jl. Merak No. 10', 33, N'27', N'female', N'Bunga@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (8, N'Ria Addini', N'Jl. Arjuna No. 40', 16, N'29', N'female', N'Ria@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (9, N'Lisa Wulandari', N'Jl. Ampera No. 39', 11, N'26', N'female', N'Lisa@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (10, N'Rio Wijaya', N'Jl. Abdul Muis No. 70', 13, N'52', N'male', N'Rio@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (11, N'Ahmad Riyansah', N'Jl. Kecapi No. 5', 48, N'27', N'male', N'Ahmad@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (12, N'Mario Robert', N'Jl. Kebayoran No. 13', 44, N'28', N'male', N'Mario@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (13, N'Khansa Audya', N'Jl. Kedoya No. 50', 39, N'32', N'female', N'Khansa@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (14, N'Cintya Gabriela', N'Jl. Pintu Air No. 14', 30, N'24', N'female', N'Cintya@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (15, N'Ani Nuraini', N'Jl. Cimpedak No. 50', 49, N'45', N'female', N'Ani@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (16, N'Agung Mulyono', N'Jl. Daan Mogot No. 60', 29, N'38', N'male', N'Agung@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (17, N'Rian Wibowo', N'Jl. Batu No. 49', 31, N'41', N'male', N'Rian@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (18, N'Lutfi Aulia', N'Jl. Elang No. 2', 32, N'30', N'male', N'Lutfi@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (19, N'Malika Cantika', N'Jl. Imam Bonjol No. 30', 43, N'38', N'female', N'Malika@gmail.com')
INSERT [dbo].[customer] ([customer_id], [customer_name], [address], [city_id], [age], [gender], [email]) VALUES (20, N'Ratna Sariasih', N'Jl. Jambore No. 41', 52, N'53', N'female', N'Ratna@gmail.com')
GO
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (1, N'Jakarta Utara')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (2, N'Jakarta Selatan')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (3, N'Jakarta Pusat')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (4, N'Jakarta Timur')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (5, N'Jakarta Barat')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (6, N'Bogor')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (7, N'Depok')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (8, N'Tangerang')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (9, N'Bekasi')
GO
INSERT [dbo].[transaction_db] ([transaction_id], [account_id], [transaction_date], [amount], [transaction_type], [branch_id]) VALUES (1, 1, CAST(N'2024-01-17T09:10:00.0000000' AS DateTime2), 100000, N'Deposit', 1)
INSERT [dbo].[transaction_db] ([transaction_id], [account_id], [transaction_date], [amount], [transaction_type], [branch_id]) VALUES (2, 2, CAST(N'2024-01-17T10:10:00.0000000' AS DateTime2), 1000000, N'Deposit', 1)
INSERT [dbo].[transaction_db] ([transaction_id], [account_id], [transaction_date], [amount], [transaction_type], [branch_id]) VALUES (3, 3, CAST(N'2024-01-18T08:30:00.0000000' AS DateTime2), 10000000, N'Transfer', 1)
INSERT [dbo].[transaction_db] ([transaction_id], [account_id], [transaction_date], [amount], [transaction_type], [branch_id]) VALUES (4, 3, CAST(N'2024-01-18T10:45:00.0000000' AS DateTime2), 1000000, N'Withdrawal', 1)
INSERT [dbo].[transaction_db] ([transaction_id], [account_id], [transaction_date], [amount], [transaction_type], [branch_id]) VALUES (5, 5, CAST(N'2024-01-18T11:10:00.0000000' AS DateTime2), 200000, N'Deposit', 1)
INSERT [dbo].[transaction_db] ([transaction_id], [account_id], [transaction_date], [amount], [transaction_type], [branch_id]) VALUES (6, 6, CAST(N'2024-01-18T13:10:00.0000000' AS DateTime2), 50000, N'Withdrawal', 1)
INSERT [dbo].[transaction_db] ([transaction_id], [account_id], [transaction_date], [amount], [transaction_type], [branch_id]) VALUES (7, 6, CAST(N'2024-01-19T14:00:00.0000000' AS DateTime2), 100000, N'Payment', 1)
INSERT [dbo].[transaction_db] ([transaction_id], [account_id], [transaction_date], [amount], [transaction_type], [branch_id]) VALUES (8, 7, CAST(N'2024-01-19T09:10:00.0000000' AS DateTime2), 5000000, N'Deposit', 1)
INSERT [dbo].[transaction_db] ([transaction_id], [account_id], [transaction_date], [amount], [transaction_type], [branch_id]) VALUES (9, 8, CAST(N'2024-01-19T10:40:00.0000000' AS DateTime2), 300000, N'Withdrawal', 2)
INSERT [dbo].[transaction_db] ([transaction_id], [account_id], [transaction_date], [amount], [transaction_type], [branch_id]) VALUES (10, 9, CAST(N'2024-01-20T12:10:00.0000000' AS DateTime2), 2000000, N'Deposit', 1)
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_customer_id]
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [FK_state] FOREIGN KEY([state_id])
REFERENCES [dbo].[state] ([state_id])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [FK_state]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_city] FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_city]
GO
ALTER TABLE [dbo].[transaction_db]  WITH CHECK ADD  CONSTRAINT [FK_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[transaction_db] CHECK CONSTRAINT [FK_account]
GO
ALTER TABLE [dbo].[transaction_db]  WITH CHECK ADD  CONSTRAINT [FK_branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[branch] ([branch_id])
GO
ALTER TABLE [dbo].[transaction_db] CHECK CONSTRAINT [FK_branch]
GO
USE [master]
GO
ALTER DATABASE [stg] SET  READ_WRITE 
GO
