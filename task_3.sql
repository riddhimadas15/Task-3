CREATE DATABASE IF NOT EXISTS ecommerce_analysis;
USE ecommerce_analysis;


CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(255),
  fname VARCHAR(50),
  lname VARCHAR(50),
  sex VARCHAR(10),
  passwd VARCHAR(50),
  is_active TINYINT(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sample Data
INSERT INTO users (id, user_name, fname, lname, sex, passwd, is_active) VALUES
(101, 'alex77', 'Alex', 'Stone', 'Male', 'hashed_pw_1', 1),
(102, 'linda23', 'Linda', 'Ray', 'Female', 'hashed_pw_2', 1),
(103, 'johnDoe', 'John', 'Doe', 'Male', 'hashed_pw_3', 1),
(104, 'emma88', 'Emma', 'Clark', 'Female', 'hashed_pw_4', 1),
(105, 'mike77', 'Mike', 'Lee', 'Male', 'hashed_pw_5', 1),
(106, 'nancy45', 'Nancy', 'Green', 'Female', 'hashed_pw_6', 1),
(107, 'sara91', 'Sara', 'Hill', 'Female', 'hashed_pw_7', 1),
(108, 'dave33', 'Dave', 'Brown', 'Male', 'hashed_pw_8', 1);

SELECT * FROM users;

SELECT * FROM users
WHERE sex = 'Female';

SELECT * FROM users
ORDER BY user_name ASC;

SELECT sex, COUNT(*) AS total_users
FROM users
GROUP BY sex;

SELECT fname, COUNT(*) AS freq
FROM users
GROUP BY fname
ORDER BY freq DESC;

SELECT *
FROM users
WHERE id > (
    SELECT ROUND(AVG(id), 0) FROM users
);

CREATE VIEW active_males AS
SELECT *
FROM users
WHERE sex = 'Male' AND is_active = 1;

CREATE TABLE IF NOT EXISTS login_records (
  record_id INT AUTO_INCREMENT PRIMARY KEY,
  uid INT,
  login_stamp DATETIME,
  FOREIGN KEY (uid) REFERENCES users(id)
);

SELECT u.user_name, u.fname, l.login_stamp
FROM users u
LEFT JOIN login_records l ON u.id = l.uid;

SELECT u.user_name, u.fname, l.login_stamp
FROM users u
RIGHT JOIN login_records l ON u.id = l.uid;

INSERT INTO login_records (uid, login_stamp) VALUES
(101, '2025-04-01 08:30:00'),
(102, '2025-04-01 09:45:00'),
(101, '2025-04-02 10:15:00'),
(104, '2025-04-02 11:00:00');

SELECT u.user_name, u.fname, l.login_stamp
FROM users u
JOIN login_records l ON u.id = l.uid;

CREATE INDEX gender_idx ON users(sex);