CREATE TABLE Accounts (
  account_id SERIAL PRIMARY KEY,
  account_name VARCHAR(20),
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  email VARCHAR(100),
  password_hash chart(64),
  portrait_image BLOB,
  hourly_rate NUMERIC(9,2),
);

CREATE TABLE Bugs (
  bug_id SERIAL PRIMARY KEY,
)
