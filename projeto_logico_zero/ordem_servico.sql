create database ordem;
use ordem;

show databases;


use ordem;

create table cliente(
idcliente int auto_increment primary key,
nome varchar(45) not null,
cpf varchar(15) not null,
contato varchar(45)

);

create table pedido(
idpedido int auto_increment primary key,
servico varchar(15) not null,
descricao varchar(45) not null,
datasolitacao date not null,
liberacao boolean not null,
id_cliente INT UNIQUE,
FOREIGN KEY(id_cliente)
REFERENCES cliente(idcliente)

);


create table ordemserv(
idordemserv int auto_increment primary key,
status_os varchar(45) not null,
id_pedido int unique,
foreign key (id_pedido)
references pedido(idpedido),
id_cliente INT UNIQUE,
FOREIGN KEY(id_cliente)
REFERENCES cliente(idcliente)


);

create table responsavel(
idresponsavel int auto_increment primary key,
nivelhelpdesk int,
nome varchar(45) not null,
departamento varchar (45) not null

);


create table analisepedido(
id_responsavel INT UNIQUE,
FOREIGN KEY(id_responsavel)
REFERENCES responsavel(idresponsavel),
id_pedido INT UNIQUE,
FOREIGN KEY(id_pedido)
REFERENCES pedido(idpedido)


);


show tables;