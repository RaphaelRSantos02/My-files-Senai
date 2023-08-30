create database warehouse;

use warehouse;

create table productiLine(
	id bigint not null auto_increment,
	textDescription varchar(100) not null,
	htmalDescription varchar(100) not null,
	image text not null,
	primary key (id)
);

create table product(
	id bigint not null auto_increment,
	productName varchar(200) not null,
	productLineFK bigint not null,
	scale float,
	productVendor varchar(200) not null,
	description varchar(200) not null,
	quantity float not null,
	price float not null,
	msrp float,
	primary key(id),
	foreign key(productLineFK) references productiLine(id)
);
create table office(
	id bigint not null auto_increment,
	city varchar(170) not null,
	phone varchar(15) not null,
	addressLine1 varchar(150) not null,
	addressLine2 varchar(150),
	state varchar(100) not null,
	country varchar(100) not null,
	postalCode varchar(100),
	primary key(id)
);

create table employee(
	id bigint not null auto_increment,
	LastName varchar(100) not null,
	firstName varchar(100) not null,
	email varchar(250) not null,
	jobTitle varchar(200),
	officeCodeFK bigint not null,
	primary key(id),
	foreign key(officeCodeFK) references office(id)
);

create table customer(
	id bigint not null auto_increment,
	name varchar(200) not null,
	contactLastName varchar(100) not null,
	contactFirstName varchar(100) not null,
	city varchar(170) not null,
	phone varchar(15) not null,
	addressLine1 varchar(150) not null,
	addressLine2 varchar(150),
	state varchar(100) not null,
	country varchar(100) not null,
	creditLimit float not null,
    employeeFK bigint not null,
    primary key(id),
    foreign key(employeeFK) references employee(id)
);

create table payments(
	id bigint not null auto_increment,
    customerFK bigint not null,
    paymentDate datetime not null default now(),
    primary key(id),
    foreign key(customerFK) references customer(id)
    );
    
create table orders(
    id bigint not null auto_increment,
    orderDate datetime not null default now(),
    requireDate datetime,
    shippedDate datetime,
    status varchar(1) not null default "P",
    comments varchar(100),
    customerFK bigint not null,
    primary key(id),
    foreign key(customerFK) references customer(id)
    );

create table orderDetails(
	id bigint not null auto_increment,
	orderFK bigint not null,
	productFK bigint not null,
	quantityOrdered float not null,
	price float not null,
	primary key(id),
  foreign key(orderFK) references orders(id),
	foreign key(productFK) references product(id)
);