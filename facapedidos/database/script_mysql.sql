use facapedido;

CREATE TABLE estrategia_cobranca_entrega (
  cod_estrategia_cobranca_entrega INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nome VARCHAR(30)  NULL    ,
PRIMARY KEY(cod_estrategia_cobranca_entrega))
TYPE=InnoDB;



CREATE TABLE estado (
  cod_estado INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  uf VARCHAR(2)  NULL  ,
  nome VARCHAR(30)  NULL    ,
PRIMARY KEY(cod_estado))
TYPE=InnoDB;



CREATE TABLE estrategia_cobranca_pizza (
  cod_estrategia_cobranca_pizza INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nome VARCHAR(30)  NULL    ,
PRIMARY KEY(cod_estrategia_cobranca_pizza))
TYPE=InnoDB;



CREATE TABLE ingrediente (
  cod_ingrediente INTEGER  NOT NULL   AUTO_INCREMENT,
  nome VARCHAR(50)  NOT NULL  ,
  imagem BLOB  NULL    ,
PRIMARY KEY(cod_ingrediente)  ,
INDEX XPKIngrediente(cod_ingrediente))
TYPE=InnoDB;



CREATE TABLE funcionario (
  cod_funcionario INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nome VARCHAR(50)  NOT NULL  ,
  cpf CHAR(14)  NOT NULL  ,
  data_nascimento DATE  NULL  ,
  email VARCHAR(20)  NULL  ,
  senha VARCHAR(10)  NULL  ,
  telefone_residencial CHAR(14)  NULL  ,
  telefone_comercial CHAR(14)  NULL  ,
  celular CHAR(14)  NULL  ,
  endereco VARCHAR(50)  NOT NULL  ,
  numero TINYINT  NOT NULL  ,
  bairro VARCHAR(45)  NULL  ,
  complemento VARCHAR(30)  NULL  ,
  cep CHAR(9)  NOT NULL  ,
  status_user INTEGER  NULL DEFAULT 1  COMMENT '1 = aguardando ativacao , 2 = ativo , 3 =  inativo' ,
  data_cadastro TIMESTAMP  NULL DEFAULT now() ,
  observacao TEXT  NULL    ,
PRIMARY KEY(cod_funcionario))
TYPE=InnoDB;




CREATE TABLE tipo_produto (
  cod_tipo_produto INTEGER  NOT NULL   AUTO_INCREMENT,
  nome VARCHAR(50)  NULL  ,
  foto BLOB  NULL    ,
PRIMARY KEY(cod_tipo_produto)  ,
INDEX XPKTipo_Produto(cod_tipo_produto))
TYPE=InnoDB;



CREATE TABLE categoria_ingrediente (
  cod_tipo_ingrediente INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nome VARCHAR(40)  NOT NULL    ,
PRIMARY KEY(cod_tipo_ingrediente))
TYPE=InnoDB;



