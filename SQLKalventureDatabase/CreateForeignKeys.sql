--CreateForeignKeys.sql

-- 
-- TABLE: Avatar 
--

ALTER TABLE Avatar ADD CONSTRAINT RefUser4 
    FOREIGN KEY (username)
    REFERENCES User(username);


-- 
-- TABLE: exerciseSet 
--

ALTER TABLE exerciseSet ADD CONSTRAINT RefUser37 
    FOREIGN KEY (username)
    REFERENCES User(username);


-- 
-- TABLE: `UserEarnedAwards` 
--

ALTER TABLE UserEarnedAwards ADD CONSTRAINT RefUser28 
    FOREIGN KEY (username)
    REFERENCES User(username);

ALTER TABLE UserEarnedAwards ADD CONSTRAINT RefAwards29 
    FOREIGN KEY (awardName)
    REFERENCES Awards(awardName);


-- 
-- TABLE: `UserEarnedCheats` 
--

ALTER TABLE UserEarnedCheats ADD CONSTRAINT RefUser21 
    FOREIGN KEY (username)
    REFERENCES User(username);

ALTER TABLE UserEarnedCheats ADD CONSTRAINT RefCheats27 
    FOREIGN KEY (cheatName)
    REFERENCES Cheats(cheatName);


-- 
-- TABLE: `UserEarnsMiniGames` 
--

ALTER TABLE UserEarnsMiniGames ADD CONSTRAINT RefUser19 
    FOREIGN KEY (username)
    REFERENCES User(username);

ALTER TABLE UserEarnsMiniGames ADD CONSTRAINT RefMiniGames20 
    FOREIGN KEY (miniGameName)
    REFERENCES MiniGames(miniGameName);


-- 
-- TABLE: `UserGivenCheats` 
--

ALTER TABLE UserGivenCheats ADD CONSTRAINT RefUser35 
    FOREIGN KEY (username)
    REFERENCES User(username);

ALTER TABLE UserGivenCheats ADD CONSTRAINT RefCheats36 
    FOREIGN KEY (cheatName)
    REFERENCES Cheats(cheatName);


-- 
-- TABLE: `UserLoginsCounter` 
--

ALTER TABLE UserLoginsCounter ADD CONSTRAINT RefUser10 
    FOREIGN KEY (username)
    REFERENCES User(username);


-- 
-- TABLE: `UserMiniGames` 
--

ALTER TABLE UserMiniGames ADD CONSTRAINT RefUser12 
    FOREIGN KEY (username)
    REFERENCES User(username);

ALTER TABLE UserMiniGames ADD CONSTRAINT RefMiniGames13 
    FOREIGN KEY (miniGameName)
    REFERENCES MiniGames(miniGameName);


-- 
-- TABLE: whichMiniGameUserIsPlayingInSet 
--

ALTER TABLE whichMiniGameUserIsPlayingInSet ADD CONSTRAINT RefexerciseSet38 
    FOREIGN KEY (setID)
    REFERENCES exerciseSet(setID);

ALTER TABLE whichMiniGameUserIsPlayingInSet ADD CONSTRAINT RefMiniGames39 
    FOREIGN KEY (miniGameName)
    REFERENCES MiniGames(miniGameName);


