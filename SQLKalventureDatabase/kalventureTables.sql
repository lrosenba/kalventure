

--
-- Database: `Kalventure`
--

-- --------------------------------------------------------
-- 



-- 1st Table loaded (Table 1: User)
-- TABLE: User 
--

CREATE TABLE IF NOT EXISTS User (
    username             VARCHAR(100)    NOT NULL
    ,userWeight           VARCHAR(100)
	,userHeight           VARCHAR(100)
	,userGender           VARCHAR(100)
	,userDOB              VARCHAR(100)
	,userActivityLevel    VARCHAR(100)
	,userBMI              VARCHAR(100)
	,userEmail            VARCHAR(100)
	,dailyCounter         VARCHAR(100)
	,userPassword         VARCHAR(100)
	,PRIMARY KEY (username)
)ENGINE=INNODB
;



--
-- Dumping data for table 'User'
--
-- note: Height is stored as inches

INSERT INTO User(username, userWeight, userHeight, userGender, userDOB, userActivityLevel, userBMI, userEmail, dailyCounter, userPassword) VALUES
('rToal', 250, 72, 'M', '07-07-1970', 'Medium', 'normal weight', 'rtoal@lmu.edu', 2, 'toalRocks!')
,('aneyer', 148, 65, 'F', '09-16-1988', 'Medium', 'normal weight', 'aneyer@lmu.edu', 27, '12Thzocks!')
,('KAL', 100, 72, 'M', '07-07-1970', 'High', 'aneroxic weight', 'supremeRuler@obeyYourRuler.com', 102, 'humansRweak!')
,('Kurt', 250, 72, 'M', '07-07-1970', 'Low', 'obese', 'kurt@lmu.edu', 0, 'cmsiRocks!')
,('LisaJ', 830, 58, 'F', '07-07-1990', 'Moderate', 'overweight', 'lisa@usc.edu', 22, 'cmsiRocks!')
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
    whenCheatGiven    VARCHAR(100),
    PRIMARY KEY (username, cheatName)
)ENGINE=INNODB
;

--
-- Dumping data for table 'UserGivenCheats'
--

INSERT INTO UserGivenCheats(username, cheatName, whenCheatGiven) VALUES
('rToal', 'Slow Time Down', '09-20-2014')
,('aneyer', 'Strengthen Shield', '07-07-2007')
,('supremeRuler', 'Increase Shield Time', '08-15-2014')
,('LisaJ', 'Increase Score', '05-07-1990')
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
    whenUserLoggedIn    VARCHAR(100)    NOT NULL,
    PRIMARY KEY (username, whenUserLoggedIn)
)ENGINE=INNODB
;

--
-- Dumping data for table 'UserLoginsCounter'
--

INSERT INTO UserLoginsCounter(username, whenUserLoggedIn) VALUES
('rToal', '09-20-2014')
,('aneyer', '07-07-2007')
,('supremeRuler', '08-15-2014')
,('LisaJ', '05-07-1990')
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
    whenCheatEarned    VARCHAR(100),
    PRIMARY KEY (username, cheatName)
)ENGINE=INNODB
;

--
-- Dumping data for table 'UserEarnedCheats'
--

INSERT INTO UserEarnedCheats(username, cheatName, whenCheatEarned) VALUES
('rToal', 'Slow Time Down', '09-20-2014')
,('aneyer', 'Strengthen Shield', '07-07-2007')
,('supremeRuler', 'Increase Shield Time', '08-15-2014')
,('LisaJ', 'Increase Score', '05-07-1990')
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
    whenAwardEarned    CHAR(100),
    PRIMARY KEY (username, awardName)
)ENGINE=INNODB
;

--
-- Dumping data for table 'UserEarnedAwards'
--

INSERT INTO UserEarnedAwards(username, awardName, whenAwardEarned) VALUES
('rToal', 'High Score Award', '09-20-2014')
,('aneyer', 'Consecutive Login Award', '07-07-2007')
,('supremeRuler', '500 Calories Burned Award', '08-15-2014')
,('LisaJ', 'High Score Award', '05-07-1990')
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
-- Dumping data for table 'UserMiniGames'
--

 INSERT INTO UserMiniGames(username, miniGameName) VALUES
 ('rToal', 'Falling Zeroes')
 ,('aneyer', 'Falling KALs')
 ,('supremeRuler', 'Falling KALs - Pirates')
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

