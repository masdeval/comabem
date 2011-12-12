
CREATE SEQUENCE public.resource_cod_resource_seq;

CREATE TABLE public.resource (
                cod_resource INTEGER NOT NULL DEFAULT nextval('public.resource_cod_resource_seq'),
                name VARCHAR NOT NULL,
                CONSTRAINT resource_pk PRIMARY KEY (cod_resource)
);


ALTER SEQUENCE public.resource_cod_resource_seq OWNED BY public.resource.cod_resource;

CREATE SEQUENCE public.role_cod_role_seq;

CREATE TABLE public.role (
                cod_role INTEGER NOT NULL DEFAULT nextval('public.role_cod_role_seq'),
                nome VARCHAR NOT NULL,
                CONSTRAINT role_pk PRIMARY KEY (cod_role)
);


ALTER SEQUENCE public.role_cod_role_seq OWNED BY public.role.cod_role;

CREATE TABLE public.role_has_resource (
                cod_role INTEGER NOT NULL,
                cod_resource INTEGER NOT NULL,
                CONSTRAINT role_has_resource_pk PRIMARY KEY (cod_role, cod_resource)
);


CREATE SEQUENCE public.estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1;

CREATE TABLE public.estrategia_cobranca_pizza (
                cod_estrategia_cobranca_pizza INTEGER NOT NULL DEFAULT nextval('public.estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1'),
                nome VARCHAR NOT NULL,
                CONSTRAINT estrategia_cobranca_pizza_pk PRIMARY KEY (cod_estrategia_cobranca_pizza)
);


ALTER SEQUENCE public.estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1 OWNED BY public.estrategia_cobranca_pizza.cod_estrategia_cobranca_pizza;

CREATE SEQUENCE public.promocao_venda_coletiva_cod_venda_coletiva_seq;

CREATE TABLE public.promocao_venda_coletiva (
                cod_venda_coletiva INTEGER NOT NULL DEFAULT nextval('public.promocao_venda_coletiva_cod_venda_coletiva_seq'),
                data_inicio_venda DATE NOT NULL,
                data_fim_venda DATE NOT NULL,
                num_necessario_participantes SMALLINT NOT NULL,
                data_inicio_utilizacao DATE NOT NULL,
                data_fim_utilizacao DATE NOT NULL,
                CONSTRAINT promocao_venda_coletiva_pk PRIMARY KEY (cod_venda_coletiva)
);


ALTER SEQUENCE public.promocao_venda_coletiva_cod_venda_coletiva_seq OWNED BY public.promocao_venda_coletiva.cod_venda_coletiva;

CREATE SEQUENCE public.tipo_produto_cod_tipo_produto_seq;

CREATE TABLE public.tipo_produto (
                cod_tipo_produto INTEGER NOT NULL DEFAULT nextval('public.tipo_produto_cod_tipo_produto_seq'),
                nome VARCHAR(50),
                foto BYTEA,
                is_especialidade CHAR(1),
                CONSTRAINT tipo_produto_pkey PRIMARY KEY (cod_tipo_produto)
);


ALTER SEQUENCE public.tipo_produto_cod_tipo_produto_seq OWNED BY public.tipo_produto.cod_tipo_produto;

CREATE INDEX xpktipo_produto
 ON public.tipo_produto USING BTREE
 ( cod_tipo_produto );

CREATE SEQUENCE public.tb_estado_cod_estado_seq;

CREATE TABLE public.tb_estado (
                cod_estado INTEGER NOT NULL DEFAULT nextval('public.tb_estado_cod_estado_seq'),
                uf VARCHAR(2),
                nome VARCHAR(30),
                CONSTRAINT tb_estado_pkey PRIMARY KEY (cod_estado)
);


ALTER SEQUENCE public.tb_estado_cod_estado_seq OWNED BY public.tb_estado.cod_estado;

CREATE SEQUENCE public.tb_cidade_cod_cidade_seq;

CREATE TABLE public.tb_cidade (
                cod_cidade INTEGER NOT NULL DEFAULT nextval('public.tb_cidade_cod_cidade_seq'),
                cod_estado INTEGER NOT NULL,
                nome VARCHAR(90),
                CONSTRAINT tb_cidade_pkey PRIMARY KEY (cod_cidade)
);


ALTER SEQUENCE public.tb_cidade_cod_cidade_seq OWNED BY public.tb_cidade.cod_cidade;

CREATE INDEX ifk_rel_17
 ON public.tb_cidade USING BTREE
 ( cod_estado );

CREATE INDEX tb_cidade_fkindex1
 ON public.tb_cidade USING BTREE
 ( cod_estado );

