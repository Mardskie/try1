CREATE DATABASE intramurals_system;
USE intramurals_system;

CREATE TABLE registration (
    Username VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(50),
    ConfirmPassword VARCHAR(50),
    user_type ENUM('athlete', 'coach', 'dean', 'tournamentmanager', 'department') NOT NULL DEFAULT 'athlete'
);

CREATE TABLE department (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(50)
);

CREATE TABLE tournamentmanager (
    Username VARCHAR(50) PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Mobile VARCHAR(15),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES department(DeptID)
);

CREATE TABLE event (
    EventID INT PRIMARY KEY AUTO_INCREMENT,
    Category VARCHAR(50),
    EventName VARCHAR(100),
    NoOfParticipant INT,
    TournamentManager VARCHAR(50),
    FOREIGN KEY (TournamentManager) REFERENCES tournamentmanager(Username)
);

CREATE TABLE coach (
    Username VARCHAR(50) PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Mobile VARCHAR(15),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES department(DeptID)
);

CREATE TABLE dean (
    Username VARCHAR(50) PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Mobile VARCHAR(15),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES department(DeptID)
);

CREATE TABLE athletes (
    Username VARCHAR(50),
    EventID INT,
    DeptID INT,
    Lastname VARCHAR(50),
    Firstname VARCHAR(50),
    MiddleInitial VARCHAR(1),
    Course VARCHAR(50),
    Year INT,
    Civilstatus VARCHAR(20),
    Gender VARCHAR(10),
    Birthdate DATE,
    Contactno VARCHAR(15),
    Address VARCHAR(100),
    CoachID VARCHAR(50),
    DeanID VARCHAR(50),
    PRIMARY KEY (Username, EventID),
    FOREIGN KEY (Username) REFERENCES registration(Username),
    FOREIGN KEY (EventID) REFERENCES event(EventID),
    FOREIGN KEY (DeptID) REFERENCES department(DeptID),
    FOREIGN KEY (CoachID) REFERENCES coach(Username),
    FOREIGN KEY (DeanID) REFERENCES dean(Username)
);
