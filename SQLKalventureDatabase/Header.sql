--
-- ER/Studio Data Architect 9.6 SQL Code Generation
-- Project :      deliverable_3-complicated_model-no_fk-working model.dm1
--
-- Date Created : Tuesday, October 14, 2014 15:41:50
-- Target DBMS : MySQL 5.x
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