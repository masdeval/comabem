--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.14
-- Dumped by pg_dump version 9.3.14
-- Started on 2016-09-29 13:04:22 AMT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;


--
-- TOC entry 2360 (class 1262 OID 42695)
-- Name: teste; Type: DATABASE; Schema: -; Owner: postgres
--

--CREATE DATABASE teste WITH TEMPLATE = template0; --ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


--ALTER DATABASE teste OWNER TO postgres;



SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 171 (class 1259 OID 42696)
-- Name: categoria_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria_empresa (
    cod_categoria_empresa bigint NOT NULL,
    nome character varying(40) NOT NULL,
    cod_empresa integer NOT NULL
);


ALTER TABLE public.categoria_empresa OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 42699)
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
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 172
-- Name: categoria_empresa_cod_categoria_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categoria_empresa_cod_categoria_empresa_seq OWNED BY categoria_empresa.cod_categoria_empresa;


--
-- TOC entry 173 (class 1259 OID 42701)
-- Name: categoria_ingrediente_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria_ingrediente_empresa (
    cod_empresa integer NOT NULL,
    cod_ingrediente integer NOT NULL,
    cod_categoria_empresa bigint NOT NULL
);


ALTER TABLE public.categoria_ingrediente_empresa OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 42704)
-- Name: categoria_permitida_como_adicional; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria_permitida_como_adicional (
    cod_produto bigint NOT NULL,
    cod_categoria_empresa bigint NOT NULL,
    qtd_max_adicionais smallint
);


ALTER TABLE public.categoria_permitida_como_adicional OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 42707)
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
-- TOC entry 176 (class 1259 OID 42713)
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
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 176
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_cod_cliente_seq OWNED BY cliente.cod_cliente;


--
-- TOC entry 224 (class 1259 OID 43273)
-- Name: consulta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE consulta (
    ip character varying(50),
    data timestamp without time zone,
    pais character varying(20),
    cidade character varying(30),
    criterios character varying(50),
    id bigint NOT NULL,
    tipo_produto character varying(200),
    caloria double precision,
    produtos_especiais character varying(200),
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.consulta OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 43276)
-- Name: consulta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE consulta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consulta_id_seq OWNER TO postgres;

--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 225
-- Name: consulta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE consulta_id_seq OWNED BY consulta.id;


--
-- TOC entry 177 (class 1259 OID 42715)
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
-- TOC entry 178 (class 1259 OID 42723)
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
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 178
-- Name: empresa_cod_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresa_cod_empresa_seq OWNED BY empresa.cod_empresa;


--
-- TOC entry 179 (class 1259 OID 42725)
-- Name: entrega; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entrega (
    cod_entrega integer NOT NULL,
    cod_funcionario bigint NOT NULL,
    km_total double precision
);


ALTER TABLE public.entrega OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 42728)
-- Name: estrategia_cobranca_pizza; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estrategia_cobranca_pizza (
    cod_estrategia_cobranca_pizza integer NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE public.estrategia_cobranca_pizza OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 42734)
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
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 181
-- Name: estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1 OWNED BY estrategia_cobranca_pizza.cod_estrategia_cobranca_pizza;


--
-- TOC entry 182 (class 1259 OID 42736)
-- Name: foto_produto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE foto_produto (
    cod_foto integer NOT NULL,
    cod_produto bigint NOT NULL,
    foto bytea
);


ALTER TABLE public.foto_produto OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 42742)
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
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 183
-- Name: foto_produto_cod_foto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE foto_produto_cod_foto_seq OWNED BY foto_produto.cod_foto;


--
-- TOC entry 184 (class 1259 OID 42744)
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
-- TOC entry 185 (class 1259 OID 42753)
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
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 185
-- Name: funcionario_cod_funcionario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funcionario_cod_funcionario_seq OWNED BY funcionario.cod_funcionario;


--
-- TOC entry 186 (class 1259 OID 42755)
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
-- TOC entry 187 (class 1259 OID 42759)
-- Name: funcionario_has_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE funcionario_has_empresa (
    cod_funcionario bigint NOT NULL,
    cod_empresa integer NOT NULL,
    responsavel character(1) NOT NULL
);


ALTER TABLE public.funcionario_has_empresa OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 42762)
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
-- TOC entry 189 (class 1259 OID 42765)
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
-- TOC entry 190 (class 1259 OID 42771)
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
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 190
-- Name: ingrediente_cod_ingrediente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ingrediente_cod_ingrediente_seq OWNED BY ingrediente.cod_ingrediente;


--
-- TOC entry 191 (class 1259 OID 42773)
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
-- TOC entry 192 (class 1259 OID 42780)
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
-- TOC entry 193 (class 1259 OID 42783)
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
-- TOC entry 194 (class 1259 OID 42786)
-- Name: participantes_venda_coletiva; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE participantes_venda_coletiva (
    cod_venda_coletiva integer NOT NULL,
    cod_cliente integer NOT NULL
);


ALTER TABLE public.participantes_venda_coletiva OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 42789)
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
-- TOC entry 196 (class 1259 OID 42792)
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
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 196
-- Name: pedido_cod_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pedido_cod_pedido_seq OWNED BY pedido.cod_pedido;


