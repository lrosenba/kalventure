

--
-- Database: `Kalventure`
--

-- --------------------------------------------------------
-- 



-- quickly deletes all tables in order to start database from scratch

-- 13 tables total 

DROP TABLE IF EXISTS whichMiniGameUserIsPlayingInSet;

DROP TABLE IF EXISTS exerciseSet;

DROP TABLE IF EXISTS Avatar;

DROP TABLE IF EXISTS UserEarnsMiniGames;

-- UserMiniGames Table does not currently exist right now. It is a many to many relationship between Users and MiniGames 
DROP TABLE IF EXISTS UserMiniGames;


DROP TABLE IF EXISTS UserEarnedAwards;

DROP TABLE IF EXISTS UserEarnedCheats;

DROP TABLE IF EXISTS UserLoginsCounter;

DROP TABLE IF EXISTS UserGivenCheats;

DROP TABLE IF EXISTS Cheats;

DROP TABLE IF EXISTS Awards;

DROP TABLE IF EXISTS MiniGames;

DROP TABLE IF EXISTS User;


-- 1st Table loaded (Table 1: User)
-- TABLE: User 
--

CREATE TABLE IF NOT EXISTS User (
    username             VARCHAR(100)    NOT NULL
    ,userWeight           INT
	,userHeight           INT
	,userGender           VARCHAR(100)
	,userDOB              DATE 
	,userActivityLevel    VARCHAR(100)
	,userBMI              VARCHAR(100)
	,userEmail            VARCHAR(100)
	,dailyCounter         INT
	,userPassword         VARCHAR(100)
	,PRIMARY KEY (username)
)ENGINE=INNODB
;



--
-- Dumping data for table 'User'
--
-- note: Height is stored as inches

INSERT INTO User(username, userWeight, userHeight, userGender, userDOB, userActivityLevel, userBMI, userEmail, dailyCounter, userPassword) VALUES
('rToal', 250, 72, 'M', '1972-07-07', 'Medium', 'normal weight', 'rtoal@lmu.edu', 2, 'toalRocks!')
,('aneyer', 148, 65, 'F', '1988-09-16', 'Medium', 'normal weight', 'aneyer@lmu.edu', 27, '12Thzocks!')
,('KAL', 100, 72, 'M', '1970-07-07', 'High', 'aneroxic weight', 'supremeRuler@obeyYourRuler.com', 102, 'humansRweak!')
,('Kurt', 250, 72, 'M', '1986-07-02', 'Low', 'obese', 'kurt@lmu.edu', 0, 'cmsiRocks!')
,('LisaJ', 830, 58, 'F', '1990-07-07', 'Moderate', 'overweight', 'lisa@usc.edu', 22, 'cmsiRocks!')
;



-- Table 2 MiniGames 
-- 
-- TABLE: MiniGames 
--

CREATE TABLE IF NOT EXISTS MiniGames(
    miniGameName    VARCHAR(100)    NOT NULL,
    PRIMARY KEY (miniGameName)
)ENGINE=INNODB
;

--
-- Dumping data for table 'MiniGames'
--

INSERT INTO MiniGames(miniGameName) VALUES
('Falling Zeroes')
,('Falling KALs')
,('Falling KALs - Pirates')
,('Falling KALs - Medieval')
,('Falling KALs - Ninjas')
, ('Falling KALs - Wizards')
, ('Freeze Frame')
,  ('Flying')
, ('Falling KALs - Aliens')
, ('Falling KALs - Caveman')
;



-- Table 3 Awards
-- 
-- TABLE: Awards 
--

CREATE TABLE IF NOT EXISTS Awards(
    awardName    VARCHAR(100)    NOT NULL,
    PRIMARY KEY (awardName)
)ENGINE=INNODB
;

--
-- Dumping data for table 'Awards'
--

INSERT INTO Awards(awardName) VALUES
('High Score Award')
,('Consecutive Login Award')
,('500 Calories Burned Award')
,('Most MiniGames Earned Award')
;


