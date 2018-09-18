CREATE TABLE IF NOT EXISTS posts (
    id int unsigned not null auto_increment,
    body varchar(1200) not null,
    primary key(id)
);

ALTER TABLE posts ADD topic_id int unsigned not null;
ALTER TABLE posts ADD foreign key (topic_id) references topics(id) on DELETE cascade;

