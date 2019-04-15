-- +micrate Up
CREATE TABLE invoices (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  amount FLOAT,
  tva FLOAT,
  type VARCHAR(255),
  date TIMESTAMP NULL,
  paid BOOL,
  user_id BIGINT,
  payment_method_id BIGINT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
CREATE INDEX user_id_idx ON invoices (
  user_id
);
CREATE INDEX payment_method_id_idx ON invoices (
  payment_method_id
);

-- +micrate Down
DROP TABLE IF EXISTS invoices;