CREATE SEQUENCE public.ingrediente_cod_ingrediente_seq;

CREATE TABLE public.ingrediente (
                cod_ingrediente INTEGER NOT NULL DEFAULT nextval('public.ingrediente_cod_ingrediente_seq'),
                nome VARCHAR(50) NOT NULL,
                imagem BYTEA,
                CONSTRAINT ingrediente_pkey PRIMARY KEY (cod_ingrediente)
);


ALTER SEQUENCE public.ingrediente_cod_ingrediente_seq OWNED BY public.ingrediente.cod_ingrediente;

CREATE INDEX xpkingrediente
 ON public.ingrediente USING BTREE
 ( cod_ingrediente );

CREATE SEQUENCE public.funcionario_cod_funcionario_seq;

CREATE TABLE public.funcionario (
                cod_funcionario INTEGER NOT NULL DEFAULT nextval('public.funcionario_cod_funcionario_seq'),
                nome VARCHAR(50) NOT NULL,
                cpf CHAR(11) NOT NULL,
                data_nascimento DATE,
                email VARCHAR(30),
                senha VARCHAR(10),
                telefone_residencial VARCHAR(20) NOT NULL,
                telefone_comercial VARCHAR(20) NOT NULL,
                celular VARCHAR(20) NOT NULL,
                removed CHAR(1) DEFAULT 0 NOT NULL,
                endereco VARCHAR(50) NOT NULL,
                numero SMALLINT NOT NULL,
                bairro VARCHAR(45),
                complemento VARCHAR(30),
                cep CHAR(8) NOT NULL,
                status_user SMALLINT DEFAULT 0 NOT NULL,
                data_cadastro TIMESTAMP DEFAULT now(),
                observacao TEXT,
                CONSTRAINT funcionario_pkey PRIMARY KEY (cod_funcionario)
);


ALTER SEQUENCE public.funcionario_cod_funcionario_seq OWNED BY public.funcionario.cod_funcionario;

CREATE UNIQUE INDEX funcionario_idx
 ON public.funcionario
 ( cpf );

CREATE TABLE public.privilege (
                cod_funcionario INTEGER NOT NULL,
                cod_role INTEGER NOT NULL,
                CONSTRAINT privilege_pk PRIMARY KEY (cod_funcionario, cod_role)
);


CREATE TABLE public.funcionario_entregador (
                cod_funcionario INTEGER NOT NULL,
                modelo_moto VARCHAR(30),
                consumo DOUBLE PRECISION,
                total_km DOUBLE PRECISION,
                total_acidentes INTEGER DEFAULT 0,
                CONSTRAINT funcionario_entregador_pkey PRIMARY KEY (cod_funcionario)
);


CREATE INDEX empregado_entregador_fkindex1
 ON public.funcionario_entregador USING BTREE
 ( cod_funcionario );

CREATE INDEX ifk_rel_32
 ON public.funcionario_entregador USING BTREE
 ( cod_funcionario );

CREATE TABLE public.entrega (
                cod_entrega INTEGER NOT NULL,
                cod_funcionario INTEGER NOT NULL,
                km_total DOUBLE PRECISION,
                CONSTRAINT entrega_pkey PRIMARY KEY (cod_entrega)
);


CREATE INDEX ifk_rel_34
 ON public.entrega USING BTREE
 ( cod_funcionario );

CREATE SEQUENCE public.empresa_cod_empresa_seq;

CREATE TABLE public.empresa (
                cod_empresa INTEGER NOT NULL DEFAULT nextval('public.empresa_cod_empresa_seq'),
                cod_cidade INTEGER NOT NULL,
                razao_social VARCHAR(100) NOT NULL,
                cnpj CHAR(14) NOT NULL,
                rua VARCHAR(50) NOT NULL,
                numero SMALLINT NOT NULL,
                cep CHAR(8) NOT NULL,
                complemento VARCHAR(20),
                valor_minimo_entrega NUMERIC(14,2) NOT NULL,
                nome_fantasia VARCHAR(100),
                logo BYTEA,
                telefone1 VARCHAR(20) NOT NULL,
                telefone2 VARCHAR(20) NOT NULL,
                bairro VARCHAR(30),
                email VARCHAR(50),
                url VARCHAR(10) NOT NULL,
                removed SMALLINT DEFAULT 0 NOT NULL,
                desativada SMALLINT DEFAULT 0,
                data_cadastro TIMESTAMP,
                cod_estrategia_cobranca_pizza INTEGER,
                CONSTRAINT empresa_pkey PRIMARY KEY (cod_empresa)
);