-- Table 4 Cheats
-- 
-- TABLE: Cheats 
--

CREATE TABLE IF NOT EXISTS Cheats(
    cheatName    VARCHAR(100)    NOT NULL,
    PRIMARY KEY (cheatName)
)ENGINE=INNODB
;

--
-- Dumping data for table 'Cheats'
--

INSERT INTO Cheats(cheatName) VALUES
('Slow Time Down')
,('Strengthen Shield')
,('Increase Shield Time')
,('Increase Score')
;


-- Table 5 userGivenCheats
-- 
-- TABLE: `UserGivenCheats` 
--

CREATE TABLE IF NOT EXISTS UserGivenCheats(
    username          VARCHAR(100)    NOT NULL,
    cheatName         VARCHAR(100)    NOT NULL,
    whenCheatGiven    DATETIME,
    PRIMARY KEY (username, cheatName)
)ENGINE=INNODB
;

-- 
-- Add foreign key constraint
-- 

ALTER TABLE UserGivenCheats ADD FOREIGN KEY ( username ) REFERENCES cmsi486_aneyer.User (username) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE UserGivenCheats ADD FOREIGN KEY ( cheatName ) REFERENCES cmsi486_aneyer.Cheats (cheatName) ON DELETE RESTRICT ON UPDATE RESTRICT ;


--
-- Dumping data for table 'UserGivenCheats'
--

INSERT INTO UserGivenCheats(username, cheatName, whenCheatGiven) VALUES
('rToal', 'Slow Time Down', '2014-09-20-2014 00:00:01') 
,('aneyer', 'Strengthen Shield', '2007-07-07 00:00:01')
,('KAL', 'Increase Shield Time', '2014-08-15 01:00:01')
,('LisaJ', 'Increase Score', '1990-05-07 12:19:01')
;

-- 
-- INDEX: Ref935 
--

CREATE INDEX Ref935 ON UserGivenCheats(username)
;
-- 
-- INDEX: Ref436 
--

CREATE INDEX Ref436 ON UserGivenCheats(cheatName)
;


-- Table 6 userLoginsCounter
-- 
-- TABLE: `User Logins Counter` 
--

CREATE TABLE IF NOT EXISTS UserLoginsCounter(
    username            VARCHAR(100)    NOT NULL,
    whenUserLoggedIn    DATETIME  NOT NULL,
    PRIMARY KEY (username, whenUserLoggedIn)
)ENGINE=INNODB
;

-- 
-- Add foreign key constraint
-- 

ALTER TABLE UserLoginsCounter ADD FOREIGN KEY ( username ) REFERENCES cmsi486_aneyer.User (username) ON DELETE RESTRICT ON UPDATE RESTRICT ;


--
-- Dumping data for table 'UserLoginsCounter'
--

INSERT INTO UserLoginsCounter(username, whenUserLoggedIn) VALUES
('rToal', '2014-09-20 12:19:01')
,('aneyer', '2007-07-07 12:19:01')
,('KAL', '2014-08-20 12:19:01')
,('LisaJ', '2014-09-20 12:19:01')
;


-- 
-- INDEX: Ref910 
--

CREATE INDEX Ref910 ON UserLoginsCounter(username)
;


-- Table 7 userEarnedCheats
-- 
-- TABLE: `User Earned Cheats` 
--

CREATE TABLE IF NOT EXISTS UserEarnedCheats(
    username           VARCHAR(100)    NOT NULL,
    cheatName          VARCHAR(100)    NOT NULL,
    whenCheatEarned    DATETIME,
    PRIMARY KEY (username, cheatName)
)ENGINE=INNODB
;

-- 
-- Add foreign key constraint
-- 

ALTER TABLE UserEarnedCheats 
ADD FOREIGN KEY ( username ) REFERENCES cmsi486_aneyer.User (username) ON DELETE RESTRICT ON UPDATE RESTRICT 
;

ALTER TABLE UserEarnedCheats 
ADD FOREIGN KEY ( cheatName ) REFERENCES cmsi486_aneyer.Cheats (cheatName) ON DELETE RESTRICT ON UPDATE RESTRICT 
;


