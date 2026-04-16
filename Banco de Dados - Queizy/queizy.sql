drop database if exists queizy;
create database queizy character set utf8mb4 collate utf8mb4_unicode_ci;
use queizy;

-- tabelas principais
create table estado (
    uf char(2) primary key,
    nome varchar(50) not null unique
);

insert into estado (uf, nome) values
('AC','Acre'),
('AL','Alagoas'),
('AP','Amapá'),
('AM','Amazonas'),
('BA','Bahia'),
('CE','Ceará'),
('DF','Distrito Federal'),
('ES','Espírito Santo'),
('GO','Goiás'),
('MA','Maranhão'),
('MT','Mato Grosso'),
('MS','Mato Grosso do Sul'),
('MG','Minas Gerais'),
('PA','Pará'),
('PB','Paraíba'),
('PR','Paraná'),
('PE','Pernambuco'),
('PI','Piauí'),
('RJ','Rio de Janeiro'),
('RN','Rio Grande do Norte'),
('RS','Rio Grande do Sul'),
('RO','Rondônia'),
('RR','Roraima'),
('SC','Santa Catarina'),
('SP','São Paulo'),
('SE','Sergipe'),
('TO','Tocantins');

create table cidade (
    idCidade int primary key,
    nome varchar(85) not null,
    uf char(2) not null,
    constraint fk_cidade_estado foreign key (uf) references estado(uf)
);

create table bairro (
    idBairro int primary key,
    idCidade int not null,
    nome varchar(85) not null,
    constraint fk_bairro_cidade foreign key (idCidade) references cidade(idCidade)
);

create table tipoEndereco (
    idTipoEndereco int primary key,
    nome varchar(30) not null unique
);

create table endereco (
    idEndereco int primary key,
    idTipoEndereco int not null,
    idBairro int not null,
    nome varchar(100) not null,
    numero varchar(6) not null,
    cep char(9) not null,
    constraint fk_endereco_tipo foreign key (idTipoEndereco) references tipoEndereco(idTipoEndereco),
    constraint fk_endereco_bairro foreign key (idBairro) references bairro(idBairro)
);

create table cliente (
    idCliente int primary key,
    idEndereco int not null,
    nome varchar(130) not null,
    sexo char(1) not null,
    idade int not null,
    constraint chk_cliente_sexo check (sexo in ('M','F')),
    constraint chk_cliente_idade check (idade >= 0),
    constraint fk_cliente_endereco foreign key (idEndereco) references endereco(idEndereco)
);

create table telefone (
    idCliente int not null,
    numeroTelefone varchar(15) not null,
    primary key (idCliente, numeroTelefone),
    constraint fk_telefone_cliente foreign key (idCliente) references cliente(idCliente)
);

create table categoria (
    idCategoria int primary key,
    nome varchar(45) not null unique
);

create table fornecedor (
    idFornecedor int primary key,
    idEndereco int not null,
    nomeFornecedor varchar(45) not null,
    constraint fk_fornecedor_endereco foreign key (idEndereco) references endereco(idEndereco)
);

create table produto (
    idProduto int primary key,
    idFornecedor int not null,
    idCategoria int not null,
    nome varchar(130) not null,
    quantidade int not null,
    valorUnitario decimal(10,2) not null,
    constraint chk_produto_quantidade check (quantidade >= 0),
    constraint chk_produto_valor check (valorUnitario >= 0),
    constraint fk_produto_fornecedor foreign key (idFornecedor) references fornecedor(idFornecedor),
    constraint fk_produto_categoria foreign key (idCategoria) references categoria(idCategoria)
);

create table departamento (
    idDepartamento int primary key,
    nome varchar(45) not null unique
);

create table funcionario (
    idFuncionario int primary key,
    idSupervisor int null,
    idEndereco int not null,
    nome varchar(130) not null,
    idade int not null,
    sexo char(1) not null,
    dataContratacao date not null,
    dataDemissao date null,
    demissao boolean not null default false,
    salario decimal(10,2) not null,
    constraint chk_func_sexo check (sexo in ('M','F')),
    constraint chk_func_idade check (idade >= 16),
    constraint chk_func_salario check (salario >= 0),
    constraint fk_func_supervisor foreign key (idSupervisor) references funcionario(idFuncionario),
    constraint fk_func_endereco foreign key (idEndereco) references endereco(idEndereco)
);