ALTER SEQUENCE public.empresa_cod_empresa_seq OWNED BY public.empresa.cod_empresa;

CREATE INDEX empresa_fkindex1
 ON public.empresa USING BTREE
 ( cod_cidade );

CREATE INDEX ifk_rel_18
 ON public.empresa USING BTREE
 ( cod_cidade );

CREATE INDEX xpkempresa
 ON public.empresa USING BTREE
 ( cod_empresa );

CREATE UNIQUE INDEX empresa_idx
 ON public.empresa
 ( url );

CREATE UNIQUE INDEX empresa_idx1
 ON public.empresa
 ( cnpj );

CREATE SEQUENCE public.produto_cod_produto_seq;

CREATE TABLE public.produto (
                cod_produto INTEGER NOT NULL DEFAULT nextval('public.produto_cod_produto_seq'),
                nome VARCHAR(50) NOT NULL,
                descricao VARCHAR,
                tempo_preparo_minutos SMALLINT,
                valor_calorico DOUBLE PRECISION,
                numero_max_adicionais SMALLINT,
                fator_de_ajuste DOUBLE PRECISION,
                cobrado_por_quilo BOOLEAN,
                disponivel BOOLEAN,
                removed SMALLINT DEFAULT 0 NOT NULL,
                cod_empresa INTEGER NOT NULL,
                cod_tipo_produto INTEGER NOT NULL,
                CONSTRAINT produto_pkey PRIMARY KEY (cod_produto)
);


ALTER SEQUENCE public.produto_cod_produto_seq OWNED BY public.produto.cod_produto;

CREATE INDEX xpkproduto
 ON public.produto USING BTREE
 ( cod_produto );

CREATE SEQUENCE public.recado_cliente_cod_recado_cliente_seq;

CREATE TABLE public.recado_cliente (
                cod_recado_cliente INTEGER NOT NULL DEFAULT nextval('public.recado_cliente_cod_recado_cliente_seq'),
                data DATE,
                texto VARCHAR,
                hora TIME,
                cod_empresa INTEGER NOT NULL,
                cod_produto INTEGER NOT NULL,
                CONSTRAINT recado_cliente_pk PRIMARY KEY (cod_recado_cliente)
);


ALTER SEQUENCE public.recado_cliente_cod_recado_cliente_seq OWNED BY public.recado_cliente.cod_recado_cliente;

CREATE SEQUENCE public.tamanho_produto_cod_tamanho_produto_seq;

CREATE TABLE public.tamanho_produto (
                cod_tamanho_produto INTEGER NOT NULL DEFAULT nextval('public.tamanho_produto_cod_tamanho_produto_seq'),
                cod_produto INTEGER NOT NULL,
                descricao VARCHAR(20) NOT NULL,
                preco NUMERIC(14,2) NOT NULL,
                numero_sabores_pizza SMALLINT,
                removed SMALLINT DEFAULT 0 NOT NULL,
                CONSTRAINT tamanho_produto_pkey PRIMARY KEY (cod_tamanho_produto)
);


ALTER SEQUENCE public.tamanho_produto_cod_tamanho_produto_seq OWNED BY public.tamanho_produto.cod_tamanho_produto;

CREATE INDEX ifk_rel_14
 ON public.tamanho_produto USING BTREE
 ( cod_produto );

CREATE INDEX tamanho_produto_fkindex1
 ON public.tamanho_produto USING BTREE
 ( cod_produto );

CREATE TABLE public.produto_venda_coletiva (
                cod_venda_coletiva INTEGER NOT NULL,
                cod_tamanho_produto INTEGER NOT NULL,
                preco_promocional NUMERIC(14,2) NOT NULL,
                CONSTRAINT produto_venda_coletiva_pk PRIMARY KEY (cod_venda_coletiva, cod_tamanho_produto)
);


CREATE SEQUENCE public.promocao_cod_promocao_seq;

CREATE TABLE public.promocao (
                cod_promocao INTEGER NOT NULL DEFAULT nextval('public.promocao_cod_promocao_seq'),
                cod_produto INTEGER NOT NULL,
                data_inicio DATE NOT NULL,
                data_fim DATE NOT NULL,
                preco_promocional NUMERIC(14,2) NOT NULL,
                anuncio TEXT,
                removed SMALLINT DEFAULT 0 NOT NULL,
                cod_tamanho_produto INTEGER NOT NULL,
                CONSTRAINT promocao_pkey PRIMARY KEY (cod_promocao)
);


ALTER SEQUENCE public.promocao_cod_promocao_seq OWNED BY public.promocao.cod_promocao;