--
-- TOC entry 197 (class 1259 OID 42794)
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
-- TOC entry 198 (class 1259 OID 42802)
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
-- TOC entry 199 (class 1259 OID 42805)
-- Name: privilege; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE privilege (
    cod_funcionario bigint NOT NULL,
    cod_role integer NOT NULL
);


ALTER TABLE public.privilege OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 42808)
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
-- TOC entry 201 (class 1259 OID 42818)
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
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 201
-- Name: produto_cod_produto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produto_cod_produto_seq OWNED BY produto.cod_produto;


--
-- TOC entry 202 (class 1259 OID 42820)
-- Name: produto_venda_coletiva; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE produto_venda_coletiva (
    cod_venda_coletiva integer NOT NULL,
    cod_tamanho_produto bigint NOT NULL,
    preco_promocional numeric(14,2) NOT NULL
);


ALTER TABLE public.produto_venda_coletiva OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 42823)
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
-- TOC entry 204 (class 1259 OID 42830)
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
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 204
-- Name: promocao_cod_promocao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE promocao_cod_promocao_seq OWNED BY promocao.cod_promocao;


--
-- TOC entry 205 (class 1259 OID 42832)
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
-- TOC entry 206 (class 1259 OID 42835)
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
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 206
-- Name: promocao_venda_coletiva_cod_venda_coletiva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE promocao_venda_coletiva_cod_venda_coletiva_seq OWNED BY promocao_venda_coletiva.cod_venda_coletiva;


--
-- TOC entry 207 (class 1259 OID 42837)
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
-- TOC entry 208 (class 1259 OID 42843)
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
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 208
-- Name: recado_cliente_cod_recado_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recado_cliente_cod_recado_cliente_seq OWNED BY recado_cliente.cod_recado_cliente;


--
-- TOC entry 209 (class 1259 OID 42845)
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource (
    cod_resource integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.resource OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 42851)
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
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 210
-- Name: resource_cod_resource_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resource_cod_resource_seq OWNED BY resource.cod_resource;


--
-- TOC entry 211 (class 1259 OID 42853)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE role (
    cod_role integer NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 42859)
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
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 212
-- Name: role_cod_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_cod_role_seq OWNED BY role.cod_role;


--
-- TOC entry 213 (class 1259 OID 42861)
-- Name: role_has_resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE role_has_resource (
    cod_role integer NOT NULL,
    cod_resource integer NOT NULL
);


ALTER TABLE public.role_has_resource OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 42864)
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
-- TOC entry 215 (class 1259 OID 42867)
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
-- TOC entry 216 (class 1259 OID 42871)
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
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 216
-- Name: tamanho_produto_cod_tamanho_produto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tamanho_produto_cod_tamanho_produto_seq OWNED BY tamanho_produto.cod_tamanho_produto;


--
-- TOC entry 217 (class 1259 OID 42873)
-- Name: tb_cidade; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_cidade (
    cod_cidade integer NOT NULL,
    cod_estado integer NOT NULL,
    nome character varying(90)
);


ALTER TABLE public.tb_cidade OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 42876)
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
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 218
-- Name: tb_cidade_cod_cidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_cidade_cod_cidade_seq OWNED BY tb_cidade.cod_cidade;


--
-- TOC entry 219 (class 1259 OID 42878)
-- Name: tb_estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_estado (
    cod_estado integer NOT NULL,
    uf character varying(2),
    nome character varying(30)
);


ALTER TABLE public.tb_estado OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 42881)
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
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 220
-- Name: tb_estado_cod_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tb_estado_cod_estado_seq OWNED BY tb_estado.cod_estado;


--
-- TOC entry 221 (class 1259 OID 42883)
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
-- TOC entry 222 (class 1259 OID 42889)
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
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 222
-- Name: tipo_produto_cod_tipo_produto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_produto_cod_tipo_produto_seq OWNED BY tipo_produto.cod_tipo_produto;


--
-- TOC entry 223 (class 1259 OID 42891)
-- Name: tipos_produtos_empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipos_produtos_empresa (
    cod_tipo_produto integer NOT NULL,
    cod_empresa integer NOT NULL
);


ALTER TABLE public.tipos_produtos_empresa OWNER TO postgres;

--
-- TOC entry 2052 (class 2604 OID 42894)
-- Name: cod_categoria_empresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_empresa ALTER COLUMN cod_categoria_empresa SET DEFAULT nextval('categoria_empresa_cod_categoria_empresa_seq'::regclass);


--
-- TOC entry 2053 (class 2604 OID 42895)
-- Name: cod_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN cod_cliente SET DEFAULT nextval('cliente_cod_cliente_seq'::regclass);


--
-- TOC entry 2085 (class 2604 OID 43278)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consulta ALTER COLUMN id SET DEFAULT nextval('consulta_id_seq'::regclass);


--
-- TOC entry 2056 (class 2604 OID 42896)
-- Name: cod_empresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa ALTER COLUMN cod_empresa SET DEFAULT nextval('empresa_cod_empresa_seq'::regclass);


--
-- TOC entry 2057 (class 2604 OID 42897)
-- Name: cod_estrategia_cobranca_pizza; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estrategia_cobranca_pizza ALTER COLUMN cod_estrategia_cobranca_pizza SET DEFAULT nextval('estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1'::regclass);


--
-- TOC entry 2058 (class 2604 OID 42898)
-- Name: cod_foto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY foto_produto ALTER COLUMN cod_foto SET DEFAULT nextval('foto_produto_cod_foto_seq'::regclass);


