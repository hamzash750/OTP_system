USE [master]
GO
/****** Object:  Database [Loginsystem]    Script Date: 1/12/2017 11:50:46 AM ******/
CREATE DATABASE [Loginsystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Loginsystem', FILENAME = N'F:\OTP\Loginsystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Loginsystem_log', FILENAME = N'F:\OTP\Loginsystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Loginsystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Loginsystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Loginsystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Loginsystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Loginsystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Loginsystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Loginsystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [Loginsystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Loginsystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Loginsystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Loginsystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Loginsystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Loginsystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Loginsystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Loginsystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Loginsystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Loginsystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Loginsystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Loginsystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Loginsystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Loginsystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Loginsystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Loginsystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Loginsystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Loginsystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Loginsystem] SET  MULTI_USER 
GO
ALTER DATABASE [Loginsystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Loginsystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Loginsystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Loginsystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Loginsystem] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Loginsystem]
GO
/****** Object:  Table [dbo].[tbl_admin]    Script Date: 1/12/2017 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_admin](
	[fld_id] [int] IDENTITY(1,1) NOT NULL,
	[fld_name] [varchar](50) NULL,
	[fld_email] [varchar](50) NULL,
	[fld_phonenumber] [varchar](50) NULL,
	[fld_city] [varchar](50) NULL,
	[fld_password] [varchar](50) NULL,
	[fld_repassword] [varchar](50) NULL,
	[fld_gender] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_admin] PRIMARY KEY CLUSTERED 
(
	[fld_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_OTP]    Script Date: 1/12/2017 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_OTP](
	[fld_id] [int] IDENTITY(1,1) NOT NULL,
	[fld_otp] [varchar](50) NOT NULL,
	[fld_user] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_OTP] PRIMARY KEY CLUSTERED 
(
	[fld_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[adminlogin]    Script Date: 1/12/2017 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[adminlogin]
@Email varchar(50),
@Pass varchar(50) 


as
Begin 
Select COUNT(*) from tbl_admin where fld_email=@Email and fld_password=@Pass 
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_AddnewUser]    Script Date: 1/12/2017 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_AddnewUser]
(
	@Name varchar (40),
	@Email varchar (40),
	@Phonenumber varchar (40),
	@City varchar (40),
	@Password varchar (40),
	@Repassword varchar (40),
	@gender varchar (40)
	
	)
	

AS
 BEGIN
 BEGIN TRY
 Insert into tbl_admin
 values
 (
  @Name,@Email,@Phonenumber,
  @City,@Password,@Repassword,@gender
	)
	End TRY
	BEGIN CATCH
	PRINT('Error Occurd')
	End CATCH
	END
GO
USE [master]
GO
ALTER DATABASE [Loginsystem] SET  READ_WRITE 
GO