CREATE INDEX ifk_rel_19
 ON public.promocao USING BTREE
 ( cod_produto );

CREATE INDEX promocoes_fkindex1
 ON public.promocao USING BTREE
 ( cod_produto );

CREATE SEQUENCE public.foto_produto_cod_foto_seq;

CREATE TABLE public.foto_produto (
                cod_foto INTEGER NOT NULL DEFAULT nextval('public.foto_produto_cod_foto_seq'),
                cod_produto INTEGER NOT NULL,
                foto BYTEA,
                CONSTRAINT foto_produto_pkey PRIMARY KEY (cod_foto)
);


ALTER SEQUENCE public.foto_produto_cod_foto_seq OWNED BY public.foto_produto.cod_foto;

CREATE INDEX foto_produto_fkindex1
 ON public.foto_produto USING BTREE
 ( cod_produto );

CREATE INDEX ifk_rel_13
 ON public.foto_produto USING BTREE
 ( cod_produto );

CREATE TABLE public.tipos_produtos_empresa (
                cod_tipo_produto INTEGER NOT NULL,
                cod_empresa INTEGER NOT NULL,
                CONSTRAINT tipos_produtos_empresa_pkey PRIMARY KEY (cod_tipo_produto, cod_empresa)
);


CREATE INDEX empresa_has_tipo_produto_fkindex1
 ON public.tipos_produtos_empresa USING BTREE
 ( cod_empresa );

CREATE INDEX ifk_rel_36
 ON public.tipos_produtos_empresa USING BTREE
 ( cod_tipo_produto );

CREATE TABLE public.ingrediente_empresa (
                cod_ingrediente INTEGER NOT NULL,
                cod_empresa INTEGER NOT NULL,
                descricao VARCHAR(200),
                imagem BYTEA,
                preco_quando_adicional NUMERIC(14,2) NOT NULL,
                removed SMALLINT DEFAULT 0 NOT NULL,
                CONSTRAINT ingrediente_empresa_pkey PRIMARY KEY (cod_ingrediente, cod_empresa)
);


CREATE INDEX ifk_rel_05
 ON public.ingrediente_empresa USING BTREE
 ( cod_ingrediente );

CREATE INDEX ifk_rel_37
 ON public.ingrediente_empresa USING BTREE
 ( cod_empresa );

CREATE INDEX ingrediente_empresa_fkindex2
 ON public.ingrediente_empresa USING BTREE
 ( cod_ingrediente );

CREATE INDEX ingrediente_empresa_fkindex3
 ON public.ingrediente_empresa USING BTREE
 ( cod_empresa );

CREATE INDEX xif15ingrediente_empresa
 ON public.ingrediente_empresa USING BTREE
 ( cod_ingrediente );

CREATE INDEX xif16ingrediente_empresa
 ON public.ingrediente_empresa USING BTREE
 ( cod_empresa );

CREATE INDEX xpkingrediente_empresa
 ON public.ingrediente_empresa USING BTREE
 ( cod_ingrediente, cod_empresa );

CREATE TABLE public.itens_de_um_lanche (
                cod_produto INTEGER NOT NULL,
                cod_ingrediente INTEGER NOT NULL,
                cod_empresa INTEGER NOT NULL,
                preco NUMERIC(14,2) NOT NULL,
                valor_calorico DOUBLE PRECISION,
                CONSTRAINT itens_de_um_lanche_pkey PRIMARY KEY (cod_produto, cod_ingrediente, cod_empresa)
);


CREATE INDEX ifk_rel_07
 ON public.itens_de_um_lanche USING BTREE
 ( cod_ingrediente, cod_empresa );

CREATE INDEX itens_de_um_lanche_fkindex1
 ON public.itens_de_um_lanche USING BTREE
 ( cod_ingrediente, cod_empresa );

CREATE INDEX itens_de_um_lanche_fkindex3
 ON public.itens_de_um_lanche USING BTREE
 ( cod_produto );

CREATE INDEX xif12itens_de_um_lanche
 ON public.itens_de_um_lanche USING BTREE
 ( cod_produto );

CREATE INDEX xif17itens_de_um_lanche
 ON public.itens_de_um_lanche USING BTREE
 ( cod_ingrediente, cod_empresa );

CREATE INDEX xpkitens_de_um_lanche
 ON public.itens_de_um_lanche USING BTREE
 ( cod_produto, cod_ingrediente, cod_empresa );

