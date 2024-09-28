IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'HousingChoiceConnect')
BEGIN
  CREATE DATABASE HousingChoiceConnect;
END;
GO

USE HousingChoiceConnect;
GO

/****** 
Tables: 6
- Amentity
- Neighborhood
- Property
- Role
- SecurityQuestion
- Unit
******/

/****** Object:  Table dbo.Amentity  ******/
DROP TABLE  IF EXISTS dbo.Amentity
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.Amentity(
	AmentityID int IDENTITY(1,1) NOT NULL,
	Amentity varchar(50) NOT NULL,
	Location varchar(50) NULL,
 CONSTRAINT PK_Amentity_AmentityID PRIMARY KEY CLUSTERED (AmentityID ASC),
 INDEX IX_Amentity_AmentityID NONCLUSTERED (AmentityID),
 INDEX IX_Amentity_Amentity NONCLUSTERED (Amentity),
 INDEX IX_Amentity_Location NONCLUSTERED (Location)
)
GO

/****** Object:  Table dbo.Neighborhood  ******/
DROP TABLE  IF EXISTS dbo.Neighborhood
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.Neighborhood(
	NeighborhoodID int IDENTITY(1,1) NOT NULL,
	Neighborhood varchar(50) NOT NULL,
	ZipCode int NOT NULL,
 CONSTRAINT PK_Neighborhood_NeighborhoodID PRIMARY KEY CLUSTERED (NeighborhoodID ASC),
 INDEX IX_Neighborhood_NeighborhoodID NONCLUSTERED (NeighborhoodID),
 INDEX IX_Neighborhood_Neighborhood NONCLUSTERED (Neighborhood),
 INDEX IX_Neighborhood_ZipCode NONCLUSTERED (ZipCode)
 )
GO

/****** Object:  Table dbo.Property ******/
DROP TABLE  IF EXISTS dbo.Property
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.Property(
	PropertyID int IDENTITY(1,1) NOT NULL,
	Property varchar(50) NOT NULL,
 CONSTRAINT PK_Property_PropertyID PRIMARY KEY CLUSTERED (PropertyID ASC),
 INDEX IX_Property_PropertyID NONCLUSTERED (PropertyID),
 INDEX IX_Property_Property NONCLUSTERED (Property)
)
GO

/****** Object:  Table dbo.Role ******/
DROP TABLE IF EXISTS dbo.Role
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.[Role](
	RoleID int IDENTITY(1,1) NOT NULL,
	RoleName varchar(50) NOT NULL,
	Description varchar(250) NOT NULL,
 CONSTRAINT PK_Role_RoleID PRIMARY KEY CLUSTERED (RoleID ASC),
 INDEX IX_Role_RoleID NONCLUSTERED (RoleID),
 INDEX IX_Role_Role NONCLUSTERED (Role)
)
GO

/****** Object:  Table dbo.SecurityQuestion ******/
DROP TABLE IF EXISTS dbo.SecurityQuestion
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.SecurityQuestion(
	SecurityQuestionID int IDENTITY(1,1) NOT NULL,
	Question varchar(225) NOT NULL,
 CONSTRAINT PK_SecurityQuestion_SecurityQuestionID PRIMARY KEY CLUSTERED (SecurityQuestionID ASC),
 INDEX IX_SecurityQuestion_SecurityQuestionID NONCLUSTERED (SecurityQuestionID),
 INDEX IX_SecurityQuestion_SecurityQuestion NONCLUSTERED (Question)
)
GO


/****** Object:  Table dbo.Unit  ******/
DROP TABLE IF EXISTS dbo.Unit
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TABLE dbo.Unit(
	UnitID int IDENTITY(1,1) NOT NULL,
	Unit varchar(50) NOT NULL,
 CONSTRAINT PK_Unit_UnitID PRIMARY KEY CLUSTERED (UnitID ASC),
 INDEX IX_Unit_UnitID NONCLUSTERED (UnitID),
 INDEX IX_Unit_Unit NONCLUSTERED (Unit)
)
GO