create table compra (
    idCompra int primary key,
    idCliente int not null,
    idFuncionario int not null,
    dataCompra date not null,
    valorTotalCompra decimal(12,2) not null,
    formaPagamento varchar(15) not null,
    finalizada boolean not null default true,
    constraint chk_compra_valor check (valorTotalCompra >= 0),
    constraint fk_compra_cliente foreign key (idCliente) references cliente(idCliente),
    constraint fk_compra_funcionario foreign key (idFuncionario) references funcionario(idFuncionario)
);

create table itemCompra (
    idItemCompra int primary key,
    idProduto int not null,
    idCompra int not null,
    quantidade int not null,
    valorTotal decimal(12,2) not null,
    constraint chk_item_qtd check (quantidade > 0),
    constraint chk_item_valor check (valorTotal >= 0),
    constraint fk_item_produto foreign key (idProduto) references produto(idProduto),
    constraint fk_item_compra foreign key (idCompra) references compra(idCompra)
);

create table deptFunc (
    idDeptFunc int primary key,
    idDepartamento int not null,
    idFuncionario int not null,
    dataEntradaDept date not null,
    dataSaidaDept date null,
    constraint fk_deptfunc_departamento foreign key (idDepartamento) references departamento(idDepartamento),
    constraint fk_deptfunc_funcionario foreign key (idFuncionario) references funcionario(idFuncionario)
);

create table dependente (
    idDependente int primary key,
    idFuncionario int not null,
    nome varchar(130) not null,
    sexo char(1) not null,
    dataNascimento date not null,
    constraint chk_dep_sexo check (sexo in ('M','F')),
    constraint fk_dependente_funcionario foreign key (idFuncionario) references funcionario(idFuncionario)
);

-- inserts
insert into cidade (idCidade, nome, uf) values
(1,'São Paulo','SP'),
(2,'Campinas','SP'),
(3,'Rio de Janeiro','RJ'),
(4,'Niterói','RJ'),
(5,'Belo Horizonte','MG');

insert into bairro (idBairro, idCidade, nome) values
(1,1,'Centro'),
(2,1,'Vila Mariana'),
(3,2,'Cambuí'),
(4,3,'Copacabana'),
(5,5,'Savassi');

insert into tipoEndereco (idTipoEndereco, nome) values
(1,'Residencial'),
(2,'Comercial'),
(3,'Entrega');

insert into endereco (idEndereco, idTipoEndereco, idBairro, nome, numero, cep) values
(1,1,1,'Rua das Flores','100','01001-000'),
(2,1,2,'Av. Paulista','1500','01310-200'),
(3,2,3,'Rua Barão de Jaguara','250','13015-002'),
(4,1,4,'Rua Atlântica','500','22010-000'),
(5,2,5,'Av. do Contorno','9000','30110-000'),
(6,3,1,'Rua Augusta','450','01305-000'),
(7,1,3,'Rua Conceição','77','13010-050'),
(8,2,4,'Rua da Praia','88','22020-020');

insert into cliente (idCliente, idEndereco, nome, sexo, idade) values
(1,'1','Ana Souza','F',24),
(2,'2','Bruno Lima','M',31),
(3,'4','Carla Mendes','F',29);

insert into telefone (idCliente, numeroTelefone) values
(1,'11999990001'),
(1,'1133330001'),
(2,'11988880002'),
(3,'21977770003');

insert into categoria (idCategoria, nome) values
(1,'Bebidas'),
(2,'Limpeza'),
(3,'Mercearia');

insert into fornecedor (idFornecedor, idEndereco, nomeFornecedor) values
(1,3,'Distribuidora Alpha'),
(2,5,'Comercial Beta');

insert into produto (idProduto, idFornecedor, idCategoria, nome, quantidade, valorUnitario) values
(1,1,1,'Refrigerante 2L',50,9.90),
(2,1,3,'Arroz 5kg',30,24.50),
(3,2,2,'Detergente 500ml',80,2.80),
(4,2,3,'Feijão 1kg',60,8.30);

insert into departamento (idDepartamento, nome) values
(1,'Vendas'),
(2,'Estoque'),
(3,'RH');

insert into funcionario (idFuncionario, idSupervisor, idEndereco, nome, idade, sexo, dataContratacao, dataDemissao, demissao, salario) values
(1,null,6,'Mariana Costa',40,'F','2020-01-10',null,false,6500.00),
(2,1,7,'Pedro Alves',28,'M','2021-03-15',null,false,3200.00),
(3,1,8,'Juliana Rocha',35,'F','2019-11-20',null,false,4100.00);