CREATE TABLE public.horario_funcionamento (
                cod_empresa INTEGER NOT NULL,
                dia_da_semana VARCHAR(10) NOT NULL,
                hora_inicio TIME NOT NULL,
                hora_fim TIME NOT NULL,
                CONSTRAINT horario_funcionamento_pk PRIMARY KEY (cod_empresa, dia_da_semana)
);


CREATE INDEX dia_da_semana_has_empresa_fkindex2
 ON public.horario_funcionamento USING BTREE
 ( cod_empresa );

CREATE INDEX ifk_rel_31
 ON public.horario_funcionamento USING BTREE
 ( cod_empresa );

CREATE TABLE public.funcionario_has_empresa (
                cod_funcionario INTEGER NOT NULL,
                cod_empresa INTEGER NOT NULL,
                responsavel CHAR NOT NULL,
                CONSTRAINT funcionario_has_empresa_pkey PRIMARY KEY (cod_funcionario, cod_empresa)
);


CREATE INDEX funcionario_has_empresa_fkindex1
 ON public.funcionario_has_empresa USING BTREE
 ( cod_funcionario );

CREATE INDEX funcionario_has_empresa_fkindex2
 ON public.funcionario_has_empresa USING BTREE
 ( cod_empresa );

CREATE INDEX ifk_rel_38
 ON public.funcionario_has_empresa USING BTREE
 ( cod_funcionario );

CREATE INDEX ifk_rel_39
 ON public.funcionario_has_empresa USING BTREE
 ( cod_empresa );

CREATE SEQUENCE public.cliente_cod_cliente_seq;

CREATE TABLE public.cliente (
                cod_cliente INTEGER NOT NULL DEFAULT nextval('public.cliente_cod_cliente_seq'),
                cod_cidade INTEGER NOT NULL,
                nome VARCHAR(50) NOT NULL,
                data_nascimento DATE NOT NULL,
                email VARCHAR(30) NOT NULL,
                senha VARCHAR(20) NOT NULL,
                telefone VARCHAR(20) NOT NULL,
                celular VARCHAR(20) NOT NULL,
                endereco VARCHAR(50) NOT NULL,
                numero VARCHAR(10) NOT NULL,
                bairro VARCHAR(45) NOT NULL,
                complemento VARCHAR(30),
                cep CHAR(9) NOT NULL,
                cpf CHAR(11) NOT NULL,
                status_usuario SMALLINT NOT NULL,
                data_cadastro TIMESTAMP NOT NULL,
                observacao TEXT,
                CONSTRAINT cliente_pkey PRIMARY KEY (cod_cliente)
);


ALTER SEQUENCE public.cliente_cod_cliente_seq OWNED BY public.cliente.cod_cliente;

CREATE INDEX ifk_rel_28
 ON public.cliente USING BTREE
 ( cod_cidade );

CREATE INDEX tb_usuario_fkindex1
 ON public.cliente USING BTREE
 ( cod_cidade );

CREATE TABLE public.participantes_venda_coletiva (
                cod_venda_coletiva INTEGER NOT NULL,
                cod_cliente INTEGER NOT NULL,
                CONSTRAINT participantes_venda_coletiva_pk PRIMARY KEY (cod_venda_coletiva, cod_cliente)
);


CREATE SEQUENCE public.pedido_cod_pedido_seq;

CREATE TABLE public.pedido (
                cod_pedido INTEGER NOT NULL DEFAULT nextval('public.pedido_cod_pedido_seq'),
                cod_entrega INTEGER NOT NULL,
                cod_cliente INTEGER NOT NULL,
                data DATE,
                valor_total NUMERIC(14,2) NOT NULL,
                rua VARCHAR(50),
                numero SMALLINT,
                complemento VARCHAR(20),
                tempo_entrega_minutos SMALLINT,
                cep VARCHAR(8),
                status_pagamento SMALLINT,
                status_pedido SMALLINT,
                telefone VARCHAR(20) NOT NULL,
                CONSTRAINT pedido_pkey PRIMARY KEY (cod_pedido)
);


ALTER SEQUENCE public.pedido_cod_pedido_seq OWNED BY public.pedido.cod_pedido;

CREATE INDEX ifk_rel_29
 ON public.pedido USING BTREE
 ( cod_cliente );

CREATE INDEX ifk_rel_33
 ON public.pedido USING BTREE
 ( cod_entrega );

CREATE INDEX pedido_fkindex1
 ON public.pedido USING BTREE
 ( cod_cliente );

CREATE INDEX pedido_fkindex2
 ON public.pedido USING BTREE
 ( cod_entrega );

CREATE INDEX xif26pedido
 ON public.pedido USING BTREE
 ( cod_cliente );

CREATE INDEX xpkpedido
 ON public.pedido USING BTREE
 ( cod_pedido );

