-- +micrate Up
CREATE TABLE user_types (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  wording VARCHAR(255),
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);


-- +micrate Down
DROP TABLE IF EXISTS user_types;
