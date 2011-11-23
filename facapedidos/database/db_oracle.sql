
CREATE TABLE Cliente (
       cod_cliente          integer NOT NULL,
       nome                 VARCHAR(100) NULL,
       rua                  VARCHAR(100) NOT NULL,
       CEP                  VARCHAR(10) NOT NULL,
       numero               integer NOT NULL,
       complemento          varchar(20) NULL
);

CREATE UNIQUE INDEX XPKCliente ON Cliente
(
       cod_cliente                    ASC
);


ALTER TABLE Cliente
       ADD  ( PRIMARY KEY (cod_cliente) ) ;


CREATE TABLE Tipo_Produto (
       cod_tipo_poduto      integer NOT NULL,
       nome                 varchar(20) NOT NULL,
       foto                 BLOB NULL
);

CREATE UNIQUE INDEX XPKTipo_Produto ON Tipo_Produto
(
       cod_tipo_poduto                ASC
);


ALTER TABLE Tipo_Produto
       ADD  ( PRIMARY KEY (cod_tipo_poduto) ) ;


CREATE TABLE Empresa (
       cod_empresa          integer NOT NULL,
       razao_social         VARCHAR(100) NOT NULL,
       cnpj                 varchar(20) NULL,
       rua                  VARCHAR(50) NOT NULL,
       numero               integer NULL,
       CEP                  VARCHAR(10) NOT NULL,
       complemento          varchar(20) NULL
);

CREATE UNIQUE INDEX XPKEmpresa ON Empresa
(
       cod_empresa                    ASC
);


ALTER TABLE Empresa
       ADD  ( PRIMARY KEY (cod_empresa) ) ;


CREATE TABLE Produto (
       cod_produto          integer NOT NULL,
       cod_empresa          integer NOT NULL,
       cod_tipo_poduto      integer NOT NULL,
       nome                 varchar(20) NULL,
       preco                FLOAT NULL,
       promocao             CHAR(1) NULL,
       descricao            VARCHAR(200) NULL,
       foto                 blob,
       tempo_entrega        integer NULL
);

CREATE UNIQUE INDEX XPKProduto ON Produto
(
       cod_produto                    ASC
);

CREATE INDEX XIF10Produto ON Produto
(
       cod_tipo_poduto                ASC
);

CREATE INDEX XIF6Produto ON Produto
(
       cod_empresa                    ASC
);


ALTER TABLE Produto
       ADD  ( PRIMARY KEY (cod_produto) ) ;


CREATE TABLE Ingrediente (
       cod_ingrediente      integer NOT NULL,
       nome                 varchar(20) NOT NULL,
       descricao            VARCHAR(100) NULL
);

CREATE UNIQUE INDEX XPKIngrediente ON Ingrediente
(
       cod_ingrediente                ASC
);


ALTER TABLE Ingrediente
       ADD  ( PRIMARY KEY (cod_ingrediente) ) ;


CREATE TABLE Ingrediente_Empresa (
       cod_ingrediente      integer NOT NULL,
       cod_empresa          integer NOT NULL,
       descricao            VARCHAR(100) NULL
);

CREATE UNIQUE INDEX XPKIngrediente_Empresa ON Ingrediente_Empresa
(
       cod_ingrediente                ASC,
       cod_empresa                    ASC
);

CREATE INDEX XIF15Ingrediente_Empresa ON Ingrediente_Empresa
(
       cod_ingrediente                ASC
);

CREATE INDEX XIF16Ingrediente_Empresa ON Ingrediente_Empresa
(
       cod_empresa                    ASC
);


ALTER TABLE Ingrediente_Empresa
       ADD  ( PRIMARY KEY (cod_ingrediente, cod_empresa) ) ;


CREATE TABLE Itens_de_um_lanche (
       cod_produto          integer NOT NULL,
       cod_ingrediente      integer NOT NULL,
       cod_empresa          integer NOT NULL
);

CREATE UNIQUE INDEX XPKItens_de_um_lanche ON Itens_de_um_lanche
(
       cod_produto                    ASC,
       cod_ingrediente                ASC,
       cod_empresa                    ASC
);

CREATE INDEX XIF12Itens_de_um_lanche ON Itens_de_um_lanche
(
       cod_produto                    ASC
);

CREATE INDEX XIF17Itens_de_um_lanche ON Itens_de_um_lanche
(
       cod_ingrediente                ASC,
       cod_empresa                    ASC
);


ALTER TABLE Itens_de_um_lanche
       ADD  ( PRIMARY KEY (cod_produto, cod_ingrediente, cod_empresa) ) ;


CREATE TABLE Pedido (
       cod_pedido           NUMERIC(15) NOT NULL,
       cod_cliente          integer NOT NULL,
       data                 DATE NULL,
       valor_total          FLOAT NULL,
       rua                  varchar(20) NULL,
       numero               integer NULL,
       complemento          varchar(20) NULL,
       tempo_entrega        integer NULL
);

CREATE UNIQUE INDEX XPKPedido ON Pedido
(
       cod_pedido                     ASC
);

CREATE INDEX XIF26Pedido ON Pedido
(
       cod_cliente                    ASC
);


ALTER TABLE Pedido
       ADD  ( PRIMARY KEY (cod_pedido) ) ;


CREATE TABLE Pedido_Produto (
       cod_pedido           NUMERIC(15) NOT NULL,
       cod_produto          integer NOT NULL,
       quantidade           integer NULL
);

CREATE UNIQUE INDEX XPKPedido_Produto ON Pedido_Produto
(
       cod_pedido                     ASC,
       cod_produto                    ASC
);

CREATE INDEX XIF28Pedido_Produto ON Pedido_Produto
(
       cod_pedido                     ASC
);

CREATE INDEX XIF29Pedido_Produto ON Pedido_Produto
(
       cod_produto                    ASC
);


ALTER TABLE Pedido_Produto
       ADD  ( PRIMARY KEY (cod_pedido, cod_produto) ) ;



