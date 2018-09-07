CREATE TABLE IF NOT EXISTS posts (
    id int unsigned not null auto_increment,
    body varchar(1200) not null,
    primary key(id)
);