insert into dependente (idDependente, idFuncionario, nome, sexo, dataNascimento) values
(1,1,'Lucas Costa','M','2012-05-17'),
(2,2,'Sofia Alves','F','2018-09-30');

insert into deptFunc (idDeptFunc, idDepartamento, idFuncionario, dataEntradaDept, dataSaidaDept) values
(1,1,1,'2020-01-10',null),
(2,1,2,'2021-03-15',null),
(3,2,3,'2019-11-20',null);

insert into compra (idCompra, idCliente, idFuncionario, dataCompra, valorTotalCompra, formaPagamento, finalizada) values
(1,1,2,'2026-04-10',44.10,'cartao',true),
(2,2,2,'2026-04-11',33.20,'pix',true),
(3,3,1,'2026-04-12',19.80,'dinheiro',true);

insert into itemCompra (idItemCompra, idProduto, idCompra, quantidade, valorTotal) values
(1,1,1,2,19.80),
(2,2,1,1,24.50),
(3,4,2,4,33.20),
(4,1,3,2,19.80);

-- views para testes
create or replace view vw_clientes_com_endereco as
select
    c.idCliente,
    c.nome as cliente,
    c.sexo,
    c.idade,
    e.nome as logradouro,
    e.numero,
    b.nome as bairro,
    ci.nome as cidade,
    es.uf
from cliente c
join endereco e on e.idEndereco = c.idEndereco
join bairro b on b.idBairro = e.idBairro
join cidade ci on ci.idCidade = b.idCidade
join estado es on es.uf = ci.uf;

create or replace view vw_produtos_detalhado as
select
    p.idProduto,
    p.nome as produto,
    p.quantidade,
    p.valorUnitario,
    cat.nome as categoria,
    f.nomeFornecedor as fornecedor
from produto p
join categoria cat on cat.idCategoria = p.idCategoria
join fornecedor f on f.idFornecedor = p.idFornecedor;

create or replace view vw_compras_resumo as
select
    cp.idCompra,
    cp.dataCompra,
    cl.nome as cliente,
    fu.nome as funcionario,
    cp.formaPagamento,
    cp.valorTotalCompra,
    cp.finalizada
from compra cp
join cliente cl on cl.idCliente = cp.idCliente
join funcionario fu on fu.idFuncionario = cp.idFuncionario;

-- procedures de teste
delimiter $$

create procedure sp_reajuste_preco_categoria (
    in p_idCategoria int,
    in p_percentual decimal(5,2)
)
begin
    update produto
    set valorUnitario = valorUnitario * (1 + p_percentual / 100)
    where idCategoria = p_idCategoria;
end $$

create procedure sp_listar_compras_cliente (
    in p_idCliente int
)
begin
    select
        c.idCompra,
        c.dataCompra,
        c.valorTotalCompra,
        c.formaPagamento
    from compra c
    where c.idCliente = p_idCliente
    order by c.dataCompra desc;
end $$

delimiter ;

-- function de teste
delimiter $$

create function fn_total_itens_compra (p_idCompra int)
returns decimal(12,2)
deterministic
begin
    declare v_total decimal(12,2);
    select coalesce(sum(valorTotal),0) into v_total
    from itemCompra
    where idCompra = p_idCompra;
    return v_total;
end $$

delimiter ;

-- trigger de teste
delimiter $$

create trigger trg_itemcompra_bi
before insert on itemCompra
for each row
begin
    declare v_qtd int;

    select quantidade into v_qtd
    from produto
    where idProduto = new.idProduto
    for update;

    if v_qtd is null then
        signal sqlstate '45000' set message_text = 'Produto inexistente.';
    end if;

    if v_qtd < new.quantidade then
        signal sqlstate '45000' set message_text = 'Estoque insuficiente.';
    end if;

    update produto
    set quantidade = quantidade - new.quantidade
    where idProduto = new.idProduto;
end $$

delimiter ;

-- índices simples para consulta
create index idx_cliente_nome on cliente(nome);
create index idx_produto_nome on produto(nome);
create index idx_compra_data on compra(dataCompra);

-- selects de conferência
select * from estado;
select * from cidade;
select * from bairro;
select * from tipoEndereco;
select * from endereco;
select * from cliente;
select * from telefone;
select * from categoria;
select * from fornecedor;
select * from produto;
select * from departamento;
select * from funcionario;
select * from compra;
select * from itemCompra;
select * from deptFunc;
select * from dependente;
select * from vw_clientes_com_endereco;
select * from vw_produtos_detalhado;
select * from vw_compras_resumo;
select fn_total_itens_compra(1) as total_compra_1;