USE [master]
GO
/****** Object:  Database [DWH]    Script Date: 3/20/2024 2:27:04 PM ******/
CREATE DATABASE [DWH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DWH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSQLSERVER\MSSQL\DATA\DWH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DWH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSQLSERVER\MSSQL\DATA\DWH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DWH] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DWH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DWH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DWH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DWH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DWH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DWH] SET ARITHABORT OFF 
GO
ALTER DATABASE [DWH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DWH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DWH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DWH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DWH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DWH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DWH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DWH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DWH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DWH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DWH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DWH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DWH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DWH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DWH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DWH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DWH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DWH] SET RECOVERY FULL 
GO
ALTER DATABASE [DWH] SET  MULTI_USER 
GO
ALTER DATABASE [DWH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DWH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DWH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DWH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DWH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DWH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DWH', N'ON'
GO
ALTER DATABASE [DWH] SET QUERY_STORE = ON
GO
ALTER DATABASE [DWH] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DWH]
GO
/****** Object:  Table [dbo].[DimAccount]    Script Date: 3/20/2024 2:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAccount](
	[AccountId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[AccountType] [varchar](50) NOT NULL,
	[Balance] [int] NOT NULL,
	[DateOppened] [datetime2](0) NULL,
	[Status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimBranch]    Script Date: 3/20/2024 2:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimBranch](
	[BranchId] [int] NOT NULL,
	[BranchName] [varchar](50) NOT NULL,
	[BranchLocation] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 3/20/2024 2:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerId] [int] NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
	[Age] [varchar](10) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactTransaction]    Script Date: 3/20/2024 2:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTransaction](
	[TransactionId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[TransactionDate] [datetime2](0) NOT NULL,
	[Amount] [int] NOT NULL,
	[TransactionType] [varchar](50) NOT NULL,
	[BranchId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (1, 1, N'saving', 1500000, CAST(N'2020-05-01T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (2, 2, N'saving', 500000, CAST(N'2020-06-01T10:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (3, 1, N'checking', 25000000, CAST(N'2020-06-21T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (5, 4, N'saving', 75000000, CAST(N'2020-06-29T13:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (6, 5, N'checking', 1500000, CAST(N'2020-07-01T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (7, 6, N'saving', 15000000, CAST(N'2020-07-14T09:00:00.0000000' AS DateTime2), N'terminated')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (8, 7, N'checking', 25000000, CAST(N'2020-07-15T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (9, 8, N'saving', 80000000, CAST(N'2020-07-15T11:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (10, 9, N'checking', 25000000, CAST(N'2020-07-16T10:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (11, 10, N'saving', 75000000, CAST(N'2020-07-24T11:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (12, 11, N'checking', 25000000, CAST(N'2020-08-08T10:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (13, 12, N'saving', 55000000, CAST(N'2020-08-15T11:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (14, 13, N'checking', 25000000, CAST(N'2020-08-15T14:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (15, 14, N'saving', 45000000, CAST(N'2020-09-25T08:00:00.0000000' AS DateTime2), N'terminated')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (16, 15, N'checking', 25000000, CAST(N'2020-09-26T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (17, 15, N'saving', 10000000, CAST(N'2020-10-19T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (18, 17, N'checking', 25000000, CAST(N'2020-10-21T10:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (19, 18, N'saving', 55000000, CAST(N'2020-11-11T09:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (20, 19, N'checking', 25000000, CAST(N'2020-11-19T08:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (21, 20, N'checking', 6000000, CAST(N'2020-11-29T08:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (22, 3, N'checking', 4000000, CAST(N'2022-08-18T10:00:00.0000000' AS DateTime2), N'active')
INSERT [dbo].[DimAccount] ([AccountId], [CustomerId], [AccountType], [Balance], [DateOppened], [Status]) VALUES (23, 6, N'checking', 5000000, CAST(N'2022-01-10T12:00:00.0000000' AS DateTime2), N'active')
GO
INSERT [dbo].[DimBranch] ([BranchId], [BranchName], [BranchLocation]) VALUES (1, N'KC Jakarta', N'Jl. Gatot Subroto No 13')
INSERT [dbo].[DimBranch] ([BranchId], [BranchName], [BranchLocation]) VALUES (2, N'KC Bogor', N'Jl. Padjajaran No 43')
INSERT [dbo].[DimBranch] ([BranchId], [BranchName], [BranchLocation]) VALUES (3, N'KC Depok', N'Jl. Raya Sawangan No 34')
INSERT [dbo].[DimBranch] ([BranchId], [BranchName], [BranchLocation]) VALUES (4, N'KC Tangerang', N'Jl. Cisauk No 50')
INSERT [dbo].[DimBranch] ([BranchId], [BranchName], [BranchLocation]) VALUES (5, N'KC Bekas', N'Jl. Ahmad Yani No 23')
GO
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (1, N'SHELLY JUWITA', N'JL. BOULEVARD NO. 31', N'KELAPA GADING', N'JAKARTA UTARA', N'25', N'FEMALE', N'shelly@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (2, N'BOBI RINALDO', N'JL. MANGGA NO. 1', N'TANJUNG PRIOK', N'JAKARTA UTARA', N'31', N'MALE', N'Bobi@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (3, N'ADAM MALIK', N'JL. KINCIR ANGIN NO. 50', N'PADEMANGAN', N'JAKARTA UTARA', N'23', N'MALE', N'Adam@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (4, N'SUSI RAHMAWATI', N'JL. KENANGA NO. 11', N'CILANDAK', N'JAKARTA SELATAN', N'45', N'FEMALE', N'Susi@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (5, N'DIMAS PRASETYO', N'JL. NIAGARA NO. 69', N'JAGAKARSA', N'JAKARTA SELATAN', N'32', N'MALE', N'Dimas@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (6, N'AJI PANGESTU', N'JL. SEMPURNA NO. 2', N'MAMPANG PRAPATAN', N'JAKARTA SELATAN', N'40', N'MALE', N'Aji@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (7, N'BUNGA MALIKA', N'JL. MERAK NO. 10', N'CIBINONG', N'BOGOR', N'27', N'FEMALE', N'Bunga@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (8, N'RIA ADDINI', N'JL. ARJUNA NO. 40', N'MENTENG', N'JAKARTA PUSAT', N'29', N'FEMALE', N'Ria@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (9, N'LISA WULANDARI', N'JL. AMPERA NO. 39', N'TEBET', N'JAKARTA SELATAN', N'26', N'FEMALE', N'Lisa@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (10, N'RIO WIJAYA', N'JL. ABDUL MUIS NO. 70', N'GAMBIR', N'JAKARTA PUSAT', N'52', N'MALE', N'Rio@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (11, N'AHMAD RIYANSAH', N'JL. KECAPI NO. 5', N'BABELAN', N'BEKASI', N'27', N'MALE', N'Ahmad@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (12, N'MARIO ROBERT', N'JL. KEBAYORAN NO. 13', N'CISAUK', N'TANGERANG', N'28', N'MALE', N'Mario@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (13, N'KHANSA AUDYA', N'JL. KEDOYA NO. 50', N'CINERE', N'DEPOK', N'32', N'FEMALE', N'Khansa@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (14, N'CINTYA GABRIELA', N'JL. PINTU AIR NO. 14', N'KALIDERES', N'JAKARTA BARAT', N'24', N'FEMALE', N'Cintya@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (15, N'ANI NURAINI', N'JL. CIMPEDAK NO. 50', N'CIBITUNG', N'BEKASI', N'45', N'FEMALE', N'Ani@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (17, N'RIAN WIBOWO', N'JL. BATU NO. 49', N'BOJONGGEDE', N'BOGOR', N'41', N'MALE', N'Rian@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (18, N'LUTFI AULIA', N'JL. ELANG NO. 2', N'CIAWI', N'BOGOR', N'30', N'MALE', N'Lutfi@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (19, N'MALIKA CANTIKA', N'JL. IMAM BONJOL NO. 30', N'BALARAJA', N'TANGERANG', N'38', N'FEMALE', N'Malika@gmail.com')
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [Address], [CityName], [StateName], [Age], [Gender], [Email]) VALUES (20, N'RATNA SARIASIH', N'JL. JAMBORE NO. 41', N'SUKATANI', N'BEKASI', N'53', N'FEMALE', N'Ratna@gmail.com')
GO
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (1, 1, CAST(N'2024-01-17T09:10:00.0000000' AS DateTime2), 100000, N'Deposit', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (2, 2, CAST(N'2024-01-17T10:10:00.0000000' AS DateTime2), 1000000, N'Deposit', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (3, 3, CAST(N'2024-01-18T08:30:00.0000000' AS DateTime2), 10000000, N'Transfer', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (4, 3, CAST(N'2024-01-18T10:45:00.0000000' AS DateTime2), 1000000, N'Withdrawal', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (5, 5, CAST(N'2024-01-18T11:10:00.0000000' AS DateTime2), 200000, N'Deposit', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (6, 6, CAST(N'2024-01-18T13:10:00.0000000' AS DateTime2), 50000, N'Withdrawal', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (7, 6, CAST(N'2024-01-19T14:00:00.0000000' AS DateTime2), 100000, N'Payment', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (8, 7, CAST(N'2024-01-19T09:10:00.0000000' AS DateTime2), 5000000, N'Deposit', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (9, 8, CAST(N'2024-01-19T10:40:00.0000000' AS DateTime2), 300000, N'Withdrawal', 2)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (10, 9, CAST(N'2024-01-20T12:10:00.0000000' AS DateTime2), 2000000, N'Deposit', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (11, 10, CAST(N'2024-01-20T15:00:00.0000000' AS DateTime2), 1000000, N'Transfer', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (12, 11, CAST(N'2024-01-20T10:00:00.0000000' AS DateTime2), 500000, N'Deposit', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (13, 12, CAST(N'2024-01-20T12:10:00.0000000' AS DateTime2), 500000, N'Withdrawal', 5)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (14, 13, CAST(N'2024-01-21T00:14:00.0000000' AS DateTime2), 1500000, N'Deposit', 4)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (15, 14, CAST(N'2024-01-21T00:08:00.0000000' AS DateTime2), 500000, N'Transfer', 3)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (16, 15, CAST(N'2024-01-22T00:09:00.0000000' AS DateTime2), 100000, N'Deposit', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (17, 16, CAST(N'2024-01-22T10:13:00.0000000' AS DateTime2), 100000, N'Withdrawal', 5)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (18, 17, CAST(N'2024-01-22T20:10:00.0000000' AS DateTime2), 700000, N'Deposit', 5)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (19, 18, CAST(N'2024-01-22T00:11:00.0000000' AS DateTime2), 30000, N'Payment', 2)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (20, 19, CAST(N'2024-01-22T00:15:00.0000000' AS DateTime2), 2500000, N'Deposit', 2)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (21, 20, CAST(N'2024-01-23T06:11:00.0000000' AS DateTime2), 150000, N'Payment', 4)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (22, 21, CAST(N'2024-01-23T21:10:00.0000000' AS DateTime2), 800000, N'Withdrawal', 5)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (23, 22, CAST(N'2024-01-24T02:10:00.0000000' AS DateTime2), 100000, N'Withdrawal', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (24, 23, CAST(N'2024-01-22T10:11:00.0000000' AS DateTime2), 300000, N'Payment', 1)
INSERT [dbo].[FactTransaction] ([TransactionId], [AccountId], [TransactionDate], [Amount], [TransactionType], [BranchId]) VALUES (25, 23, CAST(N'2024-01-23T06:14:00.0000000' AS DateTime2), 400000, N'Deposit', 1)
GO
ALTER TABLE [dbo].[DimAccount]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[DimCustomer] ([CustomerId])
GO
ALTER TABLE [dbo].[FactTransaction]  WITH CHECK ADD FOREIGN KEY([BranchId])
REFERENCES [dbo].[DimBranch] ([BranchId])
GO
ALTER TABLE [dbo].[FactTransaction]  WITH CHECK ADD  CONSTRAINT [FK__FactTrans__Custo__48CFD27E] FOREIGN KEY([AccountId])
REFERENCES [dbo].[DimAccount] ([AccountId])
GO
ALTER TABLE [dbo].[FactTransaction] CHECK CONSTRAINT [FK__FactTrans__Custo__48CFD27E]
GO
/****** Object:  StoredProcedure [dbo].[BalancePerCustomer]    Script Date: 3/20/2024 2:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[BalancePerCustomer]
	@name VARCHAR(100)
AS
BEGIN
	SELECT 
			DimCustomer.CustomerName, 
			DimAccount.AccountType, 
			DimAccount.Balance,
			DimAccount.Balance - ISNULL
				(SUM
					(CASE WHEN NOT FactTransaction.TransactionType = 'Deposit' THEN FactTransaction.Amount 
					ELSE -FactTransaction.Amount 
					END), 
				0)
			AS CurrentBalance
		FROM
			DimCustomer
		INNER JOIN 
			DimAccount ON DimCustomer.CustomerId = DimAccount.CustomerId
		LEFT JOIN 
			FactTransaction ON DimAccount.AccountId = FactTransaction.AccountId
		WHERE 
			DimCustomer.CustomerName LIKE @name+'%'
			AND DimAccount.Status = 'Active'
		GROUP BY 
			DimCustomer.CustomerName, 
			DimAccount.AccountType, 
			DimAccount.Balance;
END
GO
/****** Object:  StoredProcedure [dbo].[DailyTransaction]    Script Date: 3/20/2024 2:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DailyTransaction]
	@start_date DATETIME,
	@end_date DATETIME
AS
BEGIN
	SELECT 
	FORMAT(TransactionDate, 'yyyy-MM-dd') AS Date, 
	COUNT(TransactionId) AS TotalTransaction,
	SUM(Amount) AS TotalAmount
	FROM FactTransaction
	WHERE FORMAT(TransactionDate, 'yyyy-MM-dd') BETWEEN @start_date AND @end_date
	GROUP BY FORMAT(TransactionDate, 'yyyy-MM-dd');
END;


GO
USE [master]
GO
ALTER DATABASE [DWH] SET  READ_WRITE 
GO
