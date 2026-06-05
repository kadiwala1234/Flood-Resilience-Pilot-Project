-- 1. Create Database

CREATE DATABASE FloodResilienceDB;
GO

USE FloodResilienceDB;
GO

CREATE TABLE FloodEvents (
    Event_ID INT PRIMARY KEY,
    [Date] DATE,
    Rainfall_mm INT,
    Flood_Depth_cm INT,
    Road_Closure_Hours INT,
    Repair_Cost_USD INT
);
GO

INSERT INTO FloodEvents
    (Event_ID, [Date], Rainfall_mm, Flood_Depth_cm, Road_Closure_Hours, Repair_Cost_USD)
VALUES
    (1001, '2023-04-12', 68, 22, 8, 12000),
    (1002, '2023-05-18', 94, 35, 14, 18000),
    (1003, '2023-07-06', 112, 46, 20, 25000),
    (1004, '2023-09-14', 75, 28, 10, 15000),
    (1005, '2024-03-20', 83, 31, 12, 17000),
    (1006, '2024-05-25', 120, 52, 24, 32000),
    (1007, '2024-08-08', 135, 60, 30, 42000),
    (1008, '2024-10-10', 90, 37, 15, 21000),
    (1009, '2025-04-22', 65, 20, 5, 8000),
    (1010, '2025-06-30', 78, 25, 7, 9500);
GO

SELECT * FROM FloodEvents;

SELECT COUNT(*) AS Total_Records FROM FloodEvents;

CREATE TABLE InfrastructureAssets (
    Asset_ID VARCHAR(10) PRIMARY KEY,
    Asset_Type VARCHAR(50),
    Location VARCHAR(20),
    Condition_Rating VARCHAR(20),
    Flood_Risk VARCHAR(20)
);
GO

INSERT INTO InfrastructureAssets
    (Asset_ID, Asset_Type, Location, Condition_Rating, Flood_Risk)
VALUES
    ('A101', 'Road Segment', 'Zone 1', 'Poor', 'High'),
    ('A102', 'Road Segment', 'Zone 2', 'Fair', 'Medium'),
    ('A103', 'Culvert', 'Zone 1', 'Poor', 'High'),
    ('A104', 'Bridge', 'Zone 3', 'Good', 'Medium'),
    ('A105', 'Drainage Channel', 'Zone 2', 'Very Poor', 'High'),
    ('A106', 'Retention Pond', 'Zone 4', 'Excellent', 'Low');
GO

SELECT * FROM InfrastructureAssets;

CREATE TABLE Climate_Observations (
    Month VARCHAR(20),
    Avg_Rainfall_mm DECIMAL(10,2),
    Max_1Day_Rainfall DECIMAL(10,2)
);

INSERT INTO Climate_Observations
(Month, Avg_Rainfall_mm, Max_1Day_Rainfall)
VALUES
('Jan',25,12),
('Feb',32,18),
('Mar',45,24),
('Apr',62,34),
('May',74,46),
('Jun',96,58),
('Jul',88,55),
('Aug',102,63),
('Sep',81,49),
('Oct',59,35),
('Nov',42,21),
('Dec',30,15);

SELECT * FROM Climate_Observations;
SELECT AVG(Avg_Rainfall_mm) AS Annual_Average
FROM Climate_Observations;

CREATE TABLE Adaptation_Projects (
    Project_ID VARCHAR(20) PRIMARY KEY,
    Intervention VARCHAR(100),
    Cost_USD DECIMAL(15,2),
    Completion_Percent DECIMAL(5,2),
    Status VARCHAR(50)
);

INSERT INTO Adaptation_Projects
(Project_ID, Intervention, Cost_USD, Completion_Percent, Status)
VALUES
('P001','Culvert Upgrade',150000,100,'Complete'),
('P002','Road Elevation',280000,85,'Ongoing'),
('P003','Bioswale Construction',95000,100,'Complete'),
('P004','Retention Pond',220000,75,'Ongoing'),
('P005','Drainage Expansion',180000,100,'Complete');

SELECT * FROM Adaptation_Projects;

SELECT
SUM(Cost_USD) AS Total_Investment
FROM Adaptation_Projects;

CREATE TABLE Resilience_KPI (
    Year VARCHAR(20),
    Closure_Days INT,
    Repair_Cost_USD DECIMAL(15,2),
    Drainage_Functionality DECIMAL(5,2),
    Access_Reliability DECIMAL(5,2)
);

