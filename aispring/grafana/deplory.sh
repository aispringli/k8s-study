create
database grafana default character set utf8mb4 collate utf8mb4_general_ci;

create user 'grafana'@'%' identified by 'grafana';
grant all privileges on grafana.* to 'grafana'@'%' with grant option;
flush privileges;