--
-- Dumping data for table 'UserEarnedCheats'
--

INSERT INTO UserEarnedCheats(username, cheatName, whenCheatEarned) VALUES
('rToal', 'Slow Time Down', '2014-09-20 12:19:01')
,('aneyer', 'Strengthen Shield', '2007-07-07 12:10:01')
,('KAL', 'Increase Shield Time', '2014-08-15 12:19:01')
,('LisaJ', 'Increase Score', '1990-07-05 12:19:01')
;



-- 
-- INDEX: Ref921 
--

CREATE INDEX Ref921 ON UserEarnedCheats(username)
;
-- 
-- INDEX: Ref427 
--

CREATE INDEX Ref427 ON UserEarnedCheats(cheatName)
;




-- Table 8 userEarnedAwards
-- 
-- TABLE: `User earned Awards` 
--

CREATE TABLE IF NOT EXISTS UserEarnedAwards(
    username           VARCHAR(100)    NOT NULL,
    awardName          VARCHAR(100)    NOT NULL,
    whenAwardEarned    DATETIME,
    PRIMARY KEY (username, awardName)
)ENGINE=INNODB
;

-- Add foreign key constraint
ALTER TABLE UserEarnedAwards 
ADD FOREIGN KEY (username) 
REFERENCES cmsi486_aneyer.User (username) 
ON DELETE RESTRICT ON UPDATE RESTRICT 
;

ALTER TABLE UserEarnedAwards 
ADD FOREIGN KEY (awardName) 
REFERENCES cmsi486_aneyer.Awards (awardName) 
ON DELETE RESTRICT ON UPDATE RESTRICT 
;

--
-- Dumping data for table 'UserEarnedAwards'
--

INSERT INTO UserEarnedAwards(username, awardName, whenAwardEarned) VALUES
('rToal', 'High Score Award', '2014-09-20 12:19:01')
,('aneyer', 'Consecutive Login Award', '2007-07-07 12:19:01')
,('KAL', '500 Calories Burned Award', '2014-08-15 12:19:01')
,('LisaJ', 'High Score Award', '2014-05-07 12:19:01')
;

-- 
-- INDEX: Ref928 
--

CREATE INDEX Ref928 ON UserEarnedAwards(username)
;
-- 
-- INDEX: Ref129 
--

CREATE INDEX Ref129 ON UserEarnedAwards(awardName)
;

-- Many to Many relationship between User entity and MiniGames entity. 0-Many (*) User(s) plays 0-many (*) MiniGames.
-- Table 9 userMiniGames
-- 
-- TABLE: `User MiniGames` 
--

 CREATE TABLE IF NOT EXISTS UserMiniGames(
    username        VARCHAR(100)    NOT NULL,
    miniGameName    VARCHAR(100)    NOT NULL,
    PRIMARY KEY (username, miniGameName)
 )ENGINE=INNODB
 ;

-- 
-- Add foreign key constraint
-- 

ALTER TABLE UserMiniGames ADD FOREIGN KEY ( username ) REFERENCES cmsi486_aneyer.User (username) ON DELETE RESTRICT ON UPDATE RESTRICT 
;

ALTER TABLE UserMiniGames ADD FOREIGN KEY ( miniGameName ) REFERENCES cmsi486_aneyer.MiniGames (miniGameName) ON DELETE RESTRICT ON UPDATE RESTRICT 
;
 
--
-- Dumping data for table 'UserMiniGames'
--

 INSERT INTO UserMiniGames(username, miniGameName) VALUES
 ('rToal', 'Falling Zeroes')
 ,('aneyer', 'Falling KALs')
 ,('KAL', 'Falling KALs - Pirates')
 ,('Kurt', 'Falling KALs - Medieval')
 ,('LisaJ', 'Falling KALs - Ninjas')
 ;

 
-- 
-- INDEX: Ref912 
--

 CREATE INDEX Ref912 ON UserMiniGames(username)
 ;
 