CREATE TABLE public.itens_pedido (
                cod_pedido INTEGER NOT NULL,
                cod_tamanho_produto INTEGER NOT NULL,
                quantidade SMALLINT,
                quilos DOUBLE PRECISION,
                CONSTRAINT itens_pedido_pkey PRIMARY KEY (cod_pedido, cod_tamanho_produto)
);


CREATE INDEX ifk_rel_08
 ON public.itens_pedido USING BTREE
 ( cod_pedido );

CREATE INDEX itens_pedido_fkindex1
 ON public.itens_pedido USING BTREE
 ( cod_pedido );

CREATE INDEX xif28pedido_produto
 ON public.itens_pedido USING BTREE
 ( cod_pedido );

CREATE INDEX xpkpedido_produto
 ON public.itens_pedido USING BTREE
 ( cod_pedido );

CREATE TABLE public.sabores_pizza (
                cod_outro_sabor_pizza INTEGER NOT NULL,
                cod_produto INTEGER NOT NULL,
                cod_tamanho_produto INTEGER NOT NULL,
                cod_pedido INTEGER NOT NULL,
                CONSTRAINT sabores_pizza_pkey PRIMARY KEY (cod_outro_sabor_pizza, cod_produto, cod_tamanho_produto, cod_pedido)
);


CREATE INDEX ifk_rel_30
 ON public.sabores_pizza USING BTREE
 ( cod_pedido, cod_produto );

CREATE INDEX sabores_pizza_fkindex1
 ON public.sabores_pizza USING BTREE
 ( cod_pedido, cod_produto );

CREATE INDEX sabores_pizza_fkindex2
 ON public.sabores_pizza USING BTREE
 ( cod_outro_sabor_pizza );

CREATE TABLE public.pedido_personalizado (
                cod_empresa INTEGER NOT NULL,
                cod_ingrediente INTEGER NOT NULL,
                cod_pedido INTEGER NOT NULL,
                cod_tamanho_produto INTEGER NOT NULL,
                CONSTRAINT pedido_personalizado_pkey PRIMARY KEY (cod_empresa, cod_ingrediente, cod_pedido, cod_tamanho_produto)
);


CREATE INDEX ifk_rel_12
 ON public.pedido_personalizado USING BTREE
 ( cod_pedido );

CREATE INDEX pedido_personalizado_fkindex1
 ON public.pedido_personalizado USING BTREE
 ( cod_pedido );

CREATE INDEX pedido_personalizado_fkindex2
 ON public.pedido_personalizado USING BTREE
 ( cod_ingrediente, cod_empresa );

CREATE SEQUENCE public.categoria_ingrediente_cod_tipo_ingrediente_seq;

CREATE TABLE public.categoria_ingrediente (
                cod_tipo_ingrediente INTEGER NOT NULL DEFAULT nextval('public.categoria_ingrediente_cod_tipo_ingrediente_seq'),
                nome VARCHAR(40) NOT NULL,
                CONSTRAINT categoria_ingrediente_pkey PRIMARY KEY (cod_tipo_ingrediente)
);


ALTER SEQUENCE public.categoria_ingrediente_cod_tipo_ingrediente_seq OWNED BY public.categoria_ingrediente.cod_tipo_ingrediente;

CREATE TABLE public.categoria_permitida_como_adicional (
                cod_produto INTEGER NOT NULL,
                cod_tipo_ingrediente INTEGER NOT NULL,
                qtd_max_adicionais SMALLINT NOT NULL,
                CONSTRAINT categoria_permitida_como_adicional_pkey PRIMARY KEY (cod_produto, cod_tipo_ingrediente)
);


CREATE INDEX ifk_rel_47
 ON public.categoria_permitida_como_adicional USING BTREE
 ( cod_produto );

CREATE INDEX ifk_rel_48
 ON public.categoria_permitida_como_adicional USING BTREE
 ( cod_tipo_ingrediente );

CREATE INDEX tipo_ingrediente_empresa_has_produto_fkindex2
 ON public.categoria_permitida_como_adicional USING BTREE
 ( cod_produto );

CREATE TABLE public.categoria_ingrediente_empresa (
                cod_tipo_ingrediente INTEGER NOT NULL,
                cod_empresa INTEGER NOT NULL,
                cod_ingrediente INTEGER NOT NULL,
                CONSTRAINT categoria_ingrediente_empresa_pkey PRIMARY KEY (cod_tipo_ingrediente, cod_empresa, cod_ingrediente)
);