--
-- TOC entry 2062 (class 2604 OID 42899)
-- Name: cod_funcionario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario ALTER COLUMN cod_funcionario SET DEFAULT nextval('funcionario_cod_funcionario_seq'::regclass);


--
-- TOC entry 2064 (class 2604 OID 42900)
-- Name: cod_ingrediente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingrediente ALTER COLUMN cod_ingrediente SET DEFAULT nextval('ingrediente_cod_ingrediente_seq'::regclass);


--
-- TOC entry 2066 (class 2604 OID 42901)
-- Name: cod_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido ALTER COLUMN cod_pedido SET DEFAULT nextval('pedido_cod_pedido_seq'::regclass);


--
-- TOC entry 2073 (class 2604 OID 42902)
-- Name: cod_produto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto ALTER COLUMN cod_produto SET DEFAULT nextval('produto_cod_produto_seq'::regclass);


--
-- TOC entry 2075 (class 2604 OID 42903)
-- Name: cod_promocao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY promocao ALTER COLUMN cod_promocao SET DEFAULT nextval('promocao_cod_promocao_seq'::regclass);


--
-- TOC entry 2076 (class 2604 OID 42904)
-- Name: cod_venda_coletiva; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY promocao_venda_coletiva ALTER COLUMN cod_venda_coletiva SET DEFAULT nextval('promocao_venda_coletiva_cod_venda_coletiva_seq'::regclass);


--
-- TOC entry 2077 (class 2604 OID 42905)
-- Name: cod_recado_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recado_cliente ALTER COLUMN cod_recado_cliente SET DEFAULT nextval('recado_cliente_cod_recado_cliente_seq'::regclass);


--
-- TOC entry 2078 (class 2604 OID 42906)
-- Name: cod_resource; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource ALTER COLUMN cod_resource SET DEFAULT nextval('resource_cod_resource_seq'::regclass);


--
-- TOC entry 2079 (class 2604 OID 42907)
-- Name: cod_role; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN cod_role SET DEFAULT nextval('role_cod_role_seq'::regclass);


--
-- TOC entry 2081 (class 2604 OID 42908)
-- Name: cod_tamanho_produto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tamanho_produto ALTER COLUMN cod_tamanho_produto SET DEFAULT nextval('tamanho_produto_cod_tamanho_produto_seq'::regclass);


--
-- TOC entry 2082 (class 2604 OID 42909)
-- Name: cod_cidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_cidade ALTER COLUMN cod_cidade SET DEFAULT nextval('tb_cidade_cod_cidade_seq'::regclass);


--
-- TOC entry 2083 (class 2604 OID 42910)
-- Name: cod_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_estado ALTER COLUMN cod_estado SET DEFAULT nextval('tb_estado_cod_estado_seq'::regclass);


--
-- TOC entry 2084 (class 2604 OID 42911)
-- Name: cod_tipo_produto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_produto ALTER COLUMN cod_tipo_produto SET DEFAULT nextval('tipo_produto_cod_tipo_produto_seq'::regclass);


--
-- TOC entry 2089 (class 2606 OID 42913)
-- Name: categoria_ingrediente_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria_ingrediente_empresa
    ADD CONSTRAINT categoria_ingrediente_empresa_pkey PRIMARY KEY (cod_empresa, cod_ingrediente, cod_categoria_empresa);


--
-- TOC entry 2087 (class 2606 OID 42915)
-- Name: categoria_ingrediente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria_empresa
    ADD CONSTRAINT categoria_ingrediente_pkey PRIMARY KEY (cod_categoria_empresa);


--
-- TOC entry 2093 (class 2606 OID 42917)
-- Name: categoria_permitida_como_adicional_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria_permitida_como_adicional
    ADD CONSTRAINT categoria_permitida_como_adicional_pkey PRIMARY KEY (cod_produto, cod_categoria_empresa);


--
-- TOC entry 2098 (class 2606 OID 42919)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cod_cliente);


--
-- TOC entry 2103 (class 2606 OID 42921)
-- Name: empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (cod_empresa);


--
-- TOC entry 2107 (class 2606 OID 42923)
-- Name: entrega_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entrega
    ADD CONSTRAINT entrega_pkey PRIMARY KEY (cod_entrega);


--
-- TOC entry 2110 (class 2606 OID 42925)
-- Name: estrategia_cobranca_pizza_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estrategia_cobranca_pizza
    ADD CONSTRAINT estrategia_cobranca_pizza_pk PRIMARY KEY (cod_estrategia_cobranca_pizza);


--
-- TOC entry 2113 (class 2606 OID 42927)
-- Name: foto_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY foto_produto
    ADD CONSTRAINT foto_produto_pkey PRIMARY KEY (cod_foto);


--
-- TOC entry 2120 (class 2606 OID 42929)
-- Name: funcionario_entregador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funcionario_entregador
    ADD CONSTRAINT funcionario_entregador_pkey PRIMARY KEY (cod_funcionario);


--
-- TOC entry 2125 (class 2606 OID 42931)
-- Name: funcionario_has_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funcionario_has_empresa
    ADD CONSTRAINT funcionario_has_empresa_pkey PRIMARY KEY (cod_funcionario, cod_empresa);


--
-- TOC entry 2117 (class 2606 OID 42933)
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (cod_funcionario);


