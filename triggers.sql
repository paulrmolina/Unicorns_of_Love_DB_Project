CREATE TABLE ProjectAudit
(
    projectID CHAR(4) PRIMARY KEY,
    projectTypeCode CHAR(5),
    firmFedID CHAR(9) NOT NULL,
    projectName VARCHAR(50),
    startDate DATE,
    status VARCHAR(25),
    projectedEndDate DATE,
    projectManager CHAR(8),
        fundedBudget DECIMAL(16,2),
        operation VARCHAR(50),
        dateTimeCreated SMALLDATETIME,
        userName VARCHAR(50)
)
GO


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
        dateTimeCreated SMALLDATETIME,
        userName VARCHAR(50)
)
GO


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
        dateTimeCreated SMALLDATETIME,
        userName VARCHAR(50)
)
GO
CREATE TRIGGER Trg_ProjectAudit
ON Project
AFTER INSERT, DELETE
AS
BEGIN
         IF EXISTS(SELECT 1 FROM inserted)
         BEGIN
                 INSERT INTO ProjectAudit
                 (projectID, projectTypeCode,firmFedID,projectName ,startDate ,
                 status,projectedEndDate,projectManager,fundedBudget,operation,datetimecreated,username )
                 SELECT projectID, projectTypeCode,firmFedID,projectName,startDate,status,
                 projectedEndDate,projectManager,fundedBudget,'INSERT', getdate(),System_user
                 FROM Inserted
         END
 
         if exists(select 1 from deleted)
         begin
                INSERT INTO ProjectAudit
                 (projectID, projectTypeCode,firmFedID,projectName ,startDate ,
                 status,projectedEndDate,projectManager,operation,datetimecreated,username )
                 SELECT projectID, projectTypeCode,firmFedID,projectName,startDate,status,
                 projectedEndDate,projectManager,'DELETE', getdate(),System_user
                 FROM deleted
         END
END
GO
 
CREATE TRIGGER Trg_ActivityAudit
ON Activity
AFTER INSERT, DELETE
AS
BEGIN
         IF EXISTS(select 1 from inserted)
         BEGIN
                 INSERT INTO ActivityAudit
                 (activityID,activityName,projectID,costToDate,status,
                 activityTypeCode,startDate,endDate,operation,datetimecreated,username )
                 SELECT activityID,activityName,projectID,costToDate,status,activityTypeCode,
                 startDate,endDate,'INSERT', getdate(),System_user
                 FROM Inserted
         END
 
         IF EXISTS(select 1 from deleted)
         BEGIN
                INSERT INTO ActivityAudit
                 (activityID,activityName,projectID,costToDate,status,
                 activityTypeCode,startDate,endDate,operation,datetimecreated,username )
                 SELECT activityID,activityName,projectID,costToDate,status,activityTypeCode,
                 startDate,endDate,'DELETE', getdate(),System_user
                 FROM deleted
         END
END
GO
 
CREATE TRIGGER Trg_EmployeeAudit
ON Employee
AFTER INSERT, DELETE
AS
BEGIN
         IF EXISTS(select 1 from inserted)
         BEGIN
                 INSERT INTO EmployeeAudit
                 (empNumber,firstName,lastName,ssn,address,
                 state,zip,job,operation,datetimecreated,username )
                 SELECT empNumber,firstName,lastName,ssn,address,
                 state,zip,job,'INSERT', getdate(),System_user
                 FROM Inserted
         END
 
         IF EXISTS(select 1 from deleted)
         BEGIN
                INSERT INTO EmployeeAudit
                 (empNumber,firstName,lastName,ssn,address,
                 state,zip,job,operation,datetimecreated,username )
                 SELECT empNumber,firstName,lastName,ssn,address,
                 state,zip,job,'INSERT', getdate(),System_user
                 FROM deleted
         END
END
GO
