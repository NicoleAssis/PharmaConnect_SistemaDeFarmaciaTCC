create database bdfarmacia;

CREATE USER 'teste'@'%' IDENTIFIED BY '123';

GRANT ALL ON *.* TO 'teste'@'%' WITH GRANT OPTION;

flush privileges;

USE bdfarmacia;

CREATE TABLE NivelAcesso (
nivel_id INT AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(100)
);

select * from NivelAcesso;
INSERT INTO bdfarmacia.nivelacesso
(nivel_id, descricao)
VALUES
(1, 'Administrador'),
(2, 'Usuário');

CREATE TABLE tb_clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    cpf_cliente  BIGINT(11) UNIQUE NOT NULL ,
    nome_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) NOT NULL,
    telefone_cliente VARCHAR(11),
    celular_cliente VARCHAR(11),
    cep_cliente VARCHAR(8),
    endereco_cliente VARCHAR(255),
    numero_cliente INT,
    complemento_cliente VARCHAR(100),
    bairro_cliente VARCHAR(100),
    cidade_cliente VARCHAR(100),
    estado_cliente VARCHAR(2),
    senha_cliente VARCHAR(10) NOT NULL,
    nivel_acesso int,
    FOREIGN KEY (nivel_acesso) references NivelAcesso(nivel_id)
);

CREATE TABLE tb_administrador(
id INT AUTO_INCREMENT PRIMARY KEY,
cnpj_administrador BIGINT(14) UNIQUE NULL,
nome_administrador VARCHAR(100) NOT NULL,
email_administrador VARCHAR(100) NOT NULL,
telefone_administrador VARCHAR(11),
celular_administrador VARCHAR(11),
cep_administrador VARCHAR(8),
endereco_administrador VARCHAR(255),
numero_administrador INT,
complemento_administrador VARCHAR(100),
bairro_administrador VARCHAR(100),
cidade_administrador VARCHAR(100),
estado_administrador VARCHAR(2),
senha_administrador VARCHAR(10) NOT NULL,
nivel_acesso INT,
FOREIGN KEY (nivel_acesso) REFERENCES NivelAcesso(nivel_id)
);

CREATE TABLE tb_produto(
    id_produto    INT(14)  AUTO_INCREMENT PRIMARY KEY,
    nome_produto  VARCHAR(255),
    desc_produto  VARCHAR(255),
    preco_produto Decimal(10,2),
    qtd_estoque   INT(11),
    departamento VARCHAR(100)
);

CREATE TABLE tb_pagamento(
	id_pagamento INT(14)  AUTO_INCREMENT PRIMARY KEY,
	tipo_pag VARCHAR(255),
    num_cartao VARCHAR(255),
    mes VARCHAR(255),
    ano VARCHAR(255),
    cvv VARCHAR(255),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id)
);

CREATE TABLE tb_carrinho(
    id_carrinho    INT(14)  AUTO_INCREMENT PRIMARY KEY,
    id_produtoCarrinho    INT(14) ,
	qtd_Carrinho   INT(11),
    subtotalCarrinho Decimal(10,2),
    totalCarrinho Decimal(10,2),
    id_cliente INT ,
    FOREIGN KEY (id_produtoCarrinho) REFERENCES tb_produto(id_produto),
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id)
);


CREATE TABLE tiposPagamento(
    id_pagamento INT(14) AUTO_INCREMENT PRIMARY KEY,
    tipo_pag VARCHAR(255)
);

-- Inserir os tipos de pagamento
INSERT INTO tiposPagamento (tipo_pag) VALUES ('Debito');
INSERT INTO tiposPagamento (tipo_pag) VALUES ('Credito');
INSERT INTO tiposPagamento (tipo_pag) VALUES ('Pix');

select * from tiposPagamento;


-- Inserir os tipos de pagamento
INSERT INTO tiposPagamento (tipo_pag) VALUES ('Débito');
INSERT INTO tiposPagamento (tipo_pag) VALUES ('Crédito');
INSERT INTO tiposPagamento (tipo_pag) VALUES ('Pix');

select * from tiposPagamento;

CREATE TABLE tb_vendas (
	id_venda int auto_increment primary key,
	cliente_id int,
	total_venda decimal (10,2),
	id_pagamento INT, 
	tipo_pag VARCHAR(255),
	num_cartao VARCHAR(255),
	mes VARCHAR(255),
	ano VARCHAR(255),
	cvv VARCHAR(255),
  FOREIGN KEY (cliente_id) REFERENCES tb_clientes(id),
  FOREIGN KEY (id_pagamento) REFERENCES tiposPagamento(id_pagamento)
);

CREATE TABLE tb_itensvendas (
  id_item int auto_increment primary key,
  venda_id int,
  produto_id int,
  qtd int,
  subtotal decimal (10,2),
 
  FOREIGN KEY (venda_id) REFERENCES tb_vendas(id_venda),
  FOREIGN KEY (produto_id) REFERENCES tb_produto(id_produto)
);
SHOW CREATE TABLE tb_administrador;

-- Se necessário, altere o tipo da coluna id para BIGINT
ALTER TABLE tb_administrador MODIFY id BIGINT AUTO_INCREMENT;

-- Redefina o valor de AUTO_INCREMENT para garantir que não há valores fora do range
ALTER TABLE tb_administrador AUTO_INCREMENT = 1;