--
-- TOC entry 2130 (class 2606 OID 42935)
-- Name: horario_funcionamento_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY horario_funcionamento
    ADD CONSTRAINT horario_funcionamento_pk PRIMARY KEY (cod_empresa, dia_da_semana);


--
-- TOC entry 2202 (class 2606 OID 43283)
-- Name: id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY consulta
    ADD CONSTRAINT id_pk PRIMARY KEY (id);


--
-- TOC entry 2140 (class 2606 OID 42937)
-- Name: ingrediente_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingrediente_empresa
    ADD CONSTRAINT ingrediente_empresa_pkey PRIMARY KEY (cod_ingrediente, cod_empresa);


--
-- TOC entry 2145 (class 2606 OID 42939)
-- Name: ingrediente_empresa_produto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingrediente_empresa_produto
    ADD CONSTRAINT ingrediente_empresa_produto_pk PRIMARY KEY (cod_ingrediente, cod_empresa, cod_produto);


--
-- TOC entry 2133 (class 2606 OID 42941)
-- Name: ingrediente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingrediente
    ADD CONSTRAINT ingrediente_pkey PRIMARY KEY (cod_ingrediente);


--
-- TOC entry 2147 (class 2606 OID 42943)
-- Name: itens_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY itens_pedido
    ADD CONSTRAINT itens_pedido_pkey PRIMARY KEY (cod_tamanho_produto, cod_pedido, cod_empresa);


--
-- TOC entry 2149 (class 2606 OID 42945)
-- Name: participantes_venda_coletiva_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY participantes_venda_coletiva
    ADD CONSTRAINT participantes_venda_coletiva_pk PRIMARY KEY (cod_venda_coletiva, cod_cliente);


--
-- TOC entry 2157 (class 2606 OID 42947)
-- Name: pedido_empresa_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedido_empresa
    ADD CONSTRAINT pedido_empresa_pk PRIMARY KEY (cod_pedido, cod_empresa);


--
-- TOC entry 2159 (class 2606 OID 42949)
-- Name: pedido_personalizado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedido_personalizado
    ADD CONSTRAINT pedido_personalizado_pkey PRIMARY KEY (cod_tamanho_produto, cod_pedido, cod_empresa, cod_ingrediente, indice);


--
-- TOC entry 2153 (class 2606 OID 42951)
-- Name: pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (cod_pedido);


--
-- TOC entry 2161 (class 2606 OID 42953)
-- Name: privilege_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY privilege
    ADD CONSTRAINT privilege_pk PRIMARY KEY (cod_funcionario, cod_role);


--
-- TOC entry 2163 (class 2606 OID 42955)
-- Name: produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (cod_produto);


--
-- TOC entry 2166 (class 2606 OID 42957)
-- Name: produto_venda_coletiva_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produto_venda_coletiva
    ADD CONSTRAINT produto_venda_coletiva_pk PRIMARY KEY (cod_venda_coletiva, cod_tamanho_produto);


--
-- TOC entry 2169 (class 2606 OID 42959)
-- Name: promocao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY promocao
    ADD CONSTRAINT promocao_pkey PRIMARY KEY (cod_promocao);


--
-- TOC entry 2172 (class 2606 OID 42961)
-- Name: promocao_venda_coletiva_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY promocao_venda_coletiva
    ADD CONSTRAINT promocao_venda_coletiva_pk PRIMARY KEY (cod_venda_coletiva);


--
-- TOC entry 2174 (class 2606 OID 42963)
-- Name: recado_cliente_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recado_cliente
    ADD CONSTRAINT recado_cliente_pk PRIMARY KEY (cod_recado_cliente);


--
-- TOC entry 2176 (class 2606 OID 42965)
-- Name: resource_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_pk PRIMARY KEY (cod_resource);


--
-- TOC entry 2180 (class 2606 OID 42967)
-- Name: role_has_resource_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role_has_resource
    ADD CONSTRAINT role_has_resource_pk PRIMARY KEY (cod_role, cod_resource);


--
-- TOC entry 2178 (class 2606 OID 42969)
-- Name: role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pk PRIMARY KEY (cod_role);


--
-- TOC entry 2183 (class 2606 OID 42971)
-- Name: sabores_pizza_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sabores_pizza
    ADD CONSTRAINT sabores_pizza_pkey PRIMARY KEY (cod_outro_sabor_pizza, cod_tamanho_produto, cod_pedido, cod_empresa, indice);


--
-- TOC entry 2187 (class 2606 OID 42973)
-- Name: tamanho_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tamanho_produto
    ADD CONSTRAINT tamanho_produto_pkey PRIMARY KEY (cod_tamanho_produto);


--
-- TOC entry 2191 (class 2606 OID 42975)
-- Name: tb_cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_cidade
    ADD CONSTRAINT tb_cidade_pkey PRIMARY KEY (cod_cidade);


--
-- TOC entry 2193 (class 2606 OID 42977)
-- Name: tb_estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_estado
    ADD CONSTRAINT tb_estado_pkey PRIMARY KEY (cod_estado);


--
-- TOC entry 2195 (class 2606 OID 42979)
-- Name: tipo_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_produto
    ADD CONSTRAINT tipo_produto_pkey PRIMARY KEY (cod_tipo_produto);