INSERT INTO Resilience_KPI
(Year, Closure_Days, Repair_Cost_USD,
Drainage_Functionality, Access_Reliability)
VALUES
('Baseline',18,350000,0.68,0.82),
('Year 1',14,280000,0.76,0.88),
('Year 2',9,190000,0.86,0.94),
('Year 3',4,120000,0.97,0.99);

SELECT * FROM Resilience_KPI;

SELECT
MAX(Access_Reliability) AS Best_Access_Reliability
FROM Resilience_KPI;

CREATE TABLE Sensor_Data (
    Sensor_ID VARCHAR(20),
    Date DATE,
    Water_Level_cm DECIMAL(10,2),
    Flow_Rate_m3s DECIMAL(10,2),
    Status VARCHAR(20)
);

INSERT INTO Sensor_Data
(Sensor_ID, Date, Water_Level_cm, Flow_Rate_m3s, Status)
VALUES
('S001','2025-01-01',45,4.5,'Normal'),
('S002','2025-01-01',70,8.2,'Alert'),
('S003','2025-01-01',95,12.8,'Critical'),
('S004','2025-01-02',38,3.2,'Normal'),
('S005','2025-01-02',60,7.1,'Alert');

SELECT * FROM Sensor_Data;

SELECT *
FROM Sensor_Data
WHERE Status='Critical';

CREATE TABLE NbS_Projects (
    NbS_ID VARCHAR(20) PRIMARY KEY,
    Type VARCHAR(100),
    Area_ha DECIMAL(10,2),
    Storage_m3 DECIMAL(15,2),
    Completion DECIMAL(5,2)
);

INSERT INTO NbS_Projects
(NbS_ID, Type, Area_ha, Storage_m3, Completion)
VALUES
('N001','Wetland Restoration',12,25000,100),
('N002','Bioswale',5,4500,100),
('N003','Riparian Buffer',8,1200,90),
('N004','Retention Pond',3,15000,75);

SELECT * FROM NbS_Projects;

SELECT
SUM(Storage_m3) AS Total_Storage
FROM NbS_Projects;

CREATE TABLE VARUs_Indicators (
    Indicator VARCHAR(100),
    Baseline DECIMAL(15,2),
    CurrentValue DECIMAL(15,2),
    Improvement DECIMAL(10,2)
);

INSERT INTO VARUs_Indicators
(Indicator, Baseline, CurrentValue, Improvement)
VALUES
('Closure Days',18,4,0.78),
('Repair Cost',350000,120000,0.66),
('Exposed Population',12000,6500,0.46),
('Drainage Functionality',0.68,0.97,0.43);

SELECT * FROM VARUs_Indicators;

SELECT
AVG(Improvement) AS Average_Improvement
FROM VARUs_Indicators;

CREATE TABLE Community_Impact (
    Year INT,
    Population_Affected INT,
    School_Closures INT,
    Emergency_Disruptions INT
);

INSERT INTO Community_Impact
(Year, Population_Affected, School_Closures, Emergency_Disruptions)
VALUES
(2023,12000,15,9),
(2024,10200,11,6),
(2025,6900,5,3);

SELECT * FROM Community_Impact;

SELECT
MIN(Population_Affected) AS Lowest_Affected_Population
FROM Community_Impact;

-- Complete Database Validation Script

SELECT 'Flood_Events', COUNT(*) FROM FloodEvents
UNION ALL
SELECT 'Infrastructure_Assets', COUNT(*) FROM InfrastructureAssets
UNION ALL
SELECT 'Climate_Observations', COUNT(*) FROM Climate_Observations
UNION ALL
SELECT 'Adaptation_Projects', COUNT(*) FROM Adaptation_Projects
UNION ALL
SELECT 'Resilience_KPI', COUNT(*) FROM Resilience_KPI
UNION ALL
SELECT 'Sensor_Data', COUNT(*) FROM Sensor_Data
UNION ALL
SELECT 'NbS_Projects', COUNT(*) FROM NbS_Projects
UNION ALL
SELECT 'VARUs_Indicators', COUNT(*) FROM VARUs_Indicators
UNION ALL
SELECT 'Community_Impact', COUNT(*) FROM Community_Impact;

-- 2. Flood Event Analysis 

-- Total Flood Damage Cost

SELECT
    SUM(Repair_Cost_USD) AS Total_Repair_Cost
FROM FloodEvents;

-- Average Flood Depth

SELECT
    AVG(Flood_Depth_cm) AS Avg_Flood_Depth
FROM FloodEvents;

-- Maximum Rainfall Event

SELECT *
FROM FloodEvents
WHERE Rainfall_mm =
(
    SELECT MAX(Rainfall_mm)
    FROM FloodEvents
);

