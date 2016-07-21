--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categoria_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria_empresa (
    cod_categoria_empresa bigint NOT NULL,
    nome character varying(40) NOT NULL,
    cod_empresa integer NOT NULL
);


ALTER TABLE public.categoria_empresa OWNER TO postgres;

--
-- Name: categoria_empresa_cod_categoria_empresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categoria_empresa_cod_categoria_empresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_empresa_cod_categoria_empresa_seq OWNER TO postgres;

--
-- Name: categoria_empresa_cod_categoria_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categoria_empresa_cod_categoria_empresa_seq OWNED BY categoria_empresa.cod_categoria_empresa;


--
-- Name: categoria_ingrediente_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria_ingrediente_empresa (
    cod_empresa integer NOT NULL,
    cod_ingrediente integer NOT NULL,
    cod_categoria_empresa bigint NOT NULL
);


ALTER TABLE public.categoria_ingrediente_empresa OWNER TO postgres;

--
-- Name: categoria_permitida_como_adicional; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria_permitida_como_adicional (
    cod_produto bigint NOT NULL,
    cod_categoria_empresa bigint NOT NULL,
    qtd_max_adicionais smallint
);


ALTER TABLE public.categoria_permitida_como_adicional OWNER TO postgres;

--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cliente (
    cod_cliente integer NOT NULL,
    nome character varying(50) NOT NULL,
    data_nascimento date,
    email character varying(30) NOT NULL,
    senha character varying(20) NOT NULL,
    telefone character varying(20),
    celular character varying(20),
    endereco character varying(50),
    numero character varying(10),
    bairro character varying(45),
    complemento character varying(30),
    cep character(9),
    cpf character(11),
    status_usuario smallint,
    data_cadastro timestamp without time zone NOT NULL,
    observacao text
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_cod_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_cod_cliente_seq OWNER TO postgres;

--
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_cod_cliente_seq OWNED BY cliente.cod_cliente;


--
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE empresa (
    cod_empresa integer NOT NULL,
    cod_cidade integer NOT NULL,
    razao_social character varying(100) NOT NULL,
    cnpj character(14) NOT NULL,
    rua character varying(50) NOT NULL,
    numero smallint NOT NULL,
    cep character(8) NOT NULL,
    complemento character varying(20),
    valor_minimo_entrega numeric(14,2),
    nome_fantasia character varying(100),
    logo bytea,
    telefone1 character varying(20),
    telefone2 character varying(20),
    bairro character varying(30),
    email character varying(50),
    timezone character varying NOT NULL,
    url character varying(30) NOT NULL,
    removed smallint DEFAULT 0 NOT NULL,
    desativada boolean DEFAULT false NOT NULL,
    data_cadastro timestamp without time zone,
    cod_estrategia_cobranca_pizza integer,
    website character varying(50),
    atende_diabetico boolean,
    pouco_sal boolean,
    sem_glutem boolean,
    intolerancia_lactose boolean,
    organicos boolean
);


ALTER TABLE public.empresa OWNER TO postgres;

--
-- Name: empresa_cod_empresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empresa_cod_empresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresa_cod_empresa_seq OWNER TO postgres;

--
-- Name: empresa_cod_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresa_cod_empresa_seq OWNED BY empresa.cod_empresa;


--
-- Name: entrega; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entrega (
    cod_entrega integer NOT NULL,
    cod_funcionario bigint NOT NULL,
    km_total double precision
);


ALTER TABLE public.entrega OWNER TO postgres;

--
-- Name: estrategia_cobranca_pizza; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estrategia_cobranca_pizza (
    cod_estrategia_cobranca_pizza integer NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE public.estrategia_cobranca_pizza OWNER TO postgres;

--
-- Name: estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1 OWNER TO postgres;

--
-- Name: estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1 OWNED BY estrategia_cobranca_pizza.cod_estrategia_cobranca_pizza;


--
-- Name: foto_produto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE foto_produto (
    cod_foto integer NOT NULL,
    cod_produto bigint NOT NULL,
    foto bytea
);


ALTER TABLE public.foto_produto OWNER TO postgres;

--
-- Name: foto_produto_cod_foto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE foto_produto_cod_foto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foto_produto_cod_foto_seq OWNER TO postgres;

--
-- Name: foto_produto_cod_foto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE foto_produto_cod_foto_seq OWNED BY foto_produto.cod_foto;


--
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE funcionario (
    cod_funcionario bigint NOT NULL,
    nome character varying(50) NOT NULL,
    cpf character(11) NOT NULL,
    data_nascimento date,
    email character varying(30),
    senha character varying(15) NOT NULL,
    telefone_residencial character varying(20),
    telefone_comercial character varying(20),
    celular character varying(20),
    removed character(1) DEFAULT 0 NOT NULL,
    endereco character varying(50),
    numero smallint,
    bairro character varying(45),
    complemento character varying(30),
    cep character(8),
    status_user smallint DEFAULT 0 NOT NULL,
    data_cadastro timestamp without time zone DEFAULT now(),
    observacao text
);


ALTER TABLE public.funcionario OWNER TO postgres;

--
-- Name: funcionario_cod_funcionario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funcionario_cod_funcionario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.funcionario_cod_funcionario_seq OWNER TO postgres;

--
-- Name: funcionario_cod_funcionario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funcionario_cod_funcionario_seq OWNED BY funcionario.cod_funcionario;


--
-- Name: funcionario_entregador; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE funcionario_entregador (
    cod_funcionario bigint NOT NULL,
    modelo_moto character varying(30),
    consumo double precision,
    total_km double precision,
    total_acidentes integer DEFAULT 0
);


ALTER TABLE public.funcionario_entregador OWNER TO postgres;

--
-- Name: funcionario_has_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE funcionario_has_empresa (
    cod_funcionario bigint NOT NULL,
    cod_empresa integer NOT NULL,
    responsavel character(1) NOT NULL
);


ALTER TABLE public.funcionario_has_empresa OWNER TO postgres;

--
-- Name: horario_funcionamento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE horario_funcionamento (
    cod_empresa integer NOT NULL,
    dia_da_semana character varying(10) NOT NULL,
    hora_inicio time without time zone,
    hora_fim time without time zone
);


ALTER TABLE public.horario_funcionamento OWNER TO postgres;

--
-- Name: ingrediente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ingrediente (
    cod_ingrediente integer NOT NULL,
    nome character varying(50) NOT NULL,
    imagem bytea,
    valor_calorico double precision
);


ALTER TABLE public.ingrediente OWNER TO postgres;

--
-- Name: ingrediente_cod_ingrediente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ingrediente_cod_ingrediente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingrediente_cod_ingrediente_seq OWNER TO postgres;

--
-- Name: ingrediente_cod_ingrediente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ingrediente_cod_ingrediente_seq OWNED BY ingrediente.cod_ingrediente;


--
-- Name: ingrediente_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ingrediente_empresa (
    cod_ingrediente integer NOT NULL,
    cod_empresa integer NOT NULL,
    descricao character varying(200),
    imagem bytea,
    preco_quando_adicional numeric(14,2),
    removed smallint DEFAULT 0 NOT NULL,
    preco_de_cem_gramas numeric(14,2)
);


ALTER TABLE public.ingrediente_empresa OWNER TO postgres;

--
-- Name: ingrediente_empresa_produto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ingrediente_empresa_produto (
    cod_ingrediente integer NOT NULL,
    cod_empresa integer NOT NULL,
    cod_produto bigint NOT NULL,
    quantidade_utilizada double precision,
    valor_calorico double precision
);


ALTER TABLE public.ingrediente_empresa_produto OWNER TO postgres;

--
-- Name: itens_pedido; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE itens_pedido (
    cod_tamanho_produto bigint NOT NULL,
    cod_pedido bigint NOT NULL,
    cod_empresa integer NOT NULL,
    quantidade smallint,
    quilos double precision
);


ALTER TABLE public.itens_pedido OWNER TO postgres;

--
-- Name: participantes_venda_coletiva; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE participantes_venda_coletiva (
    cod_venda_coletiva integer NOT NULL,
    cod_cliente integer NOT NULL
);


ALTER TABLE public.participantes_venda_coletiva OWNER TO postgres;

--
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pedido (
    cod_pedido bigint NOT NULL,
    cod_cliente integer,
    data timestamp without time zone NOT NULL,
    valor_total numeric(14,2),
    rua character varying(50) NOT NULL,
    numero smallint NOT NULL,
    complemento character varying(20),
    cep character varying(8),
    status_pagamento smallint,
    distancia numeric(4,2),
    telefone character varying(20) NOT NULL,
    cod_cidade integer
);


ALTER TABLE public.pedido OWNER TO postgres;

--
-- Name: pedido_cod_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pedido_cod_pedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedido_cod_pedido_seq OWNER TO postgres;

--
-- Name: pedido_cod_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pedido_cod_pedido_seq OWNED BY pedido.cod_pedido;


--
-- Name: pedido_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pedido_empresa (
    cod_pedido bigint NOT NULL,
    cod_empresa integer NOT NULL,
    entregar boolean DEFAULT true NOT NULL,
    observacao character varying,
    tempo_entrega_minutos smallint,
    cod_entrega integer,
    notificacaosms boolean DEFAULT true NOT NULL,
    status_pedido smallint
);


ALTER TABLE public.pedido_empresa OWNER TO postgres;

--
-- Name: pedido_personalizado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pedido_personalizado (
    cod_tamanho_produto bigint NOT NULL,
    cod_pedido bigint NOT NULL,
    cod_empresa integer NOT NULL,
    cod_ingrediente integer NOT NULL,
    indice integer NOT NULL
);


ALTER TABLE public.pedido_personalizado OWNER TO postgres;

--
-- Name: privilege; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE privilege (
    cod_funcionario bigint NOT NULL,
    cod_role integer NOT NULL
);


ALTER TABLE public.privilege OWNER TO postgres;

--
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE produto (
    cod_produto bigint NOT NULL,
    nome character varying(50) NOT NULL,
    descricao character varying,
    tempo_preparo_minutos smallint,
    valor_calorico double precision DEFAULT 0 NOT NULL,
    valor_calorico_aproximado double precision DEFAULT 0 NOT NULL,
    numero_max_adicionais smallint,
    cobrado_por_quilo boolean,
    disponivel boolean DEFAULT true,
    removed smallint DEFAULT 0 NOT NULL,
    cod_empresa integer NOT NULL,
    cod_tipo_produto integer NOT NULL,
    atende_diabetico boolean,
    pouco_sal boolean,
    sem_glutem boolean,
    intolerancia_lactose boolean,
    organicos boolean
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- Name: produto_cod_produto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produto_cod_produto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produto_cod_produto_seq OWNER TO postgres;

--
-- Name: produto_cod_produto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produto_cod_produto_seq OWNED BY produto.cod_produto;


--
-- Name: produto_venda_coletiva; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE produto_venda_coletiva (
    cod_venda_coletiva integer NOT NULL,
    cod_tamanho_produto bigint NOT NULL,
    preco_promocional numeric(14,2) NOT NULL
);


ALTER TABLE public.produto_venda_coletiva OWNER TO postgres;

--
-- Name: promocao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE promocao (
    cod_promocao bigint NOT NULL,
    cod_produto integer NOT NULL,
    data_inicio date NOT NULL,
    data_fim date NOT NULL,
    preco_promocional numeric(14,2) NOT NULL,
    anuncio text,
    removed smallint DEFAULT 0 NOT NULL,
    cod_tamanho_produto bigint NOT NULL
);


ALTER TABLE public.promocao OWNER TO postgres;

--
-- Name: promocao_cod_promocao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE promocao_cod_promocao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promocao_cod_promocao_seq OWNER TO postgres;

--
-- Name: promocao_cod_promocao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE promocao_cod_promocao_seq OWNED BY promocao.cod_promocao;


--
-- Name: promocao_venda_coletiva; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE promocao_venda_coletiva (
    cod_venda_coletiva integer NOT NULL,
    data_inicio_venda date NOT NULL,
    data_fim_venda date NOT NULL,
    num_necessario_participantes smallint NOT NULL,
    data_inicio_utilizacao date NOT NULL,
    data_fim_utilizacao date NOT NULL
);


ALTER TABLE public.promocao_venda_coletiva OWNER TO postgres;

--
-- Name: promocao_venda_coletiva_cod_venda_coletiva_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE promocao_venda_coletiva_cod_venda_coletiva_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promocao_venda_coletiva_cod_venda_coletiva_seq OWNER TO postgres;

--
-- Name: promocao_venda_coletiva_cod_venda_coletiva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE promocao_venda_coletiva_cod_venda_coletiva_seq OWNED BY promocao_venda_coletiva.cod_venda_coletiva;


--
-- Name: recado_cliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recado_cliente (
    cod_recado_cliente bigint NOT NULL,
    data date,
    texto character varying,
    hora time without time zone,
    cod_empresa integer NOT NULL,
    cod_produto bigint NOT NULL
);


ALTER TABLE public.recado_cliente OWNER TO postgres;

--
-- Name: recado_cliente_cod_recado_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recado_cliente_cod_recado_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recado_cliente_cod_recado_cliente_seq OWNER TO postgres;

--
-- Name: recado_cliente_cod_recado_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recado_cliente_cod_recado_cliente_seq OWNED BY recado_cliente.cod_recado_cliente;


--
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource (
    cod_resource integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.resource OWNER TO postgres;

--
-- Name: resource_cod_resource_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_cod_resource_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_cod_resource_seq OWNER TO postgres;

--
-- Name: resource_cod_resource_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resource_cod_resource_seq OWNED BY resource.cod_resource;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE role (
    cod_role integer NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_cod_role_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_cod_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_cod_role_seq OWNER TO postgres;

--
-- Name: role_cod_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_cod_role_seq OWNED BY role.cod_role;


--
-- Name: role_has_resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE role_has_resource (
    cod_role integer NOT NULL,
    cod_resource integer NOT NULL
);


ALTER TABLE public.role_has_resource OWNER TO postgres;

--
-- Name: sabores_pizza; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sabores_pizza (
    cod_outro_sabor_pizza bigint NOT NULL,
    cod_tamanho_produto bigint NOT NULL,
    cod_pedido bigint NOT NULL,
    cod_empresa integer NOT NULL,
    indice integer NOT NULL
);


ALTER TABLE public.sabores_pizza OWNER TO postgres;

--
-- Name: tamanho_produto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tamanho_produto (
    cod_tamanho_produto bigint NOT NULL,
    cod_produto bigint NOT NULL,
    descricao character varying(20) NOT NULL,
    preco numeric(14,2) NOT NULL,
    numero_sabores_pizza smallint,
    removed smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.tamanho_produto OWNER TO postgres;

--
-- Name: tamanho_produto_cod_tamanho_produto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tamanho_produto_cod_tamanho_produto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tamanho_produto_cod_tamanho_produto_seq OWNER TO postgres;

--
-- Name: tamanho_produto_cod_tamanho_produto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tamanho_produto_cod_tamanho_produto_seq OWNED BY tamanho_produto.cod_tamanho_produto;


--
-- Name: tb_cidade; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_cidade (
    cod_cidade integer NOT NULL,
    cod_estado integer NOT NULL,
    nome character varying(90)
);


ALTER TABLE public.tb_cidade OWNER TO postgres;

--
-- Name: tb_cidade_cod_cidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_cidade_cod_cidade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_cidade_cod_cidade_seq OWNER TO postgres;

--
-- Name: tb_cidade_cod_cidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_cidade_cod_cidade_seq OWNED BY tb_cidade.cod_cidade;


--
-- Name: tb_estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_estado (
    cod_estado integer NOT NULL,
    uf character varying(2),
    nome character varying(30)
);


ALTER TABLE public.tb_estado OWNER TO postgres;

--
-- Name: tb_estado_cod_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tb_estado_cod_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_estado_cod_estado_seq OWNER TO postgres;

--
-- Name: tb_estado_cod_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_estado_cod_estado_seq OWNED BY tb_estado.cod_estado;


--
-- Name: tipo_produto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_produto (
    cod_tipo_produto integer NOT NULL,
    nome character varying(50),
    foto bytea,
    is_especialidade boolean
);


ALTER TABLE public.tipo_produto OWNER TO postgres;

--
-- Name: tipo_produto_cod_tipo_produto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_produto_cod_tipo_produto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_produto_cod_tipo_produto_seq OWNER TO postgres;

--
-- Name: tipo_produto_cod_tipo_produto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_produto_cod_tipo_produto_seq OWNED BY tipo_produto.cod_tipo_produto;


--
-- Name: tipos_produtos_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipos_produtos_empresa (
    cod_tipo_produto integer NOT NULL,
    cod_empresa integer NOT NULL
);


ALTER TABLE public.tipos_produtos_empresa OWNER TO postgres;

--
-- Name: cod_categoria_empresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_empresa ALTER COLUMN cod_categoria_empresa SET DEFAULT nextval('categoria_empresa_cod_categoria_empresa_seq'::regclass);


--
-- Name: cod_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN cod_cliente SET DEFAULT nextval('cliente_cod_cliente_seq'::regclass);


--
-- Name: cod_empresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa ALTER COLUMN cod_empresa SET DEFAULT nextval('empresa_cod_empresa_seq'::regclass);


--
-- Name: cod_estrategia_cobranca_pizza; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estrategia_cobranca_pizza ALTER COLUMN cod_estrategia_cobranca_pizza SET DEFAULT nextval('estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1'::regclass);


--
-- Name: cod_foto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY foto_produto ALTER COLUMN cod_foto SET DEFAULT nextval('foto_produto_cod_foto_seq'::regclass);


--
-- Name: cod_funcionario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario ALTER COLUMN cod_funcionario SET DEFAULT nextval('funcionario_cod_funcionario_seq'::regclass);


--
-- Name: cod_ingrediente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingrediente ALTER COLUMN cod_ingrediente SET DEFAULT nextval('ingrediente_cod_ingrediente_seq'::regclass);


--
-- Name: cod_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido ALTER COLUMN cod_pedido SET DEFAULT nextval('pedido_cod_pedido_seq'::regclass);


--
-- Name: cod_produto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto ALTER COLUMN cod_produto SET DEFAULT nextval('produto_cod_produto_seq'::regclass);


--
-- Name: cod_promocao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY promocao ALTER COLUMN cod_promocao SET DEFAULT nextval('promocao_cod_promocao_seq'::regclass);


--
-- Name: cod_venda_coletiva; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY promocao_venda_coletiva ALTER COLUMN cod_venda_coletiva SET DEFAULT nextval('promocao_venda_coletiva_cod_venda_coletiva_seq'::regclass);


--
-- Name: cod_recado_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recado_cliente ALTER COLUMN cod_recado_cliente SET DEFAULT nextval('recado_cliente_cod_recado_cliente_seq'::regclass);


--
-- Name: cod_resource; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource ALTER COLUMN cod_resource SET DEFAULT nextval('resource_cod_resource_seq'::regclass);


--
-- Name: cod_role; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN cod_role SET DEFAULT nextval('role_cod_role_seq'::regclass);


--
-- Name: cod_tamanho_produto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tamanho_produto ALTER COLUMN cod_tamanho_produto SET DEFAULT nextval('tamanho_produto_cod_tamanho_produto_seq'::regclass);


--
-- Name: cod_cidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_cidade ALTER COLUMN cod_cidade SET DEFAULT nextval('tb_cidade_cod_cidade_seq'::regclass);


--
-- Name: cod_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_estado ALTER COLUMN cod_estado SET DEFAULT nextval('tb_estado_cod_estado_seq'::regclass);


--
-- Name: cod_tipo_produto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_produto ALTER COLUMN cod_tipo_produto SET DEFAULT nextval('tipo_produto_cod_tipo_produto_seq'::regclass);


--
-- Name: categoria_ingrediente_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria_ingrediente_empresa
    ADD CONSTRAINT categoria_ingrediente_empresa_pkey PRIMARY KEY (cod_empresa, cod_ingrediente, cod_categoria_empresa);


--
-- Name: categoria_ingrediente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria_empresa
    ADD CONSTRAINT categoria_ingrediente_pkey PRIMARY KEY (cod_categoria_empresa);


--
-- Name: categoria_permitida_como_adicional_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria_permitida_como_adicional
    ADD CONSTRAINT categoria_permitida_como_adicional_pkey PRIMARY KEY (cod_produto, cod_categoria_empresa);


--
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cod_cliente);


--
-- Name: empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (cod_empresa);


--
-- Name: entrega_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entrega
    ADD CONSTRAINT entrega_pkey PRIMARY KEY (cod_entrega);


--
-- Name: estrategia_cobranca_pizza_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estrategia_cobranca_pizza
    ADD CONSTRAINT estrategia_cobranca_pizza_pk PRIMARY KEY (cod_estrategia_cobranca_pizza);


--
-- Name: foto_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY foto_produto
    ADD CONSTRAINT foto_produto_pkey PRIMARY KEY (cod_foto);


--
-- Name: funcionario_entregador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funcionario_entregador
    ADD CONSTRAINT funcionario_entregador_pkey PRIMARY KEY (cod_funcionario);


--
-- Name: funcionario_has_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funcionario_has_empresa
    ADD CONSTRAINT funcionario_has_empresa_pkey PRIMARY KEY (cod_funcionario, cod_empresa);


--
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (cod_funcionario);


--
-- Name: horario_funcionamento_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY horario_funcionamento
    ADD CONSTRAINT horario_funcionamento_pk PRIMARY KEY (cod_empresa, dia_da_semana);


--
-- Name: ingrediente_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingrediente_empresa
    ADD CONSTRAINT ingrediente_empresa_pkey PRIMARY KEY (cod_ingrediente, cod_empresa);


--
-- Name: ingrediente_empresa_produto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingrediente_empresa_produto
    ADD CONSTRAINT ingrediente_empresa_produto_pk PRIMARY KEY (cod_ingrediente, cod_empresa, cod_produto);


--
-- Name: ingrediente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingrediente
    ADD CONSTRAINT ingrediente_pkey PRIMARY KEY (cod_ingrediente);


--
-- Name: itens_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY itens_pedido
    ADD CONSTRAINT itens_pedido_pkey PRIMARY KEY (cod_tamanho_produto, cod_pedido, cod_empresa);


--
-- Name: participantes_venda_coletiva_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY participantes_venda_coletiva
    ADD CONSTRAINT participantes_venda_coletiva_pk PRIMARY KEY (cod_venda_coletiva, cod_cliente);


--
-- Name: pedido_empresa_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedido_empresa
    ADD CONSTRAINT pedido_empresa_pk PRIMARY KEY (cod_pedido, cod_empresa);


--
-- Name: pedido_personalizado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedido_personalizado
    ADD CONSTRAINT pedido_personalizado_pkey PRIMARY KEY (cod_tamanho_produto, cod_pedido, cod_empresa, cod_ingrediente, indice);


--
-- Name: pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (cod_pedido);


--
-- Name: privilege_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY privilege
    ADD CONSTRAINT privilege_pk PRIMARY KEY (cod_funcionario, cod_role);


--
-- Name: produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (cod_produto);


--
-- Name: produto_venda_coletiva_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produto_venda_coletiva
    ADD CONSTRAINT produto_venda_coletiva_pk PRIMARY KEY (cod_venda_coletiva, cod_tamanho_produto);


--
-- Name: promocao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY promocao
    ADD CONSTRAINT promocao_pkey PRIMARY KEY (cod_promocao);


--
-- Name: promocao_venda_coletiva_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY promocao_venda_coletiva
    ADD CONSTRAINT promocao_venda_coletiva_pk PRIMARY KEY (cod_venda_coletiva);


--
-- Name: recado_cliente_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recado_cliente
    ADD CONSTRAINT recado_cliente_pk PRIMARY KEY (cod_recado_cliente);


--
-- Name: resource_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_pk PRIMARY KEY (cod_resource);


--
-- Name: role_has_resource_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role_has_resource
    ADD CONSTRAINT role_has_resource_pk PRIMARY KEY (cod_role, cod_resource);


--
-- Name: role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pk PRIMARY KEY (cod_role);


--
-- Name: sabores_pizza_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sabores_pizza
    ADD CONSTRAINT sabores_pizza_pkey PRIMARY KEY (cod_outro_sabor_pizza, cod_tamanho_produto, cod_pedido, cod_empresa, indice);


--
-- Name: tamanho_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tamanho_produto
    ADD CONSTRAINT tamanho_produto_pkey PRIMARY KEY (cod_tamanho_produto);


--
-- Name: tb_cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_cidade
    ADD CONSTRAINT tb_cidade_pkey PRIMARY KEY (cod_cidade);


--
-- Name: tb_estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_estado
    ADD CONSTRAINT tb_estado_pkey PRIMARY KEY (cod_estado);


--
-- Name: tipo_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_produto
    ADD CONSTRAINT tipo_produto_pkey PRIMARY KEY (cod_tipo_produto);


--
-- Name: tipos_produtos_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipos_produtos_empresa
    ADD CONSTRAINT tipos_produtos_empresa_pkey PRIMARY KEY (cod_tipo_produto, cod_empresa);


--
-- Name: cliente_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX cliente_idx ON cliente USING btree (email);


--
-- Name: dia_da_semana_has_empresa_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX dia_da_semana_has_empresa_fkindex2 ON horario_funcionamento USING btree (cod_empresa);


--
-- Name: empregado_entregador_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX empregado_entregador_fkindex1 ON funcionario_entregador USING btree (cod_funcionario);


--
-- Name: empresa_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX empresa_fkindex1 ON empresa USING btree (cod_cidade);


--
-- Name: empresa_has_tipo_produto_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX empresa_has_tipo_produto_fkindex1 ON tipos_produtos_empresa USING btree (cod_empresa);


--
-- Name: empresa_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX empresa_idx ON empresa USING btree (url);


--
-- Name: empresa_idx1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX empresa_idx1 ON empresa USING btree (cnpj);


--
-- Name: foto_produto_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX foto_produto_fkindex1 ON foto_produto USING btree (cod_produto);


--
-- Name: funcionario_has_empresa_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX funcionario_has_empresa_fkindex1 ON funcionario_has_empresa USING btree (cod_funcionario);


--
-- Name: funcionario_has_empresa_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX funcionario_has_empresa_fkindex2 ON funcionario_has_empresa USING btree (cod_empresa);


--
-- Name: funcionario_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX funcionario_idx ON funcionario USING btree (cpf);


--
-- Name: ifk_rel_05; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_05 ON ingrediente_empresa USING btree (cod_ingrediente);


--
-- Name: ifk_rel_13; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_13 ON foto_produto USING btree (cod_produto);


--
-- Name: ifk_rel_14; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_14 ON tamanho_produto USING btree (cod_produto);


--
-- Name: ifk_rel_17; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_17 ON tb_cidade USING btree (cod_estado);


--
-- Name: ifk_rel_18; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_18 ON empresa USING btree (cod_cidade);


--
-- Name: ifk_rel_19; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_19 ON promocao USING btree (cod_produto);


--
-- Name: ifk_rel_29; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_29 ON pedido USING btree (cod_cliente);


--
-- Name: ifk_rel_31; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_31 ON horario_funcionamento USING btree (cod_empresa);


--
-- Name: ifk_rel_32; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_32 ON funcionario_entregador USING btree (cod_funcionario);


--
-- Name: ifk_rel_34; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_34 ON entrega USING btree (cod_funcionario);


--
-- Name: ifk_rel_36; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_36 ON tipos_produtos_empresa USING btree (cod_tipo_produto);


--
-- Name: ifk_rel_37; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_37 ON ingrediente_empresa USING btree (cod_empresa);


--
-- Name: ifk_rel_38; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_38 ON funcionario_has_empresa USING btree (cod_funcionario);


--
-- Name: ifk_rel_39; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_39 ON funcionario_has_empresa USING btree (cod_empresa);


--
-- Name: ifk_rel_45; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_45 ON categoria_ingrediente_empresa USING btree (cod_ingrediente, cod_empresa);


--
-- Name: ifk_rel_47; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_47 ON categoria_permitida_como_adicional USING btree (cod_produto);


--
-- Name: ingrediente_empresa_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ingrediente_empresa_fkindex2 ON ingrediente_empresa USING btree (cod_ingrediente);


--
-- Name: ingrediente_empresa_fkindex3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ingrediente_empresa_fkindex3 ON ingrediente_empresa USING btree (cod_empresa);


--
-- Name: pedido_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pedido_fkindex1 ON pedido USING btree (cod_cliente);


--
-- Name: promocoes_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX promocoes_fkindex1 ON promocao USING btree (cod_produto);


--
-- Name: sabores_pizza_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sabores_pizza_fkindex2 ON sabores_pizza USING btree (cod_outro_sabor_pizza);


--
-- Name: tamanho_produto_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tamanho_produto_fkindex1 ON tamanho_produto USING btree (cod_produto);


--
-- Name: tb_cidade_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tb_cidade_fkindex1 ON tb_cidade USING btree (cod_estado);


--
-- Name: tipo_ingrediente_empresa_has_produto_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tipo_ingrediente_empresa_has_produto_fkindex2 ON categoria_permitida_como_adicional USING btree (cod_produto);


--
-- Name: tipo_ingrediente_has_ingrediente_empresa_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tipo_ingrediente_has_ingrediente_empresa_fkindex2 ON categoria_ingrediente_empresa USING btree (cod_ingrediente, cod_empresa);


--
-- Name: xif15ingrediente_empresa; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xif15ingrediente_empresa ON ingrediente_empresa USING btree (cod_ingrediente);


--
-- Name: xif16ingrediente_empresa; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xif16ingrediente_empresa ON ingrediente_empresa USING btree (cod_empresa);


--
-- Name: xif26pedido; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xif26pedido ON pedido USING btree (cod_cliente);


--
-- Name: xpkempresa; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xpkempresa ON empresa USING btree (cod_empresa);


--
-- Name: xpkingrediente; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xpkingrediente ON ingrediente USING btree (cod_ingrediente);


--
-- Name: xpkingrediente_empresa; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xpkingrediente_empresa ON ingrediente_empresa USING btree (cod_ingrediente, cod_empresa);


--
-- Name: xpkpedido; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xpkpedido ON pedido USING btree (cod_pedido);


--
-- Name: xpkproduto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xpkproduto ON produto USING btree (cod_produto);


--
-- Name: xpktipo_produto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xpktipo_produto ON tipo_produto USING btree (cod_tipo_produto);


--
-- Name: categoria_empresa_categoria_ingrediente_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_ingrediente_empresa
    ADD CONSTRAINT categoria_empresa_categoria_ingrediente_empresa_fk FOREIGN KEY (cod_categoria_empresa) REFERENCES categoria_empresa(cod_categoria_empresa);


--
-- Name: categoria_empresa_categoria_permitida_como_adicional_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_permitida_como_adicional
    ADD CONSTRAINT categoria_empresa_categoria_permitida_como_adicional_fk FOREIGN KEY (cod_categoria_empresa) REFERENCES categoria_empresa(cod_categoria_empresa);


--
-- Name: categoria_ingrediente_empresa_cod_ingrediente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_ingrediente_empresa
    ADD CONSTRAINT categoria_ingrediente_empresa_cod_ingrediente_fkey FOREIGN KEY (cod_ingrediente, cod_empresa) REFERENCES ingrediente_empresa(cod_ingrediente, cod_empresa);


--
-- Name: categoria_permitida_como_adicional_cod_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_permitida_como_adicional
    ADD CONSTRAINT categoria_permitida_como_adicional_cod_produto_fkey FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto);


--
-- Name: cliente_participantes_venda_coletiva_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participantes_venda_coletiva
    ADD CONSTRAINT cliente_participantes_venda_coletiva_fk FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente);


--
-- Name: empresa_categoria_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_empresa
    ADD CONSTRAINT empresa_categoria_empresa_fk FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- Name: empresa_cod_cidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_cod_cidade_fkey FOREIGN KEY (cod_cidade) REFERENCES tb_cidade(cod_cidade);


--
-- Name: empresa_ingrediente_empresa_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingrediente_empresa_produto
    ADD CONSTRAINT empresa_ingrediente_empresa_produto_fk FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- Name: empresa_pedido_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido_empresa
    ADD CONSTRAINT empresa_pedido_empresa_fk FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- Name: empresa_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT empresa_produto_fk FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- Name: empresa_recado_cliente_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recado_cliente
    ADD CONSTRAINT empresa_recado_cliente_fk FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- Name: entrega_cod_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrega
    ADD CONSTRAINT entrega_cod_funcionario_fkey FOREIGN KEY (cod_funcionario) REFERENCES funcionario_entregador(cod_funcionario);


--
-- Name: entrega_pedido_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido_empresa
    ADD CONSTRAINT entrega_pedido_empresa_fk FOREIGN KEY (cod_entrega) REFERENCES entrega(cod_entrega);


--
-- Name: estrategia_cobranca_pizza_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT estrategia_cobranca_pizza_empresa_fk FOREIGN KEY (cod_estrategia_cobranca_pizza) REFERENCES estrategia_cobranca_pizza(cod_estrategia_cobranca_pizza);


--
-- Name: foto_produto_cod_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY foto_produto
    ADD CONSTRAINT foto_produto_cod_produto_fkey FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: funcionario_entregador_cod_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario_entregador
    ADD CONSTRAINT funcionario_entregador_cod_funcionario_fkey FOREIGN KEY (cod_funcionario) REFERENCES funcionario(cod_funcionario);


--
-- Name: funcionario_has_empresa_cod_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario_has_empresa
    ADD CONSTRAINT funcionario_has_empresa_cod_empresa_fkey FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- Name: funcionario_has_empresa_cod_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario_has_empresa
    ADD CONSTRAINT funcionario_has_empresa_cod_funcionario_fkey FOREIGN KEY (cod_funcionario) REFERENCES funcionario(cod_funcionario);


--
-- Name: funcionario_privileges_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY privilege
    ADD CONSTRAINT funcionario_privileges_fk FOREIGN KEY (cod_funcionario) REFERENCES funcionario(cod_funcionario);


--
-- Name: horario_funcionamento_cod_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY horario_funcionamento
    ADD CONSTRAINT horario_funcionamento_cod_empresa_fkey FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- Name: ingrediente_empresa_cod_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingrediente_empresa
    ADD CONSTRAINT ingrediente_empresa_cod_empresa_fkey FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ingrediente_empresa_cod_ingrediente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingrediente_empresa
    ADD CONSTRAINT ingrediente_empresa_cod_ingrediente_fkey FOREIGN KEY (cod_ingrediente) REFERENCES ingrediente(cod_ingrediente);


--
-- Name: ingrediente_empresa_pedido_personalizado_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido_personalizado
    ADD CONSTRAINT ingrediente_empresa_pedido_personalizado_fk FOREIGN KEY (cod_ingrediente, cod_empresa) REFERENCES ingrediente_empresa(cod_ingrediente, cod_empresa);


--
-- Name: ingrediente_ingrediente_empresa_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingrediente_empresa_produto
    ADD CONSTRAINT ingrediente_ingrediente_empresa_produto_fk FOREIGN KEY (cod_ingrediente) REFERENCES ingrediente(cod_ingrediente);


--
-- Name: itens_pedido_cod_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itens_pedido
    ADD CONSTRAINT itens_pedido_cod_produto_fkey FOREIGN KEY (cod_tamanho_produto) REFERENCES tamanho_produto(cod_tamanho_produto);


--
-- Name: itens_pedido_pedido_personalizado_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido_personalizado
    ADD CONSTRAINT itens_pedido_pedido_personalizado_fk FOREIGN KEY (cod_tamanho_produto, cod_pedido, cod_empresa) REFERENCES itens_pedido(cod_tamanho_produto, cod_pedido, cod_empresa);


--
-- Name: itens_pedido_sabores_pizza_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sabores_pizza
    ADD CONSTRAINT itens_pedido_sabores_pizza_fk FOREIGN KEY (cod_tamanho_produto, cod_pedido, cod_empresa) REFERENCES itens_pedido(cod_tamanho_produto, cod_pedido, cod_empresa);


--
-- Name: pedido_cod_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_cod_cliente_fkey FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente);


--
-- Name: pedido_empresa_itens_pedido_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itens_pedido
    ADD CONSTRAINT pedido_empresa_itens_pedido_fk FOREIGN KEY (cod_pedido, cod_empresa) REFERENCES pedido_empresa(cod_pedido, cod_empresa);


--
-- Name: pedido_pedido_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido_empresa
    ADD CONSTRAINT pedido_pedido_empresa_fk FOREIGN KEY (cod_pedido) REFERENCES pedido(cod_pedido);


--
-- Name: produto_ingrediente_empresa_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingrediente_empresa_produto
    ADD CONSTRAINT produto_ingrediente_empresa_produto_fk FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto);


--
-- Name: produto_recado_cliente_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recado_cliente
    ADD CONSTRAINT produto_recado_cliente_fk FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto);