--
-- TOC entry 2200 (class 2606 OID 42981)
-- Name: tipos_produtos_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipos_produtos_empresa
    ADD CONSTRAINT tipos_produtos_empresa_pkey PRIMARY KEY (cod_tipo_produto, cod_empresa);


--
-- TOC entry 2096 (class 1259 OID 42982)
-- Name: cliente_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX cliente_idx ON cliente USING btree (email);


--
-- TOC entry 2128 (class 1259 OID 42983)
-- Name: dia_da_semana_has_empresa_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX dia_da_semana_has_empresa_fkindex2 ON horario_funcionamento USING btree (cod_empresa);


--
-- TOC entry 2118 (class 1259 OID 42984)
-- Name: empregado_entregador_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX empregado_entregador_fkindex1 ON funcionario_entregador USING btree (cod_funcionario);


--
-- TOC entry 2099 (class 1259 OID 42985)
-- Name: empresa_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX empresa_fkindex1 ON empresa USING btree (cod_cidade);


--
-- TOC entry 2197 (class 1259 OID 42986)
-- Name: empresa_has_tipo_produto_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX empresa_has_tipo_produto_fkindex1 ON tipos_produtos_empresa USING btree (cod_empresa);


--
-- TOC entry 2100 (class 1259 OID 42987)
-- Name: empresa_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX empresa_idx ON empresa USING btree (url);


--
-- TOC entry 2101 (class 1259 OID 42988)
-- Name: empresa_idx1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX empresa_idx1 ON empresa USING btree (cnpj);


--
-- TOC entry 2111 (class 1259 OID 42989)
-- Name: foto_produto_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX foto_produto_fkindex1 ON foto_produto USING btree (cod_produto);


--
-- TOC entry 2122 (class 1259 OID 42990)
-- Name: funcionario_has_empresa_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX funcionario_has_empresa_fkindex1 ON funcionario_has_empresa USING btree (cod_funcionario);


--
-- TOC entry 2123 (class 1259 OID 42991)
-- Name: funcionario_has_empresa_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX funcionario_has_empresa_fkindex2 ON funcionario_has_empresa USING btree (cod_empresa);


--
-- TOC entry 2115 (class 1259 OID 42992)
-- Name: funcionario_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX funcionario_idx ON funcionario USING btree (cpf);


--
-- TOC entry 2135 (class 1259 OID 42993)
-- Name: ifk_rel_05; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_05 ON ingrediente_empresa USING btree (cod_ingrediente);


--
-- TOC entry 2114 (class 1259 OID 42994)
-- Name: ifk_rel_13; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_13 ON foto_produto USING btree (cod_produto);


--
-- TOC entry 2184 (class 1259 OID 42995)
-- Name: ifk_rel_14; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_14 ON tamanho_produto USING btree (cod_produto);


--
-- TOC entry 2188 (class 1259 OID 42996)
-- Name: ifk_rel_17; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_17 ON tb_cidade USING btree (cod_estado);


--
-- TOC entry 2104 (class 1259 OID 42997)
-- Name: ifk_rel_18; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_18 ON empresa USING btree (cod_cidade);


--
-- TOC entry 2167 (class 1259 OID 42998)
-- Name: ifk_rel_19; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_19 ON promocao USING btree (cod_produto);


--
-- TOC entry 2150 (class 1259 OID 42999)
-- Name: ifk_rel_29; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_29 ON pedido USING btree (cod_cliente);


--
-- TOC entry 2131 (class 1259 OID 43000)
-- Name: ifk_rel_31; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_31 ON horario_funcionamento USING btree (cod_empresa);


--
-- TOC entry 2121 (class 1259 OID 43001)
-- Name: ifk_rel_32; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_32 ON funcionario_entregador USING btree (cod_funcionario);


--
-- TOC entry 2108 (class 1259 OID 43002)
-- Name: ifk_rel_34; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_34 ON entrega USING btree (cod_funcionario);


--
-- TOC entry 2198 (class 1259 OID 43003)
-- Name: ifk_rel_36; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_36 ON tipos_produtos_empresa USING btree (cod_tipo_produto);


--
-- TOC entry 2136 (class 1259 OID 43004)
-- Name: ifk_rel_37; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_37 ON ingrediente_empresa USING btree (cod_empresa);


--
-- TOC entry 2126 (class 1259 OID 43005)
-- Name: ifk_rel_38; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_38 ON funcionario_has_empresa USING btree (cod_funcionario);


--
-- TOC entry 2127 (class 1259 OID 43006)
-- Name: ifk_rel_39; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_39 ON funcionario_has_empresa USING btree (cod_empresa);


--
-- TOC entry 2090 (class 1259 OID 43007)
-- Name: ifk_rel_45; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_45 ON categoria_ingrediente_empresa USING btree (cod_ingrediente, cod_empresa);


--
-- TOC entry 2094 (class 1259 OID 43008)
-- Name: ifk_rel_47; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_47 ON categoria_permitida_como_adicional USING btree (cod_produto);


--
-- TOC entry 2137 (class 1259 OID 43009)
-- Name: ingrediente_empresa_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ingrediente_empresa_fkindex2 ON ingrediente_empresa USING btree (cod_ingrediente);


--
-- TOC entry 2138 (class 1259 OID 43010)
-- Name: ingrediente_empresa_fkindex3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ingrediente_empresa_fkindex3 ON ingrediente_empresa USING btree (cod_empresa);


