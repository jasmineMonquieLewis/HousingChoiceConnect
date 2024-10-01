IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'HousingChoiceConnect')
BEGIN
  CREATE DATABASE HousingChoiceConnect;
END;
GO

USE HousingChoiceConnect;
GO


CREATE SCHEMA Security AUTHORIZATION dbo;
GO

CREATE SCHEMA Landlord AUTHORIZATION dbo;
GO