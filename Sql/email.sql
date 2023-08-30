create database emailServer;

use emailServer;

create table user(
	id bigint not null auto_increment,
	name varchar(100) not null,
	emailAddress varchar(100) not null,
	primary key(id)
);

create table email(
	id bigint not null auto_increment,
	subject varchar(150) not null,
	body varchar(5000),
    sentData datetime not null default now(),
    status enum('sketch', 'Sending', 'Sent') not null,
    userFK bigint not null,
    primary key(id),
    foreign key(userFK) references user(id)
    );
    
create table attachment(
	id bigint not null auto_increment,
	emailFK bigint not null,
	link varchar(1000) not null,
	fileName varchar(300) not null,
	size long not null,
	primary key(id),
	foreign key(emailFK) references email(id)
);

create table users_destination(
	id bigint not null auto_increment,
	userFK bigint not null,
	emailFK bigint not null,
	primary key(id),
	foreign key(userFK) references user(id),
	foreign key(emailFK) references email(id)
);

