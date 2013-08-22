drop schema if exists dumpmind;
create schema dumpmind default character set utf8;
use dumpmind;

create table user(
    `id` int(4) not null primary key,
    `name` varchar(40) not null,
    `email` varchar(100) not null,
    `password` varchar(100) not null
);
create table unit(
    `id` int(4) not null primary key,
    `name` varchar(40) not null
);
create table tag(
    `id` int(4) not null primary key,
    `name` varchar(40) not null
);
create table grocery(
    `id` int(4) not null primary key,
    `name` varchar(60) not null,
    `unit_fk` int(4) not null references unit(`id`),
    `price` int(4) not null,
    `tags` varchar(100) not null
);
create table course(
    `id` int(4) not null primary key,
    `name` varchar(60) not null,
    `tags` varchar(100) not null
);
create table course_grocery(
    `id` int(4) not null primary key,
    course_fk int(4) not null references course(`id`),
    grocery_fk int(4) not null references grocery(`id`)
);

create table plan(
    `id` int(4) not null primary key,
    `date` date not null,
    user_fk int(4) not null references `user`(`id`),
    course_fk int(4) not null references course(`id`),
    `tags` varchar(100) not null
);
