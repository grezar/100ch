CREATE TABLE IF NOT EXISTS topics (
    id int unsigned not null auto_increment,
    name varchar(255) not null,
    board_id int unsigned not null,
    foreign key(board_id) references boards(id) on DELETE cascade,
    primary key(id)
);