CREATE INDEX ifk_rel_44
 ON public.categoria_ingrediente_empresa USING BTREE
 ( cod_tipo_ingrediente );

CREATE INDEX ifk_rel_45
 ON public.categoria_ingrediente_empresa USING BTREE
 ( cod_ingrediente, cod_empresa );

CREATE INDEX tipo_ingrediente_has_ingrediente_empresa_fkindex1
 ON public.categoria_ingrediente_empresa USING BTREE
 ( cod_tipo_ingrediente );

CREATE INDEX tipo_ingrediente_has_ingrediente_empresa_fkindex2
 ON public.categoria_ingrediente_empresa USING BTREE
 ( cod_ingrediente, cod_empresa );

ALTER TABLE public.role_has_resource ADD CONSTRAINT resource_role_has_resources_fk
FOREIGN KEY (cod_resource)
REFERENCES public.resource (cod_resource)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.role_has_resource ADD CONSTRAINT role_role_has_resources_fk
FOREIGN KEY (cod_role)
REFERENCES public.role (cod_role)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.privilege ADD CONSTRAINT role_privileges_fk
FOREIGN KEY (cod_role)
REFERENCES public.role (cod_role)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.empresa ADD CONSTRAINT estrategia_cobranca_pizza_empresa_fk
FOREIGN KEY (cod_estrategia_cobranca_pizza)
REFERENCES public.estrategia_cobranca_pizza (cod_estrategia_cobranca_pizza)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.produto_venda_coletiva ADD CONSTRAINT promocao_venda_coletiva_produto_venda_coletiva_fk
FOREIGN KEY (cod_venda_coletiva)
REFERENCES public.promocao_venda_coletiva (cod_venda_coletiva)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.participantes_venda_coletiva ADD CONSTRAINT promocao_venda_coletiva_participantes_venda_coletiva_fk
FOREIGN KEY (cod_venda_coletiva)
REFERENCES public.promocao_venda_coletiva (cod_venda_coletiva)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.tipos_produtos_empresa ADD CONSTRAINT tipos_produtos_empresa_cod_tipo_produto_fkey
FOREIGN KEY (cod_tipo_produto)
REFERENCES public.tipo_produto (cod_tipo_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.produto ADD CONSTRAINT tipo_produto_produto_fk
FOREIGN KEY (cod_tipo_produto)
REFERENCES public.tipo_produto (cod_tipo_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.tb_cidade ADD CONSTRAINT tb_cidade_cod_estado_fkey
FOREIGN KEY (cod_estado)
REFERENCES public.tb_estado (cod_estado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.cliente ADD CONSTRAINT cliente_cod_cidade_fkey
FOREIGN KEY (cod_cidade)
REFERENCES public.tb_cidade (cod_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.empresa ADD CONSTRAINT empresa_cod_cidade_fkey
FOREIGN KEY (cod_cidade)
REFERENCES public.tb_cidade (cod_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ingrediente_empresa ADD CONSTRAINT ingrediente_empresa_cod_ingrediente_fkey
FOREIGN KEY (cod_ingrediente)
REFERENCES public.ingrediente (cod_ingrediente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.funcionario_entregador ADD CONSTRAINT funcionario_entregador_cod_funcionario_fkey
FOREIGN KEY (cod_funcionario)
REFERENCES public.funcionario (cod_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.funcionario_has_empresa ADD CONSTRAINT funcionario_has_empresa_cod_funcionario_fkey
FOREIGN KEY (cod_funcionario)
REFERENCES public.funcionario (cod_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.privilege ADD CONSTRAINT funcionario_privileges_fk
FOREIGN KEY (cod_funcionario)
REFERENCES public.funcionario (cod_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.entrega ADD CONSTRAINT entrega_cod_funcionario_fkey
FOREIGN KEY (cod_funcionario)
REFERENCES public.funcionario_entregador (cod_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedido ADD CONSTRAINT pedido_cod_entrega_fkey
FOREIGN KEY (cod_entrega)
REFERENCES public.entrega (cod_entrega)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.funcionario_has_empresa ADD CONSTRAINT funcionario_has_empresa_cod_empresa_fkey
FOREIGN KEY (cod_empresa)
REFERENCES public.empresa (cod_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.horario_funcionamento ADD CONSTRAINT horario_funcionamento_cod_empresa_fkey
FOREIGN KEY (cod_empresa)
REFERENCES public.empresa (cod_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ingrediente_empresa ADD CONSTRAINT ingrediente_empresa_cod_empresa_fkey
FOREIGN KEY (cod_empresa)
REFERENCES public.empresa (cod_empresa)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.tipos_produtos_empresa ADD CONSTRAINT tipos_produtos_empresa_cod_empresa_fkey
FOREIGN KEY (cod_empresa)
REFERENCES public.empresa (cod_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.produto ADD CONSTRAINT empresa_produto_fk
FOREIGN KEY (cod_empresa)
REFERENCES public.empresa (cod_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.recado_cliente ADD CONSTRAINT empresa_recado_cliente_fk
FOREIGN KEY (cod_empresa)
REFERENCES public.empresa (cod_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.categoria_permitida_como_adicional ADD CONSTRAINT categoria_permitida_como_adicional_cod_produto_fkey
FOREIGN KEY (cod_produto)
REFERENCES public.produto (cod_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.foto_produto ADD CONSTRAINT foto_produto_cod_produto_fkey
FOREIGN KEY (cod_produto)
REFERENCES public.produto (cod_produto)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.itens_de_um_lanche ADD CONSTRAINT itens_de_um_lanche_cod_produto_fkey
FOREIGN KEY (cod_produto)
REFERENCES public.produto (cod_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.sabores_pizza ADD CONSTRAINT sabores_pizza_cod_outro_sabor_pizza_fkey
FOREIGN KEY (cod_outro_sabor_pizza)
REFERENCES public.produto (cod_produto)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.tamanho_produto ADD CONSTRAINT tamanho_produto_cod_produto_fkey
FOREIGN KEY (cod_produto)
REFERENCES public.produto (cod_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.recado_cliente ADD CONSTRAINT produto_recado_cliente_fk
FOREIGN KEY (cod_produto)
REFERENCES public.produto (cod_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.itens_pedido ADD CONSTRAINT itens_pedido_cod_produto_fkey
FOREIGN KEY (cod_tamanho_produto)
REFERENCES public.tamanho_produto (cod_tamanho_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.promocao ADD CONSTRAINT promocao_cod_produto_fkey
FOREIGN KEY (cod_tamanho_produto)
REFERENCES public.tamanho_produto (cod_tamanho_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.produto_venda_coletiva ADD CONSTRAINT tamanho_produto_produto_venda_coletiva_fk
FOREIGN KEY (cod_tamanho_produto)
REFERENCES public.tamanho_produto (cod_tamanho_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.categoria_ingrediente_empresa ADD CONSTRAINT categoria_ingrediente_empresa_cod_ingrediente_fkey
FOREIGN KEY (cod_ingrediente, cod_empresa)
REFERENCES public.ingrediente_empresa (cod_ingrediente, cod_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.itens_de_um_lanche ADD CONSTRAINT itens_de_um_lanche_cod_ingrediente_fkey
FOREIGN KEY (cod_ingrediente, cod_empresa)
REFERENCES public.ingrediente_empresa (cod_ingrediente, cod_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedido_personalizado ADD CONSTRAINT pedido_personalizado_cod_ingrediente_fkey
FOREIGN KEY (cod_ingrediente, cod_empresa)
REFERENCES public.ingrediente_empresa (cod_ingrediente, cod_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedido ADD CONSTRAINT pedido_cod_cliente_fkey
FOREIGN KEY (cod_cliente)
REFERENCES public.cliente (cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.participantes_venda_coletiva ADD CONSTRAINT cliente_participantes_venda_coletiva_fk
FOREIGN KEY (cod_cliente)
REFERENCES public.cliente (cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.itens_pedido ADD CONSTRAINT itens_pedido_cod_pedido_fkey
FOREIGN KEY (cod_pedido)
REFERENCES public.pedido (cod_pedido)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.pedido_personalizado ADD CONSTRAINT pedido_personalizado_cod_pedido_fkey
FOREIGN KEY (cod_pedido, cod_tamanho_produto)
REFERENCES public.itens_pedido (cod_pedido, cod_tamanho_produto)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.sabores_pizza ADD CONSTRAINT sabores_pizza_cod_pedido_fkey
FOREIGN KEY (cod_pedido, cod_tamanho_produto)
REFERENCES public.itens_pedido (cod_pedido, cod_tamanho_produto)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE public.categoria_ingrediente_empresa ADD CONSTRAINT categoria_ingrediente_empresa_cod_tipo_ingrediente_fkey
FOREIGN KEY (cod_tipo_ingrediente)
REFERENCES public.categoria_ingrediente (cod_tipo_ingrediente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.categoria_permitida_como_adicional ADD CONSTRAINT categoria_permitida_como_adicional_cod_tipo_ingrediente_fkey
FOREIGN KEY (cod_tipo_ingrediente)
REFERENCES public.categoria_ingrediente (cod_tipo_ingrediente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