-- INDEX: Ref313 
--

 CREATE INDEX Ref313 ON UserMiniGames(miniGameName)
 ;


-- Table 10 userEarnsMiniGames
-- 
-- TABLE: `UserEarnsMiniGames` 
--


-- Note: when the data type is DATETIME data type then the data inputted must match this Format: YYYY-MM-DD HH:MI:SS
-- example of sample data: '2014-09-20 12:19:01'

CREATE TABLE IF NOT EXISTS UserEarnsMiniGames(
    username          VARCHAR(100)    NOT NULL,
    miniGameName      VARCHAR(100)    NOT NULL,
    whenGameEarned    DATETIME,
    PRIMARY KEY (username, miniGameName)
)ENGINE=INNODB
;

-- 
-- Add foreign key constraint
-- 

ALTER TABLE UserEarnsMiniGames 
ADD FOREIGN KEY ( username ) REFERENCES cmsi486_aneyer.User (username)
ON DELETE RESTRICT ON UPDATE RESTRICT 
;

ALTER TABLE UserEarnsMiniGames 
ADD FOREIGN KEY ( miniGameName ) REFERENCES cmsi486_aneyer.MiniGames (miniGameName) 
ON DELETE RESTRICT ON UPDATE RESTRICT 
;

--
-- Dumping data for table 'UserEarnsMiniGames'
--

INSERT INTO UserEarnsMiniGames(username, miniGameName, whenGameEarned) VALUES
('rToal', 'Falling Zeroes', '2014-09-20 12:19:01')
,('aneyer', 'Falling KALs', '2014-09-15 10:10:01')
,('KAL', 'Falling KALs - Pirates', '1988-07-12 12:19:01')
,('Kurt', 'Falling KALs - Medieval', '1979-07-07 12:19:01')
,('aneyer', 'Falling Zeroes', '2014-09-15 12:19:01')
,('LisaJ', 'Falling KALs - Ninjas', '2014-05-07 12:19:01')
;

-- 
-- INDEX: Ref919 
--

CREATE INDEX Ref919 ON UserEarnsMiniGames(username)
;
-- 
-- INDEX: Ref320 
--

CREATE INDEX Ref320 ON UserEarnsMiniGames(miniGameName)
;


-- Table 11 Avatar
-- 
-- TABLE: Avatar 
--

CREATE TABLE IF NOT EXISTS Avatar(
    userNickname                VARCHAR(100)    NOT NULL,
    username                    VARCHAR(100)     NOT NULL,
    points                      INT,
    cheatsEarned                INT,
    miniGamesEarned             INT,
    MoneyCredits                INT,
    userConsecutiveLoginsNum    INT,
    awardsEarned                INT,
    userCaloriesBurned          INT,
    userStatus                  VARCHAR(100),
    userAvatarRepresentation    VARCHAR(100),
    PRIMARY KEY (userNickname, username)
)ENGINE=INNODB;

-- 
-- TABLE: Avatar 
-- 
-- Add foreign key constraint to Avatar Table
-- 

ALTER TABLE Avatar ADD CONSTRAINT RefUser4 
    FOREIGN KEY (username)
    REFERENCES User(username)
	;


--
-- Dumping data for table 'Avatar'
--

INSERT INTO Avatar(userNickname, username, points, cheatsEarned, miniGamesEarned, MoneyCredits, userConsecutiveLoginsNum, awardsEarned, userCaloriesBurned, userStatus, userAvatarRepresentation) VALUES
('Toal', 'rToal', 250, 72, 1, 0, 2, 4, 2, 'Intro Story Chapter', 'normalMaleWeight')
,('Allison', 'aneyer', 148, 65, 2, 4, 5, 6, 7,  'Chapter 1', 'normalFemaleWeight')
,('supremeRuler', 'KAL', 100, 65, 1, 4, 5, 6, 7,  'Chapter 220', 'aneroxicMaleWeight')
,('K', 'Kurt', 148, 65, 1, 4, 5, 6, 7,  'Chapter 1', 'obeseMaleWeight')
,('Lisa', 'LisaJ', 27, 65, 1, 4, 5, 6, 7,  'Chapter 3', 'chubbyFemaleWeight')
;

