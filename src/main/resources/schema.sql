CREATE TABLE IF NOT EXISTS customer (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE,
  phone_number VARCHAR(45) NOT NULL UNIQUE,
  address VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS team (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS project (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE,
  bugjet NUMERIC (18,2) NOT NULL,
  deadline TIMESTAMP NOT NULL DEFAULT (NOW()),
  customer_id INT NOT NULL, FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE IF NOT EXISTS projectTeam (
  id serial PRIMARY KEY,
  team_id INT NOT NULL, FOREIGN KEY (team_id) REFERENCES team(id),
  project_id INT NOT NULL, FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE IF NOT EXISTS rule (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS project_role (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS rule_of_role (
  rule_id INT NOT NULL, FOREIGN KEY (rule_id) REFERENCES rule(id),
  project_rule_id INT NOT NULL, FOREIGN KEY (project_rule_id) REFERENCES project_role(id),
  PRIMARY KEY (rule_id, project_rule_id)
);

CREATE TABLE IF NOT EXISTS user_role (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS project_member (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE,
  surname VARCHAR(45) NOT NULL UNIQUE,
  patronymic VARCHAR(100) NOT NULL UNIQUE,
  address VARCHAR(100) NOT NULL UNIQUE,
  birthday TIMESTAMP NOT NULL DEFAULT (NOW()),
  login VARCHAR(10) NOT NULL UNIQUE,
  password VARCHAR(10) NOT NULL,
  user_role_id INT NOT NULL, FOREIGN KEY (user_role_id) REFERENCES user_role(id)
);

CREATE TABLE IF NOT EXISTS project_memberRole (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE,
  project_role_id INT NOT NULL, FOREIGN KEY (project_role_id) REFERENCES project_role(id),
  team_id INT NOT NULL, FOREIGN KEY (team_id) REFERENCES team(id),
  user_id INT NOT NULL, FOREIGN KEY (user_id) REFERENCES project_member(id)
);

CREATE TABLE IF NOT EXISTS sprint (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE,
  startDate TIMESTAMP NOT NULL DEFAULT (NOW()),
  finishDate TIMESTAMP NOT NULL DEFAULT (NOW()),
  project_id INT NOT NULL, FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE IF NOT EXISTS priority (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS priority_set (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE,
  project_id INT NOT NULL, FOREIGN KEY (project_id) REFERENCES project(id),
  priority_id INT NOT NULL, FOREIGN KEY (priority_id) REFERENCES priority(id)
);

CREATE TABLE IF NOT EXISTS document_type (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS requirement (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE,
  ddate TIMESTAMP NOT NULL DEFAULT (NOW()),
  project_id INT NOT NULL, FOREIGN KEY (project_id) REFERENCES project(id),
  user_id INT NOT NULL, FOREIGN KEY (user_id) REFERENCES project_member(id),
  type_id INT NOT NULL, FOREIGN KEY (type_id) REFERENCES document_type(id)
);

CREATE TABLE IF NOT EXISTS status (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS task_type (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS entity (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS file (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE,
  content bytea NOT NULL,
  description VARCHAR(45) NOT NULL UNIQUE,
  entity_id INT NOT NULL, FOREIGN KEY (entity_id) REFERENCES entity(id)
);

CREATE TABLE IF NOT EXISTS comment (
  id serial PRIMARY KEY,
  text VARCHAR(45) NOT NULL UNIQUE,
  ddate TIMESTAMP NOT NULL DEFAULT (NOW())
);

CREATE TABLE IF NOT EXISTS task_history (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE,
  estimation VARCHAR(45) NOT NULL UNIQUE,
  task_id INT NOT NULL, FOREIGN KEY (task_id) REFERENCES task_type(id),
  comment_id INT NOT NULL, FOREIGN KEY (comment_id) REFERENCES comment(id),
  status_id INT NOT NULL, FOREIGN KEY (status_id) REFERENCES status(id)
);

CREATE TABLE IF NOT EXISTS sprintTask (
  id serial PRIMARY KEY,
  name VARCHAR(45) NOT NULL UNIQUE,
  description VARCHAR(45) NOT NULL UNIQUE,
  user_id INT NOT NULL, FOREIGN KEY (user_id) REFERENCES project_member(id),
  priority_id INT NOT NULL, FOREIGN KEY (priority_id) REFERENCES priority(id)
);













--CREATE TABLE IF NOT EXISTS pharmacist (
--  id_pharmacist serial PRIMARY KEY,
--  name VARCHAR(45)  NOT NULL UNIQUE,
--  password VARCHAR(45)  NOT NULL,
--  user_group VARCHAR(45) NOT NULL,
--  CHECK (user_group IN ('employee','admin'))
--);
--
--CREATE TABLE IF NOT EXISTS drug (
--  id_drug serial PRIMARY KEY,
--  drug_name VARCHAR(45) NOT NULL UNIQUE
--);
--
--CREATE TABLE IF NOT EXISTS drug_store (
--  id_drug_store serial PRIMARY KEY,
--  id_drug INT NOT NULL, FOREIGN KEY (id_drug) REFERENCES drug(id_drug),
--  price numeric (18,2) NOT NULL,
--  amount int  NOT NULL,
--  CHECK (price >= 0),
--  CHECK (amount >= 0)
--);
--
--CREATE TABLE IF NOT EXISTS client (
--  id_client serial PRIMARY KEY,
--  name VARCHAR(45) NOT NULL UNIQUE,
--  password VARCHAR(45) NOT NULL,
--  user_group VARCHAR(45) NOT NULL,
--  CHECK (user_group IN ('user'))
--);
--
--CREATE TABLE IF NOT EXISTS order_t (
--  id_order serial PRIMARY KEY,
--  id_client INT NOT NULL, FOREIGN KEY (id_client) REFERENCES client(id_client),
--  id_pharmacist INT NOT NULL, FOREIGN KEY (id_pharmacist) REFERENCES pharmacist(id_pharmacist),
--  date TIMESTAMP NOT NULL DEFAULT (NOW())
--);
--
--CREATE TABLE  IF NOT EXISTS order_items (
--  id_items serial PRIMARY KEY,
--  id_order INT NOT NULL, FOREIGN KEY (id_order) REFERENCES order_t (id_order),
--  id_drug INT NOT NULL, FOREIGN KEY (id_drug) REFERENCES drug (id_drug),
--  price numeric (18,2) NOT NULL,
--  amount int NOT NULL
--);