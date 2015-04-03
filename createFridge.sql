
CREATE TABLE role(
	accountRole VARCHAR(30) NOT NULL,
	roleID INTEGER PRIMARY KEY AUTOINCREMENT);

CREATE TABLE account(
	password VARCHAR(32) NOT NULL,
	salt VASRCHAR(32) NOT NULL,
	accountID VARCHAR(10) NOT NULL,
	forename VARCHAR(30) NOT NULL,
	surname VARCHAR(30) NOT NULL,
	roleID VARCHAR(3) NOT NULL,
	SessionID VARCHAR(10),
	PRIMARY KEY(accountID)
	FOREIGN KEY(roleID) REFERENCES role ON DELETE NO ACTION ON UPDATE CASCADE);

CREATE TABLE session(
	sessionID CHAR(10) NOT NULL,
	accountID VARCHAR(10) NOT NULL,
	PRIMARY KEY(sessionID),
	FOREIGN KEY(accountID) REFERENCES account ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE measure(
	type varchar(20) NOT NULL,
	typeID INTEGER PRIMARY KEY AUTOINCREMENT);

CREATE TABLE fridgeSection(
	location VARCHAR(20) NOT NULL,
	locationID INTEGER PRIMARY KEY AUTOINCREMENT,
	capacity INT DEFAULT NULL);

CREATE TABLE foodInstance(
	quantity INT NOT NULL
		CONSTRAINT quantityIsPositive
			CHECK (quantity > 0 AND quantity < 1000),
	expiration DATE,
	locationID INTEGER NOT NULL,
	instanceID INTEGER NOT NULL,
	accountID VARCHAR(10) NOT NULL,
	shareable BOOLEAN NOT NULL,
	PRIMARY KEY(instanceID),
	FOREIGN KEY(accountID) REFERENCES account ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY(locationID) REFERENCES fridgeSection ON DELETE NO ACTION ON UPDATE CASCADE);

CREATE TABLE Manufacturer(
	manufacturer VARCHAR(30) NOT NULL,
	manufacturerID INTEGER PRIMARY KEY AUTOINCREMENT);

CREATE TABLE food(
	amount INT NOT NULL
		CONSTRAINT amountIsPositive
			CHECK (amount > 0 AND amount < 999999),
	EAN CHAR(13) NOT NULL,
	foodType VARCHAR(50) NOT NULL,
	amountType INT NOT NULL,
	manufacturerID INT NOT NULL,
	PRIMARY KEY(EAN),
	FOREIGN KEY(amountType) REFERENCES measure ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY(manufacturerID) REFERENCES manufacturer ON DELETE NO ACTION ON UPDATE CASCADE);

INSERT INTO role (accountRole)
VALUES ("Admin"), ("User");