-- 
-- INDEX: Ref94 
--

CREATE INDEX Ref94 ON Avatar(username);


-- Tables: Table 12 exerciseSet
-- 
-- TABLE: exerciseSet 
--

CREATE TABLE IF NOT EXISTS exerciseSet(
--	setID INT UNSIGNED NOT NULL AUTO_INCREMENT
	setID        INT     NOT NULL
	,setType     VARCHAR(100)     
	,username    VARCHAR(100)    NOT NULL
	,PRIMARY KEY (setID)
)ENGINE=INNODB
;

-- 
-- Add foreign key constraint
-- 

	ALTER TABLE exerciseSet 
	ADD FOREIGN KEY ( username ) REFERENCES cmsi486_aneyer.User (username) 
	ON DELETE RESTRICT ON UPDATE RESTRICT 
	;


--
-- Dumping data for table 'exerciseSet'
--
-- 

INSERT INTO exerciseSet(setID, setType, username) VALUES
(1, 'Strength Training', 'rToal')
,(2, 'Cardio', 'aneyer')
,(3, 'Endurance', 'KAL')
,(4, 'Flexibility', 'LisaJ')
,(5, 'Balance', 'LisaJ')
;


-- 
-- INDEX: Ref937 
--

CREATE INDEX Ref937 ON exerciseSet(username)
;


-- Last table to be created (table 13)
-- TABLE: whichMiniGameUserIsPlayingInSet 
-- Table structure for table 'whichMiniGameUserIsPlayingInSet'

CREATE TABLE IF NOT EXISTS whichMiniGameUserIsPlayingInSet(
	setID                  INT             NOT NULL
	,miniGameName          VARCHAR(100)    NOT NULL
    ,whenGameInSetPlayed   VARCHAR(100)    NOT NULL
    ,PRIMARY KEY (setID, miniGameName)
)ENGINE=INNODB
;

 
 -- Add foreign key constraint
 


 ALTER TABLE whichMiniGameUserIsPlayingInSet ADD CONSTRAINT RefexerciseSet38 
 FOREIGN KEY ( setID ) REFERENCES cmsi486_aneyer.exerciseSet (setID) 
 ON DELETE RESTRICT ON UPDATE RESTRICT 
 ;


 ALTER TABLE whichMiniGameUserIsPlayingInSet ADD CONSTRAINT RefexerciseSet39 FOREIGN KEY ( miniGameName ) REFERENCES cmsi486_aneyer.MiniGames (miniGameName) ON DELETE RESTRICT ON UPDATE RESTRICT 
 ;

--
-- Dumping data for table 'whichMiniGameUserIsPlayingInSet'
--

INSERT INTO whichMiniGameUserIsPlayingInSet (setID, miniGameName,  whenGameInSetPlayed ) VALUES
(1, 'Falling KALs', 'Game1')
,(2, 'Falling Zeroes', 'Game 1')
,(3, 'Freeze Frame', 'Game 1')
,(4, 'Flying', 'Game 1')
,(5, 'Falling KALs - Pirates', 'Game 1')
,(1, 'Falling KALs - Wizards', 'Game 2')
,(5,'Falling KALs - Aliens', 'Game 2')
,(4, 'Falling KALs - Medieval', 'Game 2')
,(3, 'Falling KALs - Caveman', 'Game 2')
,(4, 'Falling KALs - Ninjas', 'Game 3')
, (2, 'Freeze Frame', 'Game 2')
;



-- 
-- INDEX: Ref2038 
--

CREATE INDEX Ref2038 ON whichMiniGameUserIsPlayingInSet(setID)
;
-- 
-- INDEX: Ref339 
--

CREATE INDEX Ref339 ON whichMiniGameUserIsPlayingInSet(miniGameName)
;