--
-- TOC entry 2151 (class 1259 OID 43011)
-- Name: pedido_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pedido_fkindex1 ON pedido USING btree (cod_cliente);


--
-- TOC entry 2170 (class 1259 OID 43012)
-- Name: promocoes_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX promocoes_fkindex1 ON promocao USING btree (cod_produto);


--
-- TOC entry 2181 (class 1259 OID 43013)
-- Name: sabores_pizza_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sabores_pizza_fkindex2 ON sabores_pizza USING btree (cod_outro_sabor_pizza);


--
-- TOC entry 2185 (class 1259 OID 43014)
-- Name: tamanho_produto_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tamanho_produto_fkindex1 ON tamanho_produto USING btree (cod_produto);


--
-- TOC entry 2189 (class 1259 OID 43015)
-- Name: tb_cidade_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tb_cidade_fkindex1 ON tb_cidade USING btree (cod_estado);


--
-- TOC entry 2095 (class 1259 OID 43016)
-- Name: tipo_ingrediente_empresa_has_produto_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tipo_ingrediente_empresa_has_produto_fkindex2 ON categoria_permitida_como_adicional USING btree (cod_produto);


--
-- TOC entry 2091 (class 1259 OID 43017)
-- Name: tipo_ingrediente_has_ingrediente_empresa_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tipo_ingrediente_has_ingrediente_empresa_fkindex2 ON categoria_ingrediente_empresa USING btree (cod_ingrediente, cod_empresa);


--
-- TOC entry 2141 (class 1259 OID 43018)
-- Name: xif15ingrediente_empresa; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xif15ingrediente_empresa ON ingrediente_empresa USING btree (cod_ingrediente);


--
-- TOC entry 2142 (class 1259 OID 43019)
-- Name: xif16ingrediente_empresa; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xif16ingrediente_empresa ON ingrediente_empresa USING btree (cod_empresa);


--
-- TOC entry 2154 (class 1259 OID 43020)
-- Name: xif26pedido; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xif26pedido ON pedido USING btree (cod_cliente);


--
-- TOC entry 2105 (class 1259 OID 43021)
-- Name: xpkempresa; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xpkempresa ON empresa USING btree (cod_empresa);


--
-- TOC entry 2134 (class 1259 OID 43022)
-- Name: xpkingrediente; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xpkingrediente ON ingrediente USING btree (cod_ingrediente);


--
-- TOC entry 2143 (class 1259 OID 43023)
-- Name: xpkingrediente_empresa; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xpkingrediente_empresa ON ingrediente_empresa USING btree (cod_ingrediente, cod_empresa);


--
-- TOC entry 2155 (class 1259 OID 43024)
-- Name: xpkpedido; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xpkpedido ON pedido USING btree (cod_pedido);


--
-- TOC entry 2164 (class 1259 OID 43025)
-- Name: xpkproduto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xpkproduto ON produto USING btree (cod_produto);


--
-- TOC entry 2196 (class 1259 OID 43026)
-- Name: xpktipo_produto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xpktipo_produto ON tipo_produto USING btree (cod_tipo_produto);


--
-- TOC entry 2204 (class 2606 OID 43027)
-- Name: categoria_empresa_categoria_ingrediente_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_ingrediente_empresa
    ADD CONSTRAINT categoria_empresa_categoria_ingrediente_empresa_fk FOREIGN KEY (cod_categoria_empresa) REFERENCES categoria_empresa(cod_categoria_empresa);


--
-- TOC entry 2206 (class 2606 OID 43032)
-- Name: categoria_empresa_categoria_permitida_como_adicional_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_permitida_como_adicional
    ADD CONSTRAINT categoria_empresa_categoria_permitida_como_adicional_fk FOREIGN KEY (cod_categoria_empresa) REFERENCES categoria_empresa(cod_categoria_empresa);


--
-- TOC entry 2205 (class 2606 OID 43037)
-- Name: categoria_ingrediente_empresa_cod_ingrediente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_ingrediente_empresa
    ADD CONSTRAINT categoria_ingrediente_empresa_cod_ingrediente_fkey FOREIGN KEY (cod_ingrediente, cod_empresa) REFERENCES ingrediente_empresa(cod_ingrediente, cod_empresa);


--
-- TOC entry 2207 (class 2606 OID 43042)
-- Name: categoria_permitida_como_adicional_cod_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_permitida_como_adicional
    ADD CONSTRAINT categoria_permitida_como_adicional_cod_produto_fkey FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto);


--
-- TOC entry 2223 (class 2606 OID 43047)
-- Name: cliente_participantes_venda_coletiva_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participantes_venda_coletiva
    ADD CONSTRAINT cliente_participantes_venda_coletiva_fk FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente);


--
-- TOC entry 2203 (class 2606 OID 43052)
-- Name: empresa_categoria_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_empresa
    ADD CONSTRAINT empresa_categoria_empresa_fk FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- TOC entry 2208 (class 2606 OID 43057)
-- Name: empresa_cod_cidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_cod_cidade_fkey FOREIGN KEY (cod_cidade) REFERENCES tb_cidade(cod_cidade);


--
-- TOC entry 2218 (class 2606 OID 43062)
-- Name: empresa_ingrediente_empresa_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingrediente_empresa_produto
    ADD CONSTRAINT empresa_ingrediente_empresa_produto_fk FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- TOC entry 2227 (class 2606 OID 43067)
