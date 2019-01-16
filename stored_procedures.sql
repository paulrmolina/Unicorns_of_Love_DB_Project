
GO
-- ACTIVITY
CREATE PROCEDURE U_DIS_AddActivity
(
@activityID CHAR (4),
@activityName VARCHAR (50),
@projectID CHAR (4),
@costToDate DECIMAL (10,2),
@status VARCHAR(25),
@activityTypeCode CHAR (4),
@activityTypeDesc VARCHAR (50),
@startDate DATE,
@endDate DATE
)
AS BEGIN
  	IF NOT EXISTS (SELECT 1 FROM Project WHERE projectID = @projectID)
  	BEGIN
  	PRINT 'PROJECT DOES NOT EXIST PLEASE ENTER VALID PROJECT'
  	RETURN
  	END
  	IF EXISTS (SELECT 1 FROM ActivityType WHERE activityTypeCode = @activityTypeCode)
  	BEGIN
  	PRINT 'Updating activity type'
  	UPDATE ActivityType
  	SET
  	activityTypeDesc = @activityTypeDes
  	WHERE activityTypeCode = @activityTypeCode
  	END
  	
  	IF NOT EXISTS (SELECT 1 FROM ActivityType WHERE activityTypeCode = @activityTypeCode)
  	BEGIN
  	PRINT 'Adding activity type'
  	INSERT INTO ActivityType
  	(activityTypeCode, activityTypeDesc)
  	VALUES
  	(@activityTypeCode, @activityTypeDesc)
  	END
PRINT 'Adding activity'
INSERT INTO Activity
(activityID, activityName, projectID,  activityTypeCode,  costToDate, status, startDate, endDate)
VALUES
(@activityID, @activityName, @projectID,  @activityTypeCode,  @costToDate, @status, @startDate, @endDate)
END
GO
CREATE PROCEDURE U_DIS_DeleteActivity
(
@activityID CHAR (4)
)
AS BEGIN
PRINT 'Delecting activity'
DELETE FROM Activity WHERE activityID = @activityID
END
GO
CREATE PROCEDURE U_DIS_UpdateActivity
(
@activityID CHAR (4),
@activityName VARCHAR (50),
@projectID CHAR (4),
@costToDate DECIMAL (10,2),
@status VARCHAR(25),
@activityTypeCode CHAR (4),
@activityTypeDesc VARCHAR (50),
@startDate DATE,
@endDate DATE
)
AS BEGIN
PRINT 'Updating activity'
UPDATE Activity
SET
projectId = @projectID,
activityTypeCode = @activityTypeCode,
activityName = @activityName,
costToDate = @costToDate,
status = @status,
startDate = @startDate,
endDate = @endDate
WHERE activityID = @activityID
PRINT 'Updating activity type'
UPDATE ActivityType
SET
activityTypeDesc = @activityTypeDesc
WHERE activityTypeCode = @activityTypeCode
END
GO
-- Employee
CREATE PROCEDURE U_DIS_AddEmployee
(
@empNumber CHAR (8),
@firstName VARCHAR (25),
@lastName VARCHAR (25),
@ssn CHAR (9),
@address VARCHAR (25),
@state CHAR (2),
@zip CHAR (5),
@job VARCHAR (50)
)
AS BEGIN
PRINT 'Adding Employee'
INSERT INTO Employee
(
empNumber, firstName, lastName, ssn, address, state, zip, job
)
VALUES
(
@empNumber, @firstName, @lastName, @ssn, @address, @state, @zip, @job
)
END
GO
CREATE PROCEDURE U_DIS_DeleteEmployee
(
@empNumber CHAR (8)
)
AS BEGIN
PRINT 'Deleting employee'
UPDATE Project
SET
projectManager = null
WHERE projectManager = @empNumber
DELETE FROM Employee WHERE empNumber = @empNumber
END	
GO
CREATE PROCEDURE U_DIS_UpdateEmployee
(
@empNumber CHAR (8),
@firstName VARCHAR (25),
@lastName VARCHAR (25),
@ssn CHAR (9),
@address VARCHAR (25),
@state CHAR (2),
@zip CHAR (5),
@job VARCHAR (50)
)
AS BEGIN
PRINT 'Updating employee'
UPDATE Employee
SET
empNumber = @empNumber,
firstName = @firstName,
lastName = @lastName,
ssn = @ssn,
address = @address,
state = @state,
zip = @zip,
job = @job
WHERE empNumber = @empNumber
END
