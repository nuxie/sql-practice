# when adding new player and setting buyin less than minimum for a given tournament we will get an error
# "Error: Not enough buyin for player 2 to play in the "Hands Up!" tournament (min. buyin: 20000)."

CREATE TABLE players (
id INT NOT NULL AUTO_INCREMENT,
full_name VARCHAR(50),
no_of_wins INT DEFAULT 0,
total_buyins FLOAT DEFAULT 0,
tournaments_played INT DEFAULT 0,
total_won FLOAT DEFAULT 0,
PRIMARY KEY (id)
);

CREATE TABLE tournament_types (
id INT NOT NULL AUTO_INCREMENT,
type_name VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE tournaments (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50),
minimum_buyin FLOAT NOT NULL DEFAULT 0,
total_players INT DEFAULT 0,
total_buyins FLOAT NOT NULL DEFAULT 0,
prize_pool FLOAT NOT NULL DEFAULT 0,
house_pool FLOAT NOT NULL DEFAULT 0,
winner_id INT,
house_pool_multiplier FLOAT NOT NULL DEFAULT 0,
type_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (winner_id) REFERENCES players(id),
FOREIGN KEY (type_id) REFERENCES tournament_types(id)
);

CREATE TABLE tournament_players (
id INT NOT NULL AUTO_INCREMENT,
tournament_id INT NOT NULL,
player_id INT NOT NULL,
buy_in FLOAT NOT NULL DEFAULT 0,
PRIMARY KEY (id),
FOREIGN KEY (tournament_id) REFERENCES tournaments(id),
FOREIGN KEY (player_id) REFERENCES players(id)
);

DELIMITER //

