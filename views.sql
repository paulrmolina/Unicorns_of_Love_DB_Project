--View has been made to show absolutely all projects available
--A project might not be fully explained yet, therefore it might not have 
---a totally-defined description (though it may have a type). 
--This view allows the view of all projects, as long as they have a project ID assigned to them. FINALIZED
CREATE VIEW vw_Project AS
SELECT projectId, projectName, Project.firmFedID, firmName, firmAddress, fundedbudget, startDate, status, ProjectType.projectTypeCode, projectTypeDesc, projectedEndDate, projectManager
FROM Project
INNER JOIN Firm ON 
Project.firmFedID = Firm.firmFedID
LEFT JOIN ProjectType ON 
Project.ProjectTypeCode = ProjectType.ProjectTypeCode


--Similar principle as the project view, all activities MAY be defined, but a description may not have been defined for them
--Therefore it is possible to see all current activities, though they may not have yet been described. FINALIZED
CREATE VIEW vw_Activity AS
SELECT activityId, activityName, projectId, costToDate, status, Activity.activityTypeCode, activityTypeDesc, startDate, endDate FROM Activity
LEFT JOIN ActivityType
ON Activity.ActivityTypeCode = ActivityType.ActivityTypeCode


--Simple view. Extracts all relevant information from the employee table. FINALIZED
CREATE VIEW vw_Employee AS
SELECT * FROM Employee


--Shows which projects have activities will go beyond the project's projected end date.
--This view is only able to see projects that are currently active (read: have started and
--have yet to finish). NOTE: This view is designed to work only on projects that have activities
--associated with them. FINALIZED
CREATE VIEW vw_LateProjects AS
SELECT * FROM Project
WHERE projectID IN
(SELECT DISTINCT Project.projectID FROM Project
INNER JOIN Activity ON Project.projectID = Activity.projectID
WHERE Activity.endDate > Project.projectedEndDate AND Project.status='Active')


--Shows whichever project has gone over their Firm's funded budget with their activity budget FINALIZED
CREATE VIEW vw_OverBudget AS
SELECT ProjectName, SUM(costToDate) AS SummarizedActivityCost, FundedBudget FROM
(SELECT Project.projectName, Activity.costToDate, Project.fundedBudget FROM Project
INNER JOIN Activity ON Project.ProjectID = Activity.ProjectID
INNER JOIN Firm ON Firm.FirmFedID = Project.FirmFedID
WHERE Project.status='Active')ActivityAndProjectBudget
GROUP BY ProjectName, fundedBudget
HAVING SUM(costToDate) > fundedBudget


--Shows First Name, Last Name and SSN of Employees who have more than 5 projects FINALIZED
CREATE VIEW vw_OverAllocatedPM AS
SELECT firstName, lastName, ssn FROM Employee
WHERE empNumber IN
(
SELECT projectManager FROM Project
GROUP BY projectManager
HAVING COUNT(projectManager) > 5
)


--Shows the projects whose activities have proven costly. Each costly activity is shown alongside the project it belongs to. FINALIZED
CREATE VIEW vw_CostlyActivity AS
SELECT Project.projectID, Project.projectName, Activity.activityName, Activity.costToDate AS ActivityCost FROM Activity
INNER JOIN Project ON Activity.projectID = Project.projectID
WHERE (Activity.status='Cancelled' OR Activity.status='On-Hold') AND Project.status='Active'


--Shows projects which have been completed FINALIZED
CREATE VIEW vw_CompletedProjects AS
SELECT DISTINCT Project.projectID, Project.projectName, Project.projectTypeCode FROM Project
INNER JOIN Activity ON Project.projectID = Activity.projectID
WHERE Activity.activityTypeCode='WA' AND Activity.endDate IS NOT NULL