CREATE TABLE IF NOT EXISTS UserEarnsMiniGames(
    username          VARCHAR(100)    NOT NULL,
    miniGameName      VARCHAR(100)    NOT NULL,
    whenGameEarned    VARCHAR(100),
    PRIMARY KEY (username, miniGameName)
)ENGINE=INNODB
;

--
-- Dumping data for table 'UserEarnsMiniGames'
--

INSERT INTO UserEarnsMiniGames(username, miniGameName, whenGameEarned) VALUES
('rToal', 'Falling Zeroes', '09-20-2014')
,('aneyer', 'Falling KALs', '09-15-2014')
,('supremeRuler', 'Falling KALs - Pirates', '07-16-1988')
,('Kurt', 'Falling KALs - Medieval', '07-07-1979')
,('LisaJ', 'Falling KALs - Ninjas', '05-07-1990')
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
    points                      VARCHAR(100),
    cheatsEarned                VARCHAR(100),
    miniGamesEarned             VARCHAR(100),
    MoneyCredits                VARCHAR(100),
    userConsecutiveLoginsNum    VARCHAR(100),
    awardsEarned                VARCHAR(100),
    userCaloriesBurned          VARCHAR(100),
    userStatus                  VARCHAR(100),
    userAvatarRepresentation    VARCHAR(100),
    PRIMARY KEY (userNickname, username)
)ENGINE=INNODB;


--
-- Dumping data for table 'Avatar'
--

INSERT INTO Avatar(userNickname, username, points, cheatsEarned, miniGamesEarned, MoneyCredits, userConsecutiveLoginsNum, awardsEarned, userCaloriesBurned, userStatus, userAvatarRepresentation) VALUES
('Toal', 'rToal', 250, 72, 0, 0, 2, 4, 2, 'Intro Story Chapter', 'normalMaleWeight')
,('Allison', 'aneyer', 148, 65, 3, 4, 5, 6, 7,  'Chapter 1', 'normalFemaleWeight')
,('supremeRuler', 'KAL', 100, 65, 3, 4, 5, 6, 7,  'Chapter 220', 'aneroxicMaleWeight')
,('K', 'Kurt', 148, 65, 3, 4, 5, 6, 7,  'Chapter 1', 'obeseMaleWeight')
,('Lisa', 'LisaJ', 27, 65, 3, 4, 5, 6, 7,  'Chapter 3', 'chubbyFemaleWeight')
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
	setID INT UNSIGNED NOT NULL AUTO_INCREMENT
	,setType     CHAR(100)
	,username    VARCHAR(100)    NOT NULL
	,PRIMARY KEY (setID)
)ENGINE=INNODB
;

--
-- Dumping data for table 'exerciseSet'
--
-- 

INSERT INTO exerciseSet(setType, username) VALUES
('Strength Training', 'rToal')
,('Cardio', 'aneyer')
,('Endurance', 'KAL')
,('Flexibility', 'LisaJ')
,('Balance', 'LisaJ')
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
    setID INT UNSIGNED NOT NULL AUTO_INCREMENT
	,miniGameName          VARCHAR(100)    NOT NULL
    ,whenGameInSetPlayed    CHAR(100)       NOT NULL
    ,PRIMARY KEY (setID, miniGameName)
)ENGINE=INNODB
;

--
-- Dumping data for table 'whichMiniGameUserIsPlayingInSet'
--

INSERT INTO whichMiniGameUserIsPlayingInSet (miniGameName,  whenGameInSetPlayed ) VALUES
('Falling KALs', 'Game1')
,('Falling Zeroes', 'Game 2')
,('Freeze Frame', 'Game 3')
,('Flying', 'Game 4')
,('Falling KALs - Pirates', 'Game 5')
,('Falling KALs - Wizards', 'Game 6')
,('Falling KALs - Aliens', 'Game 7')
,('Falling KALs - Medieval', 'Game 8')
,('Falling KALs - Caveman', 'Game 9')
,('Falling KALs - Ninjas', 'Game 10')
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