CREATE FUNCTION calculate_total_buyins(tournament_id INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
SET @tmp = 0;
SELECT SUM(buy_in) INTO @tmp FROM tournament_players WHERE tournament_players.tournament_id = tournament_id;
RETURN @tmp;
END //

CREATE FUNCTION calculate_house_pool(tournament_id INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
SET @tmp = 0;
SET @multiplier = 0;
SELECT house_pool_multiplier INTO @multiplier FROM tournaments WHERE tournaments.id = tournament_id;
SELECT calculate_total_buyins(tournament_id) * @multiplier INTO @tmp;
RETURN @tmp;
END //

CREATE FUNCTION calculate_prize_pool(tournament_id INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
SET @tmp = 0;
SELECT (calculate_total_buyins(tournament_id) - calculate_house_pool(tournament_id)) INTO @tmp;
RETURN @tmp;
END //

CREATE TRIGGER buyin_amount BEFORE INSERT ON tournament_players
FOR EACH ROW
BEGIN
DECLARE msg VARCHAR(150) DEFAULT "";
IF((SELECT no_of_wins FROM players WHERE id = NEW.player_id) > 0) THEN SET NEW.buy_in = '20000';
ELSE SET NEW.buy_in = '10000';
END IF;
IF((SELECT minimum_buyin FROM tournaments WHERE id = NEW.tournament_id) > NEW.buy_in) THEN
SET msg = concat('Error: Not enough buyin for player ', NEW.player_id, ' to play in the "',
(SELECT name FROM tournaments WHERE id = NEW.tournament_id), '" tournament (min. buyin: ',
(SELECT minimum_buyin FROM tournaments WHERE id = NEW.tournament_id), ').');
signal sqlstate '45000' SET message_text = msg;
end if;
UPDATE players SET total_buyins = total_buyins + NEW.buy_in WHERE id = NEW.player_id;
END //

CREATE TRIGGER set_winner AFTER UPDATE ON tournaments
FOR EACH ROW
BEGIN
IF ISNULL(OLD.winner_id) THEN
SET @prize = NEW.prize_pool;
UPDATE players SET no_of_wins = no_of_wins + 1 WHERE id = NEW.winner_id;
UPDATE players SET total_won = total_won + @prize WHERE id = NEW.winner_id;
END IF;
END //

CREATE TRIGGER money AFTER INSERT ON tournament_players
FOR EACH ROW
BEGIN
SET @tournament_id = NEW.tournament_id;
SET @player_id = NEW.player_id;
SET @buyins = calculate_total_buyins(@tournament_id);
SET @hpool = calculate_house_pool(@tournament_id);
SET @ppool = calculate_prize_pool(@tournament_id);
UPDATE tournaments SET total_buyins = @buyins WHERE id = @tournament_id;
UPDATE tournaments SET total_players = total_players + 1 WHERE id = @tournament_id;
UPDATE tournaments SET house_pool = @hpool WHERE id = @tournament_id;
UPDATE tournaments SET prize_pool = @ppool WHERE id = @tournament_id;
UPDATE players SET tournaments_played = tournaments_played + 1 WHERE id = @player_id;
END //

DELIMITER ;

INSERT INTO players (full_name) VALUES ('Chickie MacPhail');
INSERT INTO players (full_name) VALUES ('Vernon Scholes');
INSERT INTO players (full_name) VALUES ('Misti Mewrcik');
INSERT INTO players (full_name) VALUES ('Cornall Lockyear');
INSERT INTO players (full_name) VALUES ('Orlando Blankley');
INSERT INTO players (full_name) VALUES ('Abey Phinnessy');
INSERT INTO players (full_name) VALUES ('Beckie Conniam');
INSERT INTO players (full_name) VALUES ('Aleen Riccardelli');
INSERT INTO players (full_name) VALUES ('Dacey Sturley');
INSERT INTO players (full_name) VALUES ('Kathryne Wain');
INSERT INTO players (full_name) VALUES ('Svend Clinton');
INSERT INTO players (full_name) VALUES ('Ariel Saenz');
INSERT INTO players (full_name) VALUES ('Kiele Benedetti');
INSERT INTO players (full_name) VALUES ('Blisse Blumfield');
INSERT INTO players (full_name) VALUES ('Farand Manclark');
INSERT INTO players (full_name) VALUES ('Dave O''Lunney');
INSERT INTO players (full_name) VALUES ('Bat Kneeland');
INSERT INTO players (full_name) VALUES ('Jerome Stanion');
INSERT INTO players (full_name) VALUES ('Liza Denning');
INSERT INTO players (full_name) VALUES ('Waring Iles');

INSERT INTO tournament_types (type_name) VALUES ('Bounty Builder'), ('Heads Up'), ('Deep Stack');

INSERT INTO tournaments (name, minimum_buyin, house_pool_multiplier, type_id) VALUES
('Crazy Bounty for Poker Newbies', '5000', '0.2', '1'), ('Texas Game', '7000', '0.17', '1'),
('Hands Up!', '20000', '0.3', '2'), ('Another Poker Game', '10000', '0.25', '3'),
('Friends of Poker', '2000', '0.15', '1'), ('All-In!', '9000', '0.1', '2');

INSERT INTO tournament_players (tournament_id, player_id) VALUES
('1', '19'), ('1', '4'), ('1', '14'), ('1', '17'), ('1', '6'), ('1', '13'), ('1', '18'), ('1', '5'), ('1', '9');
UPDATE tournaments SET winner_id = '4' WHERE id = '1';

INSERT INTO tournament_players (tournament_id, player_id) VALUES
('2', '4'), ('2', '11'), ('2', '1'), ('2', '12'), ('2', '15'), ('2', '3');
UPDATE tournaments SET winner_id = '11' WHERE id = '2';

INSERT INTO tournament_players (tournament_id, player_id) VALUES
('4', '2'), ('4', '7'), ('4', '8'), ('4', '10'), ('4', '16'), ('4', '20');
UPDATE tournaments SET winner_id = '7' WHERE id = '4';

INSERT INTO tournament_players (tournament_id, player_id) VALUES
('5', '2'), ('5', '11'), ('5', '14'), ('5', '10'), ('5', '13'), ('5', '3'), ('5', '9');
UPDATE tournaments SET winner_id = '13' WHERE id = '5';

INSERT INTO tournament_players (tournament_id, player_id) VALUES
('6', '20'), ('6', '17'), ('6', '14'), ('6', '1');
UPDATE tournaments SET winner_id = '17' WHERE id = '6';

INSERT INTO tournament_players (tournament_id, player_id) VALUES
('3', '13'), ('3', '17'), ('3', '7'), ('3', '11'), ('3', '4');
UPDATE tournaments SET winner_id = '13' WHERE id = '3';

SELECT * FROM players;
SELECT * FROM tournaments;