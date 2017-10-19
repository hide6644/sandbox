drop table if exists novel_chapter_info cascade;
drop table if exists novel_info cascade;
drop table if exists novel_chapter_history cascade;
drop table if exists novel_chapter cascade;
drop table if exists novel_history cascade;
drop table if exists novel cascade;

create table novel (
    id integer not null auto_increment,
    url varchar(100) not null,
    title varchar(100) default null,
    writername varchar(100) default null,
    description text default null,
    body mediumtext default null,
    deleted boolean default false,
    version integer default null,
    create_user varchar(16) default null,
    create_date timestamp default '0000-00-00 00:00:00',
    update_user varchar(16) default null,
    update_date timestamp default '0000-00-00 00:00:00',
    primary key (id),
    unique (url)
) engine = InnoDB default character set utf8;

create table novel_history (
    id integer not null auto_increment,
    novel_id integer not null,
    title varchar(100) default null,
    writername varchar(100) default null,
    description text default null,
    body mediumtext default null,
    version integer default null,
    create_user varchar(16) default null,
    create_date timestamp default '0000-00-00 00:00:00',
    update_user varchar(16) default null,
    update_date timestamp default '0000-00-00 00:00:00',
    primary key (id),
    foreign key (novel_id) references novel (id)
) engine = InnoDB default character set utf8;

create table novel_chapter (
    id integer not null auto_increment,
    novel_id integer not null,
    url varchar(100) not null,
    title varchar(100) default null,
    body mediumtext default null,
    version integer default null,
    create_user varchar(16) default null,
    create_date timestamp default '0000-00-00 00:00:00',
    update_user varchar(16) default null,
    update_date timestamp default '0000-00-00 00:00:00',
    primary key (id),
    unique (url),
    foreign key (novel_id) references novel (id)
) engine = InnoDB default character set utf8;

create table novel_chapter_history (
    id integer not null auto_increment,
    novel_chapter_id integer not null,
    title varchar(100) default null,
    body mediumtext default null,
    version integer default null,
    create_user varchar(16) default null,
    create_date timestamp default '0000-00-00 00:00:00',
    update_user varchar(16) default null,
    update_date timestamp default '0000-00-00 00:00:00',
    primary key (id),
    foreign key (novel_chapter_id) references novel_chapter (id)
) engine = InnoDB default character set utf8;

create table novel_info (
    id integer not null auto_increment,
    novel_id integer not null,
    checked_date datetime default null,
    modified_date datetime default null,
    finished boolean default false,
    keyword varchar(300) default null,
    favorite boolean default null,
    rank integer default null,
    version integer default null,
    create_user varchar(16) default null,
    create_date timestamp default '0000-00-00 00:00:00',
    update_user varchar(16) default null,
    update_date timestamp default '0000-00-00 00:00:00',
    primary key (id),
    foreign key (novel_id) references novel (id)
) engine = InnoDB default character set utf8;

create table novel_chapter_info (
    id integer not null auto_increment,
    novel_chapter_id integer not null,
    checked_date datetime default null,
    modified_date datetime default null,
    unread boolean default null,
    read_date datetime default null,
    version integer default null,
    create_user varchar(16) default null,
    create_date timestamp default '0000-00-00 00:00:00',
    update_user varchar(16) default null,
    update_date timestamp default '0000-00-00 00:00:00',
    primary key (id),
    index (unread),
    foreign key (novel_chapter_id) references novel_chapter (id)
) engine = InnoDB default character set utf8;