--
-- Name: promocao_cod_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY promocao
    ADD CONSTRAINT promocao_cod_produto_fkey FOREIGN KEY (cod_tamanho_produto) REFERENCES tamanho_produto(cod_tamanho_produto);


--
-- Name: promocao_venda_coletiva_participantes_venda_coletiva_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participantes_venda_coletiva
    ADD CONSTRAINT promocao_venda_coletiva_participantes_venda_coletiva_fk FOREIGN KEY (cod_venda_coletiva) REFERENCES promocao_venda_coletiva(cod_venda_coletiva);


--
-- Name: promocao_venda_coletiva_produto_venda_coletiva_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_venda_coletiva
    ADD CONSTRAINT promocao_venda_coletiva_produto_venda_coletiva_fk FOREIGN KEY (cod_venda_coletiva) REFERENCES promocao_venda_coletiva(cod_venda_coletiva);


--
-- Name: resource_role_has_resources_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role_has_resource
    ADD CONSTRAINT resource_role_has_resources_fk FOREIGN KEY (cod_resource) REFERENCES resource(cod_resource);


--
-- Name: role_privileges_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY privilege
    ADD CONSTRAINT role_privileges_fk FOREIGN KEY (cod_role) REFERENCES role(cod_role);


--
-- Name: role_role_has_resources_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role_has_resource
    ADD CONSTRAINT role_role_has_resources_fk FOREIGN KEY (cod_role) REFERENCES role(cod_role);