-- Name: empresa_pedido_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido_empresa
    ADD CONSTRAINT empresa_pedido_empresa_fk FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- TOC entry 2234 (class 2606 OID 43072)
-- Name: empresa_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT empresa_produto_fk FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- TOC entry 2239 (class 2606 OID 43077)
-- Name: empresa_recado_cliente_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recado_cliente
    ADD CONSTRAINT empresa_recado_cliente_fk FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- TOC entry 2210 (class 2606 OID 43082)
-- Name: entrega_cod_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrega
    ADD CONSTRAINT entrega_cod_funcionario_fkey FOREIGN KEY (cod_funcionario) REFERENCES funcionario_entregador(cod_funcionario);


--
-- TOC entry 2228 (class 2606 OID 43087)
-- Name: entrega_pedido_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido_empresa
    ADD CONSTRAINT entrega_pedido_empresa_fk FOREIGN KEY (cod_entrega) REFERENCES entrega(cod_entrega);


--
-- TOC entry 2209 (class 2606 OID 43092)
-- Name: estrategia_cobranca_pizza_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT estrategia_cobranca_pizza_empresa_fk FOREIGN KEY (cod_estrategia_cobranca_pizza) REFERENCES estrategia_cobranca_pizza(cod_estrategia_cobranca_pizza);


--
-- TOC entry 2211 (class 2606 OID 43097)
-- Name: foto_produto_cod_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY foto_produto
    ADD CONSTRAINT foto_produto_cod_produto_fkey FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2212 (class 2606 OID 43102)
-- Name: funcionario_entregador_cod_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario_entregador
    ADD CONSTRAINT funcionario_entregador_cod_funcionario_fkey FOREIGN KEY (cod_funcionario) REFERENCES funcionario(cod_funcionario);


--
-- TOC entry 2213 (class 2606 OID 43107)
-- Name: funcionario_has_empresa_cod_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario_has_empresa
    ADD CONSTRAINT funcionario_has_empresa_cod_empresa_fkey FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- TOC entry 2214 (class 2606 OID 43112)
-- Name: funcionario_has_empresa_cod_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario_has_empresa
    ADD CONSTRAINT funcionario_has_empresa_cod_funcionario_fkey FOREIGN KEY (cod_funcionario) REFERENCES funcionario(cod_funcionario);


--
-- TOC entry 2232 (class 2606 OID 43117)
-- Name: funcionario_privileges_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY privilege
    ADD CONSTRAINT funcionario_privileges_fk FOREIGN KEY (cod_funcionario) REFERENCES funcionario(cod_funcionario);


--
-- TOC entry 2215 (class 2606 OID 43122)
-- Name: horario_funcionamento_cod_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY horario_funcionamento
    ADD CONSTRAINT horario_funcionamento_cod_empresa_fkey FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- TOC entry 2216 (class 2606 OID 43127)
-- Name: ingrediente_empresa_cod_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingrediente_empresa
    ADD CONSTRAINT ingrediente_empresa_cod_empresa_fkey FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2217 (class 2606 OID 43132)
-- Name: ingrediente_empresa_cod_ingrediente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingrediente_empresa
    ADD CONSTRAINT ingrediente_empresa_cod_ingrediente_fkey FOREIGN KEY (cod_ingrediente) REFERENCES ingrediente(cod_ingrediente);


--
-- TOC entry 2230 (class 2606 OID 43137)
-- Name: ingrediente_empresa_pedido_personalizado_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido_personalizado
    ADD CONSTRAINT ingrediente_empresa_pedido_personalizado_fk FOREIGN KEY (cod_ingrediente, cod_empresa) REFERENCES ingrediente_empresa(cod_ingrediente, cod_empresa);


--
-- TOC entry 2219 (class 2606 OID 43142)
-- Name: ingrediente_ingrediente_empresa_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingrediente_empresa_produto
    ADD CONSTRAINT ingrediente_ingrediente_empresa_produto_fk FOREIGN KEY (cod_ingrediente) REFERENCES ingrediente(cod_ingrediente);


--
-- TOC entry 2221 (class 2606 OID 43147)
-- Name: itens_pedido_cod_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itens_pedido
    ADD CONSTRAINT itens_pedido_cod_produto_fkey FOREIGN KEY (cod_tamanho_produto) REFERENCES tamanho_produto(cod_tamanho_produto);


--
-- TOC entry 2231 (class 2606 OID 43152)
-- Name: itens_pedido_pedido_personalizado_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido_personalizado
    ADD CONSTRAINT itens_pedido_pedido_personalizado_fk FOREIGN KEY (cod_tamanho_produto, cod_pedido, cod_empresa) REFERENCES itens_pedido(cod_tamanho_produto, cod_pedido, cod_empresa);


--
-- TOC entry 2243 (class 2606 OID 43157)
-- Name: itens_pedido_sabores_pizza_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sabores_pizza
    ADD CONSTRAINT itens_pedido_sabores_pizza_fk FOREIGN KEY (cod_tamanho_produto, cod_pedido, cod_empresa) REFERENCES itens_pedido(cod_tamanho_produto, cod_pedido, cod_empresa);


--
-- TOC entry 2225 (class 2606 OID 43162)
-- Name: pedido_cod_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_cod_cliente_fkey FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente);


