--/* insert */
insert into customer (name,phone_number, address) values ('lisa','12-85-00', 'Moscow');
insert into customer (name,phone_number, address) values ('larisa','12-85-01', 'New York');
insert into customer (name,phone_number, address) values ('dima','12-85-03', 'Kiev');

insert into team (name) values ('cloud core team');
insert into team (name) values ('security team');
insert into team (name) values ('cloud BSS team');

insert into rule (name) values ('create');
insert into rule (name) values ('edit');
insert into rule (name) values ('delete');

insert into project_role (name) values ('junior developer');
insert into project_role (name) values ('middle developer');
insert into project_role (name) values ('senior developer');
insert into project_role (name) values ('lead developer');


insert into rule_of_role (rule_id, project_rule_id) values ((SELECT id from rule where name ='create'),(SELECT id from project_role where name ='junior developer'));
insert into rule_of_role (rule_id, project_rule_id) values ((SELECT id from rule where name ='create'),(SELECT id from project_role where name ='middle developer'));
insert into rule_of_role (rule_id, project_rule_id) values ((SELECT id from rule where name ='create'),(SELECT id from project_role where name ='senior developer'));
insert into rule_of_role (rule_id, project_rule_id) values ((SELECT id from rule where name ='create'),(SELECT id from project_role where name ='lead developer'));
insert into rule_of_role (rule_id, project_rule_id) values ((SELECT id from rule where name ='delete'),(SELECT id from project_role where name ='lead developer'));