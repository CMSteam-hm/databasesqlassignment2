CREATE DATABASE IF NOT EXISTS expense_tracker;
USE expense_tracker;
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

DROP PROCEDURE IF EXISTS InsertSampleData;
DROP FUNCTION IF EXISTS GetRandomDate
SELECT * FROM Expenses;

