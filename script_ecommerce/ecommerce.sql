-- criacao do banco de dados para o cenario  de e-commerce--

create database ecommerce;

use ecommerce;

create table cliente(
	idcliente int 	auto_increment primary key,
    nome varchar(10),
    segnome varchar(10),
    sobrenome varchar(20),
    cpf char(11) not null,
    endereco varchar(30),
    constraint unique_cpf_cliente unique (cpf)
   
);


create table produto(
	idproduto int 	auto_increment primary key,
    nome_prod varchar(30) not null,
    classificacao bool default false,
    categoria enum('Eletronicos', 'Vestuario', 'Brinquedos', 'Alimentos', 'Moveis') not null,
    avaliacao float default 0,
    dimensao varchar(10)
    
);

create table pagamento(
	idcliente int,
    idpagamento int,
    tipopagamento enum('Boleto', 'Cartao1', 'Cartao2'),
    avaliacaolimite float,
    primary key(idcliente, id_pagamento)

);

create table pedido(
	idpedido int auto_increment primary key,
    idpedidocliente int,
    status_pedido enum('Cancelado', 'Confirmado', 'Em Processamento') default 'Em Processamento',
    descricao_produto varchar (255),
    valorenvio float default 10,
    pagamentodinheiro bool default false,
    constraint fk_pedido_cliente foreign key (idpedidocliente) references cliente (idcliente)

);

create table estoque(
	idprodestoque int auto_increment primary	key,
    estoquelocalizacao varchar (255),
    quantidade int default 0
    
);

create table fornecedor(
	idfornecedor int auto_increment primary key,
    razaosocial varchar (255) not null,
    cnpj char(15),
    contato char (11) not null,
    constraint unique_fornecedor unique (cnpj)
);

create table vendedor(
	idvendedor int auto_increment primary key,
    razaosocial varchar (255) not null,
    nomefantasia varchar(255),
    cnpj char(15),
    cpf char (11),
    localizacao varchar (255),
    contato char (11) not null,
    constraint unique_cnpj_fornecedor unique (cnpj),
    constraint unique_cpf_vendedor unique (cnpj)
);

create table produtovendedor(
	idvendedor int,
    idproduto int,
    prodqualidade int default 1,
    primary key (idvendedor, idproduto),
    constraint fk_produto_vendedor foreign key (idvendedor) references vendedor(idvendedor),
    constraint fk_produto_vendedor foreign key (idProduto) references produto(idproduto)

);	





