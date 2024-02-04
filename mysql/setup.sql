DROP DATABASE IF EXISTS student_passwords;

CREATE DATABASE student_passwords DEFAULT CHARACTER SET utf8mb4;

USE student_passwords;

SET @UNHEXEncryptionKey = UNHEX('8190e34b6ca24e9a6402');

CREATE USER 'passwords_user'@'localhost' IDENTIFIED BY 'password1!';

GRANT ALL PRIVILEGES ON student_passwords.* TO 'passwords_user'@'localhost';

CREATE TABLE IF NOT EXISTS websites (
    website_id INT AUTO_INCREMENT,
    website_name VARCHAR(64) NOT NULL,
    website_url VARCHAR(256) NOT NULL,
    PRIMARY KEY (website_id)
);

CREATE TABLE IF NOT EXISTS accounts (
    account_id INT AUTO_INCREMENT,
    website_id INT NOT NULL,
    username VARCHAR(64) NOT NULL,
    password VARBINARY(256) NOT NULL,
    email VARCHAR(128) NOT NULL,
    comment TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (account_id),
    UNIQUE KEY unique_website_username (website_id, username)
);

INSERT INTO websites (website_name, website_url) VALUES
    ('MySQL', 'https://www.mysql.com'),
    ('UniversityOfHartford', 'https://www.hartford.edu'),
    ('UselessWebsite', 'http://www.useless.com'),
    ('FastFoodForMe', 'http://www.fastfoodforme.com'),
    ('Roblox', 'http://www.roblox.com'),
    ('Ebay', 'http://www.ebay.com'),
    ('NFL', 'http://www.nfl.com'),
    ('Steam', 'http://www.steam.com'),
    ('Twitch', 'http://www.twitch.com'),
    ('HotPocket', 'http://www.hotpocket.com');

INSERT INTO accounts (website_id, username, password, email, comment) VALUES
    (1, 'dbel21', AES_ENCRYPT('mySQLPassword', @UNHEXEncryptionKey),'db@gmail.com','New MySQL account'),
    (2, 'DB21', AES_ENCRYPT('myUHARTPassword', @UNHEXEncryptionKey),'dbel@gmail.com','New UHART account'),
    (3, 'Dee84', AES_ENCRYPT('84password', @UNHEXEncryptionKey),'derim@gmail.com','New account on the useless website'),
    (4, 'Bel', AES_ENCRYPT('fffmPW', @UNHEXEncryptionKey),'fffm@gmail.com','New account on the fast food for me website'),
    (5, 'Derim1998', AES_ENCRYPT('robloxPlayer12!', @UNHEXEncryptionKey),'rblx@gmail.com', 'New account on the Roblox website'),
    (6, 'DBShop', AES_ENCRYPT('DeEbay', @UNHEXEncryptionKey),'deeee@gmail.com', 'New account on the Ebay website'),
    (7, 'DFootball', AES_ENCRYPT('footballFan99', @UNHEXEncryptionKey),'brandnew@gmail.com', 'New account on the NFL website'),
    (8, 'DBGames', AES_ENCRYPT('gamePlayer11', @UNHEXEncryptionKey),'throwaway@gmail.com', 'New account on the Steam website'),
    (9, 'DeeStreams', AES_ENCRYPT('streamerGuy121', @UNHEXEncryptionKey),'streamer@gmail.com', 'New account on the Twitch website'),
    (10,'DerimB', AES_ENCRYPT('verySecurePassword', @UNHEXEncryptionKey),'verygood@gmail.com', 'New account on the HotPocket website');
