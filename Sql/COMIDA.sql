create database nutricao;

use nutricao;

create table users(
id bigint not null auto_increment,
user_name varchar(50) not null,
user_age int not null,
user_dob datetime not null default now(),
user_height double not null,
user_weight int not null,
primary key(id)
);

insert into users(user_name,user_age,user_dob,user_height,user_weight) value ('Vandeley', '30', '2002-01-21 20:30:00', '1.70', '70');

create table day(
id bigint not null auto_increment,
user_FK bigint not null,
day date not null,
primary key (id),
foreign key (user_FK) references users(id)
);

select * from users;

insert into day(day, user_FK) value ('2023-02-20', '3');

select * from day;

 create table meals(
meal_num bigint not null auto_increment,
calorias int not null,
fat int not null,
carbohydrates int not null,
fibre int not null,
protein int not null,
day_fk bigint not null,
primary key (meal_num),
foreign key (day_fk) references day(id)
);


insert into meals(calorias, fat, carbohydrates, fibre, protein, day_fk) value ('143', '1', '0', '0', '26', '2');
 

