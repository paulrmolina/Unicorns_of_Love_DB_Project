VALUES ('4','Jamie','Almazan','261572144','4609 Trails End Road
Boca Raton','FL','33486','Project Manager');


INSERT INTO Employee (empNumber, firstName, lastName, ssn,address,state,zip,job)
VALUES ('5','Jenifer','Haskell','261572144','1100 Lighthouse Drive
Branson','MO','65616','Cast Member');

INSERT INTO Employee (empNumber, firstName, lastName, ssn,address,state,zip,job)
VALUES ('6','Thomas','Ross','473169635','3499 Jewell Road
Minneapolis','MN','55406','Engineer');


INSERT INTO Employee (empNumber, firstName, lastName, ssn,address,state,zip,job)
VALUES ('7','Pedro','King','259362145','359 Despard Street
Atlanta','GA','30318','Inspector');

INSERT INTO Employee (empNumber, firstName, lastName, ssn,address,state,zip,job)
VALUES ('8','Gabriel','Morgan','259362145','2015 Forest Drive
Chantilly','VA','22021','Project Manager');

INSERT INTO Employee (empNumber, firstName, lastName, ssn,address,state,zip,job)
VALUES ('9','Charline','Miner','081382314','1945 Henry Ford Avenue
New York','NY','10007','Cast Member');


INSERT INTO Employee (empNumber, firstName, lastName, ssn,address,state,zip,job)
VALUES ('10','Michael','Stewart','081382314','4435 Dancing Dove Lane
Garden City','NY','11530','Engineer');


INSERT INTO Employee (empNumber, firstName, lastName, ssn,address,state,zip,job)
VALUES ('11','Derrick','Lay','772342348','2067 County Line Road
Tampa','FL','33602','Project Manager');


INSERT INTO Employee (empNumber, firstName, lastName, ssn,address,state,zip,job)
VALUES ('12','Mary','Clark','120785631','394 Stanley Avenue
Garden City','NY','11530','Project Manager');

INSERT INTO Employee (empNumber, firstName, lastName, ssn,address,state,zip,job)
VALUES ('13','Susan','Howard','360168563','9 Cherry Camp Road
Chicago','IL','60643','Engineer');

INSERT INTO Employee (empNumber, firstName, lastName, ssn,address,state,zip,job)
VALUES ('14','Ernest','Parker','360168563','2695 Windy Ridge Road
Fort Wayne','IN','46804','Project Manager');


--Data ProjectType :

INSERT INTO ProjectType (projectTypeCode, projectTypeDesc)
VALUES ('FAC','Facility');

INSERT INTO ProjectType (projectTypeCode, projectTypeDesc)
VALUES ('RIDE','Ride');

INSERT INTO ProjectType (projectTypeCode, projectTypeDesc)
VALUES ('FOOD','Restaurant');

--Data Activity Type :

INSERT INTO ActivityType (activityTypeCode, activityTypeDesc)
VALUES ('DE','Design');

INSERT INTO ActivityType (activityTypeCode, activityTypeDesc)
VALUES ('CO','Construction');

INSERT INTO ActivityType (activityTypeCode, activityTypeDesc)
VALUES ('WA','Warranty');


--Data Project:

INSERT INTO Project (projectID, projectName, projectTypeCode, firmFedID , fundedBudget, startDate, status, projectedEndDate,projectManager)
VALUES ('1','Timely Pluto','FAC ','1','45845','20160511','Inactive','20160811','4');

INSERT INTO Project (projectID, projectName, projectTypeCode, firmFedID , fundedBudget, startDate, status, projectedEndDate,projectManager)
VALUES ('2','Rich Mars','RIDE','3','65225','20150511','Active','20160311','8');


INSERT INTO Project (projectID, projectName, projectTypeCode, firmFedID , fundedBudget, startDate, status, projectedEndDate,projectManager)
VALUES ('3','Lost Kangaroo','FOOD','4','52365','20150706','Cancelled','20160420','4');


INSERT INTO Project (projectID, projectName, projectTypeCode, firmFedID , fundedBudget, startDate, status, projectedEndDate,projectManager)
VALUES ('4','Ninth Snake','FOOD','6','105542','20150804','On-Hold','20151207','8');

INSERT INTO Project (projectID, projectName, projectTypeCode, firmFedID , fundedBudget, startDate, status, projectedEndDate,projectManager)
VALUES ('5','Cold Zeus','RIDE','7','78524','2015-10-12','Active','2016-04-23','4');

INSERT INTO Project (projectID, projectName, projectTypeCode, firmFedID , fundedBudget, startDate, status, projectedEndDate,projectManager)
VALUES ('6','Black Scorpion','RIDE','8','142554','2015-11-12','On-Hold','2016-06-11','14');


INSERT INTO Project (projectID, projectName, projectTypeCode, firmFedID , fundedBudget, startDate, status, projectedEndDate,projectManager)
VALUES ('7','Steamy Nitrogen','FOOD','5','235445','2015-09-06','Active','2016-05-05','12');

INSERT INTO Project (projectID, projectName, projectTypeCode, firmFedID , fundedBudget, startDate, status, projectedEndDate,projectManager)
VALUES ('8','Rough Haystack','FAC','3','101445','2015-09-23','Active','2016-07-18','12');

INSERT INTO Project (projectID, projectName, projectTypeCode, firmFedID , fundedBudget, startDate, status, projectedEndDate,projectManager)
VALUES ('9','Sticky Hideous Lobster','FOOD','9','86004','2015-07-15','On-Hold','2016-03-16','14');


INSERT INTO Project (projectID, projectName, projectTypeCode, firmFedID , fundedBudget, startDate, status, projectedEndDate,projectManager)
VALUES ('10','Needless Clown','RIDE','2','452225','2015-09-23','Active','2016-12-21','4');


INSERT INTO Project (projectID, projectName, projectTypeCode, firmFedID , fundedBudget, startDate, status, projectedEndDate,projectManager)
VALUES ('11','Cloudy Eagle','FAC','10','786522','2015-05-23','Inactive','2017-06-13','8');


--Data Activity

INSERT INTO Activity (activityID, activityName, projectID, costToDate,status,activityTypeCode,startDate,endDate)
VALUES ('1','Steep Tuba','3','25000','Active','CO','2015-08-04','2015-12-30');

INSERT INTO Activity (activityID, activityName, projectID, costToDate,status,activityTypeCode,startDate,endDate)
VALUES ('2','Gloomy Roadrunner','2','14500','Active','DE','2015-10-15','2016-08-21');

INSERT INTO Activity (activityID, activityName, projectID, costToDate,status,activityTypeCode,startDate,endDate)
VALUES ('3','Wild Dog','7','27000','Inactive','CO','2015-11-05','2016-05-03');

INSERT INTO Activity (activityID, activityName, projectID, costToDate,status,activityTypeCode,startDate,endDate)
VALUES ('4','Tasty Uranium','3','12000','Cancelled','WA','2015-07-25','2016-02-13');


INSERT INTO Activity (activityID, activityName, projectID, costToDate,status,activityTypeCode,startDate,endDate)
VALUES ('5','Dead Parachute','8','18004','Cancelled','WA','2015-07-25','2016-02-13');

INSERT INTO Activity (activityID, activityName, projectID, costToDate,status,activityTypeCode,startDate,endDate)
VALUES ('6','Tidy Compass','6','154000','Active','CO','2015-05-27','2016-08-12');


INSERT INTO Activity (activityID, activityName, projectID, costToDate,status,activityTypeCode,startDate,endDate)
VALUES ('7','Disappointed Spider','4','220000','Active','CO','2015-09-14','2016-07-11');

INSERT INTO Activity (activityID, activityName, projectID, costToDate,status,activityTypeCode,startDate,endDate)
VALUES ('8','White Iron','8','25300','On-Hold','DE','2015-12-04','2016-11-03');

INSERT INTO Activity (activityID, activityName, projectID, costToDate,status,activityTypeCode,startDate,endDate)
VALUES ('9','Random Snake','9','55000','Active','CO','2016-02-04','2016-12-31');

INSERT INTO Activity (activityID, activityName, projectID, costToDate,status,activityTypeCode,startDate,endDate)
VALUES ('10','Sad Steel','5','34564','Active','WA','2015-09-25','2016-07-21');
