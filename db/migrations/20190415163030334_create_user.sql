-- +micrate Up
CREATE TABLE users (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  user_type_id BIGINT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
CREATE INDEX user_type_id_idx ON users (
  user_type_id
);

-- +micrate Down
DROP TABLE IF EXISTS users;