-- 3. Infrastructure Risk Assessment --

-- High-Risk Assets

SELECT *
FROM InfrastructureAssets
WHERE Flood_Risk = 'High';

-- Poor Condition Assets

SELECT *
FROM InfrastructureAssets
WHERE Condition_Rating IN ('Poor','Very Poor');

-- Asset Count by Risk Level

SELECT
    Flood_Risk,
    COUNT(*) AS Asset_Count
FROM InfrastructureAssets
GROUP BY Flood_Risk;

-- 4. Climate Analysis

-- Wettest Month

SELECT TOP 1 *
FROM Climate_Observations
ORDER BY Avg_Rainfall_mm DESC;

--Average Monthly Rainfall

SELECT
    AVG(Avg_Rainfall_mm) AS Annual_Average_Rainfall
FROM Climate_Observations;

-- 5. Adaptation Project Monitoring --

--Total Adaptation Investment

SELECT
    SUM(Cost_USD) AS Total_Investment
FROM Adaptation_Projects;

--Completed Projects

SELECT *
FROM Adaptation_Projects
WHERE Status = 'Complete';

--Project Completion Rate

SELECT
    AVG(Completion_Percent) AS Average_Completion
FROM Adaptation_Projects;

-- 6. Resilience KPI Tracking --

--Improvement in Closure Days

SELECT
    Year,
    Closure_Days
FROM Resilience_KPI;

--KPI Dashboard Query

SELECT
    Year,
    Closure_Days,
    Repair_Cost_USD,
    Drainage_Functionality,
    Access_Reliability
FROM Resilience_KPI;

--Percentage Reduction in Repair Cost

SELECT
(
    (350000 - 120000) * 100.0 / 350000
) AS Repair_Cost_Reduction_Percent;

--7. Sensor Monitoring System

--Critical Water Levels

SELECT *
FROM Sensor_Data
WHERE Status = 'Critical';

--Average Water Level

SELECT
    AVG(Water_Level_cm) AS Avg_Water_Level
FROM Sensor_Data;

--Real-Time Alert Query

SELECT *
FROM Sensor_Data
WHERE Water_Level_cm > 80;

-- 8. Nature-Based Solutions Analysis --

--Total Water Storage Capacity

SELECT
    SUM(Storage_m3) AS Total_Storage_Capacity
FROM NbS_Projects;

--Completed NbS Projects

SELECT *
FROM NbS_Projects
WHERE Completion = 100;

--Average Storage by NbS Type

SELECT
    Type,
    AVG(Storage_m3) AS Avg_Storage
FROM NbS_Projects
GROUP BY Type;

-- 9. VARUs Performance Assessment --

--VARUs Improvement Ranking

SELECT *
FROM VARUs_Indicators
ORDER BY Improvement DESC;

--Average Improvement

SELECT
    AVG(Improvement) AS Average_Improvement
FROM VARUs_Indicators;

-- 10. Community Resilience Impact--

--Population Reduction Analysis

SELECT
    Year,
    Population_Affected
FROM Community_Impact;

--Total Reduction in Population Affected

SELECT
(
    (12000 - 6900) * 100.0 / 12000
) AS Reduction_Percentage;

--Community Impact Dashboard Query

SELECT
    Year,
    Population_Affected,
    School_Closures,
    Emergency_Disruptions
FROM Community_Impact;

-- 11. Power BI Dashboard SQL View --

--Create a view for dashboard reporting:

CREATE VIEW vw_Flood_Resilience_Dashboard AS
SELECT
    r.Year,
    r.Closure_Days,
    r.Repair_Cost_USD,
    r.Drainage_Functionality,
    r.Access_Reliability,
    c.Population_Affected,
    c.School_Closures,
    c.Emergency_Disruptions
FROM Resilience_KPI r
INNER JOIN Community_Impact c
ON CAST(REPLACE(r.Year,'Year ','20') AS INT) = c.Year;

-- 12. Executive Summary Query --

SELECT
    (SELECT SUM(Repair_Cost_USD) FROM FloodEvents) AS Total_Flood_Damage,
    (SELECT SUM(Cost_USD) FROM Adaptation_Projects) AS Adaptation_Investment,
    (SELECT AVG(Improvement) FROM VARUs_Indicators) AS Avg_VARUs_Improvement,
    (SELECT SUM(Storage_m3) FROM NbS_Projects) AS NbS_Storage_Capacity,
    (SELECT AVG(Access_Reliability) FROM Resilience_KPI) AS Avg_Access_Reliability;