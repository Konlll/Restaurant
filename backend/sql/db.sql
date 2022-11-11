CREATE DATABASE restaurant DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;

CREATE TABLE meals (
    `mealID` int AUTO_INCREMENT, 
    `name` varchar(255) NOT NULL,
	`price` int(5) NOT NULL, /* We assume Hungarian forints as the currency, so we use integers. */
	`allergens` VARCHAR(255) DEFAULT "",
	`mealType` enum("Leves", "Főétel", "Desszert"),
	`imagePath` VARCHAR(255) NOT NULL,
	`availability` VARCHAR(12) /* Left empty means always available, follows the format of HH:MM-HH:MM with the first being start, the latter being the end and the - seperates. */
	PRIMARY KEY(`mealID`)
);

CREATE TABLE drinks (
	`drinkID` int AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`price` int(5) NOT NULL, /* Hungarian forint assumed */
	`imagePath` VARCHAR(255) NOT NULL
	PRIMARY KEY(`drinkID`)
);