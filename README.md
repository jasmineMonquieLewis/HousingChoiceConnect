# Housing Choice Connect

![housing-choice-connect-home-slider](https://github.com/user-attachments/assets/8fb0f491-0e5a-44b3-9ebe-f073e5783d05)


# Table of Contents

1. [General Information](#general-information)
2. [Introduction](#introduction)
3. [Installation](#installation)
4. [Application Details](#application-details)
5. [Database Composition](#database-composition)
 
# General Information

## Company 
Housing Authority of New Orleans

### Industry
Housing

### Project Type
House Listings

## Project Description
Housing Choice Connect allows New Orleans voucher holders and participating landlords to 
easily search or advertise rental properties without reviewing an extensive list.

### Project Link
https://www.hano.org/HousingChoiceConnect/

### Project GitHub
https://github.com/jasmineMLewis/Housing-Choice-Connect

### Project SRS
https://www.slideshare.net/JasmineMonquieLewis/housing-choice-connect-software-requirement-specifications

# Introduction
Housing Choice Connect is a .NET project for Housing Authority of New Orleans.

### Version
<p>Major.Minor.Patch</p>
<p>Old project from late 2010s (2016 - 2017)</p>

<b>New Updates Added as of 2024</b>
1. Add a Application Constants Class as pascal case variables
2. Create schemas for Security and Landlord
3. Separate users' roles into UserRole table separate from User table
4. Add Location Type table for Amentity
5. Implement schemas for user and landlord database tables
6. Add Activity Log, Activity Type, and Zip Code database tables
7. Add Zip Code ID for Neighborhood table
8. Remove Landlord Property Picture that stores images into databse

(IN PROGRESS) Change VB pages that uses local constants to Application Constants namespace 


### Date Last Updated via GitHub
October 13, 2024

### Technologies
| Technology | Version  |
|--|--|
| ASP.NET Web Application | 4.7.2 |
| Visual Basic .NET | 6 |
| Bootstrap | 5.2.3 |
| Font Awesome | 6.3.0 |
| JQuery | 5.2.3 |


# Installation

## Install Applications
1. Download MicroSoft (MS) SQL Server Managment Studio
2. Download MicroSoft (MS) Visual Studio 2022

## Install Database
Within the File-Tracker folder, navigate to database folder, and open the following folders:
1. create-schemas-sql 
2. create-tbls-sql
3. insert-data-sql

### Create Schemas
Execute database files in SQL Server Managment Studio within 'create-scheams-sql' folder:
1. ./database/create-schemas-sql/1-1-create-schemas-sql

### Create Tables
Execute database files in SQL Server Managment Studio within 'create-tbls-sql' folder:
Note: Execute each table separately.
1. ./database/create-tbls-sql/2-1-create-tbls-refernce.sql
2. ./database/create-tbls-sql/2-2-create-tbls-permanent.sql
3. ./database/create-tbls-sql/2-3-create-tbls-link.sql

### Insert Data
Execute database files in SQL Server Managment Studio within 'insert-data-sql' folder:
Note: Execute each table separately.
1. ./database/insert-data-sql/3-1-insert-data-tbls-refernce.sql
2. ./database/insert-data-sql/3-2-insert-data-tbls-permanent.sql

### View Database Diagram
1. ./database/housing-choice-connect-database-diagram.png


## Run Application
1. Open FileTracker project folder (contains FileTracker.sln) in MS Visual Studio 2022
2. Navigate to Web.Config, modify database host and password to your localhost credentials
3. After the application is open in Visual Studio, press IIS Express on the top tool bar


### Test Users
To log into the application, here are some test users from the database files:

### Admins
| Namme | Email  | Password | 
|--|--|--|
| Jasmine Lewis | jasmine.lewis@artistikrebellion.us | Qwerty1 | 

### Landlords
| Namme | Email  | Password | 
|--|--|--|
| Cesar Gonzalez | CesarGonzalez@gmail.com | Qwerty1 |
| Shannon Long | ShannonLong@gmail.com | Qwerty1 |

#### Tenants
| Namme | Email  | Password | 
|--|--|--|
| Patrick Hoban | PatrickHoban@gmail.com | Qwerty1 |


#### Elite Import Tenant
Use these users to test the Elite Import Tenant Link on Tenants' Sign Up
| Namme | EntityID  | DisguisedTaxID | Date Of Birth |
|--|--|--|--|
| Patrick Hoban | 197095642 | XXX-XX-9708 | 2020-12-01 |


# Application Details
Housing Choice Connect's folders are Sign In, Sign Up, Tenants, Landlords, and Admins.
1. [Sign In and Sign Up](#sign-in-and-sign-up)
2. [Tenants](#tenants)
3. [Landlords](#landlords)
4. [Admins](#admins)

## Sign In and Sign Up

### Landlord
![housing-choice-connect-landlord-sign-up](https://github.com/user-attachments/assets/cc706197-4650-4d03-9487-c0763e078aa9)


### Tenant
![housing-choice-connect-tenant-sign-up](https://github.com/user-attachments/assets/fe6199ad-56d5-45ec-bcee-c77a012102c0)


> User and Role Maanagment Module
1. Tables: User, Role, User Role, Security Question, User Security Question

## Tenants
>Tenant Module

![housing-choice-connect-tenant-search-properties](https://github.com/user-attachments/assets/0bfb6839-a0e3-44a9-a7a3-0f83813fd16f)

1. Update Profile Information
2. Search and View Landlord Properties
3. Update Security Question Answers

## Landlords
> Landlord Module

![housing-choice-connect-landlord-property](https://github.com/user-attachments/assets/1fa94e5b-549b-4431-8165-d30be386b4d1)

1. Update Profile Information
2. Create, Update, and Delete Properties
3. Properties: Active, Inactive, Soon To Be Deleted

## Admins
> Admin Module
1. Create, Update, and Delete Properties


# Database Composition
## Schemas
> Schemas are a list of logical structures of data.
1. Landlord
2. Security

## Association Tables
> Association tables are used for many-to-many relationships between two objects.
Association tables can handle both one-to-one, one-to-many and many-to-many relationships.
1. Landlord.PropertyAddress
2. Landlord.PropertyAmentity
3. Landlord.PropertyHandicapAccessibility
4. Security.UserActivityLog
5. Security.UserRole
6. Security.UserSecurityQuestion

## Reference  Tables
> Reference Tables share identical fields/column data in another table.
1. ActivityType
2. Amentity
3. Location
4. Neighborhood
5. Property
6. Role
7. SecurityQuestion
8. Unit

## Permanent Tables
> Permanent Tables have their own table structure, columns, data types, constraints and indexes.
1. Security.EliteTenantImport
2. Security.User
3. Landlord.Property