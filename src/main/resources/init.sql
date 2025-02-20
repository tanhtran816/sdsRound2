CREATE TABLE users
(
    id           SERIAL PRIMARY KEY,
    first_name   VARCHAR(255) NOT NULL,
    last_name    VARCHAR(255) NOT NULL,
    email        VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(10),
    zip_code     VARCHAR(10)
);
INSERT INTO users (first_name, last_name, email, phone_number, zip_code)
VALUES ('anh', 'tran', 'anhtran@test.com', '0123456789', '10000');
