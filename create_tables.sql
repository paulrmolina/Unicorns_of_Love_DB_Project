--Creates Firm Table
CREATE TABLE Firm
(
   	firmFedID CHAR(9) PRIMARY KEY,
   	firmName VARCHAR(50),
   	firmAddress VARCHAR(50),
)
 
--Creates Employee Table
CREATE TABLE Employee
(
   	empNumber CHAR(8) PRIMARY KEY,
   	firstName VARCHAR(25),
   	lastName VARCHAR(25),
   	ssn CHAR(9),
   	address VARCHAR(50),
   	state VARCHAR(2),
   	zip VARCHAR(5),
   	job VARCHAR(50),
   	CONSTRAINT chk_EmployeeJob CHECK(job IN('Cast Member', 'Engineer', 'Inspector', 'Project Manager'))
)
 
--Creates ProjectType Table
CREATE TABLE ProjectType
(
   	projectTypeCode CHAR(5) PRIMARY KEY,
   	projectTypeDesc VARCHAR(50)
)
 
--Creates ActivityType Table
CREATE TABLE ActivityType
(
   	activityTypeCode CHAR(4) PRIMARY KEY,
   	activityTypeDesc VARCHAR(50),
   	CONSTRAINT chk_ActivityTypeCode CHECK
   	(activityTypeCode IN ('DE', 'CO', 'WA')),
   	CONSTRAINT chk_ActivityTypeDesc CHECK
   	(activityTypeDesc IN ('DESIGN', 'CONSTRUCTION', 'WARRANTY'))
)
 
--Create Project Table
CREATE TABLE Project
(
   	projectID CHAR(4) PRIMARY KEY,
   	projectName VARCHAR(50),
   	projectTypeCode CHAR(5),
   	firmFedID CHAR(9) NOT NULL,
   	fundedBudget DECIMAL(16,2),
   	startDate DATE,
   	status VARCHAR(25),
   	projectedEndDate DATE,
   	projectManager CHAR(8),
   	FOREIGN KEY (projectTypeCode) REFERENCES ProjectType(projectTypeCode),
   	FOREIGN KEY (firmFedID) REFERENCES Firm(firmFedID),
   	FOREIGN KEY (projectManager) REFERENCES Employee(empNumber),
   	CONSTRAINT chk_ProjectStatus CHECK(status IN('Active', 'Inactive', 'Cancelled', 'On-Hold'))
)
 
--Creates Activity Table
CREATE TABLE Activity
(
   	activityID CHAR(4) PRIMARY KEY,
   	activityName VARCHAR(50),
   	projectID CHAR(4),
   	costToDate DECIMAL(16,2),
   	status VARCHAR(25),
   	activityTypeCode CHAR(4),
   	startDate DATE,
   	endDate DATE,
   	FOREIGN KEY(projectID) REFERENCES Project(projectID),
   	FOREIGN KEY(activityTypeCode) REFERENCES ActivityType(activityTypeCode),
   	CONSTRAINT chk_ActivityStatus CHECK(status IN('Active', 'Inactive', 'Cancelled', 'On-Hold'))
)

--Creates Project Audit Table
CREATE TABLE ProjectAudit
(
	projectID CHAR(4) NOT NULL,
	projectName VARCHAR(50),
	projectTypeCode CHAR(5),
	firmFedID CHAR(9),
	startDate DATE,
	status VARCHAR(25),
	projectedEndDate DATE,
	projectManager CHAR(8),
	fundedBudget DECIMAL(16,2),
	operation VARCHAR(50),
	dateTimeCreated smalldatetime,
	userName varchar(50)
)

--Creates Activity Audit Table
CREATE TABLE ActivityAudit
(
	activityID CHAR(4) NOT NULL,
	activityName VARCHAR(50),
	projectID CHAR(4),
	costToDate DECIMAL(16,2),
	status VARCHAR(25),
	activityTypeCode CHAR(4),
	startDate DATE,
	endDate DATE,
	operation VARCHAR(50),
	dateTimeCreated smalldatetime,
	userName varchar(50)
)

--Creates Employee Audit
CREATE TABLE EmployeeAudit
(
	empNumber CHAR(8) NOT NULL,
	firstName VARCHAR(25),
	lastName VARCHAR(25),
	ssn CHAR(9),
	address VARCHAR(50),
	state VARCHAR(2),
	zip VARCHAR(5),
	job VARCHAR(50),
	operation VARCHAR(50),
	dateTimeCreated smalldatetime,
	userName varchar(50)
)