--
-- Name: sabores_pizza_cod_outro_sabor_pizza_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sabores_pizza
    ADD CONSTRAINT sabores_pizza_cod_outro_sabor_pizza_fkey FOREIGN KEY (cod_outro_sabor_pizza) REFERENCES produto(cod_produto) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tamanho_produto_cod_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tamanho_produto
    ADD CONSTRAINT tamanho_produto_cod_produto_fkey FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto);


--
-- Name: tamanho_produto_produto_venda_coletiva_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_venda_coletiva
    ADD CONSTRAINT tamanho_produto_produto_venda_coletiva_fk FOREIGN KEY (cod_tamanho_produto) REFERENCES tamanho_produto(cod_tamanho_produto);


--
-- Name: tb_cidade_cod_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_cidade
    ADD CONSTRAINT tb_cidade_cod_estado_fkey FOREIGN KEY (cod_estado) REFERENCES tb_estado(cod_estado);


--
-- Name: tb_cidade_pedido_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT tb_cidade_pedido_fk FOREIGN KEY (cod_cidade) REFERENCES tb_cidade(cod_cidade);


--
-- Name: tipo_produto_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT tipo_produto_produto_fk FOREIGN KEY (cod_tipo_produto) REFERENCES tipo_produto(cod_tipo_produto);


--
-- Name: tipos_produtos_empresa_cod_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipos_produtos_empresa
    ADD CONSTRAINT tipos_produtos_empresa_cod_empresa_fkey FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- Name: tipos_produtos_empresa_cod_tipo_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipos_produtos_empresa
    ADD CONSTRAINT tipos_produtos_empresa_cod_tipo_produto_fkey FOREIGN KEY (cod_tipo_produto) REFERENCES tipo_produto(cod_tipo_produto);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

