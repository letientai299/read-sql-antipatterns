CREATE TABLE IF NOT EXISTS Accounts (
  account_id BIGINT PRIMARY KEY,
  account_name VARCHAR(20),
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  email VARCHAR(100),
  password_hash CHAR(64),
  portrait_image_url TEXT,
  hourly_rate NUMERIC(9, 2)
);

CREATE TABLE IF NOT EXISTS BugStatus (
  status VARCHAR(20) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Bugs (
  bug_id BIGINT PRIMARY KEY,
  date_reported DATE NOT NULL,
  summary VARCHAR(80),
  description VARCHAR(1000),
  resolution VARCHAR(1000),
  reported_by BIGINT NOT NULL,
  assigned_to BIGINT NOT NULL,
  verified_by BIGINT NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'NEW',
  priority VARCHAR(20),
  hours numeric(9, 2),
  FOREIGN KEY (reported_by) REFERENCES Accounts (account_id),
  FOREIGN KEY (verified_by) REFERENCES Accounts (account_id),
  FOREIGN KEY (assigned_to) REFERENCES Accounts (account_id),
  FOREIGN KEY (status) REFERENCES BugStatus (status)
);

CREATE TABLE IF NOT EXISTS Comments (
  comment_id BIGINT PRIMARY KEY,
  bug_id BIGINT NOT NULL,
  author BIGINT NOT NULL,
  comment_date DATE NOT NULL,
  comment text NOT NULL, -- what is the different between text and varchar? And when to use them?
  FOREIGN KEY (bug_id) REFERENCES Bugs (bug_id),
  FOREIGN KEY (author) REFERENCES Accounts (account_id)
);

CREATE TABLE IF NOT EXISTS Screenshots (
  bug_id BIGINT NOT NULL,
  image_id BIGINT NOT NULL,
  screenshot_image_url TEXT,
  caption VARCHAR(100),
  PRIMARY KEY (bug_id,
    image_id),
  FOREIGN KEY (bug_id) REFERENCES Bugs (bug_id)
);

CREATE TABLE IF NOT EXISTS Tags (
  bug_id BIGINT NOT NULL,
  tag VARCHAR(20) NOT NULL,
  PRIMARY KEY (bug_id,
    tag),
  FOREIGN KEY (bug_id) REFERENCES Bugs (bug_id)
);

CREATE TABLE IF NOT EXISTS Products (
  product_id BIGINT PRIMARY KEY,
  product_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS BugProducts (
  bug_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  PRIMARY KEY (bug_id,
    product_id),
  FOREIGN KEY (bug_id) REFERENCES Bugs (bug_id),
  FOREIGN KEY (product_id) REFERENCES Products (product_id)
);
