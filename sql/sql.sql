CREATE DATABASE db_ScheduleProject;
USE db_ScheduleProject;

CREATE TABLE Schedules 
(
	scheduleId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    clientName VARCHAR(35) NOT NULL,
    scheduleDate DATE NOT NULL,
    scheduleTime TIME NOT NULL,
    massagePrice INT NOT NULL
);

DROP TABLE Schedules;
SELECT * FROM Schedules;