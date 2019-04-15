-- +micrate Up
CREATE TABLE payment_methods (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  wording TEXT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);


-- +micrate Down
DROP TABLE IF EXISTS payment_methods;