CREATE TABLE funcionario_entregador (
  cod_funcionario INTEGER UNSIGNED  NOT NULL  ,
  modelo_moto VARCHAR(30)  NULL  ,
  consumo FLOAT  NULL  ,
  total_km DOUBLE  NULL  ,
  total_acidentes INTEGER  NULL DEFAULT 0   ,
PRIMARY KEY(cod_funcionario)  ,
INDEX empregado_entregador_FKIndex1(cod_funcionario),
  FOREIGN KEY(cod_funcionario)
    REFERENCES funcionario(cod_funcionario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE entrega (
  cod_entrega INTEGER UNSIGNED  NOT NULL  ,
  cod_funcionario INTEGER UNSIGNED  NOT NULL  ,
  km_total DOUBLE  NULL    ,
PRIMARY KEY(cod_entrega)  ,
INDEX entrega_FKIndex1(cod_funcionario),
  FOREIGN KEY(cod_funcionario)
    REFERENCES funcionario_entregador(cod_funcionario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE cidade (
  cod_cidade INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  cod_estado INTEGER UNSIGNED  NOT NULL  ,
  nome VARCHAR(90)  NULL    ,
PRIMARY KEY(cod_cidade)  ,
INDEX cidade_FKIndex1(cod_estado),
  FOREIGN KEY(cod_estado)
    REFERENCES estado(cod_estado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



-- ------------------------------------------------------------
-- Criar campo latlng
-- Exemplo:
-- SELECT AddGeometryColumn('tb_usuario','latlng',4326,'POINT',2);
-- 
-- Criar index
-- CREATE INDEX [indexname] ON [tablename]
--  USING GIST ( [geometryfield] GIST_GEOMETRY_OPS );
-- ------------------------------------------------------------

CREATE TABLE cliente (
  cod_cliente INTEGER UNSIGNED  NOT NULL  ,
  cod_cidade INTEGER UNSIGNED  NOT NULL  ,
  nome VARCHAR(30)  NOT NULL  ,
  data_nascimento DATE  NOT NULL  ,
  email VARCHAR(30)  NOT NULL  ,
  senha VARCHAR(20)  NOT NULL  ,
  telefone CHAR(14)  NOT NULL  ,
  celular CHAR(14)  NULL  ,
  endereco VARCHAR(50)  NOT NULL  ,
  numero VARCHAR(10)  NOT NULL  ,
  bairro VARCHAR(45)  NOT NULL  ,
  complemento VARCHAR(30)  NULL  ,
  cep CHAR(9)  NOT NULL  ,
  status_usuario INTEGER UNSIGNED  NOT NULL DEFAULT 1  COMMENT '1 = aguardando ativacao, 2 = ativo, 3 = inativo' ,
  data_cadastro DATE  NOT NULL  ,
  observacao TEXT  NULL    ,
PRIMARY KEY(cod_cliente)  ,
INDEX cliente_FKIndex1(cod_cidade),
  FOREIGN KEY(cod_cidade)
    REFERENCES cidade(cod_cidade)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB
COMMENT = 'Criar campo latlng  Exemplo:  SELECT AddGeometryColumn(''tb_usuario'',''latlng'',4326,''POINT'',2);    Criar index  CREATE INDEX [indexname] ON [tablename]   USING GIST ( [geometryfield] GIST_GEOMETRY_OPS );' ;




CREATE TABLE pedido (
  cod_pedido INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  cod_entrega INTEGER UNSIGNED  NOT NULL  ,
  cod_cliente INTEGER UNSIGNED  NOT NULL  ,
  data DATE  NULL  ,
  valor_total DOUBLE  NULL  ,
  rua VARCHAR(50)  NULL  ,
  numero SMALLINT UNSIGNED  NULL  ,
  complemento VARCHAR(20)  NULL  ,
  tempo_entrega_minutos SMALLINT UNSIGNED  NULL  ,
  CEP VARCHAR(8)  NULL    ,
PRIMARY KEY(cod_pedido)  ,
INDEX XPKPedido(cod_pedido)  ,
INDEX XIF26Pedido(cod_cliente)  ,
INDEX pedido_FKIndex1(cod_cliente)  ,
INDEX pedido_FKIndex2(cod_entrega),
  FOREIGN KEY(cod_cliente)
    REFERENCES cliente(cod_cliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_entrega)
    REFERENCES entrega(cod_entrega)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE empresa (
  cod_empresa INTEGER  NOT NULL   AUTO_INCREMENT,
  cod_estrategia_cobranca_entrega INTEGER UNSIGNED  NOT NULL  ,
  cod_estrategia_cobranca_pizza INTEGER UNSIGNED  NOT NULL  ,
  cod_cidade INTEGER UNSIGNED  NOT NULL  ,
  razao_social VARCHAR(100)  NOT NULL  ,
  cnpj CHAR(14)  NULL  ,
  rua VARCHAR(50)  NOT NULL  ,
  numero SMALLINT  NOT NULL  ,
  CEP CHAR(8)  NOT NULL  ,
  complemento VARCHAR(20)  NULL  ,
  valor_minimo_entrega DOUBLE  NOT NULL  ,
  nome_fantasia VARCHAR(100)  NULL  ,
  logo BLOB  NULL  ,
  telefone1 CHAR(10)  NULL  ,
  telefone2 CHAR(10)  NULL  ,
  bairro VARCHAR(30)  NULL  ,
  email VARCHAR(20)  NULL  ,
  URL VARCHAR(10)  NOT NULL  ,
  removed TINYINT UNSIGNED  NULL DEFAULT 0 ,
  desativada TINYINT UNSIGNED  NULL DEFAULT 0 ,
  data_cadastro TIMESTAMP  NULL    ,
PRIMARY KEY(cod_empresa)  ,
INDEX XPKEmpresa(cod_empresa)  ,
INDEX empresa_FKIndex2(cod_estrategia_cobranca_entrega)  ,
INDEX empresa_FKIndex3(cod_estrategia_cobranca_pizza)  ,
INDEX empresa_FKIndex1(cod_cidade),
  FOREIGN KEY(cod_cidade)
    REFERENCES cidade(cod_cidade)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_estrategia_cobranca_pizza)
    REFERENCES estrategia_cobranca_pizza(cod_estrategia_cobranca_pizza)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_estrategia_cobranca_entrega)
    REFERENCES estrategia_cobranca_entrega(cod_estrategia_cobranca_entrega)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE horario_funcionamento (
  cod_empresa INTEGER  NOT NULL  ,
  hora_inicio TIME  NOT NULL  ,
  hora_fim TIME  NOT NULL  ,
  dia_da_semana VARCHAR(10)  NOT NULL    ,
PRIMARY KEY(cod_empresa)  ,
INDEX dia_da_semana_has_empresa_FKIndex2(cod_empresa),
  FOREIGN KEY(cod_empresa)
    REFERENCES empresa(cod_empresa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE tipos_produtos_empresa (
  cod_tipo_produto INTEGER  NOT NULL  ,
  cod_empresa INTEGER  NOT NULL    ,
PRIMARY KEY(cod_tipo_produto, cod_empresa)  ,
INDEX empresa_has_tipo_produto_FKIndex1(cod_empresa)  ,
INDEX tipos_produtos_empresa_FKIndex2(cod_tipo_produto),
  FOREIGN KEY(cod_empresa)
    REFERENCES empresa(cod_empresa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_tipo_produto)
    REFERENCES tipo_produto(cod_tipo_produto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE funcionario_has_empresa (
  cod_funcionario INTEGER UNSIGNED  NOT NULL  ,
  cod_empresa INTEGER  NOT NULL  ,
  responsavel TINYINT UNSIGNED  NULL DEFAULT 0   ,
PRIMARY KEY(cod_funcionario, cod_empresa)  ,
INDEX funcionario_has_empresa_FKIndex1(cod_funcionario)  ,
INDEX funcionario_has_empresa_FKIndex2(cod_empresa),
  FOREIGN KEY(cod_funcionario)
    REFERENCES funcionario(cod_funcionario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_empresa)
    REFERENCES empresa(cod_empresa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE ingrediente_empresa (
  cod_ingrediente INTEGER  NOT NULL  ,
  cod_empresa INTEGER  NOT NULL  ,
  descricao VARCHAR(200)  NULL  ,
  imagem BLOB  NULL  ,
  preco_quando_adicional DOUBLE  NULL  ,
  removed TINYINT UNSIGNED  NULL DEFAULT 0   ,
PRIMARY KEY(cod_ingrediente, cod_empresa)  ,
INDEX XPKIngrediente_Empresa(cod_ingrediente, cod_empresa)  ,
INDEX XIF15Ingrediente_Empresa(cod_ingrediente)  ,
INDEX XIF16Ingrediente_Empresa(cod_empresa)  ,
INDEX ingrediente_empresa_FKIndex2(cod_ingrediente)  ,
INDEX ingrediente_empresa_FKIndex3(cod_empresa),
  FOREIGN KEY(cod_ingrediente)
    REFERENCES ingrediente(cod_ingrediente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_empresa)
    REFERENCES empresa(cod_empresa)
      ON DELETE CASCADE
      ON UPDATE CASCADE)
TYPE=InnoDB;



CREATE TABLE produto (
  cod_produto INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  cod_tipo_produto INTEGER  NOT NULL  ,
  cod_empresa INTEGER  NOT NULL  ,
  nome VARCHAR(50)  NOT NULL  ,
  descricao VARCHAR(200)  NULL  ,
  tempo_preparo_minutos SMALLINT  NULL  ,
  valor_calorico DOUBLE  NULL  ,
  numero_max_adicionais SMALLINT UNSIGNED  NULL  ,
  fator_de_ajuste DOUBLE  NULL  ,
  cobrado_por_quilo BOOL  NULL  ,
  disponivel BOOL  NULL  ,
  removed TINYINT UNSIGNED  NULL DEFAULT 0   ,
PRIMARY KEY(cod_produto)  ,
INDEX XPKProduto(cod_produto)  ,
INDEX produto_FKIndex2(cod_empresa)  ,
INDEX produto_FKIndex3(cod_tipo_produto, cod_empresa),
  FOREIGN KEY(cod_empresa)
    REFERENCES empresa(cod_empresa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_tipo_produto, cod_empresa)
    REFERENCES tipos_produtos_empresa(cod_tipo_produto, cod_empresa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE categoria_permitida_como_adicional (
  cod_produto INTEGER UNSIGNED  NOT NULL  ,
  cod_tipo_ingrediente INTEGER UNSIGNED  NOT NULL  ,
  qtd_max_adicionais SMALLINT UNSIGNED  NOT NULL    ,
PRIMARY KEY(cod_produto, cod_tipo_ingrediente)  ,
INDEX FKIndex1(cod_produto)  ,
INDEX FKIndex2(cod_tipo_ingrediente),
  FOREIGN KEY(cod_produto)
    REFERENCES produto(cod_produto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_tipo_ingrediente)
    REFERENCES categoria_ingrediente(cod_tipo_ingrediente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE categoria_ingrediente_empresa (
  cod_tipo_ingrediente INTEGER UNSIGNED  NOT NULL  ,
  cod_empresa INTEGER  NOT NULL  ,
  cod_ingrediente INTEGER  NOT NULL    ,
PRIMARY KEY(cod_tipo_ingrediente, cod_empresa, cod_ingrediente)  ,
INDEX FKIndex1(cod_tipo_ingrediente)  ,
INDEX FKIndex2(cod_ingrediente, cod_empresa),
  FOREIGN KEY(cod_tipo_ingrediente)
    REFERENCES categoria_ingrediente(cod_tipo_ingrediente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_ingrediente, cod_empresa)
    REFERENCES ingrediente_empresa(cod_ingrediente, cod_empresa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE itens_de_um_lanche (
  cod_produto INTEGER UNSIGNED  NOT NULL  ,
  cod_ingrediente INTEGER  NOT NULL  ,
  cod_empresa INTEGER  NOT NULL  ,
  preco DOUBLE  NULL  ,
  valor_calorico DOUBLE  NULL    ,
PRIMARY KEY(cod_produto, cod_ingrediente, cod_empresa)  ,
INDEX XPKItens_de_um_lanche(cod_produto, cod_ingrediente, cod_empresa)  ,
INDEX XIF12Itens_de_um_lanche(cod_produto)  ,
INDEX XIF17Itens_de_um_lanche(cod_ingrediente, cod_empresa)  ,
INDEX itens_de_um_lanche_FKIndex1(cod_ingrediente, cod_empresa)  ,
INDEX itens_de_um_lanche_FKIndex3(cod_produto),
  FOREIGN KEY(cod_ingrediente, cod_empresa)
    REFERENCES ingrediente_empresa(cod_ingrediente, cod_empresa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cod_produto)
    REFERENCES produto(cod_produto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE tamanho_produto (
  cod_produto INTEGER UNSIGNED  NOT NULL  ,
  descricao VARCHAR(20)  NOT NULL  ,
  preco DOUBLE  NOT NULL  ,
  numero_sabores_pizza SMALLINT UNSIGNED  NULL  ,
  removed TINYINT UNSIGNED  NULL DEFAULT 0   ,
PRIMARY KEY(cod_produto)  ,
INDEX tamanho_produto_FKIndex1(cod_produto)  ,
INDEX tamanho_produto_FKIndex2(cod_produto),
  FOREIGN KEY(cod_produto)
    REFERENCES produto(cod_produto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE foto_produto (
  cod_foto INTEGER  NOT NULL   AUTO_INCREMENT,
  cod_produto INTEGER UNSIGNED  NOT NULL  ,
  foto BLOB  NULL    ,
PRIMARY KEY(cod_foto)  ,
INDEX foto_produto_FKIndex1(cod_produto),
  FOREIGN KEY(cod_produto)
    REFERENCES produto(cod_produto)
      ON DELETE CASCADE
      ON UPDATE CASCADE)
TYPE=InnoDB;



CREATE TABLE itens_pedido (
  cod_pedido INTEGER UNSIGNED  NOT NULL  ,
  cod_produto INTEGER UNSIGNED  NOT NULL  ,
  quantidade SMALLINT UNSIGNED  NULL  ,
  quilos DOUBLE  NULL    ,
PRIMARY KEY(cod_pedido, cod_produto)  ,
INDEX XPKPedido_Produto(cod_pedido)  ,
INDEX XIF28Pedido_Produto(cod_pedido)  ,
INDEX itens_pedido_FKIndex1(cod_pedido)  ,
INDEX itens_pedido_FKIndex3(cod_produto),
  FOREIGN KEY(cod_pedido)
    REFERENCES pedido(cod_pedido)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(cod_produto)
    REFERENCES tamanho_produto(cod_produto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE promocao (
  cod_promocao INTEGER  NOT NULL   AUTO_INCREMENT,
  cod_produto INTEGER UNSIGNED  NOT NULL  ,
  data_inicio DATETIME  NOT NULL  ,
  data_fim DATETIME  NOT NULL  ,
  preco_promocional DOUBLE PRECISION  NOT NULL  ,
  anuncio TEXT  NULL  ,
  removed TINYINT UNSIGNED  NULL DEFAULT 0   ,
PRIMARY KEY(cod_promocao)  ,
INDEX promocoes_FKIndex1(cod_produto),
  FOREIGN KEY(cod_produto)
    REFERENCES tamanho_produto(cod_produto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE pedido_personalizado (
  cod_empresa INTEGER  NOT NULL  ,
  cod_ingrediente INTEGER  NOT NULL  ,
  cod_pedido INTEGER UNSIGNED  NOT NULL  ,
  cod_produto INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(cod_empresa, cod_ingrediente, cod_pedido, cod_produto)  ,
INDEX pedido_personalizado_FKIndex1(cod_pedido, cod_produto)  ,
INDEX pedido_personalizado_FKIndex2(cod_ingrediente, cod_empresa),
  FOREIGN KEY(cod_pedido, cod_produto)
    REFERENCES itens_pedido(cod_pedido, cod_produto)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(cod_ingrediente, cod_empresa)
    REFERENCES ingrediente_empresa(cod_ingrediente, cod_empresa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
TYPE=InnoDB;



CREATE TABLE sabores_pizza (
  cod_outro_sabor_pizza INTEGER UNSIGNED  NOT NULL  ,
  cod_produto INTEGER UNSIGNED  NOT NULL  ,
  cod_pedido INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(cod_outro_sabor_pizza, cod_produto, cod_pedido)  ,
INDEX sabores_pizza_FKIndex1(cod_pedido, cod_produto)  ,
INDEX sabores_pizza_FKIndex2(cod_outro_sabor_pizza),
  FOREIGN KEY(cod_pedido, cod_produto)
    REFERENCES itens_pedido(cod_pedido, cod_produto)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(cod_outro_sabor_pizza)
    REFERENCES produto(cod_produto)
      ON DELETE CASCADE
      ON UPDATE CASCADE)
TYPE=InnoDB;



