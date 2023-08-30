create database atores;

use atores;

create table actor(
actor_id int not null auto_increment,
name varchar(100) not null,
primary key (actor_id)
);

create table film(
film_id int not null auto_increment,
title varchar(100) not null,
genre varchar(100) not null,
primary key (film_id)
);

create table actor_film_mapping(
actor_id int not null,
film_id int not null,
id int not null auto_increment,
primary key(id),

foreign key (actor_id) references actor(actor_id),
foreign key (film_id) references film(film_id)
);

insert into actor (name) values ('PEDRO PASCAL');

select * from actor;

insert into film(title, genre) values ('THE LAST OF US', 'SUSPENSE');

select * from film;

insert into  actor_film_mapping(film_id, actor_id) values (1,1);

select * from actor_film_mapping
join film on actor_film_mapping.film_id = film.film_id
join actor on actor_film_mapping.actor_id = actor.actor_id;