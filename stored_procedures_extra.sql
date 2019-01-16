-- SQL SP TEST
--Adding a project
exec U_DIS_AddProject @projectId = 4444,
@projectName = 'Happy Land',
@firmFedID = '4444',
@firmName = 'Money Inc',
@firmAddress = '33 NW 123 PL Country Land FL 33313',
@fundedBudget = 12354.2,
@StartDate = '12-12-1932',
@Status = 'Active',
@projectTypeCode = 'FAC',
@projectTypeDesc = 'Facility',
@projectedEndDate = '12-12-1933',
@ProjectManager = null
SELECT * FROM Project
--Adding an activity if projectid doesnt exist
exec U_DIS_AddActivity
@activityID = 1,
@activityName = 'test',
@projectID = 305 ,
@costToDate = 1231.23,
@status = 'Active',
@activityTypeCode = 'DE',
@activityTypeDesc = 'DESIGN',
@startDate = '12-12-1232',
@endDate = '12-12-1233'
--Adding an activity if project does exist
exec U_DIS_AddActivity
@activityID = 349,
@activityName = 'test',
@projectID = 4444 ,
@costToDate = 123123,
@status = 'Active',
@activityTypeCode = 'DE',
@activityTypeDesc = 'DESIGN',
@startDate = '12-12-1232',
@endDate = '12-12-1233'
SELECT * FROM Activity
-- Creating employee
exec U_DIS_AddEmployee
@empNumber = 1337,
@firstName = 'Paul',
@lastName = 'Not-In-This-Class',
@ssn = '123-321-123',
@address = 'Under the sea',
@state = 'fl',
@zip = '33323',
@job = 'Engineer'
SELECT * FROM Employee
--Updating a project with manager that doesnt exist
exec U_DIS_UpdateProject @projectId = 4444,
@projectName = 'Looking good',
@firmFedID = '4444',
@firmName = 'Money Bags',
@firmAddress = 'Somewhere over the rainbow',
@fundedBudget = 12354.2,
@StartDate = '12-12-1666',
@Status = 'Active',
@projectTypeCode = 'FOOD',
@projectTypeDesc = 'Good Burger',
@projectedEndDate = '12-12-2012',
@ProjectManager = 5445
--Updating a project with manager that does exist
exec U_DIS_UpdateProject @projectId = 4444,
@projectName = 'Looking good',
@firmFedID = '4444',
@firmName = 'Money Bags',
@firmAddress = 'Somewhere over the rainbow',
@fundedBudget = 12354.2,
@StartDate = '12-12-1666',
@Status = 'Active',
@projectTypeCode = 'FOOD',
@projectTypeDesc = 'Good Burger',
@projectedEndDate = '12-12-2012',
@ProjectManager = 1337
SELECT * FROM Project
--Updating activity
exec U_DIS_UpdateActivity
@activityID = 349,
@activityName = 'Merp City',
@projectID = 4444 ,
@costToDate = 321321,
@status = 'Active',
@activityTypeCode = 'DE',
@activityTypeDesc = 'CONSTRUCTION',
@startDate = '4-9-2222',
@endDate = '12-12-2431'
SELECT * FROM Activity
--Update employee
exec U_DIS_UpdateEmployee
@empNumber = 1337,
@firstName = 'TEST',
@lastName = 'TEST',
@ssn = '123-321-123',
@address = 'somewhere',
@state = 'fl',
@zip = '33323',
@job = 'Engineer'
SELECT * FROM Employee
