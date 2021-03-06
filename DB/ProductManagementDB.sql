USE [master]
GO
/****** Object:  Database [ProductManagementDB]    Script Date: 5/18/2015 10:54:41 PM ******/
CREATE DATABASE [ProductManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductManagementDB', FILENAME = N'E:\BASIS _SEIP - Practice (.NET)\Project Product Management App\ProductManagementApp\DB\ProductManagementDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProductManagementDB_log', FILENAME = N'E:\BASIS _SEIP - Practice (.NET)\Project Product Management App\ProductManagementApp\DB\ProductManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProductManagementDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductManagementDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ProductManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProductManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ProductManagementDB]
GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 5/18/2015 10:54:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_code] [varchar](50) NULL,
	[category_name] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 5/18/2015 10:54:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_code] [varchar](50) NULL,
	[product_name] [varchar](100) NULL,
	[product_quantity] [int] NULL,
	[product_categoryId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[view_productCategory]    Script Date: 5/18/2015 10:54:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_productCategory]
AS
SELECT c.category_name,p.product_id,p.product_code,p.product_name,p.product_quantity FROM tbl_product AS p
LEFT OUTER JOIN tbl_category AS c
ON p.product_categoryId = c.category_id;
GO
SET IDENTITY_INSERT [dbo].[tbl_category] ON 

INSERT [dbo].[tbl_category] ([category_id], [category_code], [category_name]) VALUES (1, N'101', N'Computer')
INSERT [dbo].[tbl_category] ([category_id], [category_code], [category_name]) VALUES (2, N'102', N'Mobile')
INSERT [dbo].[tbl_category] ([category_id], [category_code], [category_name]) VALUES (3, N'103', N'Electric')
SET IDENTITY_INSERT [dbo].[tbl_category] OFF
SET IDENTITY_INSERT [dbo].[tbl_product] ON 

INSERT [dbo].[tbl_product] ([product_id], [product_code], [product_name], [product_quantity], [product_categoryId]) VALUES (1, N'1001', N'Desktop', 3, 1)
INSERT [dbo].[tbl_product] ([product_id], [product_code], [product_name], [product_quantity], [product_categoryId]) VALUES (4, N'1003', N'Nokia', 2, 2)
INSERT [dbo].[tbl_product] ([product_id], [product_code], [product_name], [product_quantity], [product_categoryId]) VALUES (6, N'1004', N'Laptop', 5, 1)
SET IDENTITY_INSERT [dbo].[tbl_product] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tbl_category]    Script Date: 5/18/2015 10:54:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_category] ON [dbo].[tbl_category]
(
	[category_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tbl_product]    Script Date: 5/18/2015 10:54:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_product] ON [dbo].[tbl_product]
(
	[product_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_product_tbl_product] FOREIGN KEY([product_categoryId])
REFERENCES [dbo].[tbl_category] ([category_id])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK_tbl_product_tbl_product]
GO
USE [master]
GO
ALTER DATABASE [ProductManagementDB] SET  READ_WRITE 
GO
