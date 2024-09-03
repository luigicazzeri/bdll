create database livraria;
use livraria;
show databases;
show tables;
drop database livraria;

create table cliente(
id_cliente int(5) auto_increment,
nome varchar(11) not null,
celular varchar(20),
email varchar(20),
cep int (8),
numero_residencia varchar(5),
cpf varchar (11),
primary key(id_cliente)
);

create table vendedor(
id_vendedor int(5) auto_increment,
nome varchar(20),
telefone varchar(20),
email varchar(30),
primary key (id_vendedor)
);

create table pedido(
id_pedido int(5) auto_increment,
id_vendedor int(5),
id_cliente int(5),
descricao varchar(11) not null,
datapedido varchar(11),
valor varchar(20),
forma_pagamento varchar(20),
primary key(id_pedido),
foreign key(id_cliente) references cliente(id_cliente),
foreign key(id_vendedor) references vendedor(id_vendedor)
);

create table livros(
id_livro int(5) auto_increment,
nome varchar(40),
preco int(5),
editora varchar(20),
primary key (id_livro)
);

create table nota_fiscal(
idnota_fiscal int(5) auto_increment,
numero varchar(30),
primary key (idnota_fiscal)
);

create table livrospedidos(
id_cliente int(5),
id_vendedor int(5),
id_livro int(5),
id_pedido int(5),
idnota_fiscal int(5),

foreign key(id_cliente) references cliente(id_cliente),
foreign key(id_vendedor) references vendedor(id_vendedor),
foreign key(id_livro) references livros(id_livro),
foreign key(id_pedido) references pedido(id_pedido),
foreign key(idnota_fiscal) references nota_fiscal(idnota_fiscal)
);

create table estoque(
id_estoque int(5) auto_increment,
id_livro int(5),
quantidade varchar(45),
primary key (id_estoque),
foreign key(id_livro) references livros(id_livro)
);