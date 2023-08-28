create database Netflix;
 use netflix;
 
 create table categorias (
	id bigint not null auto_increment,
    categoryName varchar(100) not null,
    primary key(id)
 );
 
 create table dataCriação(
	id bigint not null auto_increment,
    createDate date not null,
    primary key(id)
 );
 
 create table sinopse(
	id bigint not null auto_increment,
    sinopse varchar(100) not null,
    primary key(id)
 );
 
 create table titulo(
	id bigint not null auto_increment,
    title varchar(100) not null,
    primary key(id)
 );
 
 create table quantidadeExibida(
	id bigint not null auto_increment,
    quantityView bigint not null,
    primary key(id)
 );
 
 create table filme(
	id bigint not null auto_increment,
    categoryNameFK bigint not null,
    createDateFK bigint not null,
	sinopseFK bigint not null,
    quantyViewFK bigint not null,
    titleFK bigint not null,
    primary key(id),
    foreign key (categoryNameFK) references categorias(id),
    foreign key (createDateFK) references dataCriação(id),
    foreign key (sinopseFK) references sinopse(id),
    foreign key (quantyViewFK) references quantidadeExibida(id),
    foreign key (titleFK) references titulo(id)
 );
 
 create table user(
 id bigint not null auto_increment,
 Name varchar(100) not null,
 addressEmail varchar(150) not null,
 phone varchar(15) not null,
 filmFK bigint not null,
 primary key(id),
 foreign key(filmFK) references filme(id)
 );
 
 