--
-- TOC entry 2222 (class 2606 OID 43167)
-- Name: pedido_empresa_itens_pedido_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itens_pedido
    ADD CONSTRAINT pedido_empresa_itens_pedido_fk FOREIGN KEY (cod_pedido, cod_empresa) REFERENCES pedido_empresa(cod_pedido, cod_empresa);


--
-- TOC entry 2229 (class 2606 OID 43172)
-- Name: pedido_pedido_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido_empresa
    ADD CONSTRAINT pedido_pedido_empresa_fk FOREIGN KEY (cod_pedido) REFERENCES pedido(cod_pedido);


--
-- TOC entry 2220 (class 2606 OID 43177)
-- Name: produto_ingrediente_empresa_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingrediente_empresa_produto
    ADD CONSTRAINT produto_ingrediente_empresa_produto_fk FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto);


--
-- TOC entry 2240 (class 2606 OID 43182)
-- Name: produto_recado_cliente_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recado_cliente
    ADD CONSTRAINT produto_recado_cliente_fk FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto);


--
-- TOC entry 2238 (class 2606 OID 43187)
-- Name: promocao_cod_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY promocao
    ADD CONSTRAINT promocao_cod_produto_fkey FOREIGN KEY (cod_tamanho_produto) REFERENCES tamanho_produto(cod_tamanho_produto);


--
-- TOC entry 2224 (class 2606 OID 43192)
-- Name: promocao_venda_coletiva_participantes_venda_coletiva_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participantes_venda_coletiva
    ADD CONSTRAINT promocao_venda_coletiva_participantes_venda_coletiva_fk FOREIGN KEY (cod_venda_coletiva) REFERENCES promocao_venda_coletiva(cod_venda_coletiva);


--
-- TOC entry 2236 (class 2606 OID 43197)
-- Name: promocao_venda_coletiva_produto_venda_coletiva_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_venda_coletiva
    ADD CONSTRAINT promocao_venda_coletiva_produto_venda_coletiva_fk FOREIGN KEY (cod_venda_coletiva) REFERENCES promocao_venda_coletiva(cod_venda_coletiva);


--
-- TOC entry 2241 (class 2606 OID 43202)
-- Name: resource_role_has_resources_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role_has_resource
    ADD CONSTRAINT resource_role_has_resources_fk FOREIGN KEY (cod_resource) REFERENCES resource(cod_resource);


--
-- TOC entry 2233 (class 2606 OID 43207)
-- Name: role_privileges_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY privilege
    ADD CONSTRAINT role_privileges_fk FOREIGN KEY (cod_role) REFERENCES role(cod_role);


--
-- TOC entry 2242 (class 2606 OID 43212)
-- Name: role_role_has_resources_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role_has_resource
    ADD CONSTRAINT role_role_has_resources_fk FOREIGN KEY (cod_role) REFERENCES role(cod_role);


--
-- TOC entry 2244 (class 2606 OID 43217)
-- Name: sabores_pizza_cod_outro_sabor_pizza_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sabores_pizza
    ADD CONSTRAINT sabores_pizza_cod_outro_sabor_pizza_fkey FOREIGN KEY (cod_outro_sabor_pizza) REFERENCES produto(cod_produto) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2245 (class 2606 OID 43222)
-- Name: tamanho_produto_cod_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tamanho_produto
    ADD CONSTRAINT tamanho_produto_cod_produto_fkey FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto);


--
-- TOC entry 2237 (class 2606 OID 43227)
-- Name: tamanho_produto_produto_venda_coletiva_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_venda_coletiva
    ADD CONSTRAINT tamanho_produto_produto_venda_coletiva_fk FOREIGN KEY (cod_tamanho_produto) REFERENCES tamanho_produto(cod_tamanho_produto);


--
-- TOC entry 2246 (class 2606 OID 43232)
-- Name: tb_cidade_cod_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tb_cidade
    ADD CONSTRAINT tb_cidade_cod_estado_fkey FOREIGN KEY (cod_estado) REFERENCES tb_estado(cod_estado);


--
-- TOC entry 2226 (class 2606 OID 43237)
-- Name: tb_cidade_pedido_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT tb_cidade_pedido_fk FOREIGN KEY (cod_cidade) REFERENCES tb_cidade(cod_cidade);


--
-- TOC entry 2235 (class 2606 OID 43242)
-- Name: tipo_produto_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT tipo_produto_produto_fk FOREIGN KEY (cod_tipo_produto) REFERENCES tipo_produto(cod_tipo_produto);


--
-- TOC entry 2247 (class 2606 OID 43247)
-- Name: tipos_produtos_empresa_cod_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipos_produtos_empresa
    ADD CONSTRAINT tipos_produtos_empresa_cod_empresa_fkey FOREIGN KEY (cod_empresa) REFERENCES empresa(cod_empresa);


--
-- TOC entry 2248 (class 2606 OID 43252)
-- Name: tipos_produtos_empresa_cod_tipo_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipos_produtos_empresa
    ADD CONSTRAINT tipos_produtos_empresa_cod_tipo_produto_fkey FOREIGN KEY (cod_tipo_produto) REFERENCES tipo_produto(cod_tipo_produto);


--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-09-29 13:04:23 AMT

--
-- PostgreSQL database dump complete
--

