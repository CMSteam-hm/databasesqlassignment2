CREATE DATABASE IF NOT EXISTS expense_tracker;
CREATE TABLE IF NOT EXISTS Expenses (
  expense_id INT PRIMARY KEY AUTO_INCREMENT,
  amount DECIMAL(10,2) NOT NULL,
  date DATE NOT NULL,
  category VARCHAR(50) NOT NULL
);
DELIMITER //

CREATE FUNCTION GetRandomDate(startDate DATE, endDate DATE)
RETURNS DATE
READS SQL DATA
DETERMINISTIC
BEGIN
  DECLARE randomDays INT;
  SET randomDays = FLOOR(RAND() * (DATEDIFF(endDate, startDate) + 1));
  RETURN DATE_ADD(startDate, INTERVAL randomDays DAY);
END; //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE InsertSampleData()
BEGIN
  DECLARE counter INT DEFAULT 1;

  WHILE counter <= 20 DO
    INSERT INTO Expenses (amount, date, category)
    VALUES (FLOOR(10 + RAND() * 100),
            GetRandomDate(DATE_SUB(CURDATE(), INTERVAL 4 YEAR), CURDATE()),  -- Random date within the last 4 years
            CASE WHEN counter % 4 = 0 THEN 'Groceries'
                 WHEN counter % 4 = 1 THEN 'Entertainment'
                 WHEN counter % 4 = 2 THEN 'Transportation'
                 ELSE 'Other'
            END);
    SET counter = counter + 1;
  END WHILE;
END; //

DELIMITER ;
CALL InsertSampleData();

-- Inserting additional sample data into Expenses table
INSERT INTO Expenses (amount, date, category) VALUES
(85.00, '2024-07-11', 'Food'),
(60.50, '2024-07-12', 'Transportation'),
(180.00, '2024-07-13', 'Shopping'),
(25.00, '2024-07-14', 'Entertainment'),
(110.75, '2024-07-15', 'Food'),
(35.20, '2024-07-16', 'Transportation'),
(220.00, '2024-07-17', 'Shopping'),
(18.50, '2024-07-18', 'Entertainment'),
(95.25, '2024-07-19', 'Food'),
(45.00, '2024-07-20', 'Transportation'),
(210.00, '2024-07-21', 'Shopping'),
(30.75, '2024-07-22', 'Entertainment'),
(120.50, '2024-07-23', 'Food'),
(50.25, '2024-07-24', 'Transportation'),
(190.00, '2024-07-25', 'Shopping'),
(22.00, '2024-07-26', 'Entertainment'),
(105.00, '2024-07-27', 'Food'),
(65.75, '2024-07-28', 'Transportation'),
(200.50, '2024-07-29', 'Shopping'),
(28.80, '2024-07-30', 'Entertainment'),
(115.25, '2024-07-31', 'Food'),
(55.00, '2024-08-01', 'Transportation'),
(240.00, '2024-08-02', 'Shopping'),
(20.50, '2024-08-03', 'Entertainment'),
(125.75, '2024-08-04', 'Food'),
(70.25, '2024-08-05', 'Transportation'),
(180.00, '2024-08-06', 'Shopping'),
(15.00, '2024-08-07', 'Entertainment'),
(100.00, '2024-08-08', 'Food'),
(40.50, '2024-08-09', 'Transportation'),
(195.00, '2024-08-10', 'Shopping'),
(27.80, '2024-08-11', 'Entertainment'),
(110.25, '2024-08-12', 'Food'),
(60.00, '2024-08-13', 'Transportation'),
(225.00, '2024-08-14', 'Shopping'),
(17.50, '2024-08-15', 'Entertainment'),
(90.75, '2024-08-16', 'Food'),
(48.25, '2024-08-17', 'Transportation'),
(185.00, '2024-08-18', 'Shopping'),
(23.00, '2024-08-19', 'Entertainment'),
(95.00, '2024-08-20', 'Food'),
(42.50, '2024-08-21', 'Transportation'),
(205.00, '2024-08-22', 'Shopping'),
(32.75, '2024-08-23', 'Entertainment'),
(115.50, '2024-08-24', 'Food'),
(58.00, '2024-08-25', 'Transportation'),
(235.00, '2024-08-26', 'Shopping'),
(19.50, '2024-08-27', 'Entertainment'),
(130.25, '2024-08-28', 'Food'),
(75.00, '2024-08-29', 'Transportation'),
(195.00, '2024-08-30', 'Shopping'),
(26.00, '2024-08-31', 'Entertainment'),
(120.00, '2024-09-01', 'Food'),
(65.50, '2024-09-02', 'Transportation'),
(210.00, '2024-09-03', 'Shopping'),
(14.75, '2024-09-04', 'Entertainment'),
(85.25, '2024-09-05', 'Food'),
(44.00, '2024-09-06', 'Transportation'),
(175.00, '2024-09-07', 'Shopping'),
(21.50, '2024-09-08', 'Entertainment'),
(105.75, '2024-09-09', 'Food'),
(52.25, '2024-09-10', 'Transportation'),
(190.00, '2024-09-11', 'Shopping'),
(31.00, '2024-09-12', 'Entertainment'),
(125.50, '2024-09-13', 'Food'),
(68.00, '2024-09-14', 'Transportation'),
(215.00, '2024-09-15', 'Shopping'),
(16.25, '2024-09-16', 'Entertainment'),
(95.00, '2024-09-17', 'Food'),
(46.50, '2024-09-18', 'Transportation'),
(200.00, '2024-09-19', 'Shopping'),
(29.80, '2024-09-20', 'Entertainment'),
(110.25, '2024-09-21', 'Food'),
(62.00, '2024-09-22', 'Transportation'),
(230.00, '2024-09-23', 'Shopping'),
(18.00, '2024-09-24', 'Entertainment'),
(135.75, '2024-09-25', 'Food'),
(80.25, '2024-09-26', 'Transportation'),
(185.00, '2024-09-27', 'Shopping'),
(24.50, '2024-09-28', 'Entertainment'),
(100.00, '2024-09-29', 'Food'),
(55.50, '2024-09-30', 'Transportation');

DROP PROCEDURE IF EXISTS InsertSampleData;
DROP FUNCTION IF EXISTS GetRandomDate;

CREATE DATABASE  IF NOT EXISTS `expense_tracker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `expense_tracker`;
DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `expenses` WRITE;
INSERT INTO `expenses` VALUES (1,'Groceries','Milk, Eggs, Bread',20.00,'2023-06-15'),(2,'Entertainment','Movie ticket',12.50,'2022-06-18'),(3,'Groceries','Fruits, Vegetables',35.75,'2021-06-20'),(4,'Transportation','Bus ticket',5.00,'2020-06-17'),(5,'Entertainment','Concert ticket',45.00,'2024-06-21'),(6,'Dining Out','Restaurant dinner',30.00,'2025-06-19'),(7,'Clothing','New shirt',15.99,'2026-04-12'),(8,'Bills','Electricity bill',75.40,'2027-02-01'),(9,'Other','Gift for friend',22.00,'2028-12-25'),(10,'Travel','Flight ticket',350.00,'2029-08-10');
UNLOCK TABLES;
