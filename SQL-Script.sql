CREATE DATABASE CallCenterDB;
USE CallCenterDB;

CREATE TABLE Calls (
    CallId VARCHAR(10) PRIMARY KEY,
    Agent VARCHAR(50),
    Date DATE,
    Time TIME,
    Topic VARCHAR(255),
    Answered VARCHAR(1),
    Resolved VARCHAR(1),
    SpeedOfAnswer INT,
    AvgTalkDuration TIME,
    SatisfactionRating INT
);

Select * from calls;

-- 1# Total Calls Taken by Each Agent

SELECT Agent, COUNT(*) AS TotalCalls
FROM calls
GROUP BY Agent;

-- 2# Total Number of Calls Per Day

SELECT Date, COUNT(*) AS TotalCalls
FROM calls
GROUP BY Date
ORDER BY Date;

-- 3# Topic and Their Count

SELECT Topic, COUNT(*) AS TopicCount
FROM calls
GROUP BY Topic
ORDER BY TopicCount DESC;

-- 4#  Total Average Talk Time by Agent

SELECT Agent, 
       DATE_FORMAT(SEC_TO_TIME(AVG(AvgTalkDuration) * 60), '%H:%i:%s') AS AvgTalkDuration
FROM calls
GROUP BY Agent
ORDER BY Agent;

-- 5# Resolved Count Yes and No Per Agent

SELECT 
    Agent, 
    SUM(CASE WHEN Resolved = 'Y' THEN 1 ELSE 0 END) AS ResolvedCount,
    SUM(CASE WHEN Resolved = 'N' THEN 1 ELSE 0 END) AS NotResolvedCount
FROM calls
GROUP BY Agent
ORDER BY Agent;

-- 6# Resolved Count Yes and No Per Topic

SELECT 
    Topic, 
    SUM(CASE WHEN Resolved = 'Y' THEN 1 ELSE 0 END) AS ResolvedCount,
    SUM(CASE WHEN Resolved = 'N' THEN 1 ELSE 0 END) AS NotResolvedCount
FROM calls
GROUP BY Topic
ORDER BY Topic;

-- 7# Average Satisfaction Rating per Agent

SELECT Agent, ROUND(AVG(`SatisfactionRating`), 2) AS AvgRating
FROM calls
GROUP BY Agent
ORDER BY AvgRating DESC;

-- 8# Average Satisfaction Rating per Topic

SELECT Topic, ROUND(AVG(`SatisfactionRating`), 2) AS AvgRating
FROM calls
GROUP BY Topic
ORDER BY AvgRating DESC;

-- 9# Average Speed of Answer per Agent

SELECT Agent, 
       AVG(`SpeedOfAnswer`) AS AvgSpeedOfAnswer
FROM calls
GROUP BY Agent
ORDER BY AvgSpeedOfAnswer

-- 10# Number of calls per hour

SELECT HOUR(Time) AS Hour, 
    COUNT(*) AS TotalCalls
FROM calls
GROUP BY HOUR(Time)
ORDER BY Hour;






