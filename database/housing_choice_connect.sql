USE [master]
GO
/****** Object:  Database [HousingChoiceConnect]    Script Date: 5/31/2019 9:01:01 PM ******/
CREATE DATABASE [HousingChoiceConnect]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HousingChoiceConnect', FILENAME = N'C:\Users\dholmes\HousingChoiceConnect.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HousingChoiceConnect_log', FILENAME = N'C:\Users\dholmes\HousingChoiceConnect_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HousingChoiceConnect] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HousingChoiceConnect].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HousingChoiceConnect] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET ARITHABORT OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HousingChoiceConnect] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HousingChoiceConnect] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HousingChoiceConnect] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HousingChoiceConnect] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HousingChoiceConnect] SET  MULTI_USER 
GO
ALTER DATABASE [HousingChoiceConnect] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HousingChoiceConnect] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HousingChoiceConnect] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HousingChoiceConnect] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HousingChoiceConnect] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HousingChoiceConnect] SET QUERY_STORE = OFF
GO
USE [HousingChoiceConnect]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [HousingChoiceConnect]
GO
/****** Object:  Table [dbo].[Amentity]    Script Date: 5/31/2019 9:01:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amentity](
	[AmentityID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
 CONSTRAINT [PK_Amentity] PRIMARY KEY CLUSTERED 
(
	[AmentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EliteTenantImport]    Script Date: 5/31/2019 9:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EliteTenantImport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[EntityID] [varchar](50) NULL,
	[DisguisedTaxID] [varchar](50) NULL,
 CONSTRAINT [PK_EliteTenantImport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandlordProperty]    Script Date: 5/31/2019 9:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandlordProperty](
	[LandlordPropertyID] [int] IDENTITY(1,1) NOT NULL,
	[AddressProperty] [varchar](100) NULL,
	[Apt_Suite] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[Description] [varchar](max) NULL,
	[Rent] [money] NULL,
	[Deposit] [money] NULL,
	[PetDeposit] [money] NULL,
	[PersonOfContact] [varchar](25) NULL,
	[PersonToContactPhoneNumber] [varchar](10) NULL,
	[NumberOfTenantViews] [int] NULL,
	[IsUtilityElectricPaidByLandlord] [bit] NULL,
	[IsUtilityWaterPaidByLandlord] [bit] NULL,
	[IsUtilityGasPaidByLandlord] [bit] NULL,
	[IsAmentitiesIncluded] [bit] NULL,
	[IsHandicapAccessible] [bit] NULL,
	[IsPropertyReadyForOccupancy] [bit] NULL,
	[IsPetsPermitted] [bit] NULL,
	[IsPicturesExists] [bit] NULL,
	[IsActive] [bit] NULL,
	[DateAvaiableToRent] [varchar](100) NULL,
	[DateLastUpdated] [date] NULL,
	[DateOfInactivation] [date] NULL,
	[DateOfPostage] [date] NULL,
	[fk_UserID] [int] NULL,
	[fk_NeighborhoodID] [int] NULL,
	[BedroomNumber] [int] NULL,
	[BathroomNumber] [int] NULL,
	[fk_PropertyTypeID] [int] NULL,
	[fk_UnitTypeID] [int] NULL,
 CONSTRAINT [PK_LandlordProperty] PRIMARY KEY CLUSTERED 
(
	[LandlordPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandlordPropertyAmentity]    Script Date: 5/31/2019 9:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandlordPropertyAmentity](
	[fk_LandlordPropertyID] [int] NOT NULL,
	[fk_AmentityID] [int] NOT NULL,
 CONSTRAINT [PK_LandlordPropertyAmentity] PRIMARY KEY CLUSTERED 
(
	[fk_LandlordPropertyID] ASC,
	[fk_AmentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandlordPropertyHandicapAccessibility]    Script Date: 5/31/2019 9:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandlordPropertyHandicapAccessibility](
	[LandlordPropertyHandicapAccessibilityID] [int] IDENTITY(1,1) NOT NULL,
	[IsAccessibleParkingCloseToHome] [bit] NULL,
	[IsRampedEntry] [bit] NULL,
	[IsDoorways32Inches_Wider] [bit] NULL,
	[IsAccessiblePathToAndInHome32Inches_Wider] [bit] NULL,
	[IsAutomaticEntryDoor] [bit] NULL,
	[IsLowCounter_SinkAt_Below34Inches] [bit] NULL,
	[IsAccessibleAppliances] [bit] NULL,
	[IsShower_TubGrabBars] [bit] NULL,
	[IsRollInShower] [bit] NULL,
	[IsHandHeldShowerSprayer] [bit] NULL,
	[IsFixedSeatInShower_Tub] [bit] NULL,
	[IsRaisedToilet] [bit] NULL,
	[IsFirstFloorBedroom] [bit] NULL,
	[IsFirstFloorBathroom] [bit] NULL,
	[IsLift_Elevator] [bit] NULL,
	[IsAudio_VisualDoorbell] [bit] NULL,
	[IsAudio_VisualSmoke_FireAlarm] [bit] NULL,
	[IsElevatorAccess] [bit] NULL,
	[fk_LandlordPropertyID] [int] NULL,
 CONSTRAINT [PK_LandlordPropertyHandicapAccessibility] PRIMARY KEY CLUSTERED 
(
	[LandlordPropertyHandicapAccessibilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandlordPropertyPictures]    Script Date: 5/31/2019 9:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandlordPropertyPictures](
	[LandlordPropertyPictureID] [int] IDENTITY(1,1) NOT NULL,
	[MIMEType] [varchar](max) NULL,
	[ImageData] [varchar](max) NULL,
	[fk_LandlordPropertyID] [int] NULL,
 CONSTRAINT [PK_LandlordPropertyPictures] PRIMARY KEY CLUSTERED 
(
	[LandlordPropertyPictureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Neighborhood]    Script Date: 5/31/2019 9:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Neighborhood](
	[NeighborhoodID] [int] IDENTITY(1,1) NOT NULL,
	[Neighborhood] [varchar](50) NULL,
	[ZipCode] [int] NULL,
 CONSTRAINT [PK_Neighborhood] PRIMARY KEY CLUSTERED 
(
	[NeighborhoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyType]    Script Date: 5/31/2019 9:01:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyType](
	[PropertyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_PropertyType] PRIMARY KEY CLUSTERED 
(
	[PropertyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/31/2019 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityQuestion]    Script Date: 5/31/2019 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityQuestion](
	[SecurityQuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](225) NULL,
 CONSTRAINT [PK_SecurityQuestion] PRIMARY KEY CLUSTERED 
(
	[SecurityQuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitType]    Script Date: 5/31/2019 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitType](
	[UnitTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_UnitType] PRIMARY KEY CLUSTERED 
(
	[UnitTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/31/2019 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsEmailVerified] [bit] NULL,
	[IsSecurityQuestionsCompleted] [bit] NULL,
	[DateRegistered] [datetime] NULL,
	[LastLogin] [datetime] NULL,
	[fk_RoleID] [int] NULL,
	[Code] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSecurityQuestion]    Script Date: 5/31/2019 9:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSecurityQuestion](
	[UserSecurityQuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Response] [varchar](50) NULL,
	[fk_SecurityQuestionID] [int] NULL,
	[fk_UserID] [int] NULL,
 CONSTRAINT [PK_UserSecurityQuestion] PRIMARY KEY CLUSTERED 
(
	[UserSecurityQuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [HousingChoiceConnect] SET  READ_WRITE 
GO
