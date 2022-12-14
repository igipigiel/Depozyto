USE [master]
GO
/****** Object:  Database [epicDataBase]    Script Date: 27.10.2022 13:15:54 ******/
CREATE DATABASE [epicDataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'epicDataBase', FILENAME = N'G:\SQLserver\MSSQL15.SQLEXPRESS\MSSQL\DATA\epicDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'epicDataBase_log', FILENAME = N'G:\SQLserver\MSSQL15.SQLEXPRESS\MSSQL\DATA\epicDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [epicDataBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [epicDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [epicDataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [epicDataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [epicDataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [epicDataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [epicDataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [epicDataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [epicDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [epicDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [epicDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [epicDataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [epicDataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [epicDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [epicDataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [epicDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [epicDataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [epicDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [epicDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [epicDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [epicDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [epicDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [epicDataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [epicDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [epicDataBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [epicDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [epicDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [epicDataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [epicDataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [epicDataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [epicDataBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [epicDataBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [epicDataBase] SET QUERY_STORE = OFF
GO
USE [epicDataBase]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 27.10.2022 13:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[num] [varchar](max) NULL,
	[money] [float] NULL,
	[Currency] [varchar](50) NULL,
	[ClientId] [int] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 27.10.2022 13:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NULL,
	[ClientPassword] [nvarchar](50) NULL,
	[ClientName] [nvarchar](50) NULL,
	[ClientLastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Blocked] [varchar](50) NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contractors]    Script Date: 27.10.2022 13:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contractors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[Accountnumber] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ClientId] [int] NULL,
 CONSTRAINT [PK_Contractors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 27.10.2022 13:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[Id] [int] NOT NULL,
	[Currency] [varchar](50) NULL,
 CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 27.10.2022 13:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Date] [date] NULL,
	[FromClientId] [int] NULL,
	[ToClientId] [int] NULL,
 CONSTRAINT [PK_TransactionLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Clients]
GO
ALTER TABLE [dbo].[Contractors]  WITH CHECK ADD  CONSTRAINT [FK_Contractors_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[Contractors] CHECK CONSTRAINT [FK_Contractors_Clients]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Clients] FOREIGN KEY([FromClientId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Clients]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Clients1] FOREIGN KEY([ToClientId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Clients1]
GO
/****** Object:  StoredProcedure [dbo].[SP_Account]    Script Date: 27.10.2022 13:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_Account]
(  
   @num as varchar (MAX),  
   @money as float,
   
	@Currency as varchar (50),
	@ClientId as int
)  
as  
begin tran
begin
   Insert into Accounts (num,money, Currency,ClientId) Values (@num,@money,@Currency,@ClientId)  
End  
commit tran
GO
/****** Object:  StoredProcedure [dbo].[SP_Client]    Script Date: 27.10.2022 13:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Client]
(  
   @Login as varchar (50),  
   @Password as varchar (50),
   @Name as varchar (50),
   @LastName as varchar (50),
   @Email as varchar (50),
   @Role as varchar (50),
   @Blocked as varchar(50)
)  
as  
begin tran
begin
   Insert into Clients (Login,ClientPassword,ClientName,ClientLastName,Email,Role,Blocked) Values (@Login,@Password,@Name,@LastName,@Email,@Role,@Blocked)  
End  
commit tran
GO
/****** Object:  StoredProcedure [dbo].[SP_Contractors]    Script Date: 27.10.2022 13:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Contractors]
(
   @Name as varchar (50),
   @Surname as varchar(50),
   @Accountnumber as varchar(50),
   @Email as varchar (50),
   @ClientId as int
)
as
begin tran
begin
   Insert into Contractors (Name,Surname,Accountnumber,Email,ClientId) Values (@Name,@Surname,@Accountnumber,@Email,@ClientId)
End
commit tran
GO
/****** Object:  StoredProcedure [dbo].[SP_TransactionLog]    Script Date: 27.10.2022 13:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_TransactionLog]
(  
   
   @Amount as varchar (50),
   @Title as varchar (50),
   @Date as varchar (50),
   @FromAccountId as int,
   @ToAccountId as int
)  
as  
begin tran
begin
   Insert into Transactions(Amount,Title,Date, FromClientId, ToClientId) Values (@Amount,@Title,@Date, @FromAccountId, @ToAccountId)  
End  
commit tran
GO
USE [master]
GO
ALTER DATABASE [epicDataBase] SET  READ_WRITE 
GO
