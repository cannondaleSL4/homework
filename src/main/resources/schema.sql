CREATE TABLE IF NOT EXISTS customer (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE,
  phoneNumber VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS team (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS project (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE,
  bugjet NUMERIC (18,2) NOT NULL,
  deadline TIMESTAMP NOT NULL DEFAULT (NOW()),
  customer_id INT NOT NULL, FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE IF NOT EXISTS projectTeam (
  id integer not null auto_increment,
  team_id INT NOT NULL, FOREIGN KEY (team_id) REFERENCES team(id),
  project_id INT NOT NULL, FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE IF NOT EXISTS rule (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS projectRule (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS ruleOfRole (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE,
  rule_id INT NOT NULL, FOREIGN KEY (rule_id) REFERENCES rule(id),
  projectRule_id INT NOT NULL, FOREIGN KEY (projectRule_id) REFERENCES projectRule(id)
);

CREATE TABLE IF NOT EXISTS userRole (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS projectMember (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE,
  surname VARCHAR(45) NOT NULL UNIQUE,
  patronymic VARCHAR(100) NOT NULL UNIQUE,
  address VARCHAR(100) NOT NULL UNIQUE,
  birthday TIMESTAMP NOT NULL DEFAULT (NOW()),
  login VARCHAR(10) NOT NULL UNIQUE,
  password VARCHAR(10) NOT NULL,
  userRole_id INT NOT NULL, FOREIGN KEY (userRole_id) REFERENCES userRole(id)
);

CREATE TABLE IF NOT EXISTS projectMemberRole (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE,
  projectRule_id INT NOT NULL, FOREIGN KEY (projectRule_id) REFERENCES projectRule(id),
  team_id INT NOT NULL, FOREIGN KEY (team_id) REFERENCES team(id),
  user_id INT NOT NULL, FOREIGN KEY (user_id) REFERENCES projectMember(id)
);

CREATE TABLE IF NOT EXISTS sprint (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE,
  startDate TIMESTAMP NOT NULL DEFAULT (NOW()),
  finishDate TIMESTAMP NOT NULL DEFAULT (NOW()),
  project_id INT NOT NULL, FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE IF NOT EXISTS priority (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS prioritySet (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE,
  project_id INT NOT NULL, FOREIGN KEY (project_id) REFERENCES project(id),
  priority_id INT NOT NULL, FOREIGN KEY (priority_id) REFERENCES priority(id)
);

CREATE TABLE IF NOT EXISTS documentType (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS requirement (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE,
  ddate TIMESTAMP NOT NULL DEFAULT (NOW()),
  project_id INT NOT NULL, FOREIGN KEY (project_id) REFERENCES project(id),
  user_id INT NOT NULL, FOREIGN KEY (user_id) REFERENCES projectMember(id),
  type_id INT NOT NULL, FOREIGN KEY (type_id) REFERENCES documentType(id)
);

CREATE TABLE IF NOT EXISTS status (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS taskType (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS entity (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS file (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE,
  content bytea NOT NULL,
  description VARCHAR(45) NOT NULL UNIQUE,
  entity_id INT NOT NULL, FOREIGN KEY (entity_id) REFERENCES entity(id)
);

CREATE TABLE IF NOT EXISTS comment (
  id integer not null auto_increment,
  text VARCHAR(45) NOT NULL UNIQUE,
  ddate TIMESTAMP NOT NULL DEFAULT (NOW())
);

CREATE TABLE IF NOT EXISTS taskHistory (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE,
  estimation VARCHAR(45) NOT NULL UNIQUE,
  task_id INT NOT NULL, FOREIGN KEY (task_id) REFERENCES taskType(id),
  comment_id INT NOT NULL, FOREIGN KEY (comment_id) REFERENCES comment(id),
  status_id INT NOT NULL, FOREIGN KEY (status_id) REFERENCES status(id)
);

CREATE TABLE IF NOT EXISTS sprintTask (
  id integer not null auto_increment,
  name VARCHAR(45) NOT NULL UNIQUE,
  description VARCHAR(45) NOT NULL UNIQUE,
  user_id INT NOT NULL, FOREIGN KEY (user_id) REFERENCES projectMember(id),
  priority_id INT NOT NULL, FOREIGN KEY (priority_id) REFERENCES priority(id)
);













--CREATE TABLE IF NOT EXISTS pharmacist (
--  id_pharmacist integer not null auto_increment,
--  name VARCHAR(45)  NOT NULL UNIQUE,
--  password VARCHAR(45)  NOT NULL,
--  user_group VARCHAR(45) NOT NULL,
--  CHECK (user_group IN ('employee','admin'))
--);
--
--CREATE TABLE IF NOT EXISTS drug (
--  id_drug integer not null auto_increment,
--  drug_name VARCHAR(45) NOT NULL UNIQUE
--);
--
--CREATE TABLE IF NOT EXISTS drug_store (
--  id_drug_store integer not null auto_increment,
--  id_drug INT NOT NULL, FOREIGN KEY (id_drug) REFERENCES drug(id_drug),
--  price numeric (18,2) NOT NULL,
--  amount int  NOT NULL,
--  CHECK (price >= 0),
--  CHECK (amount >= 0)
--);
--
--CREATE TABLE IF NOT EXISTS client (
--  id_client integer not null auto_increment,
--  name VARCHAR(45) NOT NULL UNIQUE,
--  password VARCHAR(45) NOT NULL,
--  user_group VARCHAR(45) NOT NULL,
--  CHECK (user_group IN ('user'))
--);
--
--CREATE TABLE IF NOT EXISTS order_t (
--  id_order integer not null auto_increment,
--  id_client INT NOT NULL, FOREIGN KEY (id_client) REFERENCES client(id_client),
--  id_pharmacist INT NOT NULL, FOREIGN KEY (id_pharmacist) REFERENCES pharmacist(id_pharmacist),
--  date TIMESTAMP NOT NULL DEFAULT (NOW())
--);
--
--CREATE TABLE  IF NOT EXISTS order_items (
--  id_items integer not null auto_increment,
--  id_order INT NOT NULL, FOREIGN KEY (id_order) REFERENCES order_t (id_order),
--  id_drug INT NOT NULL, FOREIGN KEY (id_drug) REFERENCES drug (id_drug),
--  price numeric (18,2) NOT NULL,
--  amount int NOT NULL
--);