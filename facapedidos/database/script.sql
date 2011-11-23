CREATE TABLE ingrediente (
  cod_ingrediente INTEGER(11) NOT NULL,
  nome VARCHAR(20) NOT NULL,
  descricao VARCHAR(100) NOT NULL,
  PRIMARY KEY(cod_ingrediente),
  INDEX XPKIngrediente(cod_ingrediente)
);

CREATE TABLE tipo_produto (
  cod_tipo_poduto INTEGER(11) NOT NULL,
  nome VARCHAR(20) NOT NULL,
  foto BLOB NOT NULL,
  PRIMARY KEY(cod_tipo_poduto),
  INDEX XPKTipo_Produto(cod_tipo_poduto)
);

CREATE TABLE cliente (
  cod_cliente INTEGER(11) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  rua VARCHAR(100) NOT NULL,
  CEP VARCHAR(10) NOT NULL,
  numero INTEGER(11) NOT NULL,
  complemento VARCHAR(20) NOT NULL,
  PRIMARY KEY(cod_cliente),
  INDEX XPKCliente(cod_cliente)
);

CREATE TABLE empresa (
  cod_empresa INTEGER(11) NOT NULL,
  razao_social VARCHAR(100) NOT NULL,
  cnpj VARCHAR(20) NOT NULL,
  rua VARCHAR(50) NOT NULL,
  numero INTEGER(11) NOT NULL,
  CEP VARCHAR(10) NOT NULL,
  complemento VARCHAR(20) NOT NULL,
  PRIMARY KEY(cod_empresa),
  INDEX XPKEmpresa(cod_empresa)
);

CREATE TABLE pedido (
  cod_pedido DECIMAL(15,0) NOT NULL,
  cod_cliente INTEGER(11) NOT NULL,
  data DATE NOT NULL,
  valor_total FLOAT NOT NULL,
  rua VARCHAR(20) NOT NULL,
  numero INTEGER(11) NOT NULL,
  complemento VARCHAR(20) NOT NULL,
  tempo_entrega INTEGER(11) NOT NULL,
  PRIMARY KEY(cod_pedido),
  INDEX XPKPedido(cod_pedido),
  INDEX XIF26Pedido(cod_cliente),
  FOREIGN KEY(cod_cliente)
    REFERENCES cliente(cod_cliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE produto (
  cod_produto INTEGER(11) NOT NULL,
  cod_empresa INTEGER(11) NOT NULL,
  cod_tipo_poduto INTEGER(11) NOT NULL,
  nome VARCHAR(20) NOT NULL,
  preco FLOAT NOT NULL,
  promocao CHAR(1) NOT NULL,
  descricao VARCHAR(200) NOT NULL,
  foto BLOB NOT NULL,
  tempo_entrega INTEGER(11) NOT NULL,
  PRIMARY KEY(cod_produto),
  INDEX XPKProduto(cod_produto),
  INDEX XIF10Produto(cod_tipo_poduto),
  INDEX XIF6Produto(cod_empresa),
  FOREIGN KEY(cod_empresa)
    REFERENCES empresa(cod_empresa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_tipo_poduto)
    REFERENCES tipo_produto(cod_tipo_poduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE pedido_produto (
  cod_pedido DECIMAL(15,0) NOT NULL,
  cod_produto INTEGER(11) NOT NULL,
  quantidade INTEGER(11) NOT NULL,
  PRIMARY KEY(cod_pedido, cod_produto),
  INDEX XPKPedido_Produto(cod_pedido, cod_produto),
  INDEX XIF28Pedido_Produto(cod_pedido),
  INDEX XIF29Pedido_Produto(cod_produto),
  FOREIGN KEY(cod_pedido)
    REFERENCES pedido(cod_pedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_produto)
    REFERENCES produto(cod_produto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE ingrediente_empresa (
  cod_ingrediente INTEGER(11) NOT NULL,
  cod_empresa INTEGER(11) NOT NULL,
  descricao VARCHAR(100) NOT NULL,
  PRIMARY KEY(cod_ingrediente, cod_empresa),
  INDEX XPKIngrediente_Empresa(cod_ingrediente, cod_empresa),
  INDEX XIF15Ingrediente_Empresa(cod_ingrediente),
  INDEX XIF16Ingrediente_Empresa(cod_empresa),
  FOREIGN KEY(cod_empresa)
    REFERENCES empresa(cod_empresa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_ingrediente)
    REFERENCES ingrediente(cod_ingrediente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE itens_de_um_lanche (
  cod_produto INTEGER(11) NOT NULL,
  cod_ingrediente INTEGER(11) NOT NULL,
  cod_empresa INTEGER(11) NOT NULL,
  PRIMARY KEY(cod_produto, cod_ingrediente, cod_empresa),
  INDEX XPKItens_de_um_lanche(cod_produto, cod_ingrediente, cod_empresa),
  INDEX XIF12Itens_de_um_lanche(cod_produto),
  INDEX XIF17Itens_de_um_lanche(cod_ingrediente, cod_empresa),
  FOREIGN KEY(cod_ingrediente, cod_empresa)
    REFERENCES ingrediente_empresa(cod_ingrediente, cod_empresa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_produto)
    REFERENCES produto(cod_produto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


