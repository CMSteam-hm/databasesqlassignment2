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
select * FROM Expenses;
select  date, category,amount FROM Expenses;
SELECT * FROM expenses
WHERE date BETWEEN '2021-01-01' AND '2024-12-15';
SELECT * FROM Expenses
INSERT INTO Expenses (expense_id, amount, date, category) VALUES
 (1, 45.00, '2023-01-10', 'Groceries'),
 (2, 120.50, '2023-02-15', 'Entertainment'),
 (3, 60.00, '2023-03-05', 'Transportation'),
 (4, 75.25, '2023-04-12', 'Food'),
 (5, 30.00, '2023-05-21', 'Utilities'),
 (6, 1000.00, '2023-06-10', 'Rent'),
 (7, 55.75, '2023-07-18', 'Food'),
 (8, 200.00, '2023-08-05', 'Transportation'),
 (9, 15.00, '2023-09-25', 'Groceries'),
 (10, 85.00, '2023-10-11', 'Entertainment');
 SELECT * FROM Expenses
 WHERE category = 'Entertainment';
 SELECT * FROM Expenses
 WHERE amount > 50;
 SELECT * FROM Expenses 
 WHERE amount > 75 AND category = 'Food';
 SELECT * FROM Expenses 
 WHERE category = 'Transportation' OR category = 'Groceries';
 SELECT * FROM Expenses 
 WHERE category <> 'Rent';
 SELECT * FROM Expenses
 ORDER BY amount DESC;
 SELECT * FROM Expenses
 ORDER BY date DESC, category ASC;
 CREATE TABLE Income (
 income_id INT AUTO_INCREMENT PRIMARY KEY,
 amount DECIMAL(10,2) NOT NULL,
 date DATE NOT NULL,
 source VARCHAR(50) NOT NULL
);
 INSERT INTO Income (income_id, amount, date, source, category) VALUES
 (1, 3000.00, '2023-01-01', 'Salary', 'Full-time Job'),
 (2, 500.00, '2023-02-01', 'Freelance Work', 'Part-time Job'),
 (3, 1500.00, '2023-03-01', 'Salary', 'Full-time Job'),
 (4, 200.00, '2023-04-01', 'Investment', 'Stocks'),
 (5, 400.00, '2023-05-01', 'Freelance Work', 'Part-time Job');
ALTER TABLE Income
ADD COLUMN category VARCHAR(50);
ALTER TABLE Income
DROP COLUMN source;
 INSERT INTO Income (income_id, amount, date, source, category) VALUES
 (1, 3000.00, '2023-01-01', 'Salary', 'Full-time Job'),
 (2, 500.00, '2023-02-01', 'Freelance Work', 'Part-time Job'),
 (3, 1500.00, '2023-03-01', 'Salary', 'Full-time Job'),
 (4, 200.00, '2023-04-01', 'Investment', 'Stocks'),
 (5, 400.00, '2023-05-01', 'Freelance Work', 'Part-time Job');
DROP TABLE Income;

