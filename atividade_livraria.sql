create database livraria;
use livraria;
show databases;
show tables;
drop database livraria;

create table cliente(
id_cliente int(5) auto_increment,
nome varchar(30) not null,
celular varchar(20),
email varchar(30),
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

INSERT INTO cliente (nome, celular, email, cep, numero_residencia, cpf) VALUES
('Ana Silva', '11987654321', 'ana.silva@example.com', 12345678, '123', '12345678900'),
('João Santos', '21987654321', 'joao.santos@example.com', 23456789, '456', '23456789012'),
('Maria Oliveira', '31987654321', 'maria.oliveira@example.com', 34567890, '789', '34567890123'),
('Carlos Pereira', '41987654321', 'carlos.pereira@example.com', 45678901, '101', '45678901234'),
('Fernanda Costa', '51987654321', 'fernanda.costa@example.com', 56789012, '202', '56789012345');

INSERT INTO vendedor (nome, telefone, email) VALUES
('Lucas Almeida', '11912345678', 'lucas.almeida@example.com'),
('Beatriz Costa', '21912345678', 'beatriz.costa@example.com'),
('Rafael Oliveira', '31912345678', 'rafael.oliveira@example.com'),
('Juliana Santos', '41912345678', 'juliana.santos@example.com'),
('Eduardo Ferreira', '51912345678', 'eduardo.ferreira@example.com');

INSERT INTO pedido (id_vendedor, id_cliente, descricao, datapedido, valor, forma_pagamento) VALUES
(1, 1, 'Venda A', '2024-09-15', '150.00', 'Cartão de Crédito'),
(2, 2, 'Venda B', '2024-09-16', '200.00', 'Boleto'),
(3, 3, 'Venda C', '2024-09-17', '250.00', 'Débito em Conta'),
(4, 4, 'Venda D', '2024-09-18', '300.00', 'Pix'),
(5, 5, 'Venda E', '2024-09-19', '350.00', 'Cartão de Crédito');

INSERT INTO livros (nome, preco, editora) VALUES
('O Guia do Mochileiro das Galáxias', 25, 'Arqueiro'),
('1984', 30, 'Companhia das Letras'),
('Dom Casmurro', 20, 'Editora Globo'),
('Harry Potter e a Pedra Filosofal', 40, 'Rocco'),
('O Senhor dos Anéis', 50, 'Martins Fontes');

INSERT INTO nota_fiscal (numero) VALUES
('NF-2024-0001'),
('NF-2024-0002'),
('NF-2024-0003'),
('NF-2024-0004'),
('NF-2024-0005');

INSERT INTO estoque (id_livro, quantidade) VALUES
(1, 50),
(2, 30),
(3, 20),
(4, 15),
(5, 25);
