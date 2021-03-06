﻿--
-- PostgreSQL database dump
--

-- Started on 2011-12-21 16:43:20

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;



--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 1626
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_cod_cliente_seq', 1, false);


--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 1610
-- Name: empresa_cod_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empresa_cod_empresa_seq', 37, true);


--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 1593
-- Name: estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estrategia_cobranca_pizza_cod_estrategia_cobranca_pizza_seq_1', 1, false);


--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 1619
-- Name: foto_produto_cod_foto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('foto_produto_cod_foto_seq', 6, true);


--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 1605
-- Name: funcionario_cod_funcionario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funcionario_cod_funcionario_seq', 5, true);


--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 1603
-- Name: ingrediente_cod_ingrediente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ingrediente_cod_ingrediente_seq', 6, true);


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 1629
-- Name: pedido_cod_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pedido_cod_pedido_seq', 1, false);


--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 1612
-- Name: produto_cod_produto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('produto_cod_produto_seq', 3, true);


--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 1617
-- Name: promocao_cod_promocao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('promocao_cod_promocao_seq', 11, true);


--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 1595
-- Name: promocao_venda_coletiva_cod_venda_coletiva_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('promocao_venda_coletiva_cod_venda_coletiva_seq', 1, false);


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 1638
-- Name: recado_cliente_cod_recado_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recado_cliente_cod_recado_cliente_seq', 47, true);


--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 1588
-- Name: resource_cod_resource_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_cod_resource_seq', 6, true);


--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 1590
-- Name: role_cod_role_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_cod_role_seq', 2, true);


--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 1614
-- Name: tamanho_produto_cod_tamanho_produto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tamanho_produto_cod_tamanho_produto_seq', 12, true);


--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 1601
-- Name: tb_cidade_cod_cidade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_cidade_cod_cidade_seq', 2, true);


--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 1599
-- Name: tb_estado_cod_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tb_estado_cod_estado_seq', 1, true);


--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 1597
-- Name: tipo_produto_cod_tipo_produto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_produto_cod_tipo_produto_seq', 8, true);








--
-- TOC entry 1954 (class 0 OID 0)
-- Dependencies: 1628
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

 SELECT pg_catalog.setval('cliente_cod_cliente_seq', 22, true);


--
-- TOC entry 1955 (class 0 OID 0)
-- Dependencies: 1631
-- Name: pedido_cod_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

 SELECT pg_catalog.setval('pedido_cod_pedido_seq', 99, true);



ALTER TABLE produto DISABLE TRIGGER ALL;

INSERT INTO produto (cod_produto, nome, descricao, tempo_preparo_minutos, valor_calorico, numero_max_adicionais, cobrado_por_quilo, disponivel, removed, cod_empresa, cod_tipo_produto) VALUES (5, 'Marguerita', 'Pizza com queijo fresco e selecionado, manjericão, azeite de oliva, tomates e orégano', 23, 234, 0, NULL, true, 0, 37, 8);
INSERT INTO produto (cod_produto, nome, descricao, tempo_preparo_minutos, valor_calorico, numero_max_adicionais, cobrado_por_quilo, disponivel, removed, cod_empresa, cod_tipo_produto) VALUES (6, 'Lombo ao Creme', 'Pizza de lombo ao creme', 18, 345, 0, NULL, true, 0, 37, 8);
INSERT INTO produto (cod_produto, nome, descricao, tempo_preparo_minutos, valor_calorico, numero_max_adicionais, cobrado_por_quilo, disponivel, removed, cod_empresa, cod_tipo_produto) VALUES (7, 'Calabreza', 'Pizza de borda recheada com calabreza', 16, 389, 0, NULL, NULL, 0, 37, 8);


ALTER TABLE produto ENABLE TRIGGER ALL;

--
-- TOC entry 1933 (class 0 OID 26108)
-- Dependencies: 1618 1932
-- Data for Name: tamanho_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE tamanho_produto DISABLE TRIGGER ALL;

INSERT INTO tamanho_produto (cod_tamanho_produto, cod_produto, descricao, preco, numero_sabores_pizza, removed) VALUES (13, 5, 'Grande', 28.00, 2, 0);
INSERT INTO tamanho_produto (cod_tamanho_produto, cod_produto, descricao, preco, numero_sabores_pizza, removed) VALUES (14, 5, 'Média', 25.00, 1, 0);
INSERT INTO tamanho_produto (cod_tamanho_produto, cod_produto, descricao, preco, numero_sabores_pizza, removed) VALUES (15, 6, 'Grande', 29.00, 2, 0);
INSERT INTO tamanho_produto (cod_tamanho_produto, cod_produto, descricao, preco, numero_sabores_pizza, removed) VALUES (16, 7, 'Grande', 34.00, 3, 0);


ALTER TABLE tamanho_produto ENABLE TRIGGER ALL;



--
-- TOC entry 2134 (class 0 OID 24700)
-- Dependencies: 1611 2124 2128
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE empresa DISABLE TRIGGER ALL;

INSERT INTO empresa (cod_empresa, cod_cidade, razao_social, cnpj, rua, numero, cep, complemento, valor_minimo_entrega, nome_fantasia, logo, telefone1, telefone2, bairro, email, url, removed, desativada, data_cadastro, cod_estrategia_cobranca_pizza, timezone) VALUES (4, 2, 'razao_social', '28899989888888', 'rua', 0, '79010234', 'complemento', 20.00, 'nome_fantasia', '', 'telefone1 ', 'telefone2 ', 'bairro', 'example@example.com', 'dddd', 0, false, '2011-02-12 10:05:46', NULL, 'America/Campo_Grande');
INSERT INTO empresa (cod_empresa, cod_cidade, razao_social, cnpj, rua, numero, cep, complemento, valor_minimo_entrega, nome_fantasia, logo, telefone1, telefone2, bairro, email, url, removed, desativada, data_cadastro, cod_estrategia_cobranca_pizza, timezone) VALUES (37, 2, 'teste da silva sauro', '78203805191999', 'rua 7 de setembro', 3456, '79020310', 'apto 1901', 20.00, 'Massas e Dogão Lanches LTDA', '', '          ', '          ', '', 'silvo@hotmail.com', 'coc', 0, false, '2011-02-24 10:19:27', NULL, 'America/Campo_Grande' );


ALTER TABLE empresa ENABLE TRIGGER ALL;


--
-- TOC entry 1947 (class 0 OID 26190)
-- Dependencies: 1629
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cliente (cod_cliente, nome, data_nascimento, email, senha, telefone, celular, endereco, numero, bairro, complemento, cep, cpf, status_usuario, data_cadastro, observacao) VALUES (21, 'Aparicio de Souza', NULL, 'daccds@hotmail.com', 'apacoco', '(99) 9999-9999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-10 17:53:29', NULL);
INSERT INTO cliente (cod_cliente, nome, data_nascimento, email, senha, telefone, celular, endereco, numero, bairro, complemento, cep, cpf, status_usuario, data_cadastro, observacao) VALUES (22, 'Aparicio de Souza', NULL, 'csdsd@hotmail.com', 'apacv', '(99) 9999-9999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-10 17:58:13', NULL);


--
-- TOC entry 1948 (class 0 OID 26208)
-- Dependencies: 1632 1947
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pedido (cod_pedido, cod_cliente, data, valor_total, rua, numero, complemento, cep, status_pagamento, status_pedido, telefone) VALUES (90, 19, '2012-01-16 13:51:50', NULL, 'fsdfdsf', 444, '', NULL, 1, 0, '(67) 8118-9719');
INSERT INTO pedido (cod_pedido, cod_cliente, data, valor_total, rua, numero, complemento, cep, status_pagamento, status_pedido, telefone) VALUES (89, 19, '2012-01-16 12:11:23', NULL, 'gfdgfdg', 444, '', NULL, 1, 0, '(67) 8118-9719');
INSERT INTO pedido (cod_pedido, cod_cliente, data, valor_total, rua, numero, complemento, cep, status_pagamento, status_pedido, telefone) VALUES (91, 19, '2012-01-16 14:45:33', NULL, 'dsvdsvdsv', 3232, '', NULL, 0, 0, '(67) 8118-9719');
INSERT INTO pedido (cod_pedido, cod_cliente, data, valor_total, rua, numero, complemento, cep, status_pagamento, status_pedido, telefone) VALUES (92, 19, '2012-01-16 16:10:48', NULL, 'gdfgfd', 3232, '', NULL, 1, 0, '(67) 8118-9719');
INSERT INTO pedido (cod_pedido, cod_cliente, data, valor_total, rua, numero, complemento, cep, status_pagamento, status_pedido, telefone) VALUES (93, 19, '2012-01-16 16:14:16', NULL, 'khkhu', 777, '', NULL, 1, 0, '(67) 8118-9719');
INSERT INTO pedido (cod_pedido, cod_cliente, data, valor_total, rua, numero, complemento, cep, status_pagamento, status_pedido, telefone) VALUES (97, 19, '2012-01-20 10:55:28', NULL, 'vfds', 333, '', NULL, 0, 0, '(67) 8118-9719');
INSERT INTO pedido (cod_pedido, cod_cliente, data, valor_total, rua, numero, complemento, cep, status_pagamento, status_pedido, telefone) VALUES (98, 19, '2012-01-20 10:57:54', NULL, 'grgre', 444, '', NULL, 0, 0, '(67) 8118-9719');
INSERT INTO pedido (cod_pedido, cod_cliente, data, valor_total, rua, numero, complemento, cep, status_pagamento, status_pedido, telefone) VALUES (99, 19, '2012-01-20 11:00:22', NULL, 'bdfgbdfg', 33, '', NULL, 3, 0, '(67) 8118-9719');
INSERT INTO pedido (cod_pedido, cod_cliente, data, valor_total, rua, numero, complemento, cep, status_pagamento, status_pedido, telefone) VALUES (96, 19, '2012-01-20 10:46:39', NULL, 'vfdvfdvfd', 444, '', NULL, 3, 0, '(67) 8118-9719');


--
-- TOC entry 1949 (class 0 OID 26218)
-- Dependencies: 1633 1948
-- Data for Name: pedido_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pedido_empresa (cod_pedido, cod_empresa, entregar, observacao, tempo_entrega_minutos, cod_entrega, notificacaoSMS) VALUES (89, 37, true, '', NULL, NULL, false);
INSERT INTO pedido_empresa (cod_pedido, cod_empresa, entregar, observacao, tempo_entrega_minutos, cod_entrega, notificacaoSMS) VALUES (90, 37, true, '', NULL, NULL, false);
INSERT INTO pedido_empresa (cod_pedido, cod_empresa, entregar, observacao, tempo_entrega_minutos, cod_entrega, notificacaoSMS) VALUES (91, 37, true, '', NULL, NULL, false);
INSERT INTO pedido_empresa (cod_pedido, cod_empresa, entregar, observacao, tempo_entrega_minutos, cod_entrega, notificacaoSMS) VALUES (92, 37, true, '', NULL, NULL, false);
INSERT INTO pedido_empresa (cod_pedido, cod_empresa, entregar, observacao, tempo_entrega_minutos, cod_entrega, notificacaoSMS) VALUES (93, 37, true, '', NULL, NULL, false);
INSERT INTO pedido_empresa (cod_pedido, cod_empresa, entregar, observacao, tempo_entrega_minutos, cod_entrega, notificacaoSMS) VALUES (96, 37, true, '', NULL, NULL, false);
INSERT INTO pedido_empresa (cod_pedido, cod_empresa, entregar, observacao, tempo_entrega_minutos, cod_entrega, notificacaoSMS) VALUES (97, 37, true, '', NULL, NULL, false);
INSERT INTO pedido_empresa (cod_pedido, cod_empresa, entregar, observacao, tempo_entrega_minutos, cod_entrega, notificacaoSMS) VALUES (98, 37, true, '', NULL, NULL, false);
INSERT INTO pedido_empresa (cod_pedido, cod_empresa, entregar, observacao, tempo_entrega_minutos, cod_entrega, notificacaoSMS) VALUES (99, 37, true, '', NULL, NULL, false);


--
-- TOC entry 2136 (class 0 OID 24731)
-- Dependencies: 1615 2135
-- Data for Name: tamanho_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE tamanho_produto DISABLE TRIGGER ALL;

INSERT INTO tamanho_produto (cod_tamanho_produto, cod_produto, descricao, preco, numero_sabores_pizza, removed) VALUES (7, 1, 'grande', 43.00, 0, 1);
INSERT INTO tamanho_produto (cod_tamanho_produto, cod_produto, descricao, preco, numero_sabores_pizza, removed) VALUES (8, 1, 'grande', 53.00, 0, 0);
INSERT INTO tamanho_produto (cod_tamanho_produto, cod_produto, descricao, preco, numero_sabores_pizza, removed) VALUES (5, 1, 'pequeno', 23.80, 0, 1);
INSERT INTO tamanho_produto (cod_tamanho_produto, cod_produto, descricao, preco, numero_sabores_pizza, removed) VALUES (6, 1, 'medio', 33.00, 0, 1);
INSERT INTO tamanho_produto (cod_tamanho_produto, cod_produto, descricao, preco, numero_sabores_pizza, removed) VALUES (9, 2, 'unico', 6.75, 0, 0);
INSERT INTO tamanho_produto (cod_tamanho_produto, cod_produto, descricao, preco, numero_sabores_pizza, removed) VALUES (10, 1, 'meia-porção', 32.00, 0, 0);
INSERT INTO tamanho_produto (cod_tamanho_produto, cod_produto, descricao, preco, numero_sabores_pizza, removed) VALUES (11, 3, 'normal', 0.80, 0, 0);
INSERT INTO tamanho_produto (cod_tamanho_produto, cod_produto, descricao, preco, numero_sabores_pizza, removed) VALUES (12, 3, 'fortão', 1.25, 0, 0);


ALTER TABLE tamanho_produto ENABLE TRIGGER ALL;



--
-- TOC entry 1950 (class 0 OID 26227)
-- Dependencies: 1634 1949
-- Data for Name: itens_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (9, 89, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (9, 90, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (10, 91, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (10, 92, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (8, 93, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (13, 96, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (8, 97, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (10, 97, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (9, 97, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (13, 97, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (15, 97, 37, 2, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (13, 98, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (15, 98, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (9, 98, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (8, 98, 37, 2, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (10, 98, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (8, 99, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (10, 99, 37, 1, NULL);
INSERT INTO itens_pedido (cod_tamanho_produto, cod_pedido, cod_empresa, quantidade, quilos) VALUES (15, 99, 37, 1, NULL);


--
-- TOC entry 2141 (class 0 OID 24779)
-- Dependencies: 1622 2129 2134
-- Data for Name: ingrediente_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE ingrediente_empresa DISABLE TRIGGER ALL;

INSERT INTO ingrediente_empresa (cod_ingrediente, cod_empresa, descricao, imagem, preco_quando_adicional, removed) VALUES (1, 37, 'Porção de arroz', '\\377\\330\\377\\340\\000\\020JFIF\\000\\001\\001\\000\\000\\001\\000\\001\\000\\000\\377\\333\\000\\204\\000\\011\\006\\006\\022\\022\\021\\025\\024\\023\\024\\025\\024\\025\\025\\027\\024\\024\\027\\027\\024\\027\\024\\024\\024\\024\\024\\024\\024\\025\\024\\024\\025\\024\\024\\027\\034&\\036\\027\\031#\\031\\024\\024\\037/ $''),,,\\025\\036150*5&+,)\\001\\011\\012\\012\\016\\014\\016\\032\\017\\017\\032,\\034\\037$,,,,),,,,*.),,,)),)),,,)),,))),,))),))),,,,,,,5.)5\\377\\300\\000\\021\\010\\000\\310\\000\\374\\003\\001"\\000\\002\\021\\001\\003\\021\\001\\377\\304\\000\\033\\000\\000\\002\\003\\001\\001\\001\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\003\\004\\001\\002\\005\\006\\000\\007\\377\\304\\000:\\020\\000\\001\\004\\000\\005\\002\\005\\001\\007\\003\\004\\000\\007\\000\\000\\000\\001\\000\\002\\003\\021\\004\\005\\022!1AQ\\006\\023"aq\\2012BR\\221\\241\\301\\321\\024b\\261\\025#3\\360\\007\\026Cr\\242\\341\\361\\377\\304\\000\\031\\001\\000\\003\\001\\001\\001\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\001\\002\\003\\004\\005\\377\\304\\000#\\021\\000\\002\\002\\002\\003\\000\\002\\003\\001\\001\\000\\000\\000\\000\\000\\000\\000\\001\\002\\021!1\\003\\022A\\023"Qa\\360\\221\\004\\377\\332\\000\\014\\003\\001\\000\\002\\021\\003\\021\\000?\\000\\372\\031T.W!\\015\\315H\\262-\\021\\250@+\\002\\200,Z\\275j\\003\\224\\027$\\004\\202\\256\\002\\030)\\2100\\356w\\0010!\\255\\013\\302\\022x\\013N\\034\\271\\255\\026\\345Y\\3638\\331\\306\\377\\000\\012[\\240\\026\\213,q\\347d\\323r\\346\\216JE\\231\\303\\244u\\015\\202\\246*\\027\\223\\324\\250\\356\\274\\035\\0327\\023z\\2052b\\243hX\\315\\300<\\236\\012\\321~\\015\\305\\264BJm\\370\\024\\\\\\346\\221(9\\234K+\\027\\207,\\344l\\227d\\340\\354\\024>V\\212\\352o\\014tEM\\304z\\205\\206\\346\\021\\321\\010\\342\\007]\\221\\362\\265\\260\\352t''\\000\\303\\307\\350\\203&W\\330\\254\\270\\346=\\011L\\307\\217\\220u\\265k\\225\\013\\2512`\\234:%?\\253h\\2735\\244\\321\\366+M\\231\\300\\373\\301r\\317\\313_6.V\\330\\021\\274\\207_P\\000D\\371j\\250\\226\\231\\263\\375KuP6j\\376\\210\\205z,\\203\\312\\262\\322\\\\OR\\252\\353\\034\\205\\254n\\262\\004\\026\\250\\245kR\\012\\241\\224-Q\\241\\022\\324\\240@\\203U\\302\\265)\\001\\000\\014\\250\\244R\\325\\355(\\002\\032\\3456\\206\\024\\2442\\340/\\026\\250\\265\\032\\320\\004\\026\\250\\014''\\204h\\330\\\\h-\\214.\\011\\261\\215NHLW\\005\\224u\\177\\344\\215\\213\\314\\231\\020\\246\\321),\\3079''\\322\\335\\202B\\002\\003\\255\\343c\\335e.D\\260\\206\\225\\226\\305fO\\177&\\202Y\\214s\\270\\037U\\272\\334<on\\302\\321\\306\\010\\327\\244R\\311\\305\\277J\\264\\214\\374\\277,-6\\345\\272\\030(l\\207\\016\\021\\325\\352\\3352\\310\\366[B4\\210n\\311kGe \\205[\\2641\\031\\265V*\\003\\214\\303\\211-\\253;\\007\\341\\340\\302\\267X\\320\\244\\004\\234Sv\\307tf\\234 ;RR\\177\\017\\007\\025\\272\\326\\000\\254\\207\\004\\366.\\314\\346\\206J\\340\\016\\224\\2732\\271t\\227~\\235WU\\240*9\\324/\\225\\017\\215\\025\\331\\234\\0262y?\\343-\\247m\\360[{\\225h\\311\\363\\177\\0157\\376\\332\\322\\302g\\214\\304\\342%\\2026\\353-$\\271\\3745\\215\\340\\013\\357\\312\\324\\314<5\\013\\300\\364\\321\\035\\211\\037\\376\\256e\\007,\\305\\330v\\020\\303fd\\177pO\\007\\307 \\367Y\\357\\312\\335\\030\\2406\\012\\261\\302j\\370[\\306rXeP|N\\\\[\\270\\334$\\034\\365\\245\\206\\314\\010\\331\\333\\204lN\\011\\262\\013o+e+$\\307\\017W\\017Q.\\034\\264\\356\\206\\025\\200]j\\301\\310.\\012\\272\\223\\001\\235Ju%\\304\\212|\\324\\001r\\2409C\\312\\365\\244"\\305\\353\\315i''d\\022V\\356K\\200\\241\\255\\337D\\003\\030\\300`\\304m\\324\\356V^c\\233ju}\\324|\\3470\\277H\\341s\\030\\251\\300 .nn^\\270EB6t\\330&1\\3756Z\\207\\002\\302\\005\\201\\262\\305\\312\\330K/\\242\\326\\022:\\205''\\007k(\\032\\033\\211\\215\\033\\000\\210P \\004r\\213#\\326\\253D\\022O\\272\\202\\344\\006\\272\\355_X\\001.\\326:\\014B\\365\\322\\0231\\026\\255v\\235\\246"^\\206\\036Qk\\272\\361"\\222hd2DB\\345\\205\\027\\210\\030\\320\\367\\274\\200\\337<\\301\\030\\352Ki\\247\\365\\324}\\200ZrbZ\\001u\\212\\033\\223\\316\\335\\322SM\\013f\\037\\215s\\347\\341\\230\\317/\\355\\274\\220\\007SC\\240\\372\\240e\\231\\263\\346\\301<\\270\\030\\300\\214\\267Q\\330\\227\\327\\335\\366\\367W\\3140\\314v:)^5\\201\\030k\\001\\255!\\317$\\336\\374\\232\\010~4s\\314 G\\366X\\370\\335%~\\035B\\333\\373\\225\\3119J\\345+\\375P\\322\\024\\360\\026W&\\021\\205\\205\\240\\231Hq\\223\\351\\306\\374\\256\\346\\327\\017\\231b\\244\\207\\021\\020n\\247\\206\\227\\027\\001n\\246\\0204\\221\\357\\271]V[\\212\\221\\355\\324\\366\\350\\276\\032M\\270\\017\\356\\367\\366Z\\377\\000\\317$\\227A5\\370\\030y\\007\\225\\227\\216\\302\\020\\015l\\265&`\\345,\\310\\034\\356x[I^\\006\\216b):\\025\\241\\207\\230\\264\\255H\\362\\330\\333\\275,\\274d\\303^\\301eN\\033.\\354vH\\333#}\\3264\\320\\026\\032)\\370\\037Gd\\324\\320\\211\\033\\356\\267\\214\\254\\235\\030$\\252\\220\\2574E\\246\\212\\031V\\0048\\250\\324\\241Z\\223\\001\\207F\\250B9r\\033\\222\\020l\\273\\012^\\360:u[\\231\\216 1\\224\\0252l>\\226j<\\225\\235\\233OnQ7J\\301e\\212\\341\\355\\317\\334Z[2\\360\\323\\334\\340\\350\\370\\352\\025\\233\\216p\\331\\255\\353\\272\\351\\262\\371K\\332\\035U\\321r\\305G\\223\\014\\321\\267\\034\\211e\\230G\\260\\000xZ`\\364Eu(\\320\\002\\350Q\\254\\031\\267`\\230Mn\\254\\301\\\\\\257\\031:\\252\\272a\\311L\\002P=\\010Ct&\\367\\334/\\034Z\\367\\230H\\333\\236\\311a\\2009f\\255\\200E\\206a\\300Bln\\273;\\005xY\\315)Wct\\035\\352\\256}\\017\\331q\\371g\\2154\\263\\\\\\226\\341\\256h\\234\\006\\345\\217\\211\\304\\203]\\213H\\036\\324\\257\\214\\361\\225\\304\\341\\246\\210\\213S\\235\\320=\\343\\322\\306~#F\\276TK\\236\\011Y\\011\\234\\361\\311\\246\\306\\3434\\2151\\341\\331#\\337N7\\255\\326\\035 cn\\316\\364I\\341ox\\307\\016\\350\\240\\270\\237^\\246y\\226w-\\337q\\361\\333\\205\\363\\271sI\\3314\\356\\204\\275\\215\\252{\\232\\0111E\\265\\206\\237\\272\\347\\026\\325\\373/\\241\\316\\334<\\330x\\231$\\277\\355\\2721d\\032''\\322\\015\\003\\315\\320\\256\\374\\256(\\3118?\\313\\010\\344C\\302y\\256\\257[\\313\\236\\366\\006E\\000x\\255\\213oY\\035\\353\\223\\331t\\023\\311\\014\\320\\226\\227\\200\\315G\\\\\\204\\326\\247\\003N\\323\\335c\\341\\374-\\013\\365be\\327\\020\\333KC\\210\\323\\023\\005\\003''rG\\360\\271\\257\\016\\314\\037-\\310?\\332\\210\\272\\206\\344\\311#\\311,k[\\360n\\223\\354\\340\\222\\335\\232:XG\\325\\260\\261\\307\\345\\264GUB\\217R:o\\325\\037Oe\\231\\202s\\352\\3364\\337\\015\\374#\\240''\\272~''\\367+\\276\\0155\\252$c\\345M\\332VI\\267\\245x\\236\\257\\266B\\213\\034>\\313\\033\\035\\227\\023n[^r\\260h(qR\\004\\3329\\374$D\\217\\204\\334&\\223\\362a\\303A\\244\\220\\012\\022\\352U\\330\\034\\317\\006\\034\\335C\\225\\202\\340\\272\\270\\307E\\207\\231\\3414?\\330\\255\\223%\\010\\264)\\245`\\024R\\006[R\\274\\015\\324\\340=\\322>qO\\344\\216\\325(\\366@\\0354\\207K+\\331sx\\311}B\\373\\256\\213\\031\\302\\312\\304\\345\\340\\020]\\270+\\016T\\332\\300\\341\\260\\230, u\\270\\015\\266\\257\\225\\244\\371\\013@B\\302\\303Ca\\262\\264\\247V\\3014\\251\\011\\345\\2201\\026\\245\\362\\032\\335DPi\\335\\305\\016|]\\372BZY\\017p\\0267\\007\\001[\\024bvK\\264\\215\\215\\375\\224?\\3527\\263\\302v\\024W0qmm\\267?\\012\\2309I\\335\\034HI\\273\\261\\333\\2720\\204\\001\\330\\016\\212z\\267+\\035\\342\\212G!s\\267<%''\\314D3\\026\\274\\323d\\032\\232O\\001\\315\\036\\246\\337z\\027\\364Ec\\3436\\353\\240/u\\201\\342\\\\Kd\\201\\3554\\340F\\333\\355\\371\\375\\024\\362r(F\\354Ug9\\233\\345\\203\\372\\207\\315\\010\\006:l\\316\\242h\\276M\\234C}\\332wE\\310\\241\\302\\271\\340\\027\\271\\262\\265\\256t\\233\\215-h\\273\\240G\\332\\252?\\222\\266\\003''p\\210\\306\\311\\\\\\327\\022\\327\\275\\355\\015$m\\351n\\374\\012\\375\\220\\007\\206\\307\\373\\205\\256u\\270z\\216\\333\\216\\356\\372\\257)\\312\\336P\\372?\\012\\317\\342\\034\\027\\364\\2636\\000\\350\\344q\\266\\223o\\221\\356k\\266/''\\226\\236i)\\341F\\014L\\217p>_\\225\\245\\366*\\265\\270i\\331\\274\\016\\024e^\\021l\\203\\326\\342\\315\\315W''\\213;\\250\\314\\262I"\\225\\307\\006\\302#\\322\\300kv\\353e\\331=\\310\\277\\315S}\\262\\326<\\027Y&uQdM\\223Xt\\217\\220\\276\\203\\336Ih\\000\\033\\322\\306\\367[9NS\\207\\200\\006\\304\\300(\\223|\\272\\317''Q\\\\\\307\\207\\261\\030\\200\\033\\033!-h\\275RJI$\\235\\311\\351d\\373.\\2529\\232\\017b\\272\\370TR\\272\\004\\223\\320\\376%\\246\\201\\037U\\020\\372\\201\\243\\270W\\302\\317\\351\\265\\003\\0127sMu\\256\\213\\262\\257(?E\\343}\\375\\252\\264\\313$\\011R\\032\\356\\273\\257M&\\225I\\326E\\260\\323F\\006\\343\\352\\252f\\244\\2731\\241\\300\\213\\244V>\\206\\341$\\323\\320\\3501q \\244\\2547\\236SpK\\272[\\037N\\340u\\3457\\253\\004\\0222\\201\\232\\301\\251\\227\\324&!e5\\021\\355\\261]\\325DL\\345@^\\245|Ct\\270\\217t%c\\002aZ\\031\\024T\\362}\\222\\255\\011\\334\\271\\324\\344\\230\\033X\\276\\020 \\3041\\300\\007t\\356\\217)\\260\\271i\\013\\374\\375-\\005\\333\\360\\026\\034\\262q\\241\\301Y\\321\\317\\231\\264\\032\\037\\012q\\004\\001\\310\\367Y\\357\\303\\230\\233\\251\\324?T\\214\\270\\307\\035\\366+7\\310\\326\\312Q\\275\\017\\2773\\373\\253\\332I\\365\\003k\\0326H\\367\\000\\326\\023g\\236\\313q\\221>8\\315\\002d=+\\205\\234$\\347\\262\\244\\253A\\206\\017\\323hF7<\\320\\330\\016\\276\\335\\321 \\022\\010\\311{\\267\\335\\333\\364\\036\\351q\\233\\372h\\003\\267$\\355\\317\\024\\026\\257\\256/\\004db\\\\@i\\015\\034\\017\\325\\012lQp<\\330\\275\\206\\340\\205\\20768\\227\\037\\321\\037\\372\\247F,r\\017\\310#\\262\\313\\345N\\312\\353FO\\215\\363\\343\\006\\033K\\011\\017\\220]\\201\\366\\031\\301#\\374,\\354\\232x\\235\\2050\\270\\233\\2166\\265\\335=O\\267\\020\\017]\\356\\312\\037\\216\\313\\344kfh\\003\\312\\246\\270{<\\237\\273\\330m\\371\\250\\312pl8B\\361e\\317~\\255\\366:\\232\\010\\257\\200W\\017$\\323m\\377\\000\\204\\244\\3731<\\2436\\226I]\\023\\036\\346\\306\\343\\251\\357\\344\\355\\260k}\\221\\363\\\\\\310\\302Y\\014..|\\217\\247:\\356\\232\\016\\340|\\246\\233\\204d{F\\327\\013\\323\\254\\235\\2115\\270\\003\\240\\013?\\033\\341\\362%/m\\213-\\323\\323z\\242GU\\202_\\337\\336\\024\\240\\342\\277gC\\023\\345s+M\\264\\035\\313w\\334tDf&\\252\\301\\025\\364G\\311\\360\\256\\205\\236\\247U\\360\\301\\307\\316\\375SC\\030\\332\\365\\267\\233\\240\\3427]\\261\\342\\305\\267L\\273\\316\\213G\\211\\016\\330\\032\\333ci\\234\\036\\015\\327\\352p\\333\\267T\\223^\\316h4\\177hO\\341\\263\\0068ix \\177\\336\\253x\\323\\177b]\\370h\\006\\350\\024\\\\,\\366@\\226B\\010\\006\\350\\365\\037\\3024xS\\310!\\315\\375Q\\337\\200`\\004\\201\\352\\242v=V\\375]\\031\\3308`p;Uw\\264<kdw\\331\\027\\335F\\003\\022{\\335l\\264\\031 \\002\\202i) \\323\\001\\206\\312\\232\\335\\311\\263\\\\#\\007\\033\\244VH\\223\\305\\342\\264\\270\\321\\350\\264\\245\\025\\202m\\260\\345\\375E!\\306ZyY\\241\\316\\017\\263\\363I\\207\\317\\250]\\200G\\352\\243\\265\\225C\\223O\\320#\\216\\027;\\375q\\363\\003}\\327F\\317\\262\\252\\022\\354\\330\\244\\250\\347s\\210\\352C\\356\\222\\013G>\\373M>\\31309l\\201\\020\\012b\\031(\\202\\227\\010\\274\\205 t8w\\333T\\263H\\325B\\217S\\325ge\\030\\253\\011\\354c\\303\\006\\262H\\015\\347k\\374\\324=X\\026\\024\\032\\001\\365u\\365\\005@[\\177e\\277\\220Yq\\347\\255\\221\\325[wO\\307\\232E\\366\\002\\311rE\\351\\224\\342\\320\\324\\020\\215W\\246\\275\\372#\\222;\\322\\311\\227\\020\\350\\332\\343\\276\\235\\210$\\335\\003\\300C\\300c/\\233unj\\225wK\\002\\353\\351\\257%pw\\276W1\\233\\342\\332\\371\\010k\\303t\\235\\317\\342=\\007\\321ib1\\204\\336\\324\\017Oe\\231\\036U\\031:\\274\\261\\315\\233<\\376\\253.V\\345\\204T)e\\212\\343a\\215\\262\\341\\343.#\\317\\324\\011\\330\\321h\\330\\213\\356M(\\306\\346\\014c\\237\\036\\332XF\\223{\\223B\\365}M\\245\\274{\\201k\\330\\311":\\037\\011\\324\\0328\\334\\215\\205q\\270\\007\\340\\025\\221\\215\\231\\362E\\033\\264\\0279\\372L\\224\\337\\371\\034\\000\\364\\263\\260$s\\305\\005\\305\\3175\\013Z\\004\\333y5d-\\320K\\337l\\352(z\\275\\275\\355f\\341\\363\\023gSDzK\\203\\033\\303CG\\336\\323\\316\\3013\\016,\\235:\\231\\252^\\032\\306\\217LC\\353\\366\\235\\357\\300\\367Z\\362\\370~\\0275\\256\\225\\245\\217\\2534\\353\\243\\326\\317\\005r\\306\\022\\347\\177\\\\Q\\252\\232G0s\\200\\\\\\0327\\275\\211\\373\\316>\\303\\366]\\016\\026\\007\\022\\315`\\372E\\213\\370Hf\\231 \\016\\017\\212\\275;\\215;8\\036lwS\\024\\3635\\267\\250\\223\\375\\324+\\331uq\\301q\\341\\203}\\220\\343A\\016qs\\254\\223\\260\\3548\\000"c0Z\\232\\034\\367iw\\015h\\353\\277\\005#\\207~\\222^hu6\\217\\217\\227Sm\\302\\376:v!m\\206\\230\\2754\\214\\315\\021\\350{\\216\\241\\366E\\012\\037%{-\\201\\267\\273\\311=\\271\\277\\335bA\\035\\033{\\311\\276\\207\\237\\251]NS\\035i-h\\000\\365\\353J\\241\\366\\226\\205,!\\3101\\001\\267\\261h\\033o\\262<8\\240wY\\371\\204\\255\\021\\227\\037\\306=\\3117[\\366Cn*\\250W\\345\\325o\\336\\235\\031\\325\\233/\\200\\035\\333W\\371\\025\\015\\364\\235\\320\\033\\214\\322\\320@\\277a\\312\\026a\\322F\\361\\324u\\372+\\265\\264M\\024\\233\\026\\366\\270\\351\\027]:\\245!\\314\\303\\237\\270\\335\\012f>O\\370\\330\\342\\356\\011>\\221\\365%?\\213\\313\\233\\240ih\\016\\024\\016\\373\\337U\\237\\331\\350\\274#:l[\\3351\\323V\\017\\036\\311\\374\\313\\000\\3474Q\\014w;\\365S6\\001\\2218=\\255s\\236F\\307\\224\\254\\305\\323r\\016\\307\\200h\\242\\2514\\362\\302\\357E2\\334\\033\\274\\302d6E\\001]WQ\\367V&U\\227<:\\310\\246\\216,\\331[s}\\220;\\255x\\243H\\231\\273f\\026|7o\\302\\312Z9\\344\\236\\260;\\005\\233\\251l$\\025\\245\\031\\255PZ\\244\\024\\000\\263g\\362\\245\\366v\\343\\347\\252\\351#-\\221\\224w\\004Q\\\\\\306e\\001s6\\345\\273\\217\\341\\027\\303\\371\\317B\\241\\341\\206\\315\\230\\262\\010\\032\\035\\351\\253\\253\\376\\332\\354z\\005\\317\\343r\\235\\017&7\\027Q\\334~\\326\\272\\234Yqf\\246n\\3408\\374C\\267\\312\\345e\\314&/h\\210j\\325\\310\\003{\\035\\301\\340\\256nX\\305b\\215 \\333\\004\\374l\\326\\001\\024.\\351\\327V8\\371[\\031~c\\257Q-\\322\\340)\\325\\301K\\263\\013<\\206\\246\\001\\215\\034\\022E\\376@\\253cfdL-f\\347\\277$\\237u\\021N9\\261\\274\\340\\317\\227\\032\\362\\\\L\\207s\\305P\\000"e\\317t\\216\\335\\336\\217c\\312Z,\\232g\\372\\344\\246\\264\\336\\316\\273\\366 !a2\\366\\341\\244\\221\\332\\265\\330\\016c8\\036a\\373G\\343\\217\\252\\347\\224\\334>\\322)\\326\\221\\271\\216k\\013\\311!\\273\\000\\034x\\036\\303\\371Y\\257\\306\\261\\305\\355\\016\\243\\244\\321\\003\\223\\305\\001\\367Z?UL\\263,\\236}RNt\\200j6\\016\\007w9m\\307\\222\\302\\300\\011\\002\\353s\\305\\367\\265\\021\\340\\237+\\357<&.\\351`\\300c\\237\\0346\\343\\311\\241\\377\\000\\1775\\347c-\\242\\311\\027\\362+\\262\\350f\\306\\305U\\244\\0208\\330P?\\262\\346<I\\013\\277\\345/io`\\355\\301?\\333\\360\\027D\\243\\325}X''o%|\\2571\\345\\214.\\016\\003W\\300\\357|\\024@#my\\257=\\273~\\334\\247<>\\340#k\\316\\305\\365\\317^\\313\\037\\305-s\\313\\344\\261\\245\\245\\243\\177}\\266\\374\\220\\325F\\306\\262\\350\\03633\\214\\270\\006\\017H\\347WS\\322\\275\\223\\030Y]3\\204M\\027{\\201\\301\\333\\335c\\345l\\016p\\241\\256\\373\\361\\364+\\270\\310\\262\\270\\243x65\\221\\260\\276\\235iG\\034\\\\\\331Sj&$\\2307\\307(k\\3704o\\236z-\\350qq\\305##\\267\\227\\035\\300\\336\\272\\360x\\350\\213\\231\\341\\213\\245\\000\\215\\210$\\037~\\253\\0370\\221\\315\\024A\\266\\220\\003\\272\\267nAZ\\270\\374m\\264E\\366:\\350\\352\\232[]I\\036\\345b\\342\\374\\330\\313\\234wc\\234t\\360k\\370I`s\\223\\345\\356n\\207''\\233\\372''py\\271p\\242\\007;\\203\\270\\256\\341[\\234f\\277\\004\\323\\210\\316\\025\\344\\362h\\367\\354\\243\\023''\\250\\015E\\316\\354\\007O\\242+\\341h!\\355\\261\\266\\342\\366\\366D\\303\\263[\\265l\\005s\\326\\225\\327\\204\\331\\\\KK#/t\\205\\241\\242\\310\\033\\375\\0202\\014A\\235\\216v\\340oG\\273\\202\\324~\\001\\217m9\\304\\213\\275\\252\\217\\312E\\270\\003\\033\\313\\241\\007OQ\\305\\236\\246\\223qi\\247\\340&\\2506\\037\\0348q\\241\\376\\012\\006)\\272^t\\021dj\\245\\227\\233`\\036\\034d$\\206\\222\\015\\020v?=\\222\\270,Xt\\324\\300L\\206\\233}\\032\\024>G}Z+\\257\\250\\353\\262\\262\\363\\273\\212fW[\\275\\202\\363\\007\\227\\030\\035i''\\216\\237\\313\\210\\236\\247\\374\\225\\324\\225#-\\263#\\034\\360\\347\\223\\364I\\230\\320\\335!T\\363\\212\\261\\232\\002P\\275\\251''\\021L\\336\\311\\001`V\\036s\\2031;\\315g\\331''\\177c\\337\\341mk\\265.h \\264\\356\\017!&\\254\\021>\\037\\361\\000p\\001\\307u\\261\\211\\303\\200\\035$l\\005\\344o[\\022:\\351\\367_?\\307`\\037\\003\\355\\277g\\241\\375\\212\\3502\\037\\023]5\\306\\2267\\343)\\257Pl\\006W\\026 <\\265\\357\\273\\032\\201$\\226|\\003\\3217\\201\\311L..s\\265\\320\\364\\223\\320\\367Z\\246V4:F\\006\\352u_\\367|\\221\\325gf\\030\\251\\011\\002\\200f\\304\\336\\306\\324\\270\\306*\\336\\302\\3333\\263\\034\\326g<A\\033A.\\365\\027\\273\\210\\231|\\373\\272\\370B\\227\\303\\355\\260\\350\\335\\352\\003}d\\2371\\335\\375\\217+\\330\\354\\351\\240\\366\\373\\267\\336\\270K\\2671\\325\\303\\206\\333\\032=W<\\272\\311\\333\\3134\\315`\\331\\303\\305\\345FI;\\235\\352\\366o\\260B\\314\\261:\\310h\\263b\\366\\333o\\225\\221\\211\\314dq\\320\\321\\260\\344\\365?\\375-\\011\\016\\2065\\254\\344\\201n<\\223\\311W\\332\\325-\\023U\\2219\\255\\254\\322\\326\\232\\006\\315nW1\\210\\211\\322J8\\322\\342\\032@\\344t\\262;\\256\\303\\021\\215`\\001\\235\\006\\344\\365''\\374\\240\\345\\371l!\\332\\232Iu\\336\\373\\254\\345\\016\\316\\223-J\\262\\002h\\332!ai%\\220\\232\\273\\344\\267m\\322x\\2266hdi\\3349\\303\\236\\343u\\243\\235\\342\\264\\261\\354:}}\\001\\334{\\351\\\\\\316\\023\\022\\327D\\326\\260\\331\\324I\\276EwNXt\\0139\\030\\312\\260\\2625\\372O\\006\\200<l\\273\\234\\016\\0128\\316\\260\\337Yn\\233\\366\\356}\\3273\\224\\375\\240\\\\vh\\275\\326\\206/3v\\237@\\334\\365\\350\\002\\256:\\212\\262erf\\224\\270\\316uQ\\003v\\221\\312B|tx\\250\\236\\030\\016\\266\\330\\277\\205I\\346\\323\\023K\\313l\\375\\221\\305\\354\\203\\202\\362\\360\\254\\377\\000q\\321\\260\\274\\207\\202\\015Y#po\\225M\\267\\207\\241$s\\270@\\377\\000<0\\023N<t\\371+\\271\\300\\344\\255\\015\\262\\3534i\\243\\222\\261\\031\\211\\303\\272`\\3669\\247k\\333\\337\\233U\\237\\030\\375Nx&\\311\\246\\321\\340l\\000Y\\361\\245\\015\\344\\2717/\\321\\320e\\323\\265\\326.\\267\\242\\327lvZ''\\013\\037Ko\\324\\327\\344\\2620xX\\364\\371\\222\\0279\\374\\227\\023\\266\\335)Z|eW\\253M\\335\\016\\213\\242.\\226L\\232\\316\\015i\\\\[Tj\\372\\3626\\350\\262so\\020\\276''\\350\\003r6\\333\\365D9\\247\\335#\\247=\\217p\\250q\\361L\\302\\036\\303\\2604\\343@\\203\\322\\222\\224\\257\\011\\320%[B9\\367\\211\\034ccZH\\327\\351p\\000\\022Ooe\\251\\341|\\204B\\3371\\342\\234\\355\\375\\300?\\272\\246K\\341\\250\\331\\376\\353\\301q''P\\325\\320\\373\\016\\213Y\\362\\227\\235\\266hU\\010;\\355-\\204\\244\\252\\221}E\\306\\317\\035\\026&q\\213\\324\\355=\\007\\371O\\346X\\320\\306\\351\\034\\237\\320w\\\\\\354\\226\\272\\021\\010\\263\\231h^B#J\\360\\2211\\201\\214\\321LjI\\000Q\\330\\364\\200a\\266\\210\\200\\327\\024Q!@\\036\\236\\020\\346\\321\\026\\012\\346\\361\\271q\\214\\330\\343\\241\\376WA4\\304\\016\\020\\036\\340\\341EL\\242\\232\\032t#\\200\\317^\\312\\017\\341u1\\315\\016!\\224\\356\\333\\021\\261\\037U\\307b0\\364h\\250\\201\\357\\214\\333\\011\\370X\\345a\\225V=\\233\\370C\\025\\253\\375\\267\\261\\361\\356u\\035\\234+\\246\\2209\\367\\\\n74tR\\350\\002\\270\\365\\003\\266\\334\\356\\276\\207\\227x\\240\\215\\234\\2475\\311\\260X\\317S\\233\\241\\377\\000\\215\\233;\\3528?U\\214\\270b\\363\\022\\343\\310\\326$b\\345\\270\\330\\337\\016\\260l\\270\\360\\336v\\356V\\246#\\026^lU\\206\\200\\007k\\033\\332\\305g\\200\\347\\210\\026\\3073d\\214\\236\\005\\265\\302\\375\\277\\204\\263\\263\\030p\\217lN\\325{\\354\\353\\005\\344w%O\\3328c\\303\\321\\253\\030c]V\\034z\\374\\373\\247\\377\\000\\363\\003"\\330\\271\\240\\366\\336\\377\\000E\\30730\\324\\347\\020\\013,\\223@\\355\\371+E\\244\\233\\260O\\277_\\225*u\\241\\270\\376M,\\3435f$\\352h\\026\\335\\257\\202~R\\231~\\010\\206I&\\215$X\\333\\250\\002\\354&\\360y\\214/af\\206\\007\\016x\\273\\012\\177\\327<\\240\\030\\326j\\004\\026\\223{_D\\360\\362\\330\\263\\244\\037,\\305F[\\353\\215\\334r\\336\\277E\\240|\\275\\313C\\350s{\\005\\316\\342\\274\\340\\302C\\264zIh\\252.#\\240*<7\\235Hcsdq\\262\\011\\337\\2474\\205/\\030W\\246\\306(\\034D,\\015\\240\\366\\270\\337\\260\\026?\\204\\234\\371''\\230\\33529\\267\\320\\221U\\371\\2442\\214\\315\\356q`y\\241\\271\\371=\\273''!\\315-\\324\\347\\2156E\\232F\\036\\303+\\002\\270<\\201\\3219\\332\\034\\327\\320\\006\\2075\\376\\023\\303\\034=,\\353\\315\\367\\354\\203\\210\\305\\003zA\\261{\\263mC\\256\\3133\\372y\\235\\027\\234[\\345\\264;KI Y\\351C\\232\\260\\246\\253C\\336\\316\\267\\031\\217\\323\\013\\005\\325\\221\\373\\225\\231\\213\\315X\\343\\273\\252\\206\\221\\337\\350\\026a\\307\\371\\314\\362\\267\\363E\\020\\032\\013\\215\\373W\\265\\376kk.\\360\\024\\262;\\\\\\247\\310e\\015\\2662;\\277\\263U5)\\274\\013\\013`\\260\\230\\367\\314C#\\005\\347\\365\\257\\331v\\230\\014\\231\\261\\206\\276j/\\003f\\203m\\007\\334u>\\352\\330\\03448v\\350\\201\\200w<\\270\\373\\223\\3252\\310I6\\343\\364]<|]w\\223)N\\364K\\236\\351\\017`\\251\\214\\3066&\\320\\347\\240\\375\\312\\03633k6n\\347\\364\\013\\032G\\3526M\\225\\271\\000\\347\\224\\270\\331\\352\\203\\251\\025\\350zU\\014\\361r\\363B\\202\\025\\301@\\013kR\\022\\345\\252\\354z@5\\021(\\300 \\306\\361H\\215p\\356\\201\\203\\236~\\350V\\025q\\016\\262\\250\\035\\266\\351\\210\\274\\254k\\202\\317{KJbG\\366I\\342''\\331D\\225\\2143t\\236QY\\011\\037d\\254\\210\\361\\342\\350\\255\\0301\\035\\217\\360\\261h\\243F\\034\\306V{\\246\\335\\230E(\\323+\\032\\361\\375\\315\\007\\362\\264\\2031\\035\\307\\344\\212\\030\\323\\301L\\003\\303\\220`\\351\\332\\032\\030\\\\\\010\\374A\\267\\325\\240\\360\\224o\\202\\005\\356\\366\\274|iw\\356\\216\\334/m\\221\\230\\331\\007\\005OX\\277\\002\\331\\312f\\336\\014\\236)/\\016\\307\\271\\265\\315\\264\\357\\327a\\275,\\261\\016,\\002\\014\\022\\017\\226?\\236\\343e\\364vb\\245\\010\\315\\314d\\035\\012\\227\\305\\026?\\221\\2376\\315#\\307\\010\\2432\\213h\\334P\\262\\001\\374T/\\204\\216S\\211s\\365\\020\\034:n\\010+\\353_\\352N\\352\\337\\321O\\372\\201\\374?\\240I\\361''\\350\\376C\\345^k\\341\\217\\313\\215\\222=\\356\\373N\\014q\\253\\370\\037\\242O\\017\\223\\343\\344\\266\\263\\0155\\035\\3659\\245\\243\\377\\000\\225/\\261\\267\\034\\356\\337\\245+\\177Q!\\350U.%\\350|\\214\\340r\\237\\004c\\334\\007\\230\\031\\020\\352K\\354\\327\\376\\326\\377\\000+\\251\\303x6\\026\\304#\\232C-8\\273ko=9\\377\\000\\266\\265\\3042\\036M"3\\003\\334\\332\\265\\307\\025\\341\\016m\\201\\301C\\014\\002\\240\\211\\254\\367\\000Y\\371<\\224\\300\\215\\357\\334\\224PX\\336\\31370\\361\\006\\220C7?\\341hI\\244\\367\\307\\020\\267\\020>\\177e\\207\\217\\361\\011~\\314\\364\\216\\375O\\360\\260\\261X\\367\\274\\333\\311*#\\221R@6d=\\325\\231!@iV\\370La\\314\\305Z7\\224\\006s\\272e\\333\\004\\304_R\\257\\230\\025u\\354\\252\\030\\200\\023\\016=U\\331";$iU\\005\\266R\\003\\302`\\251,\\303\\242 \\000\\245q\\021 `\\235&\\352_\\211\\333t\\243\\331\\356\\204e(\\000\\317\\304\\005\\235\\213\\305Z$\\230\\215\\226|\\256\\335 )9@\\2177|g\\270Q\\210\\221g\\316\\373H,\\352r\\377\\000\\023D\\363D\\351=\\212\\336\\207\\022\\327/\\222\\314\\333V\\302\\347s\\303\\366^k\\261\\334)q\\016\\307\\330\\243\\177bS,\\234\\373\\025\\363\\\\\\277\\377\\000\\020\\210\\332F}G\\360\\272\\\\\\017\\214\\341\\177\\336\\257\\2254\\033:\\306b\\017dfb}\\226\\024Y\\374G\\357\\267\\363L\\2638\\213\\361\\267\\363\\010\\0126\\233\\212odA\\210oe\\211\\376\\265\\020\\373\\355\\374\\302\\253\\274K\\000\\377\\000\\324o\\347i\\205\\035\\000\\304\\016\\337\\242\\237\\352}\\227)7\\215!\\034\\022\\357\\205\\233\\211\\361\\331\\341\\214\\372\\224\\354(\\357\\035\\213>\\301fc\\374I\\024|\\272\\317`\\276\\177\\215\\361\\034\\322r\\342\\007\\266\\3111);\\240(\\350\\263?\\024\\311&\\315\\364\\267\\333\\237\\315-\\205\\314\\2349YM\\262\\212\\335J\\250f\\236#4\\276\\2120\\370\\373I6\\321\\340`\\264\\300\\323\\212rS1\\275%\\034\\200&[\\211\\011\\210dL\\212&\\011\\023\\211\\026\\212\\327\\202\\230\\207<\\300Q\\004\\211=T\\275\\250\\240\\011\\362\\305\\362\\254p\\207\\270^^H\\012\\267\\014\\360\\201;H^^@\\305\\034\\355\\367KM]\\027\\227\\222\\003?\\022v\\331f\\271\\344\\251^@\\013\\310\\3429KH\\360\\274\\274\\201\\011\\274n\\225\\225yy\\002\\004\\370\\224\\262*\\340\\257/ \\006\\243.\\0348\\242\\207<\\365*\\027\\224\\214\\261\\210\\367)\\274<\\013\\313\\310z\\0040ZQ\\006\\353\\313\\312K%\\361\\242F\\027\\227\\225!1\\210\\312i\\222//& \\315z;)yy0\\012)_J\\362\\362`Aj$R//& \\276r+g^^@\\037\\377\\331', 4.75, 0);
INSERT INTO ingrediente_empresa (cod_ingrediente, cod_empresa, descricao, imagem, preco_quando_adicional, removed) VALUES (2, 37, '', NULL, 2.87, 0);
INSERT INTO ingrediente_empresa (cod_ingrediente, cod_empresa, descricao, imagem, preco_quando_adicional, removed) VALUES (3, 37, '', NULL, 4.00, 0);
INSERT INTO ingrediente_empresa (cod_ingrediente, cod_empresa, descricao, imagem, preco_quando_adicional, removed) VALUES (4, 37, '', NULL, 0.00, 0);
INSERT INTO ingrediente_empresa (cod_ingrediente, cod_empresa, descricao, imagem, preco_quando_adicional, removed) VALUES (6, 37, '', NULL, 1.76, 0);
INSERT INTO ingrediente_empresa (cod_ingrediente, cod_empresa, descricao, imagem, preco_quando_adicional, removed) VALUES (5, 37, '', NULL, 0.00, 1);


ALTER TABLE ingrediente_empresa ENABLE TRIGGER ALL;




--
-- TOC entry 1951 (class 0 OID 26232)
-- Dependencies: 1635 1950
-- Data for Name: pedido_personalizado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pedido_personalizado (cod_tamanho_produto, cod_pedido, cod_empresa, cod_ingrediente, indice) VALUES (8, 97, 37, 6, 1);
INSERT INTO pedido_personalizado (cod_tamanho_produto, cod_pedido, cod_empresa, cod_ingrediente, indice) VALUES (8, 97, 37, 2, 1);


-- Completed on 2012-04-24 14:31:35

--
-- PostgreSQL database dump complete
--





--
-- TOC entry 2124 (class 0 OID 24606)
-- Dependencies: 1594
-- Data for Name: estrategia_cobranca_pizza; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE estrategia_cobranca_pizza DISABLE TRIGGER ALL;



ALTER TABLE estrategia_cobranca_pizza ENABLE TRIGGER ALL;

--
-- TOC entry 2127 (class 0 OID 24637)
-- Dependencies: 1600
-- Data for Name: tb_estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE tb_estado DISABLE TRIGGER ALL;

INSERT INTO tb_estado (cod_estado, uf, nome) VALUES (1, 'T1', 'Estado1');


ALTER TABLE tb_estado ENABLE TRIGGER ALL;

--
-- TOC entry 2128 (class 0 OID 24645)
-- Dependencies: 1602 2127
-- Data for Name: tb_cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE tb_cidade DISABLE TRIGGER ALL;

INSERT INTO tb_cidade (cod_cidade, cod_estado, nome) VALUES (2, 1, 'City1');


ALTER TABLE tb_cidade ENABLE TRIGGER ALL;


--
-- TOC entry 2129 (class 0 OID 24655)
-- Dependencies: 1604
-- Data for Name: ingrediente; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE ingrediente DISABLE TRIGGER ALL;

INSERT INTO ingrediente (cod_ingrediente, nome, imagem) VALUES (1, 'arroz', NULL);
INSERT INTO ingrediente (cod_ingrediente, nome, imagem) VALUES (2, 'calabreza', NULL);
INSERT INTO ingrediente (cod_ingrediente, nome, imagem) VALUES (3, 'salada', NULL);
INSERT INTO ingrediente (cod_ingrediente, nome, imagem) VALUES (4, 'tomate', NULL);
INSERT INTO ingrediente (cod_ingrediente, nome, imagem) VALUES (5, 'vinagrete', NULL);
INSERT INTO ingrediente (cod_ingrediente, nome, imagem) VALUES (6, 'catupiri', NULL);


ALTER TABLE ingrediente ENABLE TRIGGER ALL;


--
-- TOC entry 2126 (class 0 OID 24625)
-- Dependencies: 1598
-- Data for Name: tipo_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE tipo_produto DISABLE TRIGGER ALL;

INSERT INTO tipo_produto (cod_tipo_produto, nome, foto, is_especialidade) VALUES (1, 'Cozinha Italiana', NULL, NULL);
INSERT INTO tipo_produto (cod_tipo_produto, nome, foto, is_especialidade) VALUES (2, 'Cozinha Internacional', NULL, NULL);
INSERT INTO tipo_produto (cod_tipo_produto, nome, foto, is_especialidade) VALUES (3, 'Cozinha Francesa', NULL, NULL);
INSERT INTO tipo_produto (cod_tipo_produto, nome, foto, is_especialidade) VALUES (4, 'Cozinha Árabe', NULL, NULL);
INSERT INTO tipo_produto (cod_tipo_produto, nome, foto, is_especialidade) VALUES (5, 'Cozinha Mediterrânea', NULL, NULL);
INSERT INTO tipo_produto (cod_tipo_produto, nome, foto, is_especialidade) VALUES (7, 'Cozinha Alemã', NULL, NULL);
INSERT INTO tipo_produto (cod_tipo_produto, nome, foto, is_especialidade) VALUES (6, 'Lanche', NULL, NULL);
INSERT INTO tipo_produto (cod_tipo_produto, nome, foto, is_especialidade) VALUES (8, 'Pizza', NULL, NULL);


ALTER TABLE tipo_produto ENABLE TRIGGER ALL;

--
-- TOC entry 2135 (class 0 OID 24718)
-- Dependencies: 1613 2126 2134
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE produto DISABLE TRIGGER ALL;

INSERT INTO produto (cod_produto, nome, descricao, tempo_preparo_minutos, valor_calorico, numero_max_adicionais, cobrado_por_quilo, disponivel, removed, cod_empresa, cod_tipo_produto) VALUES (1, 'Macarrão Carbonara', 'Deliciosa massa caseira, levemente refogada no azeite, temperada com champignon, azeitonas pretas e bacons selecionados.', 28, 450, 2,  NULL, true, 0, 37, 1);
INSERT INTO produto (cod_produto, nome, descricao, tempo_preparo_minutos, valor_calorico, numero_max_adicionais, cobrado_por_quilo, disponivel, removed, cod_empresa, cod_tipo_produto) VALUES (2, 'Cachorro Quente', 'Duas salsichas sadia, cebola, milho, ervilha, bata frita e molho especial com azeite.', 5, 142, 0,  NULL, true, 0, 37, 6);
INSERT INTO produto (cod_produto, nome, descricao, tempo_preparo_minutos, valor_calorico, numero_max_adicionais, cobrado_por_quilo, disponivel, removed, cod_empresa, cod_tipo_produto) VALUES (3, 'Esfirra', 'Deliciosa esfirra feita com nossa tradicional massa caseira e carne moída selecionada.', 20, 132, 0,  NULL, true, 0, 4, 4);


ALTER TABLE produto ENABLE TRIGGER ALL;

--
-- TOC entry 2145 (class 0 OID 24824)
-- Dependencies: 1627 2128
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE cliente DISABLE TRIGGER ALL;



ALTER TABLE cliente ENABLE TRIGGER ALL;

--
-- TOC entry 2130 (class 0 OID 24667)
-- Dependencies: 1606
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE funcionario DISABLE TRIGGER ALL;

INSERT INTO funcionario (cod_funcionario, nome, cpf, data_nascimento, email, senha, telefone_residencial, telefone_comercial, celular, removed, endereco, numero, bairro, complemento, cep, status_user, data_cadastro, observacao) VALUES (1, 'Conde Dracula', '78203805191', '1978-02-13', 'masdeval@yahoo.com.br', 'coco', '              ', '              ', '              ', '0', 'rua noroeste', 2344, '', '', '7897677 ', 1, '2011-03-02 19:57:33', 'teste');
INSERT INTO funcionario (cod_funcionario, nome, cpf, data_nascimento, email, senha, telefone_residencial, telefone_comercial, celular, removed, endereco, numero, bairro, complemento, cep, status_user, data_cadastro, observacao) VALUES (3, 'christian cleber masdeval braz', '78203805192', NULL, '', 'coco', '              ', '              ', '              ', '0', 'xxxx', 2222, '', '', '79020310', 1, '2011-03-22 15:43:26', '');
INSERT INTO funcionario (cod_funcionario, nome, cpf, data_nascimento, email, senha, telefone_residencial, telefone_comercial, celular, removed, endereco, numero, bairro, complemento, cep, status_user, data_cadastro, observacao) VALUES (5, 'MArco Aurelio Medeiros', '78203805193', '1974-09-14', 'marco@uol.com.br', NULL, '(67) 3456-9876', '', '(67) 8765-0989', '0', 'Av Getulio Vargas', 1234, '', '', '79020456', 0, '2011-11-25 18:42:20', 'teste');


ALTER TABLE funcionario ENABLE TRIGGER ALL;

--
-- TOC entry 2132 (class 0 OID 24684)
-- Dependencies: 1608 2130
-- Data for Name: funcionario_entregador; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE funcionario_entregador DISABLE TRIGGER ALL;

INSERT INTO funcionario_entregador (cod_funcionario, modelo_moto, consumo, total_km, total_acidentes) VALUES (1, 'honda bis', 16, 45667, 4);


ALTER TABLE funcionario_entregador ENABLE TRIGGER ALL;

--
-- TOC entry 2133 (class 0 OID 24692)
-- Dependencies: 1609 2132
-- Data for Name: entrega; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE entrega DISABLE TRIGGER ALL;



ALTER TABLE entrega ENABLE TRIGGER ALL;

--
-- TOC entry 2139 (class 0 OID 24761)
-- Dependencies: 1620 2135
-- Data for Name: foto_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE foto_produto DISABLE TRIGGER ALL;

INSERT INTO foto_produto (cod_foto, cod_produto, foto) VALUES (4, 2, '\\377\\330\\377\\340\\000\\020JFIF\\000\\001\\001\\000\\000\\001\\000\\001\\000\\000\\377\\333\\000C\\000\\011\\006\\007\\010\\007\\006\\011\\010\\007\\010\\012\\012\\011\\013\\015\\026\\017\\015\\014\\014\\015\\033\\024\\025\\020\\026 \\035"" \\035\\037\\037$(4,$&1''\\037\\037-=-157:::#+?D?8C49:7\\377\\333\\000C\\001\\012\\012\\012\\015\\014\\015\\032\\017\\017\\0327%\\037%77777777777777777777777777777777777777777777777777\\377\\300\\000\\021\\010\\000]\\000\\216\\003\\001"\\000\\002\\021\\001\\003\\021\\001\\377\\304\\000\\034\\000\\000\\001\\005\\001\\001\\001\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\003\\004\\005\\006\\007\\002\\001\\010\\377\\304\\000;\\020\\000\\001\\003\\003\\002\\003\\005\\005\\005\\007\\005\\001\\000\\000\\000\\000\\001\\000\\002\\003\\004\\005\\021\\022!\\0061\\221\\023"AQa\\024Bq\\201\\241\\0072\\261\\301\\321#RSbr\\322\\360\\026$3c\\202\\222\\377\\304\\000\\032\\001\\000\\002\\003\\001\\001\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\002\\001\\004\\005\\003\\006\\377\\304\\000)\\021\\000\\002\\002\\001\\002\\005\\003\\005\\001\\001\\000\\000\\000\\000\\000\\000\\001\\002\\000\\003\\021\\004\\022\\023!1AQ\\005\\0242"B\\241\\261\\360\\221\\361\\377\\332\\000\\014\\003\\001\\000\\002\\021\\003\\021\\000?\\000\\334P\\230\\336n\\021\\332\\355\\362\\325\\3105h\\035\\326\\347\\3578\\362\\012\\221h\\277\\336\\347\\274Q\\315W0\\366Z\\211\\273#\\003Z\\003@;m\\343\\261\\302\\341f\\241+`\\247\\251\\235\\253\\241\\254R\\303\\240\\227\\313\\215d6\\372)\\252\\352\\035\\2468\\232\\\\}}>%fq\\337/,\\270\\266\\354\\371es\\013\\373\\320k%\\2323\\273q\\234r\\361VN:\\254\\023OAe\\211\\337\\265\\251\\225\\256~y\\001\\234\\014\\374\\316~I\\227\\021\\321\\323EK\\0355)\\0150\\306s\\237yU\\324\\330\\305\\276\\223\\323\\367,\\351\\321U~\\241\\362\\375K\\344n\\017\\215\\257i\\313\\\\\\001\\007\\321t\\222\\245\\214CM\\014C\\223\\030\\326\\217\\220J\\255\\001\\322P0B\\020\\246\\020B\\020\\210A\\010B!\\004!\\010\\204\\020\\204"\\020B\\020\\210J7\\332-sL\\264\\266\\326\\271\\335\\243\\232e\\322\\337>M\\372\\202\\253w\\233\\253!\\215\\224tUPCQ@\\032\\360\\343\\336y{{\\304\\221\\310o\\346\\257<I`\\222\\266\\252;\\225\\013\\361[\\014F1\\033\\361\\242A\\277<\\217S\\325d\\357uU\\236\\266\\341\\015}\\023\\231S.N&\\316q\\340G\\201\\3447\\013+T\\254\\034\\261\\232\\332M\\254\\200\\016\\335\\242\\202\\373p\\251\\250\\366\\232j\\255s\\3234:\\177j;\\270\\202s\\202ycn^>\\212\\355d\\270U\\361k"\\354#dQC+\\037<\\207$g9\\323\\277<\\217\\016[\\347+3\\236)\\243\\273\\306e\\224\\012\\027w\\365\\307)q\\320F\\226\\267NN\\340\\343\\361\\312\\265\\3605\\356\\247\\207\\355\\022Lbl\\221T?_d\\343\\244\\203\\367ug\\034\\260\\006\\311\\023\\012Ac\\312=\\243r\\235\\203\\234\\330\\307$*e\\027\\030\\315XGd\\3120O&\\031NO\\\\)6q\\005@\\003\\265\\266\\277?\\311(*\\370\\325\\325\\374\\014\\315:k\\007i`B\\257\\236!\\234\\377\\000\\307m\\177\\376\\344\\003\\362M\\345\\342*\\246\\273K\\243\\243\\204\\377\\000\\3316O@\\217wW\\237\\301\\200\\323X{~e\\241\\012\\264\\313\\355qh"*7\\347\\367e#)f_\\252q\\337\\267o\\374\\263\\003\\371 j\\252?\\360\\300\\351\\254\\035\\244\\372\\024\\033o\\357\\367\\355\\363\\003\\344\\036\\322\\2727\\374\\020\\015\\005@\\371\\267\\365M\\356j\\363\\373\\221\\300\\263\\304\\232B\\205\\377\\000P3\\177\\366U=Y\\375\\313\\327q\\004M\\031u%H\\036}\\317\\356S\\356*\\363#\\203g\\2112\\205\\0148\\216\\20072\\231c\\376\\246\\376\\204\\247t\\027j\\033\\206E%C$p\\346\\334\\341\\303\\345\\315J\\335[\\034+\\010\\246\\267^dG\\310@B\\353\\022\\013:\\373M\\321R\\350\\232FD\\033e\\247\\300\\363\\007\\240\\350\\264U\\233\\337\\340\\224\\326WE6K\\265\\0226\\360Tu\\354\\301\\000\\035\\314\\267\\243\\003~OiT\\244\\264P\\262\\216I\\231,\\356{\\335\\201\\034@e\\304\\355\\271\\003#\\374\\346\\273\\222\\3455\\027\\263\\300b\\246d\\022\\002\\336\\331\\231/cG<4\\340d&\\365\\020\\272\\214\\307\\023\\336\\031\\014\\317\\001\\316\\306t\\237<x\\251\\033m\\202[u\\304U\\335^\\311\\264\\202"k\\262\\350\\210''ld\\363\\330,\\366\\261Q2\\363@d\\267(\\273E\\2126:8\\264h\\330\\031\\035\\202]\\267\\201vRo\\216\\347\\244\\032:\\267\\301N\\336\\353\\0311%\\344y\\237%c\\245\\261\\315z\\220K\\210\\240\\215\\274\\244\\222\\034\\222\\177\\225\\247\\033z\\376+\\267\\323\\232;\\224QW5\\2626,\\366\\204\\014\\007\\2029\\217\\241T\\215\\254\\2409\\\\)\\356c\\227RJ\\216dH:k5\\306\\256\\027\\232\\232\\371\\236\\301\\317\\016\\322\\007E\\344V{y\\233\\263\\223T\\222\\001\\222ZI\\352T\\335\\316\\273\\265\\375\\205\\033\\003#''\\014o,\\374ROu<\\024\\355\\212/\\274\\323\\222\\363\\357y\\222\\241\\354k\\003p\\317!\\337\\311\\202\\347\\251\\357+\\315\\247"I;\\007\\310\\306\\007\\020\\322\\323\\204\\342*Y\\203;J\\232\\371\\331\\0109# \\023\\363\\302~ \\306\\301\\343\\263$\\222\\334o\\272\\211\\273V\\207N!k\\273\\261\\363\\003q\\237%\\303\\217\\274\\005C\\317\\271\\235\\325K\\034I\\011\\347c\\255\\256\\232\\231\\216k\\263\\245\\2169\\325\\341\\276y\\246B{\\2431\\212\\262~G\\365]PT2\\2567\\3239\\332N\\316n\\177\\317\\202sK\\004\\360\\312\\347\\324\\030\\234\\033\\367\\003Nr|\\324-\\302\\275\\300\\223\\002\\200r"\\022V\\313E\\241\\2252KQP\\355\\3644\\220\\033\\365^\\334\\252\\236\\351a\\021\\275\\355k\\343\\327\\261\\370~\\252\\032Z\\347\\373T\\322\\006\\344\\023\\200O\\210\\012V\\206\\246\\226\\246\\2367L#\\023F4\\341\\356\\3067\\372\\241\\231\\227\\016\\331>`k\\300\\316#\\012\\272\\211\\251\\364>I^\\032F\\332\\2071\\350R\\224\\365]\\346\\324\\302\\342\\311\\033\\273%\\217g\\264\\371\\250\\236$\\255uM@\\021\\270\\0267\\304x\\237OD\\225\\005Of\\362\\320\\354\\347\\034\\274\\260\\025\\252\\224\\262\\206\\351\\022\\320\\000\\3476\\216\\027\\274\\013\\305\\270L\\374\\011\\230\\355\\022\\001\\310\\2371\\361\\012ag<\\0031\\206\\242\\2560q\\031\\322\\346\\216\\253C\\215\\332\\233\\225\\350\\364\\316^\\240[\\254\\302\\271B\\271\\002''QU\\005>\\216\\336F\\263Y\\303u\\036j\\023\\211`\\243\\222\\007T\\011#\\025-\\003\\0008\\022\\361\\360L\\376\\320\\273X(i\\253#\\004\\307\\023\\313d\\364\\325\\214\\036\\243\\0375P\\206\\352\\010\\346\\026~\\267XkcY\\\\\\211oK\\245\\336\\241\\303F\\\\@\\312\\211D\\014lO\\014k\\362\\347i\\333\\257\\202gEU{\\267\\310!\\267S\\3179\\226W\\276v\\016\\356\\226\\227\\035$\\345\\330\\362\\371+\\000\\257c\\332Z\\342\\010<\\301\\361]S\\324\\303\\010\\323\\023Z\\301\\344\\321\\205\\236\\272\\260\\007I\\177\\202yGt\\027\\333\\335<\\215t\\266\\311\\034\\0109\\322\\366\\237\\315yy\\275U\\3275\\270\\263T\\366\\254\\030k\\313\\233\\217\\305x. \\014j\\013\\266\\334=B\\206\\324+\\256\\306\\351\\027\\203\\206\\335\\216r\\000My\\224\\227:\\337)\\362;\\014}RUQ_$n\\250\\255\\362\\343\\313\\264fzeY=\\274g\\230\\\\>\\342\\354\\367]\\204\\253mj0\\007)\\330o\\361+\\002N(\\021\\0066\\3370\\034\\262\\347G\\220>9\\344\\221m\\005\\341\\216\\325%\\271\\356\\333''\\0220\\376j\\324\\353\\213\\210\\301+\\226\\325j\\316\\373%\\337P\\370\\254`\\316%b(n\\254p\\231\\266\\311\\3069\\020[\\221\\365KT^n\\002.\\316Z\\031\\23298\\266#\\223\\321X\\315`\\003\\031\\310Mf\\250k\\363\\220\\012V56\\011Y;\\230\\365\\225cw\\215\\273>\\232\\241\\276\\216\\205\\303\\361\\0119/\\324@f@@\\365j\\262\\272V\\015\\210\\307\\242I\\322\\267\\030\\015\\030\\365O\\305O\\037\\337\\3447\\031N\\256\\342\\0329[\\2462=7\\316Wv\\371\\331\\227T<\\220\\320\\315N\\317\\272\\000\\335X\\252\\243\\202fi\\222\\030\\236\\337\\335s\\001\\011\\241\\212\\236&\\273\\262\\245\\201\\245\\334\\361\\030\\031]V\\352\\372\\0053\\215\\241\\232Op=\\303\\267~\\2601\\253\\300-Z\\214\\227D\\017\\242\\307801\\227\\022\\310X\\030\\300~\\353y-\\216\\210b\\006\\374\\027\\242\\250\\202\\200\\201\\2010\\254\\0041\\006wSO\\025T\\022A<m\\222)\\032Z\\366;\\221\\007\\301e\\034Q\\301\\227\\013<\\217\\251\\265\\262J\\272\\022s\\245\\273\\311\\027\\241\\036#\\324|\\374\\326\\270\\274##t\\227\\351\\322\\341\\206\\217M\\357Q\\312\\317\\237"\\256\\365\\370\\247-\\255\\3339Z\\177\\024\\360\\235\\035\\314>v\\300\\326\\316w/h\\303\\217\\304\\216\\1775\\230]\\254u\\326\\331\\034;7=\\203\\307\\221YVzc\\017\\2179\\247_\\250!\\371r\\235{a\\316r\\273\\025\\307\\315A\\373X\\214\\351\\225\\257g\\3655(\\332\\250]\\312V\\037\\232\\250\\3326^\\242Z]B7C&\\233\\\\A\\346\\226mA;\\345@\\212\\246\\016n\\013\\257l\\003\\356\\274u\\\\\\316\\234\\370\\217\\304Y>''\\333r\\272l\\376EW\\215\\303\\036\\360\\352\\275\\027X\\300\\357H\\321\\363G\\267o\\020\\336\\262|\\316\\017\\212L\\313\\203\\315A\\233\\274\\037\\307\\217\\377\\000\\245\\303\\256\\360\\177\\024\\036\\251\\327L\\375\\204Cj\\016\\362p\\313\\216g)7N\\000P\\206\\361\\027\\273\\255\\337\\006\\024\\231\\270M)\\3044\\2628\\371\\273`\\272\\256\\216\\323\\366\\316M\\251\\250}\\322i\\325#\\012"\\252\\245\\315\\237LG[\\335\\311\\234\\360\\234Q\\332n\\367\\027\\200s\\023\\017\\203\\006\\375U\\343\\206x\\025\\221\\026\\276Ve\\307r\\\\9\\253\\364z~\\016^R\\273Z1\\204\\215x\\006\\3178\\221\\263J\\016\\247\\034\\223\\205\\254B\\335\\021\\265\\276I\\255\\276\\337\\015\\024a\\261\\264\\014\\004\\365i\\201\\201\\2013\\211\\314\\020\\204)\\204\\360\\214\\2465\\326\\270*\\332u\\260d\\247\\350D%\\036\\345\\301\\224\\362\\222Dc\\242\\202\\251\\3406\\034\\3421\\321j\\253\\222\\306\\236m\\010\\204\\305j\\270\\017\\031"?\\242\\213\\227\\202$i\\3323\\321oN\\246\\211\\334\\332\\022\\022[\\240>\\350\\350\\214I\\311\\2300\\340\\331\\001\\301\\217\\350\\225\\217\\203\\037\\3743\\321m\\306\\333O\\373\\243\\242\\350[\\240\\034\\232:"D\\306\\341\\340\\267\\0223\\031\\350\\244i\\270#$~\\317\\350\\265v\\320\\302\\006t\\216\\211fSF7\\000tD&sK\\301\\021\\214f1\\321K\\322p|\\014 \\230\\307Et\\021\\264rh]a\\020\\2214\\026Zz`0\\301\\262\\224c\\032\\306\\341\\240\\000\\272B!\\004!\\010\\204\\377\\331');
INSERT INTO foto_produto (cod_foto, cod_produto, foto) VALUES (5, 1, '\\377\\330\\377\\340\\000\\020JFIF\\000\\001\\001\\000\\000\\001\\000\\001\\000\\000\\377\\333\\000\\204\\000\\011\\006\\006\\024\\022\\021\\025\\023\\023\\024\\026\\025\\025\\025\\030\\030\\025\\030\\030\\030\\027\\027\\030\\027\\030\\027\\027\\024\\025\\024\\024\\025\\024\\030\\027\\034&\\036\\027\\031#\\032\\024\\024\\037/ #''),,,\\025\\036150*5&+,)\\001\\011\\012\\012\\016\\014\\016\\032\\017\\017\\032,%\\037$,,,,,,,,,,/*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,\\377\\300\\000\\021\\010\\000\\267\\001\\024\\003\\001"\\000\\002\\021\\001\\003\\021\\001\\377\\304\\000\\034\\000\\000\\002\\002\\003\\001\\001\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\004\\005\\003\\006\\000\\002\\007\\001\\010\\377\\304\\000;\\020\\000\\001\\003\\002\\005\\002\\004\\003\\006\\005\\004\\002\\003\\000\\000\\000\\001\\000\\002\\021\\003!\\004\\005\\0221A\\006Q\\023"aq\\201\\221\\2412B\\261\\301\\341\\360\\007\\024#R\\321\\025r\\262\\302b\\242\\026\\202\\361\\377\\304\\000\\032\\001\\000\\003\\001\\001\\001\\001\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\002\\003\\004\\001\\005\\000\\006\\377\\304\\000*\\021\\000\\002\\002\\002\\002\\002\\002\\001\\003\\004\\003\\000\\000\\000\\000\\000\\001\\002\\000\\003\\021!\\0221\\004A\\023"Qaq\\201#2\\221\\241\\0243\\261\\377\\332\\000\\014\\003\\001\\000\\002\\021\\003\\021\\000?\\000\\2457\\006e\\024\\312M\\265\\346\\024uq`nP\\307\\032\\301p\\276\\177\\014\\323\\262\\030\\306f\\234\\035I\\216N\\343U\\320\\353 \\362\\234s_\\270S\\212\\204>\\031\\311SXOFk\\023\\215\\313\\336W\\202\\015G\\3421@p\\203\\312)\\270S\\032\\267Zc1\\027\\2009K.\\312\\272\\234\\302\\271heG\\313IB\\345\\264\\203\\244\\366E_G\\301f_\\206\\015\\272\\326\\3730\\314\\021\\241\\032a\\316\\220\\205\\306\\000<\\304)\\215D\\026g^D-r\\002MQ\\270.a\\2372\\235\\0279\\304\\010\\013\\221\\343k\\014Ub\\371\\235\\343\\331:\\376&\\230c@;\\221e^\\351\\207\\010 \\330\\253<Z\\217\\307\\314\\235\\312j\\3001\\256\\037\\017\\245\\277ge\\3465\\372\\232\\006\\230\\365E\\177\\251\\026\\215\\016m\\273\\245\\370\\254p6\\033&\\231r\\3470\\032\\324\\357\\001\\037\\202a\\002\\352\\\\\\036ZH\\016*z\\356h\\362\\251\\235\\371}D~s\\250\\011\\306\\305H\\205=x7\\010\\0277\\315(\\272o\\220\\264\\350j0.$XJ\\265\\030\\351k\\210\\357\\331:\\302\\347fa\\377\\0004\\246\\210\\004\\243\\231\\205\\224\\247#\\334U\\265\\253w,M\\311\\305a-\\345\\\\\\262,\\274R\\244\\002\\3479Vpp\\365\\032\\327lL{.\\227\\207\\255\\255\\200\\205\\225\\375Ng''\\310\\014>\\247\\251\\255j=\\225_\\252(=\\254%\\275\\225\\305\\203\\272\\322\\266\\031\\257\\261\\022\\2341\\234\\311A\\304\\371\\344dX\\212\\265\\011\\320byV<\\277\\242+@\\225\\327\\233\\225\\323n\\315\\012:\\325\\003Q\\333y\\306\\343\\026\\306\\035J=.\\210.m\\326S\\350`\\323\\004\\225i\\257\\231F\\3103\\215s\\312\\215\\257\\030\\324j\\275\\237\\230\\271\\235\\012\\336\\350\\254\\037J5\\2059e\\012\\220\\010E\\012F''\\225\\271\\310\\352\\003X\\377\\000\\230;ii\\020\\026\\354\\256B\\321\\330\\270\\335L\\310r \\301\\264\\246 \\214w%eiR\\007(\\013an\\325\\241\\217F{\\037\\210\\257;\\036v\\377\\000\\267\\376\\316^-s\\247y\\307\\373\\177\\354\\345\\213\\263I\\034\\004\\320''\\013\\253V\\367*\\001\\215\\022\\2064\\\\\\355\\244\\255\\260\\331=G\\035\\241\\027\\024\\003f_\\227\\007BYr''\\352x\\013\\252\\345X*m\\000\\300\\236\\353\\233t\\256F\\3468\\022d\\256\\233B\\201\\014\\202\\270~C\\217\\220\\361\\207\\344\\034\\200#ZN\\007e\\273\\2516x\\225\\005\\032\\315\\246\\305^9\\263\\337WP\\220\\320\\224n\\300\\220\\212\\311:\\226\\227\\323S\\340\\260\\272\\214!0\\265\\2654\\024\\323\\011\\350\\2300O/P1\\352\\007\\213\\242\\030M\\366J\\206aM\\323''dgQ\\000\\326\\314\\334\\252],\\251\\317}\\211\\202\\222\\377\\000\\335\\200#\\221r2e\\003\\370\\205\\237\\012\\330\\255,\\273i\\237\\252M\\202\\307\\235V .\\205\\324?\\303\\246\\222\\\\\\321\\007rW:\\31527\\322q\\213\\200\\273\\276=\\2252\\204\\350\\314^k\\366\\033\\226\\352\\025\\303\\331\\366\\301#\\367\\360B\\206\\313\\300\\004*]:\\316o%Zr\\014@\\020I\\225\\227\\325\\300f[\\343\\335\\313R\\342\\321\\015hK3zBd"\\016*[<\\376\\366J\\037\\\\\\270\\335sV\\263\\234\\313+\\356E\\272\\236\\224\\240\\335R\\012\\366\\226 \\227\\001\\334\\247\\025&Q\\230\\337\\015\\203(\\262\\0137Ga\\\\\\306\\206\\335\\003\\236cDYHA-\\2119r\\306i\\203\\247\\343\\326\\023\\301]_/f\\232`v\\\\\\353\\244\\262\\355\\235\\312\\350\\330c\\345Z\\033/\\2019\\236I\\311\\220W\\305\\235P\\021\\364M\\2204\\250\\313\\344\\204]at+\\220\\013I\\216:\\203b\\261\\246ay\\374\\266\\260\\245}1\\272\\327\\371\\2009B\\006\\362\\346{\\366\\2013''\\271[\\323\\3005\\246J-\\270\\260T\\225\\334\\302\\303$\\004\\336\\025\\260\\372\\314\\344\\303\\271\\035,\\311\\277d-1\\016t\\240pYs\\034u\\265\\323\\361OLh\\035\\376\\250kWpCMl\\016\\242j\\330B\\353\\251\\260\\255\\204p\\177\\242\\203M\\326\\3748\\330\\203\\313\\324\\332\\240\\225\\031a\\010\\\\v 0I0\\240\\313\\372\\256\\215S\\240;\\315\\264&)Rp\\3238\\2662 \\271\\305O8\\377\\000o\\375\\234\\261k\\235\\201\\342\\010?w\\376\\316^\\256\\235@\\360\\023D\\347Xl\\236\\341\\255\\010\\247ee\\216\\002\\025\\317!\\311!\\246\\243\\205\\335\\267\\240F\\214\\261\\256t\\2211e\\306gc\\356]\\363\\340\\30596LA\\016V\\241G\\313d6\\012\\263K\\213\\006\\355\\3410\\2404\\330\\240P\\007\\363''v,`\\207\\011\\251\\260R\\\\.\\000\\232\\216\\021iV\\321\\010\\\\V2\\225>@\\224MRh\\346\\012\\271\\032\\221@\\247N\\020\\3251\\357k57\\344\\207\\307T5\\034\\003J3\\026i\\350`k`\\201\\016=\\317?\\277U\\241\\325\\301\\036\\2040\\230\\331\\212\\363\\032\\316\\250\\326\\271\\334\\360\\241\\301\\2077\\354\\246\\030\\2062Z\\006\\301\\037G\\010\\326\\020\\\\ \\025\\251H-\\250l\\330\\\\b\\003W\\3044\\314\\266\\306\\323\\026\\371\\252\\276a\\322\\241\\367];\\023Y\\256ci\\002\\003{\\375\\177\\024\\207\\023K@.$\\026\\312\\256\\332B\\234\\203\\002\\267#\\2419\\245n\\213i1\\001T\\363\\\\\\003\\260\\357!\\240\\220;.\\277^\\250;%X\\214\\262\\233\\346E\\312]w\\224;\\330\\225\\002\\177i\\313\\362\\334\\374\\352\\015"\\023Z\\330\\366L\\022?}\\323<wFA.\\015\\201\\336\\022\\232\\035\\021V\\243\\211a\\260V\\013i\\177\\322,\\265\\2123\\234\\3001\\030\\240\\026\\230lD\\225\\276c\\322\\230\\206\\033\\211\\2045\\032.h\\202\\323\\352\\235\\204#F\\022\\371.N\\304j\\334\\333O(\\254\\262\\205L[\\274\\277d\\\\\\224\\222\\255\\002\\362\\003Z\\257\\0357@\\320\\240t\\375\\242\\244\\273\\343\\250g\\3343k6\\2043,\\315\\333\\207:\\014\\230\\261)\\375\\016\\274\\242\\327\\351y!T+S\\324\\302\\362o\\310I\\261\\016$\\355u2R\\247\\3551\\253\\344gX\\251\\326\\370h\\220\\351=\\202\\335\\275N\\327\\213\\005\\311\\031\\206\\177d\\327.s\\232\\346\\227I\\037\\252i\\000{\\213>(\\306D\\276b:\\204\\003\\004\\020\\226\\342s\\321\\301K\\361\\231\\214\\202\\034\\333\\213\\005]\\3042\\244\\330\\356\\220i\\251\\214\\332\\351or|\\343\\252q\\015|4\\300A\\214\\367\\021[\\312^L\\220-\\353e\\025l\\023\\246\\367]\\017\\370w\\321L\\001\\270\\232\\242I\\273G\\000pc\\272\\245B(\\302\\210v*V\\274\\214\\003\\246\\361\\2250n\\321Y\\247I;r=}\\225\\356\\226$<\\0076\\340\\245\\375{\\226\\264\\323\\025Z\\337\\352\\002\\032=\\246\\352\\273\\221g\\276\\014\\261\\363s"}\\266I\\261\\270\\034\\011''\\037\\225y\\373\\227\\232\\314 \\301\\0127QQ\\263\\035\\251\\241\\323?\\341IR\\257\\226F\\350\\303\\003\\261''\\343\\210\\237?\\311\\374jdI\\225\\312\\361yuJ\\025A\\026\\276\\353\\253\\342s\\2354\\334\\362#H&\\376\\201q|\\337\\257]\\211\\020\\346\\206\\020x\\344wER\\0336\\237\\314\\252\\213\\015zn\\243\\246\\346d\\201\\251\\316$Zg\\325bE\\203\\315\\006\\236?`,]:\\352`\\240bPx\\347S\\272\\212.\\321a\\023`\\274\\360\\2647\\325\\021H\\030\\022V\\325\\031;\\360\\270X\\310\\310\\234\\374\\342V0Y]Fb<^\\011\\270V7Qq\\346\\313\\306\\357\\350\\213\\246\\200W\\350\\306\\0333\\270.-\\332XaV\\261-/\\213\\022B\\266\\327\\243 \\204-G\\323`\\223\\001\\005\\225\\375\\263\\235MG\\213\\006\\013\\311<\\255ib\\015\\330@\\260\\231)f+\\251\\013\\253\\265\\255\\373\\023\\011\\3767*5\\033-\\334\\204(\\203\\260#\\301#\\001\\245C2\\352''l\\005\\201\\335\\037\\200\\307W\\304\\021{4{Y+\\3160\\006\\211\\363\\213\\002\\205\\304\\365t\\267E0X\\321bF\\347\\321>\\265\\317R\\347*\\024q\\037\\314u\\210\\352hv\\217\\265\\304z\\213(s\\016\\2524)\\226\\270Iu\\2426\\237\\301Ujg"\\233C\\300\\276\\250\\004\\360E\\356\\203\\245\\324\\2366\\277\\020ky2\\017\\346\\253\\012\\304f+\\200''\\255K\\373j\\325\\360\\205]\\014k\\000''\\314L\\273I\\001\\332@\\022cPQ3\\250\\351X\\272\\236\\366\\265\\325^\\2566\\243\\354\\013\\201\\321\\036\\233\\311\\023\\331C\\206\\307\\276\\203\\203\\213d\\213\\301\\000\\337\\321+Z\\002\\022\\370\\341\\201''\\271\\177\\377\\000U\\243Y\\245\\242#c\\034"2|\\033i\\203\\004\\020yT\\352X\\332u\\204\\275\\302\\201\\320`\\206\\333T\\310\\016\\216\\373J7+\\244j=\\224\\350\\327c\\334a\\245\\244\\226\\273Q\\346v#\\374-\\000\\261\\317q\\015\\343}\\177\\022\\323\\232\\340\\231\\3418\\300&\\0271\\253\\204\\363\\033r\\257t3h.\\241W\\312\\360Kt\\233\\031\\002y\\364\\277\\262Y\\216\\302\\206\\211\\323\\0230}61\\335&\\307*`\\320\\245N\\014\\2563\\012"D&Y^\\015\\305j\\3061\\264\\337\\250\\265\\214\\032\\234\\327\\311\\227<\\006\\217\\015\\242\\014\\222D\\305\\276\\321\\270\\020\\237t\\365v\\306\\223\\270\\2306\\207\\000H%\\260Oo\\303\\272\\306B\\303\\364\\207c\\025\\211_\\227\\226<\\227\\211n\\343\\325J\\346\\322u\\364\\206\\201\\364V\\312\\355k\\201\\005\\263eMst8\\264\\217\\275ng\\340\\207${\\233S|\\235\\367\\016\\312\\235@\\317\\211 w\\015''\\332\\026f\\231K\\230e\\242\\304\\330H${\\302\\223\\015R\\223$\\325\\230\\354\\017\\264\\013(\\263\\014Ki\\227\\026\\322v\\247\\015{\\026\\371v\\227\\270\\233\\010\\213\\233AN\\037a\\365\\031\\233\\2144\\004aH2o\\360\\375\\312j\\332\\3544\\364\\370M\\367\\201>\\303\\223t\\212\\216r\\353:\\243Ci\\220\\340\\015\\301\\326\\003\\213E\\370\\362\\336R\\354\\006y\\342=\\355q\\322\\003Im\\247\\315\\367ZH\\213\\036\\374-\\370\\355\\354F\\224\\015\\330\\217\\274\\032d\\371\\232G\\243N\\376\\246U\\237\\011\\325\\245\\254\\320\\326\\201\\036Q\\350E\\242\\0279\\306\\346\\220\\343\\240\\310\\027\\271\\2117''H)s:\\206\\253j\\265\\343kX\\231\\006,f/r\\021\\327U\\235\\2031\\350\\016''S\\317z\\202\\250\\206=\\200\\264\\363=\\277;\\245?\\316Pp\\007\\371y\\251`u:\\304\\001$\\210?k\\325V\\260\\371\\341\\253W\\304\\251R\\376ik[\\2444\\307\\227I\\333{\\354\\240\\253\\233V\\322\\362\\017\\230\\274\\035v\\260\\345\\273\\\\\\037TE\\0338\\314R\\321\\201\\214ntZ9\\3650\\322\\306\\015/\\334r\\006\\310\\234.t\\323g\\030?%\\317\\260u\\346\\221w\\231\\316\\020d\\010\\357h\\355\\262\\203\\033\\232\\275\\215\\000\\207x\\206e\\256\\221\\002\\001i\\333\\261\\375\\332@\\006:\\213o\\024t%\\327\\250q4\\353R\\251E\\257n\\242"\\307\\352;\\217e\\3121=\\023Q\\263\\004\\024\\363#\\254\\367\\342)\\200\\322Ip\\026\\341\\246\\316\\343\\261]1\\2359L\\357(\\325\\355\\250\\341"\\335R\\2554\\342X|\\226\\243\\004\\021\\317\\370X\\272\\346k\\220Rk\\200\\003\\356\\317\\325\\313\\027b\\253\\254(\\011\\304\\037\\225?\\022\\351G@\\215DDI\\036\\333\\017\\212\\212\\274\\273i\\003}\\267\\274E\\370A\\214^\\220H\\260"\\016\\333%\\330\\216\\246\\236\\347\\334\\374W\\021\\255\\255W\\006N\\250\\314u\\032Vk\\214\\351\\261;z\\005.\\025\\3046\\035r\\252\\325\\372\\264\\215\\232>h\\234\\267\\251|C\\004\\000T\\305\\353\\345\\310\\3464T\\370\\226\\266\\327\\034\\213r\\222\\346\\331`\\250\\350\\222\\003\\204\\307\\242\\237\\371\\350\\023\\026^71\\006\\360\\262\\333Q\\200\\006b\\206\\033\\020L\\037M\\321`\\026\\222\\021\\270\\254c\\301\\001\\260\\032\\027\\217\\306\\000&\\020/\\314\\303\\235\\244\\004\\017`\\013\\365\\206\\271''{\\203u\\033|JW\\022\\345\\313\\352\\345\\317k\\234Z\\370:\\246\\377\\000E\\326(\\322\\324I*\\231\\234e\\300Vq\\341z\\233\\212\\357\\363+\\251\\261\\365\\224\\363\\223>\\243\\214\\274\\013\\311\\365\\356SL>WN\\225\\332%\\335\\323/\\000\\016\\026\\205\\201=\\274\\206}gQ\\342\\012\\354A\\010Z\\244\\223r\\216\\252\\002\\016\\262\\324"0\\0305j\\204\\010\\341E\\201w\\233\\313:\\215\\204\\022\\010t\\210"\\027\\265J+\\247\\362\\275u\\015G\\011c \\305\\356I\\216/\\310\\333\\272\\250\\020\\252I\\214\\016F\\204\\277\\370n\\327\\342V{\\237X\\206\\207=\\333\\330\\010\\370~\\212<S\\336Z\\032E\\207\\240\\230=\\214LX~\\312\\325\\364\\214\\015 h\\015c\\233wA.\\014\\226\\267rL\\226\\204[jU\\215;\\310\\322\\005\\246\\011\\324\\320y\\237( p\\271\\326+\\022KfM\\307\\033\\211\\251Rc\\\\\\005ZD\\323''~[\\334\\216\\346''\\366\\022\\374M''\\261\\315v\\030\\035A\\344\\210\\233la\\300\\371H>a\\003\\205a4\\034\\367y\\211\\0334\\023b,|\\240Lq\\315\\205\\246\\027\\256\\306\\200\\337\\014\\264\\260\\300\\006%\\267\\024\\334.9.\\324A\\236\\303\\325\\025Vq\\357\\251\\2543\\035`\\361b\\265\\026\\324\\210$]\\267\\362\\270Y\\355\\277c!Ws\\252\\000<8qtP\\301\\274\\006\\272\\231\\360\\303\\215\\345\\355\\207\\2225\\227\\020\\351\\344\\221$\\334\\220&\\311Vc\\213$\\370u\\201c\\306\\220_\\263e\\377\\000`\\026\\233\\211\\364\\267\\262m\\212X}d\\250\\234\\033"+\\314\\361\\357 \\000\\340\\033q\\003\\324\\0011\\306\\312\\277\\217\\361*oP\\306\\320\\\\H\\003\\270\\0374\\3072\\302\\324c\\274\\312''\\341-)\\225?\\0000e\\300\\2021\\211\\035z\\256}6\\323\\326CZC\\243\\273\\200\\323&x\\202W\\255\\3037\\343\\335mW\\002bVa\\360\\350\\213\\344w<0\\275A\\252`N\\372\\201\\364&=\\357\\302\\314\\260\\007\\222\\035E\\315\\323\\313\\214\\337\\230Aft\\313j\\021\\267*L.)\\315\\333n\\311\\374IN\\342\\213\\234\\307\\224\\362\\246\\000`\\010\\371\\376+\\177\\004]\\245\\263\\267\\026\\367\\005\\025\\222i\\257\\001\\273\\3629O1\\2354\\372l\\326.;r\\271\\245\\333$\\034\\301k\\000=\\312\\226]\\231RuM\\024\\337\\346\\035\\247\\216\\307\\224\\336\\236Jj\\270\\324$\\023i.7<Cg\\362KX\\032\\312\\344\\262\\223A\\373%\\321\\004\\211\\223\\267\\252}\\205\\314\\364\\334\\200\\021X\\330?\\\\\\340\\210\\005\\237\\033\\356X2\\014\\237D:-?\\220VV\\263\\237\\360\\220d\\231\\276\\2737I\\356%\\031\\230\\346\\242\\203C\\234\\346\\215N\\206\\203\\360\\266\\376\\353j\\260cY\\220X\\254[r<\\355\\236v\\377\\000\\264\\177\\311\\313\\024\\031\\225r\\342\\327H\\273\\007\\374\\234\\261v\\251\\264\\024\\0208\\312\\225n\\260c\\201\\001\\307\\344R\\274GR6!\\263>\\310\\017\\364\\352\\236\\203\\275\\345N\\314\\242.\\347\\005\\3105\\3247:b\\240=\\304G\\031]\\365\\\\\\355E\\255\\340z''\\331noQ\\244\\023\\307m\\367\\345lh\\323l\\021\\177o\\315{\\374\\360v\\302>\\0012\\307\\0160\\026\\032T\\004\\351Y>kO\\021J\\306mp\\262\\236\\033I\\217U\\317\\351ff\\231.\\246t\\023\\375\\277\\252#\\003\\325\\365\\230@>q\\377\\000\\225\\315\\314\\356\\247d\\016:\\352$\\370\\257\\223\\306tJt\\244\\302aV\\230sC\\003\\0001\\277\\262Q\\323\\371\\245:\\362Xv\\002A\\334\\023\\301Ef\\265\\213`\\013,\\000WYc#`y\\3610W\\035 \\252\\326<\\207\\223\\005A\\324\\231\\273\\332\\010\\026Bt\\247NW\\256\\317\\037\\305\\015k\\211\\322\\010\\231\\203\\004\\372]!+,\\274\\263)\\030M\\2305v8\\035\\254\\227\\342\\261E\\274.\\215\\201\\351\\207j\\006\\246\\222\\321\\332o\\357\\3313\\377\\000\\342\\024\\035\\2759\\237R\\235R\\261=M7\\252\\316H\\3279\\301A\\341^\\012\\353X\\376\\222\\3025\\262\\371\\246$\\001\\247Q$\\236\\000\\203''t\\216\\247O`[[I\\254^\\336`l=M\\217\\3018\\206N\\377\\000\\3665/\\015\\320?\\342S0\\031#\\253=\\266\\362\\202&\\304\\315\\366\\000o\\352\\254\\264\\360#\\306u\\032L''\\303\\230k[\\007S\\010i=\\334>\\364\\0102M\\200\\012L\\\\0\\270S0\\330\\362\\333i\\007U\\270\\336\\022\\267R;\\301\\357q\\271\\235\\244\\334\\231\\374\\322\\376N]\\313\\253L\\214\\306''\\026\\013\\245\\304\\274\\222\\330thx\\0150\\320\\003\\014X\\211\\3748Sf\\015sk\\307\\206\\346\\300\\210%\\277j\\0049\\356\\003N\\344\\0028\\210\\335(uB\\321:\\265Ljii\\200\\016\\256H\\365&\\333\\311\\365\\000\\352x\\242\\032\\320\\347]\\260\\346\\371\\217\\224\\2074\\235S \\371Z#\\377\\000\\254\\3727Da\\246\\025\\336Df\\347\\260\\323ps\\211h\\002.%\\332\\200-\\221q\\021\\250~\\341kT\\007\\264\\210&Z\\032\\010 \\202C\\201\\004\\352\\270\\337\\216>2\\204S5j\\220\\321w\\021\\000\\030\\334\\216\\373\\374\\023Z4*\\272\\373i\\322\\330s\\254b\\301\\202M\\354\\355\\207\\027J\\341\\370\\020Z\\260\\273\\314\\232\\216\\025\\315sZgK\\204\\020\\307\\007\\023\\016\\322I\\201\\345\\370\\374\\370\\001c:}\\245\\314\\237\\261P\\226\\227\\022\\323\\016\\356"\\360%\\247\\374JoM\\201\\332Z\\3467T\\211%\\320\\017p\\355\\267\\2670-\\352\\260\\265\\255hl\\200\\014k\\2012A\\033:&\\014j\\355>\\313\\007\\326 \\261\\314W\\235\\345f\\231,\\256\\014\\037\\263P\\011c\\255b\\010\\330\\242\\360\\035*\\332\\264\\233\\020\\340F\\373\\203\\373#\\350\\254\\231fk\\342\\2071\\2449\\214\\260p\\356,\\014q\\262[O2\\251F\\265G1\\215u7\\020^\\322C|\\333>\\243,`XM\\242O\\011\\237\\025gjO\\355&\\371\\034\\375}\\305x\\236\\230!\\244BM\\377\\000\\307*\\012\\215 [\\225\\320\\260Y\\275\\014K?\\246\\3574Ia\\263\\3330.>;\\354\\232\\321\\311\\265m\\026@\\264\\266p\\206g\\316\\313\\375\\302p^\\276\\310\\236\\307R{m \\217\\221\\375R=$.\\353\\326=&\\334M0\\323\\345{\\011\\322}H\\274\\372YS\\360\\235\\002\\326\\237\\352\\022\\343\\362\\012\\305\\273\\343@\\215\\352\\002\\260;\\225^\\235\\240\\372uYZcI\\230\\3569\\007\\321v\\377\\000\\014T\\247\\260!\\303\\361\\026T\\366\\3444\\233\\304\\253\\236Y@\\012L\\003`\\321\\037%0\\264\\330\\363-\\306\\001\\022\\231\\225\\341\\251Tq\\006\\011\\004\\2029\\220n/\\312\\333?\\350`\\340\\037JN\\222\\035\\247i#\\267\\255\\366\\345\\\\\\031\\323\\324\\213\\365\\370l\\324I3\\027\\231\\231''\\277\\252h\\312\\001\\266\\015\\004\\375?TUPw\\237\\363\\024\\326\\234\\344No\\227\\364\\256!\\204=\\243Im\\367\\372\\030N1\\031_\\363\\214\\251B\\263@ht\\265\\302d\\200\\032\\340f\\321\\006G\\301[\\236\\367A\\203\\002\\300\\307\\350\\2240\\303\\242\\327\\332v\\224,\\253K\\014\\023\\271\\346r\\375\\312\\266e\\205\\251M\\301\\215\\202\\326\\266\\033;\\304\\230\\013\\023\\334\\366\\220s\\332\\177\\360\\035\\377\\000\\271\\337\\242\\305\\326\\253\\306\\034\\006\\014\\036fq\\307b\\336w%GX9\\3605@\\027\\334\\215\\270\\266\\344\\252\\265\\\\\\316\\243\\276\\364{Yl3J\\215i\\034\\236o#\\331`\\361\\010\\374N\\203y\\325\\372Yn\\360\\277{\\376\\001MN\\211\\341T\\251u\\035A\\032\\274\\337O\\232:\\226|\\362\\335@8\\221wi\\330\\017S\\363\\371$7\\213lj\\371u0\\226zxGz|{\\257\\006\\034\\372%XN\\247\\003\\315\\000\\233\\202\\017\\006#\\235\\367\\371\\205\\270\\316\\300\\033\\023\\355\\034\\251M6\\217R\\205p\\303"=\\311\\363Z\\330J\\241\\364\\317y\\006\\355p\\213\\203\\3630\\255y/S\\1777XS\\250\\032\\302v2c\\223\\006v\\267>\\213\\231U\\315\\352F\\246\\265\\332\\177\\332H\\333\\270\\020\\241\\306u\\001k`\\200dOm\\244\\011\\007s\\376Q\\377\\000\\307w\\001LM\\242\\266\\004\\236\\377\\0003\\255fY\\0131\\032\\232\\327\\264\\220H:H0A\\2030\\211\\311\\350\\263\\001@1\\357\\362\\202n{\\2230\\027.\\350\\352x\\232\\365\\251\\324\\24241\\207\\317Rbo.l}\\351\\026\\201k\\211\\356\\274\\376"\\3468\\267U.\\254\\307S`?\\323\\034@\\264\\332\\304\\372\\240\\036.,\\370\\303~\\262.!\\275\\352vJ\\235[B\\233A\\007\\304\\237\\272\\336\\337\\371\\036\\025[4\\353\\212\\316x\\360\\334Z\\330\\331\\233\\334rH\\223\\013\\232d\\271\\373\\313t\\227\\030\\200"f#o\\231Oh\\260\\276CXI\\002c\\320}\\021\\275l\\207\\006UE\\025\\343\\221\\2143n\\241\\253P7[\\315\\266\\022e\\244\\022\\011oo\\320"\\372z\\231\\250\\035y\\2171\\357\\352}vU\\2672\\\\I\\343\\267~\\307\\353\\362M\\262\\214ki4;U\\311\\273H \\021<\\231\\275\\342\\3116("Z\\310\\0250\\262\\314(\\202 \\217M\\257e%,(c\\203\\203\\032\\342$\\337U\\355\\015\\324\\001\\211\\027\\270\\275\\373\\2410\\031\\303]g\\030\\277y\\002w\\217\\204|\\223\\206\\323\\004KH r>\\237\\037\\360\\246\\012T\\344I\\031\\212\\350\\312\\3163\\002\\3478\\227\\0029#\\322\\344\\013\\2316\\344\\367A:\\221\\002!\\\\\\237\\206\\325h7\\334\\317\\261\\023\\362C\\326\\310\\201\\323\\244\\300\\004\\330\\355r&\\377\\000\\004\\314\\347q\\251\\344\\001\\243+x|!&\\302n\\006\\323<\\010\\221\\3354\\251H\\266\\231d9\\244\\221\\315\\211"\\014\\266`\\230\\2367<"\\177\\3234\\001\\336\\373\\355\\350eh\\352\\006\\367\\022\\010\\3367$\\334|\\267E\\223\\013\\230=MY\\251\\255\\003p/\\036\\340\\\\}\\021t\\253\\313ck\\362=\\371\\346\\350zA\\300\\226\\222\\327\\010$:\\360b\\376R}\\270\\203u\\266\\034\\276ZX\\366\\200\\034\\030\\342\\375\\200w\\232"\\346=cr\\260.b\\335s,\\031\\005M/}\\233/\\023\\021\\000yx\\003\\215\\324Tp-\\361\\034\\013I$\\330\\237+w\\235@\\213\\221\\350\\024\\030,\\306\\231qk\\356@\\200@\\337\\200\\016\\333sn>fcsf\\3246\\022\\326\\230\\000n\\006\\322Dm\\261G\\220\\252\\011=\\031\\021V\\014u\\025g\\331q\\201P\\230sIp,\\032\\010\\230\\213\\267\\202\\005\\243\\200\\025\\323)\\016e\\032z\\337\\255\\341\\215\\227\\377\\000q\\213\\225_{Z\\357)\\203\\000O\\342\\023\\234%mT\\232 \\021\\032Oh\\022\\337\\311\\002^K\\230\\017\\260\\026M\\230\\336I\\367UL\\351\\256.\\206;M\\225\\302\\263A\\026\\355\\011\\020\\311N\\275o2-\\015\\340{\\367Ep,bW[\\224\\323\\3228\\212\\307W\\363\\025\\032\\014\\336m\\034\\300]\\003*\\302\\370ti\\262K\\264\\2646N\\346\\004J\\322\\265f\\261\\267\\217O\\321O\\227\\326\\325L\\035\\267\\374W\\252a\\314.g\\235\\213\\014\\230S\\036I2M\\255\\377\\000\\342"\\243@\\027?\\001\\371\\2248\\255o\\334\\237@\\203\\306\\311\\033\\300\\364Okx\\003\\354\\300\\013\\2313\\261-s\\264\\210\\356c\\267\\272\\253\\3656*\\265:\\200Sk|\\337d\\334\\231\\02128O\\262\\332V.\\357o\\222\\237\\031J \\237\\363\\364Sa\\255\\257\\223B\\004+J\\356gX\\270\\260\\233\\022\\301#\\327S\\245b\\007;\\306\\305Kv\\343o\\264\\345\\213\\243G\\221\\212\\300\\236\\3418uN\\236{w\\372]Z\\260]*\\315 \\2371"\\346\\177\\307\\012\\376\\336\\201\\246L\\222Jm\\202\\351Zl\\021\\004\\373\\376\\212[\\274\\253\\254\\000\\015J\\025\\251N\\247.\\251\\374?mGyN\\231\\342$#\\250\\377\\000\\007\\034\\341j\\304O\\020B\\353\\030l\\231\\215\\331\\2414\\241\\206\\003\\200\\266\\253/:-\\020\\366/\\2419&]\\374\\027\\320\\360\\\\\\362\\341\\332`\\037\\242\\276`:R\\2350\\007\\204\\313G\\015V\\252\\014\\203;{,{\\240\\363\\362Nd\\310\\344\\354L\\037\\225\\210\\300\\213\\251`\\300\\021\\021\\354\\274\\253\\223Px\\376\\245\\006<\\367-i1\\361\\0051mV\\235\\243\\360YR\\237\\242\\360\\343\\332\\340\\300\\337\\270\\262\\237O\\320\\020\\030\\335\\021\\375\\255\\260\\366\\015\\331W\\272\\257\\246\\031\\210\\242\\346\\324\\032\\230\\322<\\303v\\236=\\225\\357\\011X4A\\267\\252\\017:m6\\267\\315\\263\\210\\036\\204\\356\\026]J\\012\\376@@?\\247\\346\\0221\\316''\\314Y\\357O\\277\\013[H\\235''\\354\\236\\341:\\311:\\203K@\\250f\\304\\013\\\\v\\236\\362U\\363>\\313\\033SSH\\221x<\\373\\256_\\234\\345\\006\\203\\343q\\301K\\361\\374\\241\\344\\016\\017\\330\\377\\000s\\263XV\\\\FN\\251\\250\\333\\223\\307\\322\\024\\314\\240\\343n\\322}\\220X:\\243@\\322\\360L\\216\\341\\315#\\267\\247\\252;\\016\\362\\342''f\\361=\\356Q\\262\\361\\324\\250\\035jIA\\345\\251\\316_\\234Te\\204\\201\\037\\003;\\204\\2543\\211\\260\\272\\236\\255Y \\306\\300\\010\\026\\230\\374\\322\\212\\203\\001\\267\\334\\265\\340\\272\\210X\\033s\\351>\\311\\275\\032\\372\\200\\274\\376\\370\\\\\\340\\342\\375\\023\\254\\2370{@q\\263L\\304\\375\\370 83\\274j\\005+\\211\\022k(\\326D\\2710\\316\\377\\000\\205\\226\\177,\\300\\014\\001q\\020v\\211\\233v2\\241\\303b\\332\\366\\352\\324''\\262#\\017V\\340\\020\\267\\243"$\\254O\\214\\3008\\272\\305\\240LI\\264O\\336>\\211{)\\235\\234}''x\\215\\240\\013;m\\375U\\323\\035\\226\\203\\004\\011\\004_\\220\\022\\307t\\313\\236\\302\\346\\215\\246\\335\\326\\265l\\016\\204}~R\\221\\271Y\\247\\204u\\314\\373\\224\\357/\\3054\\371\\3113\\032x\\201\\000\\230\\213v\\335cpE\\204j\\201"Kf\\355?\\330\\357P\\241\\304\\324\\271t\\000\\015\\377\\000aL\\357\\303\\276\\343\\213\\207\\020\\214Fc\\244\\027\\000''\\217^\\311\\247Gb\\365\\322s\\016\\354?G\\022\\357\\307R\\247\\324\\300U\\256dy[\\301\\346;\\307uk\\351\\254\\273\\3003{\\200\\011''~\\323\\373\\345OQ\\342\\300\\2315\\200bZi\\320\\220R|\\353\\022X\\340\\000\\235B\\337\\002\\235Rw\\325\\013\\230`\\365\\026\\237\\355\\237\\221]\\033\\323\\222a{\\222)\\301\\334\\255\\345\\264M\\177\\352:t\\311\\002dL\\0301?vG\\305;\\301\\220\\011o\\311{V\\240h\\364AR\\304\\371\\301\\365Qeha\\216\\375\\303\\333\\210\\345\\240J\\0271\\244]\\014o&\\347\\323\\374\\242CI\\0226\\013jL\\324\\357\\301t\\254^C\\000w\\022\\247\\023\\\\.\\0345\\226\\373\\275\\342\\35168:\\243\\210\\373\\274\\372\\376\\211\\326&\\257\\033{nP\\241\\220, ~\\376iw( V\\275\\016\\346\\217\\311\\225,\\353\\011\\347\\037\\355\\037\\362r\\361m\\324X\\366\\370\\242\\014\\303c\\377\\000g,UR\\020 \\207\\271k\\245LE\\302\\207\\032\\010o\\226\\305o_\\030\\312m\\324\\367\\000>\\247\\330*\\375\\\\\\374\\324w\\366\\267\\201\\314z\\256w\\221j\\252\\343\\334\\024BNa41U\\232I.\\236\\302\\0022\\207Q\\026\\375\\240\\010H\\261\\271\\363[\\344o\\231\\307\\267\\036\\351\\266S\\226\\023\\017\\251\\276\\360\\243\\253\\346,\\005d\\3070P2\\3025\\247\\324\\014&\\315t&\\324+\\007\\211\\213|\\212_\\245\\263`\\002\\235\\265\\240n\\272\\265\\273\\327\\236m\\237\\342O\\243\\320\\223\\327\\313\\332\\341#~\\373\\024\\271\\324\\2520\\332m\\362E\\214`\\345J\\342\\034\\022\\354Z\\356\\332h\\376\\220\\306W\\2705\\014F\\241\\352\\263\\021KT\\003\\267\\256\\310G1\\324\\336\\015\\264\\363\\335\\034\\341\\251\\222/\\331\\025,lB\\2566&0\\342r"\\274F\\\\\\310\\211\\021\\177\\273''\\216\\352\\225\\324\\231\\033\\036\\013H\\221\\301\\210*\\372\\3743\\264\\3113\\354\\223f8v\\236>\\277\\242\\232\\372\\312\\340\\201\\203\\037M\\230=\\316C\\210\\351\\377\\000\\010\\222\\327Cv1\\274%\\265\\361O\\246a\\343\\355\\035\\327G\\314p\\215$\\300\\371\\304\\374UO\\2522\\200h\\352i:\\232l\\336#\\224\\377\\000\\033\\311\\346\\334l\\2351gDA\\360\\365\\273\\314\\035\\257\\370\\242^A\\205N\\245\\215s\\\\\\001&\\334\\024\\333\\015\\233\\007X\\330\\253\\236\\222:\\214\\017\\230\\342\\256\\034\\304\\302\\223\\011X\\266-=\\246\\340N\\366B\\341\\261Qc$r\\217\\306\\271\\226\\360\\201kcr~i\\004M\\347\\350\\311\\260\\371\\236\\230\\325?\\003\\011\\216\\017\\251^L\\013\\3760\\220\\322\\247H\\260\\227\\324\\2026\\0015\\351\\372L:\\213A \\015\\322\\215\\177\\210\\273\\032\\274\\022D\\275`s"\\346\\002\\034\\234a3\\020\\303.&!s\\354\\2672\\005\\32080\\237\\263\\034\\347Uk\\003e\\272I''\\326`\\001\\365Jk\\032\\257\\336s\\036\\221''\\314Y\\255\\356\\250v\\231\\371l\\253x\\372\\316s\\303\\005\\200\\211''\\237Ek\\3076@h\\347\\177`\\222fy#\\352\\271\\201\\217\\014\\015''Q\\211&b\\000\\372\\250\\312\\222\\320\\326\\314\\015\\302)c\\005\\030k\\375\\014\\215\\225\\257\\007\\207\\226\\016\\356\\023#{\\354\\253\\370\\\\\\217\\305}6\\270\\227h\\334\\230\\222\\005\\340\\307\\255\\225\\312\\2751L|\\025\\025Pv\\307\\241\\022\\316\\017]\\314kl\\266\\252l\\243\\303U\\324\\331\\365+j\\244\\332\\326\\345X\\017*\\371\\010\\243\\243\\211\\241h(,N\\\\\\303x\\203\\351o\\321\\025\\374\\270\\231j\\207\\020\\327\\0016!L\\304\\225\\373\\254/z3\\032LZvG\\014L4\\231\\364\\036\\235\\3249~\\243%\\260<\\267\\225\\006*\\203\\364j\\034\\376\\341X\\205\\226\\260\\353\\223\\027\\357\\006c\\237\\016\\223\\362\\347\\337\\321\\005\\213\\304\\027\\015#e\\266\\031\\244\\215N\\021\\350w\\366\\367\\272\\027\\025\\211\\320\\322\\345\\0331\\343\\370\\0060\\015\\304\\371\\2750\\034\\337(\\036A\\370\\272\\353\\324\\2736\\314\\013\\236\\010v\\355\\034mse\\213\\255A\\037\\030\\236(c\\314\\377\\000 \\326\\340\\366\\022N\\304O\\371\\331\\007C\\243j\\274]\\341\\203\\320I\\374\\200V\\241\\211o$|T\\202\\273Oo\\201\\\\\\257\\370\\365\\263d\\237\\342`\\265\\200\\300\\225\\374\\267\\242iPpqs\\236\\341\\336#\\344\\023\\352\\365 X/t\\257*\\260\\020\\251\\341\\305O\\030\\226\\263\\223n\\015\\211\\254\\032\\331%T\\363\\016\\251\\247''Iq\\370+N#\\006^!\\007\\227tU&\\324\\361\\0365\\021p\\336=\\317u\\315ek[\\004jV\\205\\027f+\\310\\351\\342k\\031\\001\\354\\247\\274\\270\\304\\373\\005n\\301Pu1\\01637E9\\341\\242\\366J\\033\\236\\027\\326\\014e7\\020\\015\\335\\300[\\361\\327I\\033\\334\\361b\\376\\241\\371\\215\\017\\021\\205\\240\\304\\210\\225\\355<\\017\\203I\\255\\3250\\002+\\013@\\022I6\\034(qm\\324#\\275\\276\\013\\241\\303\\010l=\\236\\242I\\311\\3435\\303\\342\\006\\223\\3526J3>\\236s\\214\\352#P\\264\\037\\335\\321\\316\\302\\026I\\033\\013B\\030\\346\\205\\233\\334vBlFP\\267\\016\\247\\200 \\345e(\\340M:\\304<\\027\\264M\\246\\020X\\274\\263\\310 \\231\\037Ur\\307\\206\\325v\\260 %\\357\\312\\303\\305\\316\\230\\272F\\0018\\022\\241a\\224\\034\\307\\241\\274C\\255\\266q\\027\\012\\236rw\\262\\270\\246\\361\\027]\\250\\300\\032G\\315Ws\\214\\261\\2562w\\340\\253\\022\\362\\203\\021\\365\\330N\\214QK#{KK\\2403\\277u\\257P\\232~\\030\\014#\\340\\242\\307\\323\\254\\360\\033\\254\\303R\\234\\303''{a\\322ct\\013\\206 \\223(\\\\\\344\\023\\027\\323\\303\\352\\250\\004\\330\\220\\2736R\\326Q\\302\\310h\\373+\\214x\\205\\206{+&]\\326.sE7\\233*,f\\003*3\\023\\344\\241\\260\\201\\230\\357(\\303\\023Q\\316\\210\\0166W\\354\\247\\003\\344\\026UL\\256\\253\\\\\\006\\222\\257yU],\\346w\\036\\376\\253\\225W\\365m\\313\\304\\371-\\254\\010\\267\\030a\\306\\001&\\300\\001\\177U6\\017\\010b\\\\/\\331\\031\\206\\302\\222\\347\\027rI\\003\\363G3\\017q\\3311k\\337)!:\\304\\337+\\302\\006y\\210\\271\\334/q\\257\\235\\324\\256zO\\236\\342\\213i\\303d\\275\\376P\\000\\223~\\320\\235u\\234k\\342''\\225ra\\330J\\300\\202[ao\\303tI\\251\\345 \\362\\224dd\\370M\\235\\340O\\311\\015\\234gO\\243R\\223Cu5\\356\\322{\\217P\\202\\253\\017\\302\\011\\236+\\227\\300\\226=m\\014\\204%b\\323-\\211\\236y\\012<F-\\254`$\\023\\250\\300\\000I\\277>\\210\\012\\330\\342^\\000\\277u\\353|\\200\\000\\007\\023\\301\\014mA\\244\\003\\247` \\373-0\\370\\273\\021\\301\\261\\012F\\313i\\271\\334$\\331mpK\\207\\252{\\331\\361p\\003\\334X\\031\\311\\207\\327\\337Lmh\\275\\320\\031\\3756S\\244C\\210\\222.}\\366\\021\\335\\025\\212\\256)\\002^"\\333\\223\\267\\303\\225Y\\315\\361>;\\011\\235\\210"\\1774\\233\\254U\\004{?\\3521\\027$\\037R\\235\\212\\305\\\\{~eb#4\\301\\267]\\216\\343\\363+\\025T\\017\\351\\211c\\020Lj:\\205\\265\\331 \\301\\204&\\003\\251<*\\241\\256y!sl\\2471{\\006\\350\\247\\342\\013\\216\\251\\2727\\254\\003\\022\\236?c\\324\\354\\031\\247X1\\215\\220\\345\\006\\007\\254ZX\\\\\\347l\\271qqsnJ\\326\\223I\\021&\\024\\354\\2319\\3145\\360\\307\\031\\326\\362\\217\\342V\\034\\272*\\030\\011\\215o\\342\\006\\037\\356\\235\\366\\013\\215`\\362\\200\\347z+fW\\222Qh\\363]c\\037\\257\\0250\\317\\217Z\\354\\346_p\\271\\243q\\027\\016O0\\324\\332\\321k\\256cS\\021\\341\\237\\351\\225\\230n\\272\\253D\\303\\256\\024\\225V\\024\\347\\263\\026\\3251\\376\\331\\324\\017\\321\\021B\\253c\\325s\\367\\177\\021\\332\\000\\326\\005\\323\\354\\263\\251h\\326\\247\\2548\\017\\212\\2503#g\\324A\\254\\343b<\\304\\264\\020\\223\\3430 \\355\\010\\352x\\240\\341- \\217D%z\\222\\227i[;\\023\\006DT]\\3414\\222\\222\\342\\361\\244\\222{\\247y\\256,h\\322n\\225\\345\\370v\\222I"\\022\\300\\003\\352\\014\\252\\254c\\221\\021N#1w\\224\\020l\\245m\\022\\3608\\012\\301\\211\\313\\231g\\000''\\262\\035\\370p\\014\\355\\350\\230A\\035\\303\\371\\224\\215\\010\\201\\3300\\\\-\\356\\2631\\313\\333\\244\\006\\354\\254\\030\\232-;\\000\\012\\325\\231q{}\\227\\265\\234\\011\\2377FQ\\261\\3352\\015\\243\\342\\253\\330\\256\\220\\304S:\\204z\\036\\343\\325u\\312\\330M4^`\\027\\001\\345T<\\266\\275J\\257{+\\222\\3302\\336\\320\\253F*\\2721mw3\\203\\006\\311\\274Zp\\342`\\215\\327M\\351\\334\\370Tf\\227\\303^#\\342\\252T\\232\\036#\\267+\\332xW\\003e+6\\016q\\034\\312\\266\\011\\324(\\011\\010\\226\\005Q\\310\\263\\222\\330k\\314\\216\\375\\275\\325\\241\\270\\260G\\226\\363\\312\\360i\\023/\\023\\211\\275z\\243\\344\\220b\\361\\001\\344\\236\\337g\\363>\\373"s\\032\\356w\\221\\240\\372\\230\\372!\\016\\011\\321\\366J\\212\\306g:\\2040#,\\250\\177L\\025\\3563\\006\\327\\221-\\2357\\007\\325\\027\\227a\\300e\\355\\003\\352\\266\\250\\353.\\212\\325\\375\\020\\014Io\\266DG\\230c\\003\\001\\223\\354\\205\\311\\261\\215\\251V\\032gH\\222xUlN)\\370\\274MF\\264\\220\\326\\273O\\247\\310n\\255\\235#\\221\\272\\213]\\252\\356q\\343\\260\\\\\\364\\254\\233\\004\\241\\260\\251\\372\\307\\230\\207\\022\\302\\321\\317\\356\\351~]\\203\\014{\\20026\\221\\262+\\037J\\014\\011\\271\\371-\\331L5\\260\\257\\261y8\\317\\2512\\234\\010\\257?\\300\\272\\253CZ@\\000\\311\\236\\312\\277\\215:<\\243\\217\\252\\177\\210\\3064\\270\\314\\221\\305\\341 \\317\\363Zo\\2131\\244\\010\\362\\356}\\324w\\005l\\260;\\217\\257=J\\306aT\\227\\374?2\\261k\\213\\273\\244v\\374\\312\\305\\320\\243\\376\\261(=\\312m<\\004(\\265\\020\\350X\\261P\\204\\267q\\240\\340\\303(\\275\\027H,X\\247x\\360c\\\\!\\215\\223\\012D\\367X\\261JLY0\\314=\\004&a\\206\\005b\\304\\237\\326,\\023\\231_\\306eny\\335N\\332.\\247L\\200O\\315b\\304\\337\\221\\216\\001\\225.\\361-\\337\\303\\334]@\\034\\327\\022G\\272u\\215\\317^\\034Z\\000\\262\\305\\212\\033\\235\\203\\034I\\356Pl:\\213q\\031\\213\\235\\272\\004\\343\\013L\\254X\\224\\244\\346j\\201\\016\\3133MUD\\222\\236\\343^\\010X\\261^\\214x\\231=\\312\\003jDp\\240\\201}\\221-\\257\\002\\002\\305\\210\\363\\201&3Z\\344\\351\\367B\\177\\244\\261\\354~\\241\\016\\213\\021\\371\\254X\\254\\257\\373\\267\\024I\\002.\\311\\362\\357\\273\\311M[\\222\\272H\\021=\\326,X\\210\\030d\\306;\\220f\\330\\334\\206\\031\\366\\257\\335\\005\\206\\305>\\203\\303K\\244,X\\266\\352\\225z\\233K\\226\\321\\226|&`\\327\\211D\\320\\207\\270\\000\\261b\\232\\226\\344\\341L\\307\\030\\207cHcCB]\\210i{\\034\\320`\\221\\000\\254X\\254\\362O\\365\\270z\\212^\\263\\021\\364\\347K7\\012\\347\\027\\035Ny\\227\\037\\360\\255\\030\\0327\\261\\210\\272\\305\\213\\3362\\217\\223\\037\\254\\363\\261;0|Eb\\\\eW\\363\\354\\367H-n\\375\\326,Qyv0\\317\\357\\031J\\202w9\\346m\\235\\277\\305kd\\304\\371\\2766D\\273 \\025K\\016\\305\\246A\\230\\367\\367\\013\\026$\\221\\305T\\257\\342V\\307\\021\\206?+\\014-\\003\\373A\\377\\000\\331\\313\\026,]z\\020|bL\\\\\\317\\377\\331');
INSERT INTO foto_produto (cod_foto, cod_produto, foto) VALUES (6, 3, '\\377\\330\\377\\340\\000\\020JFIF\\000\\001\\001\\000\\000\\001\\000\\001\\000\\000\\377\\333\\000C\\000\\011\\006\\007\\010\\007\\006\\011\\010\\007\\010\\012\\012\\011\\013\\015\\026\\017\\015\\014\\014\\015\\033\\024\\025\\020\\026 \\035"" \\035\\037\\037$(4,$&1''\\037\\037-=-157:::#+?D?8C49:7\\377\\333\\000C\\001\\012\\012\\012\\015\\014\\015\\032\\017\\017\\0327%\\037%77777777777777777777777777777777777777777777777777\\377\\300\\000\\021\\010\\000\\320\\000\\362\\003\\001"\\000\\002\\021\\001\\003\\021\\001\\377\\304\\000\\033\\000\\000\\001\\005\\001\\001\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\002\\000\\001\\003\\004\\005\\006\\007\\377\\304\\0007\\020\\000\\001\\004\\001\\003\\003\\002\\004\\004\\005\\004\\002\\003\\000\\000\\000\\001\\000\\002\\003\\021!\\004\\0221\\005AQ"a\\0232q\\221\\006\\024\\201\\241#BR\\261\\341\\025\\301\\321\\3603b$C\\361\\377\\304\\000\\032\\001\\000\\002\\003\\001\\001\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\000\\003\\001\\002\\004\\005\\006\\377\\304\\000#\\021\\000\\002\\002\\002\\003\\001\\000\\003\\001\\001\\001\\000\\000\\000\\000\\000\\000\\001\\002\\021\\003!\\004\\0221A\\005\\023Q"\\024a\\377\\332\\000\\014\\003\\001\\000\\002\\021\\003\\021\\000?\\000\\365\\235\\266\\343\\307\\011\\354\\000\\326\\200/\\312q\\352\\335B\\200\\345&\\201\\351ms\\373\\255Ve\\025|\\300\\243\\000\\2028\\362\\204cy#\\277\\331\\020\\007x\\300\\252\\272U`?\\314\\303\\365O\\311\\332\\000\\272\\3455\\022\\333o\\3359>\\255\\241\\271\\376\\312\\000Y\\000VI)\\310\\332]|\\236Ro~\\351cq\\334?\\302\\000f\\002K\\\\\\341\\204\\340\\023g\\335\\026\\006\\334X=\\2236\\300&\\261j\\000#d\\234\\204\\324hW\\003\\366O\\334\\342\\277T\\205\\006\\2169@\\000}''\\323\\233\\375\\323\\320\\036\\253\\365Rw\\035\\244\\234!\\003\\001\\326-\\0005\\356\\036\\375\\202"\\005g\\030Ce\\300\\232\\000\\202\\214\\237\\240\\000d\\222\\206\\311#.$\\265\\275\\274\\370LN\\313\\015\\312\\247\\250\\352zh\\006\\320\\375\\344\\036\\002\\313\\324\\376 sw|&\\265\\240\\371\\311J\\237#\\034=e\\243\\011?\\015\\347\\026\\260\\356\\3347U \\370\\321\\001\\271\\362\\306\\0108\\004\\214.?S\\324\\246\\324\\344\\312\\342y\\245P\\352e.\\031\\372\\254s\\374\\224\\026\\222\\034\\270\\357\\351\\335\\262X\\345.\\251\\030~\\204e\\033\\335Un\\246\\326]\\341p\\254\\230\\264\\007\\003\\237d\\177\\237\\237n\\3278\\355\\367*\\027\\345!\\365\\021\\377\\000;;(u\\021\\317\\025\\351\\336\\034\\320\\342\\024\\355\\033~Sk\\215\\350\\375Q\\372-S\\313\\355\\321I\\202\\337\\007\\312\\353\\341s^\\326\\311\\033\\303\\332\\361v\\026\\334\\031\\326X\\332\\025880\\335B\\234O\\251G\\357%\\003xGV\\003\\311\\002\\217\\036\\020\\270o\\335\\273\\267\\036\\351\\350X\\234\\003\\311\\336}5\\367LN\\352\\027\\351\\340\\224\\213\\213\\335WL\\254\\224\\254\\200\\030\\336\\006>\\212I\\030\\234\\006\\264\\340\\024\\266\\354$3>\\311\\376P\\340\\312=\\323\\266\\206A\\365\\021\\335M\\200\\324|\\237\\262In\\223\\331%\\000;\\206\\375\\304\\012\\244\\340e\\215\\003\\267\\335"=.p\\302 l\\206\\200F\\024\\000 m\\007w\\224@\\020\\354\\214W\\011\\217\\312C\\207~QV\\327\\372\\276Z@\\010\\345\\266\\334\\017)\\315\\027b\\370Hq_\\260N}\\262k\\205\\000\\021\\000\\234\\246p\\365\\035\\327]\\223\\2026\\002\\356S\\375T\\000\\307\\004Y''\\3316h\\234\\320DFA\\311\\011\\2738\\346\\220\\003\\214\\270P\\254%\\300L2\\3403\\364N\\015\\012#\\277(\\001Q\\004\\234\\034 {\\230\\326\\011\\036CZ<\\252\\372\\356\\241\\026\\204\\035\\364_X`+\\224\\352}a\\372\\203\\352!\\255\\376\\220\\262\\347\\345C\\022\\377\\000\\321\\260\\305)\\263o\\250u\\330\\243\\334\\330\\000''\\372\\217\\013\\013W\\324\\246\\233\\377\\000,\\356>\\327\\217\\262\\306\\227R\\347\\273p\\260;(_6m\\366k\\335q3~Bsz6\\303\\216\\221}\\372\\203\\222\\035\\312\\210\\311\\270^\\357\\272\\252\\343\\272\\262r\\207yn\\005\\020\\260\\274\\322\\177M\\013\\025\\026\\203\\300\\0370\\264\\234\\362\\303\\312\\246\\033$\\216#\\000Zg\\272Q?\\303-\\343\\225G6[\\242&\\032\\370\\331/\\303y;\\276\\212c#\\236\\377\\000\\375Oe\\230ex\\220\\265\\277+\\3716\\257i\\310\\313\\211\\301\\302\\213\\266L\\340\\222&\\016\\267s\\220\\272\\037\\303\\375U\\260\\274i\\347?\\303?)\\376\\222\\271\\321Y#>\\350\\230\\341wuK\\257\\304\\313(3\\026XZ=!\\245\\256\\026@N\\340^\\\\\\015\\001K\\017\\360\\357P\\023\\307\\371i\\2347\\267-$\\362<-\\272\\253\\003\\205\\337\\204\\324\\325\\243\\004\\225:\\004\\202\\000n6\\214_\\204\\207\\245\\245\\254\\243\\233Ee\\254\\332(\\204\\305\\273I\\330r\\357er\\240\\341\\257;NHLH\\0049\\304\\207Zpj\\234M9=n\\036\\261\\236\\330RH\\275\\177\\320~\\311"\\334\\377\\000\\352) \\001\\000xF)\\316\\300 \\200\\232\\255\\241\\336S\\201\\234Z\\200\\031\\277!\\007&\\323\\223\\307t\\277D\\344\\206\\023h\\000I5m\\342\\371F\\010\\335m\\375P\\020v\\203\\331=\\336Y\\317\\204\\001&\\010\\027\\363\\004\\267d\\337)\\233\\352\\0034\\344\\374\\027n\\345T\\007\\267\\000\\017o\\011\\012<\\037\\250C\\221D\\331\\012\\237Q\\352\\021h"\\336\\343o?+\\007''\\374*\\311\\250\\253d\\245~\\026\\344\\2228\\333\\276G\\006\\264\\014\\271\\330X\\035O\\257z\\014zRF~~\\347\\350\\261\\372\\247X\\233VF\\362+\\226\\264\\017K\\177\\345a\\317\\253s\\\\h\\222\\363\\341ry_\\220\\253\\214\\015x\\270\\327\\266\\\\\\326k^\\347\\035\\356\\267\\236r\\250\\231\\003\\316I\\241\\331@\\351E\\333\\305\\225\\033\\215\\215\\303\\027\\331q2e\\224\\235\\263\\241\\034ixJ\\351=A\\265^\\022-\\315\\227\\222\\025Wo\\003s\\215#\\017\\261\\217\\01169B\\211[)\\007\\007\\267\\011W\\253u\\362\\237O\\030\\223u\\2742\\263D]\\253\\261i\\304\\363:=\\255\\213\\030''\\217\\257\\321J\\213`\\351\\020B\\346>\\002\\366\\372\\\\\\323E\\244\\376\\351\\002\\037;\\311!\\240\\216\\310\\272\\366\\205\\375=\\220J\\0346\\313m\\364\\233\\335]\\375\\271U`w\\360\\367\\007Yp\\2453N:+W\\264I\\360#\\241V{\\203\\355\\356\\231\\322\\2064\\201\\331;\\211\\330#i\\252\\344\\250`\\002iC[e\\214\\345\\336J\\210/\\245d\\313\\260\\333c\\003\\316Q\\223U\\356\\210\\006\\214\\004U\\222x[!*3Kd\\3329\\237\\014\\302F\\272\\2106\\027u\\323\\365\\177\\233\\321\\307#@\\276\\035\\354W\\237\\306\\372}sk\\246\\374/\\252\\333\\361t\\365{\\275@{\\216Wk\\205\\232\\337S\\036h\\375:2k\\203e r\\011\\301I\\255\\015%\\300\\333\\217(^F\\333v\\012\\352\\031\\206 \\023n4A\\300Rn5eF\\335\\327\\352\\341\\036H\\004d)`7\\304\\036ROm\\376\\202\\222\\000q\\200+\\213\\373#%\\277\\313\\331F,P\\355\\375\\224\\200\\001}\\375\\325X\\002h\\200i5\\200M\\331F\\342\\334Q\\264\\300\\003w\\343\\272\\000\\022\\016\\321IU\\022Y\\312"(4\\002i3\\200i%\\244\\337\\367@\\004\\332 ^\\034\\237\\271\\336\\205\\273KA\\261\\273\\302\\307\\353\\035h@\\035\\016\\235\\300\\310~g\\366\\037D\\274\\223PV\\313E7\\244O\\325\\272\\2634C\\341\\306C\\346\\360xo\\325q=C\\250\\231g?\\026g9\\347\\234r\\243\\326\\353\\200\\335n\\267\\236l\\254\\257\\213\\352$\\214\\236\\353\\201\\314\\346\\274\\216\\227\\207C\\007\\036\\266\\3133N\\013\\267p\\007uY\\363\\267\\226\\344\\250K\\267\\277\\236;&q\\000qer\\334\\231\\2720A\\023\\277\\325YBd\\247Q\\0050s\\206@L\\352p\\334A\\016\\356{*\\3721*\\034J\\036v\\200T\\332v\\027\\2744w5J-+,\\355\\332NA%\\243+B\\027\\351\\331(!\\222\\200\\035b\\310&\\274)\\242d\\350\\275\\376\\224C\\003\\243m\\310\\017\\250\\016\\035}\\224\\372MK\\240\\326:8\\316\\371\\014nk\\203\\316\\013O\\217pV\\204\\223\\003\\244\\215\\3727J\\315\\207\\177\\000\\327\\261Y\\262C\\371\\255`\\233L\\004\\222:\\303\\243\\016\\255\\331\\317\\374\\247\\311(\\327_D-\\3727\\3427E\\324\\016\\236H\\206\\331\\032=M.\\335~+\\367Yl\\322\\177\\021\\373\\031dz\\235_+\\177\\341kk4r\\350\\266\\267P\\320\\322{\\003\\310Y\\222\\007\\235\\360D\\367S\\335\\271\\346\\373xI\\233\\224\\245\\376\\211M%H\\246\\031&\\252S\\004\\006\\243\\007\\326\\377\\000+Q\\272VB\\326\\307\\035\\201\\331Z\\321\\351#\\206&\\330\\004\\367\\312\\236f\\260\\035\\300\\003\\\\)\\264\\205I\\331K\\341m9\\301\\010H\\263\\310\\012I\\035\\273\\346m(\\235WW_Ex\\312\\331F\\205@dq\\335]\\351\\332\\223\\245\\325E3{8*-7\\376Q\\265\\333O\\320\\256\\207\\036}Zb2+G\\243\\260\\265\\315d\\214##\\031H\\263q?\\020*]\\002Vj:\\\\9\\026\\317A\\375\\026\\201\\007w\\257 \\205\\350\\241+I\\230\\036\\201\\000\\232?\\313\\330\\242\\331\\202A"\\222\\003\\036\\222v\\216\\310\\300\\004\\232\\273SeA\\007\\377\\000T\\223\\020o\\222\\222,\\221\\205\\267kH\\036\\021\\214\\0228\\362\\207\\030\\307\\262p)\\307\\030@\\013\\2020\\232\\354\\272\\360;\\242\\300\\241\\\\\\246\\240K\\250}\\320\\003\\207U!y\\332\\034\\353\\030\\3459pk=F\\200\\344\\256c\\255\\365\\255\\305\\360i\\2346p\\347\\016\\377\\000D\\254\\271c\\211[/\\030\\271:Au\\236\\263\\272\\341\\323\\022\\000\\371\\235|\\256__\\252\\370Q\\027_\\3214\\372\\260\\320\\\\\\356\\002\\312\\325j\\2336]{|/?\\312\\345\\271\\277N\\216\\034\\025\\262\\273gs\\345.~wpS\\310\\362F\\332\\307\\225\\023\\\\\\301\\352\\004\\006\\216\\351=\\301\\315\\266\\345\\247\\270\\\\\\346t\\024Ga\\015\\242n\\376\\252G6\\354\\330\\010!\\206\\333d\\217\\370F\\326\\271\\316\\004D\\347W7\\362\\200p\\025j\\313P\\275M\\255\\300\\200E\\217uf(\\014\\376\\221{\\210\\300\\362\\207G\\247:\\231\\332\\303\\351\\027\\352\\177;G\\237\\242\\356\\272wJ\\322\\303\\034dJ\\323$l\\017s\\301\\243\\031\\254~\\311\\330p<\\214^L\\212''\\027\\323$o\\305\\333\\034\\017s\\315\\206\\221\\200\\265\\300\\320\\313\\033!s\\330eh\\313\\306N\\343\\303@\\366\\362\\256\\377\\000\\246F\\315{]\\246kY\\006\\251\\205\\300\\003d\\200h\\337\\367W4=2\\015(\\325\\007h\\332\\375\\214\\301\\026\\036\\357nS\\343\\307kB\\336D\\366ciD\\360F\\350\\356\\341\\220X\\241Y\\265\\267\\322`\\032HF\\266\\211\\210\\215\\324\\006VwZk`\\236\\030\\300,\\033Z\\342x6\\265\\313\\244tz-$2\\010\\230\\370\\276!\\315\\032\\360\\007\\272\\254 \\224\\235\\374+9Z\\321S\\255u\\030\\237\\0134\\261\\260\\276G\\333\\255\\376\\2474\\034\\363\\331fE\\033!xs\\332\\321c\\003\\223j\\274O\\225\\372\\231\\344&\\311yh7wXG.\\247lN{\\203A\\003\\0262\\223\\226M\\273eR\\370\\211D\\356k\\211\\240|a\\013\\265\\002C\\264\\202\\017\\204\\015s?*%\\324\\274\\003\\341\\202\\334\\250\\276V\\330sI\\242,Z\\316\\355\\014P,\\314KI\\017\\260Gj\\341B\\035\\270\\221\\333\\312\\026\\314f\\024y\\376\\350\\376\\030\\333\\3413\\030\\251*\\023\\034Z9\\260;\\251\\030Io\\253\\222\\243k0M\\217\\242&\\220\\343\\316V\\374OhD\\316\\273\\360\\204\\215\\370z\\210K\\206\\010p\\005t\\231 \\033\\260\\270\\237\\303\\223|\\036\\244\\3268\\212\\220m7\\367\\013\\261\\017\\332\\000n}\\227\\241\\343;\\306\\214\\031\\025H0\\001q\\0149\\345*\\004\\213\\372''qn\\340Zi\\305 ,z\\223\\212P\\377\\000\\004\\377\\000RIm\\036\\377\\000t\\221\\260\\003\\202?\\272VM\\224\\341\\244\\220H\\343\\262N\\317\\261S`6w\\013p\\277)\\300;]\\236\\374yNG\\250S{q\\345U\\352\\232\\261\\242\\320\\315?\\363V\\326\\003\\347\\262\\254\\244\\222\\262R\\263\\023\\361/V\\014\\037\\224\\200\\361\\207\\221\\347\\302\\345e\\225\\271\\336Qj\\246.ys\\315\\270\\362}\\326f\\262W\\023\\2663\\236\\353\\316\\362\\363\\271KgK\\006"9\\246\\022\\222\\030\\340E\\252\\362\\271\\254i\\022\\021\\204\\001\\201\\204\\273\\345=\\325y\\033\\361\\211\\273\\256\\0277\\326t\\243\\004\\006\\240\\261\\340\\265\\246\\207\\262\\227N\\307\\006\\265\\255 \\203\\201J(\\230t\\317k\\243$8]\\036U\\255+$k\\232\\350\\003C\\361\\352''\\376\\217\\012\\356\\252\\206\\272H\\323\\321B\\351\\001\\216=$\\263j9k\\211\\332\\335\\267Vo\\267\\272\\275\\240\\321\\016\\247\\325GL\\230\\210\\314v\\347\\266<\\331\\366<w\\012\\006:w<:f\\267\\341\\270z\\250b\\274\\345Y\\213_\\036\\222*\\017\\255\\316\\262\\032\\332 v!\\330<`\\253A\\302\\377\\000\\320\\211_\\303\\247\\213\\242E\\321\\333#\\343\\216: \\2009.\\037R\\235\\235CC,\\257\\322\\311\\027\\255\\354h\\337\\031\\016/\\036,\\177\\320\\271\\207u\\210\\265\\000\\262\\345\\330;n\\000\\237\\324\\336mZ\\351\\035S\\247\\300\\352\\222/\\221\\247k\\245\\033\\234|\\213\\034-K<\\023\\250i\\010x\\345W-\\233\\314f\\205\\372\\201\\014Q\\230\\237\\246\\231\\326\\010;\\034\\323x\\027\\344x\\356\\251\\365^\\245\\037K\\323\\262=3\\033$\\340\\200\\323)\\272\\034\\345C\\254\\353\\260>(\\314;\\203h\\202\\306\\362=\\277\\312\\315\\370z\\035V\\236B\\335y\\213T\\343m\\212V\\323Fx$\\344\\376\\252e\\231;Q*\\241\\365\\225\\365]D\\316\\342\\371&t\\332\\311]\\267s+hi\\347h\\363\\331k\\215f\\315\\\\Bh\\203d\\217F\\3264\\007Y\\343\\012\\223t\\023i\\301\\230\\350trK\\274\\023\\250|\\226\\316;\\001AB\\326\\352\\035\\257\\217S\\256\\324\\007>\\201hn\\006\\321\\300\\245\\232M\\305z1\\244\\307\\323<~M\\270\\247\\002o\\012\\216\\241\\346YDd\\323I\\311ZR\\220\\347IT\\335\\316.\\373\\252Oh\\330\\366\\336JVM\\354\\244\\036\\315\\257\\312\\261\\232h\\035\\014BO\\210\\316\\377\\000\\312H\\031\\277\\0132^\\236\\357\\214\\357C\\243has\\267\\033\\242<{\\024zN\\240t\\214\\020K\\021p\\377\\000\\353->|\\251\\347f\\375\\033\\236>#\\337^\\247_\\007\\302\\033\\213E\\366\\214\\230\\332Z>\\275\\224\\241\\347o\\026\\201\\226\\334\\203nS\\032\\332\\034\\323`\\376\\311Qt\\310\\232\\001\\247\\265QF\\033G\\204#.%J\\327\\015\\304w\\245\\277\\023\\263,\\313:G\\354\\236)/\\345p\\312\\357\\241v-\\271\\335\\225\\347q`\\216l\\033]\\337G{d\\321\\302\\343\\237M~\\253\\271\\302\\226\\2321\\346_K\\330!\\256\\272?^\\023\\213'')\\266\\2074\\217\\035\\321\\036\\327_\\242\\334 k\\367?t\\223mo\\204\\220\\003\\221o\\024\\354yDEpR''\\324@h\\2628L\\010\\015\\317~\\312\\000 v\\221\\352\\261\\\\\\256;\\361GP:\\211\\376\\014d\\030\\3425\\217\\346>V\\347^\\352\\177\\223\\207\\341\\264\\377\\000\\035\\355\\364\\217\\351\\036W\\021).u\\223\\367\\\\\\376fu\\030\\365F\\2148\\334\\235\\2245r\\026\\202\\345\\225,\\3066\\227\\275\\300}V\\276\\245\\361\\200}C\\035\\312\\301\\3262''\\276\\335d]\\256\\006G\\331\\235|1\\030\\352\\003\\301#s\\317\\321\\014\\022\\002\\011\\324\\307 \\335b\\2320\\321\\330\\336}\\321\\302\\343+\\333\\024@n&\\202\\262\\355\\031i\\365H\\306\\213 \\027:\\205\\205\\021}~\\032|2''\\323\\311&\\245\\361iu\\205\\355\\345\\256p\\332+\\365R\\364mv\\252\\015C\\2761c\\242\\034\\356\\035\\324\\372\\237Dccwg$\\214"\\351z\\315\\036\\217x\\324\\350[\\250/\\025e\\345\\273G\\267\\277\\272j\\227eM\\003z$\\324\\353\\1770\\377\\000\\232\\353\\000\\001HZe\\220\\206E\\033\\344q\\3404YV\\007V\\3216g\\276\\036\\227\\0258P\\022\\310\\347\\355U\\245\\353:\\215\\256lol!\\300\\007\\010\\206\\320R\\236=\\225\\354;\\214\\221\\237Ym\\367\\0034\\234MD\\006\\333\\236p\\002\\314\\374\\301s\\366\\263\\324\\342\\266zV\\224|F\\222\\335\\317q\\252=\\324J\\011zD\\246\\215\\035\\023epdmeH\\377\\000%^~\\227\\343\\350\\2675\\207\\343o\\332\\367\\036\\002\\257\\324\\\\4\\232\\260#\\001\\355i\\000\\327\\366V\\233\\256\\216\\010\\314.{\\\\_\\353\\221\\3147\\333\\000"=W\\246g~\\242\\234r\\317\\322\\365L\\217P,r\\326\\027a\\024\\215\\333O\\022\\333\\234oh\\361\\356\\250u)N\\256]\\316\\016|\\200\\000\\010W4z]A\\321\\031\\036\\313c|\\362\\025e\\265\\242\\325\\365\\227!!\\345\\301\\267\\261\\237zR\\311\\246\\215\\314\\270\\335\\271\\3478Y\\302B\\337@#\\216\\305\\024r\\2723VH\\007\\345\\264\\225"\\\\>\\243c]\\004n\\320\\2668\\340?\\023hpwa\\345d\\262Md\\033X0\\32786\\203\\257%jiz\\203&g\\302.\\015\\305Q\\377\\000e,\\221\\302\\367\\227\\313\\0304\\332oj\\367Mu-\\225\\214\\272\\351\\230\\232\\337\\210\\311}L` Q\\014<\\224\\021H\\034r+\\331k\\365\\015#w\\031! 5\\300\\214r0\\261\\344c\\241;\\0106*\\222\\345\\026\\230\\313M\\0230\\215\\310\\235\\207\\007\\005]\\216\\263\\267*P]\\307\\331?\\014\\251\\231\\247\\022\\320\\252\\336\\006J\\353\\177\\015L\\037\\242k\\011\\371\\\\~\\241r\\020\\233`\\274{.\\213\\360\\314\\241\\277\\025\\207<\\020\\275\\007\\015\\355\\0302\\255\\035M\\267 f\\370N\\317\\224\\014\\330B\\326\\271\\216\\262@$vF\\272Fk\\036\\217\\375\\011&\\336\\337%$\\000\\266\\323\\2158\\237uO\\251\\365\\030\\264\\021\\346\\2351\\036\\226\\377\\000\\271E\\325\\265\\243A\\243t\\300\\002\\373\\332\\337\\252\\363\\316\\255\\324\\336\\355\\322\\027\\031$q\\315\\254<\\256R\\302\\253\\350\\3748^F[\\327\\353\\214\\262>I\\036\\\\\\367\\033$\\254\\015wQ\\015%\\255''w\\262\\257,\\322\\312n\\315\\025JF\\270\\223\\270~\\266\\270S\\312\\362;gW\\026\\025\\001\\377\\000<\\011v\\346\\356\\276\\305A,\\233\\315\\206\\322(\\240\\311''?\\242''BNCR\\372\\232;\\305\\021\\3053\\330\\360\\346\\002\\322\\015\\335\\243t\\217y\\262\\343\\315\\234\\247\\330\\007\\362\\242\\014\\263\\362\\320\\372\\250\\242\\036DW \\356\\262I\\367B\\3460d\\237\\320+\\243N\\312\\010\\333\\243\\001\\326\\321\\237\\242\\277UB\\336fg\\307\\247\\236|C\\023\\232\\317\\352p\\245(\\351\\215&\\245\\221\\316\\366\\006\\202\\322\\333;Ef\\275\\317\\012\\010\\030~?\\361\\2015\\356\\252\\347^\\025\\354\\331&\\233\\246\\304\\326\\264\\304\\000<P\\357\\372\\251\\236N\\234\\264\\003\\233\\301\\265a\\3225\\220\\2000\\000\\252\\003$\\373\\254\\355D\\377\\000\\025\\302\\3504$\\2716\\313\\305;6t:\\246O\\031\\216w1\\225\\303\\234/w\\326\\371Qitq\\313\\324%\\217J\\317\\314\\306\\322C,\\355\\006\\373\\254\\330\\\\\\313\\026Zj\\210''8RK\\252\\006` \\037\\015\\237\\315g\\027\\364Bv_\\251\\267\\0040j\\265\\360A\\000\\334\\330\\301v\\244\\203`\\033\\240\\001Wz\\236\\254C\\2411F\\346\\206\\356-\\015a \\201\\\\\\021\\377\\000xYZ\\011\\304''\\341\\350K%\\017\\240\\3409\\253\\273?\\252\\257\\254\\224\\313#\\367\\027n\\254\\336Iw{V\\224\\222N\\212u\\266\\016\\235\\200\\374\\275\\274\\242\\227sn\\311\\027\\302\\223\\244B5:\\226\\306@\\332\\006}\\326\\347\\342~\\226t\\372h&\\015\\300\\005\\270\\375\\270JX\\245$\\345\\374.\\344\\223H\\346~!''\\031\\245\\247\\244\\326H\\310\\317\\304k\\235\\010\\253<\\226\\177\\205\\211#\\244\\211\\327\\260\\217\\321_\\351\\335m\\372m\\315:x\\244k\\233\\265\\341\\303\\346\\010\\202\\242g\\033Z6\\36783~\\355\\354p\\364\\270*r7\\342\\023\\271\\205\\246\\354aV\\320\\353[\\371\\227D-\\260=\\326\\306\\377\\000A\\361\\364Z\\216g%\\342\\307\\225zL\\314\\356/fY\\210\\207Y)\\315\\330\\027\\2254\\315%\\304\\006\\322\\006\\266\\207\\250\\376\\252c\\246Cv\\036\\235\\326\\342\\012\\333\\374?&\\315sE\\221\\270\\020\\260Xv\\312\\015\\005\\251\\323\\244\\021\\353"w\\207\\013]\\256\\034\\374f,\\250\\356\\342\\310G\\352qsGa\\225\\020q\\370`4\\372\\224\\244\\206\\037\\232\\355v\\231\\210k\\254P\\373$\\204\\272K5\\265$P\\021\\365\\015\\024:\\370\\037\\004\\344\\3559i\\034\\202\\271\\016\\241\\370Y\\361\\261\\316\\212h\\344\\003\\263\\260WrN\\\\Z,\\367X]kQPlh\\307"\\222''\\306\\307\\227rCa\\222P\\360\\340\\245\\320\\272''\\0269\\265\\333\\012\\007\\350E`\\327\\325?P\\326\\317\\006\\270\\232\\334\\313\\3657\\310W\\242tZ\\230\\303\\342"\\217\\362\\222\\271\\231x\\261\\213\\244j\\216y3*](\\240\\001\\307\\220\\243:}\\243\\026\\266K\\003}27i\\373\\202\\221\\3235\\314\\246\\322\\314\\360\\277\\203\\026W\\364\\304\\370G\\204F0\\321G\\225\\242\\375)\\000\\320Q\\272\\002\\015\\2208\\344\\245\\376\\267\\353''\\366\\024\\233\\013\\210\\2725\\330+\\014\\203s\\016\\363\\265Zm\\200\\033@\\217e\\013\\313\\216\\346\\320\\345&i\\222\\232a<\\015\\255a\\3162\\253:72BA$\\036mX\\330y\\356\\241>\\241\\336\\302\\317&\\374\\035\\032\\003P^b6\\366Q\\355y\\265\\236ZX\\332\\002\\374-h\\336\\030C\\210\\016\\241T\\341afK\\024\\315y\\246\\342\\371Q\\021\\321ho\\207!f\\346X7\\305*\\257\\267\\273$\\223\\333\\352\\2571\\262]\\027\\003}\\201\\341\\013 \\0158\\004\\367S\\333\\250\\336\\304Zv=\\215\\240\\342/\\234\\253-\\220\\272\\367g\\334\\362\\204\\235\\240\\0003\\335\\020hs?\\356\\025[\\262\\251\\323&\\322j\\235\\014\\241\\3144\\340A\\005u\\363u\\250:\\236\\223\\341\\270\\3545@\\277\\205\\302\\220C\\206U\\206\\274\\265\\244W=\\274+Fn\\011\\245\\364\\211EH\\321\\352\\343\\3429\\2717_\\242\\311\\333\\354\\254\\231L\\243\\325U\\306\\002\\026\\263\\027\\217\\242]\\226Z!\\214H\\323\\270\\002@\\344\\216\\313\\245\\351\\372\\266\\352 \\030<Q\\317u\\316\\270\\271\\226\\005\\200\\177u''N\\324\\035&\\260\\013?\\011\\370!^,^X\\366F\\364\\255qq!S\\231\\305\\217\\376\\341hH^\\3408\\343\\004*.\\217k\\355\\346\\317)\\221Vf\\262;\\004\\340\\345]\\322>\\237\\033\\217 \\213TG\\316IV\\240vE{.\\217\\033\\332\\021\\227\\303\\321\\264\\245\\256\\207q\\347\\233\\360\\246i%\\355s\\206;\\025OD~#\\006\\343X\\031\\362\\2568\\235\\2407\\225\\350h\\347\\222z<5$?\\011\\237\\324RP@\\215S\\251e\\365\\035+^\\313\\242OrV\\235\\220\\035]\\3239\\200\\265\\240\\200\\177\\331Z.\\200\\340\\365\\375)\\256{\\275\\026\\261\\244\\351\\223i\\234_\\003\\213]\\343\\261^\\227.\\215\\2629\\330\\027X*\\216\\247\\2454\\307\\307\\275*K\\034d]J\\2175\\233\\252kt\\357\\333,`\\264"\\207\\255F\\354<l>\\353\\262\\325\\364\\021 \\313A\\005a\\352\\377\\000\\01508\\215\\233|c\\225\\222|V\\206\\254\\205h5\\214\\224\\212\\272?\\314=AZ-l\\243\\004\\025\\2257\\341\\327\\260\\356\\210\\271\\256\\354Zh\\246g\\372\\236\\217\\377\\000#F\\241\\243\\316\\010Ix_\\215\\026\\264\\3157A\\221\\204\\006\\017Q\\302\\217K\\324Y/\\243y\\216O\\350\\224W\\331[3\\226\\237\\342\\307B\\271nB\\313\\223\\002.\\244\\321P\\260\\227g\\0127DA\\240\\012\\324h\\216V\\022\\335\\256\\036\\312\\027\\351\\266\\220X\\352\\366+$\\270\\343#\\220\\317-\\246\\325(\\036\\307\\036n\\225\\371X\\340\\341l\\3413\\343\\341\\300a)\\342\\241\\213!HB\\032,\\014\\240\\221\\301\\270\\257\\321\\\\y\\0331\\317\\205\\021\\212\\306\\342\\225<t23*l\\317\\003)\\376\\025\\027\\002\\025\\262\\306\\216B\\202c\\360\\330JU1\\235\\312\\316`\\003\\373$\\333\\305\\204\\022\\023\\271\\264q\\331J\\007u=K\\251\\014\\303\\233\\274)7\\016\\307\\364P\\003F\\200D\\034\\346\\376\\275\\225z\\227\\262G\\033\\253P\\277\\016\\005\\035\\203\\213\\2445x<\\251^\\220\\331\\267\\243\\324\\231t\\254\\035\\306\\012yZH\\262\\263\\272|\\242\\031=Yi9\\036\\026\\264\\364X\\013H\\245\\243\\036\\314\\2314\\312g\\225b\\023OhU\\370$vSDAw\\272\\331\\203R\\023\\223\\303\\320t\\017\\0068\\305\\000H\\000\\001\\335^o\\360\\232A\\027Ef\\364\\260\\337\\313\\306\\\\}@-\\026e\\326\\353\\333X^\\223\\3429\\357\\321\\303\\254wI*\\217\\311IA\\003\\207P;\\276\\366\\212\\311\\002\\206\\017\\356\\201\\203\\323\\352\\347\\260R\\001\\266\\205\\343\\337\\262\\031#\\035\\304\\232\\037n\\311\\366\\200\\317U]\\362\\210\\020I\\256\\022\\240@*,\\200\\014Mq\\036\\221\\346\\224R\\351c\\224\\033h%Y\\305\\212\\341?\\321\\026\\3112\\345\\351l"\\303mU\\324t!!\\300\\026\\002\\350\\005%W^\\0247d\\234.\\277\\360\\323fk\\232\\350\\201\\256\\364\\271\\335OI\\327t\\363\\374\\011\\234\\346\\363\\360\\344\\310^\\266\\346\\202\\016\\005\\252:\\235\\0042\\267\\324\\321t\\227,Q\\231e&\\217(\\377\\000R~\\235\\367\\251\\322>3\\335\\321\\233\\375\\225\\335''T\\322j\\275-\\231\\273\\357\\345w\\244\\376\\353\\251\\327t\\006\\271\\346\\331m\\360\\271\\236\\241\\370]\\257\\004\\306\\332#\\302\\315>3^\\014S\\277K.g\\217\\320(\\336\\314\\032m,V3\\250\\364\\227\\200K\\245\\206\\376Gg\\355\\341jiu\\320k\\015E!d\\235\\343~\\017\\371Yg\\207\\372\\213\\251\\002\\3507Y#\\365N\\326[)\\303*\\326\\3077\\346\\035\\351\\003h\\002n\\326ibH\\272\\221I\\361\\202iC3@9\\027\\354\\257\\311\\020\\004\\021\\302\\201\\321\\207r2\\263\\313\\020\\330\\314\\240\\370\\301\\000\\326\\020;\\322\\026\\203\\242\\241\\225ZHI\\372*\\313\\035\\027\\214\\312\\315n\\354\\216\\350Z9\\007*\\310`h\\252Q\\226d\\2458\\214R!q`9\\345)\\032p\\346\\233\\366F\\350\\306\\352Fc\\025J\\264\\213v!\\015\\332\\342G\\363r\\265[-\\304\\006\\353Y\\301\\264U\\2464\\265\\243<\\2558#lVWe\\212\\307\\325I\\246o\\254w$\\240#\\202\\247\\321\\266\\346h\\355am\\305\\017\\364\\214\\322z;\\216\\234\\014\\221\\006\\216\\000\\013Oy\\303H\\312\\317\\320mk=''\\221\\331h3h\\217\\327\\363.\\363\\322F!\\376\\011\\362\\022C\\270\\373\\244\\215\\220;\\177\\210\\315\\335\\277u%\\227\\020\\016\\024UB\\333\\302\\220\\270\\032\\253\\375T0\\014\\032\\272O\\313\\007*6\\220\\011\\006\\307\\204\\344\\325\\021\\335V\\200\\223\\300HX\\262\\207p\\343)\\333\\311\\277\\321@\\007@\\204\\367\\224\\016\\310\\241\\345\\025\\212\\037\\331\\004\\217\\2000\\200\\264\\032.\\347\\373''\\030\\3457\\314,\\177\\372\\240\\220\\\\\\300\\367\\321\\343\\271U\\346\\321\\306l\\006\\214\\253d\\346\\253>\\022\\002\\254\\2257D\\030\\232\\316\\211\\024\\354\\341\\277_\\013\\223\\352\\377\\000\\205\\210q1\\264\\212\\340\\205\\350\\344n"\\306\\020\\271\\201\\304\\215\\240\\332\\206\\224\\275%6\\217#2\\365.\\233l\\220\\011\\343\\034\\007\\362?T\\361\\365\\235\\034\\246\\265P\\276\\007\\177W!zF\\263\\242\\301;I\\015\\000\\362\\271\\336\\247\\370I\\222\\002Z\\300/\\302\\317>=\\3705d\\376\\230,\\226''\\337\\345\\2651\\312\\017\\362\\227''tn''\\026\\323\\341\\303\\037uWY\\370bX\\234vb\\275\\225A\\244\\352\\232!\\374\\011\\036Z;]\\217\\261Y_\\035\\227SF\\235\\233\\015\\2262\\337\\004d"0\\203\\306Vd}__\\021\\377\\000\\344i\\232\\360<\\012V\\242\\353\\032iM<>''\\177\\354\\333Q\\372R[''\\260o\\200\\034\\325\\250\\035\\016l\\014+\\221j\\240\\221\\325\\024\\361I\\355tT\\257k\\017-\\332}\\322rq\\327\\250\\272\\310\\321\\222\\350\\375I5\\246\\370Z\\016\\323\\222\\177\\335\\017\\300\\256B\\313\\372\\030\\337\\330S\\021\\216J\\261\\034e\\373[\\305\\034\\251>\\003H\\006\\224\\361\\306\\032/\\272\\2641\\270\\310\\254\\247h\\007D8\\031S\\350YS\\263\\330\\250Zw\\022IZ\\035* \\371\\254\\360;.\\246\\010\\\\\\221\\236oGW\\323XE<\\363\\\\+\\330\\226\\363@\\025KJO\\244\\002k\\277\\262\\272\\352h\\364.\\244\\2753\\022op\\306>\\311(\\266\\311\\344\\244\\253H\\004\\034[M\\344vR:\\232A\\344\\322\\207sC\\003M\\330\\344\\243\\003k\\201 \\320\\354\\206\\2006\\235\\300\\373''''k\\000\\347(0n\\260Qn\\000\\000y\\356\\241\\200DS\\301\\357\\\\\\247\\004\\270\\221\\305w\\362P\\327\\254\\036\\336\\022\\260\\347:\\271\\012\\000\\226\\350%VA\\007\\267(A\\241\\236\\022\\376`k\\003\\262\\202B\\006\\356\\370\\376\\351\\211-\\030\\037\\341>\\353;@\\315}\\223\\002\\030\\000?\\251P\\001W~\\351\\201\\262AM\\220\\353\\375\\221a\\306\\273\\240\\007)\\354]\\240''`\\027\\367K6\\035_\\242\\000/6\\231\\355\\016\\252\\375P\\356\\334\\034\\332\\372\\242\\310h\\245\\036\\022W\\233E\\014\\207,\\031\\362\\263\\337\\321b6H\\242J\\332\\317~SQ \\370S`r\\232\\257\\303\\354q\\0040\\021\\375\\326.\\277\\360\\313\\036\\322\\003)\\334\\330\\013\\320\\344\\036\\232\\373 |L\\340\\201\\365EE\\372\\203\\263G\\217\\352\\377\\000\\014\\313\\020/e\\341W\\216n\\243\\241\\033^\\323$c\\371d\\026\\275nN\\234\\311\\032\\342@\\273\\300Y:\\336\\204\\307\\341\\240\\034\\347\\331Q\\341\\213\\360\\272\\311\\3758(\\272\\324mw\\3614\\357h\\356Z\\353W\\364\\375GG\\251\\240\\331C]\\341\\343iZ\\272\\277\\303\\321\\002F\\336x\\302\\300\\326~\\035|E\\316g\\036\\022\\236\\006\\213)\\243O\\341\\207\\013\\004\\021\\344\\024\\301\\231\\253\\\\\\343b\\326\\350\\337p\\275\\315\\256h\\340\\376\\212Q\\326\\265q\\220\\327\\2667\\037%\\251_\\247e\\273\\033\\222F#\\005\\304\\320\\034\\255.\\206\\303!\\016\\243\\236\\026\\034Z\\207uF\\307\\030\\214\\2636\\374\\340\\256\\313\\242\\351~\\033[\\264f\\226\\316>:\\330\\271\\310\\326\\323\\201\\024\\000\\037\\272\\234\\0075\\333\\352\\374\\004\\021\\215\\373\\254`#\\334}-\\276\\177d\\347\\261A|@\\222-\\221\\177RJ\\232\\003\\377\\331');


ALTER TABLE foto_produto ENABLE TRIGGER ALL;

--
-- TOC entry 2144 (class 0 OID 24813)
-- Dependencies: 1625 2130 2134
-- Data for Name: funcionario_has_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE funcionario_has_empresa DISABLE TRIGGER ALL;

INSERT INTO funcionario_has_empresa (cod_funcionario, cod_empresa, responsavel) VALUES (1, 37, '0');
INSERT INTO funcionario_has_empresa (cod_funcionario, cod_empresa, responsavel) VALUES (5, 37, '0');
INSERT INTO funcionario_has_empresa (cod_funcionario, cod_empresa, responsavel) VALUES (3, 4, '0');


ALTER TABLE funcionario_has_empresa ENABLE TRIGGER ALL;

--
-- TOC entry 2143 (class 0 OID 24806)
-- Dependencies: 1624 2134
-- Data for Name: horario_funcionamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE horario_funcionamento DISABLE TRIGGER ALL;

INSERT INTO horario_funcionamento (cod_empresa, dia_da_semana, hora_inicio, hora_fim) VALUES (37, 'Wednesday', '06:00:00', '23:00:00');
INSERT INTO horario_funcionamento (cod_empresa, dia_da_semana, hora_inicio, hora_fim) VALUES (4, 'Monday', '06:00:00', '23:00:00');
INSERT INTO horario_funcionamento (cod_empresa, dia_da_semana, hora_inicio, hora_fim) VALUES (4, 'Tuesday', '06:00:00', '23:00:00');
INSERT INTO horario_funcionamento (cod_empresa, dia_da_semana, hora_inicio, hora_fim) VALUES (4, 'Wednesday', '06:00:00', '23:00:00');
INSERT INTO horario_funcionamento (cod_empresa, dia_da_semana, hora_inicio, hora_fim) VALUES (4, 'Thursday', '06:00:00', '00:00:00');
INSERT INTO horario_funcionamento (cod_empresa, dia_da_semana, hora_inicio, hora_fim) VALUES (4, 'Friday', '06:00:00', '23:59:00');
INSERT INTO horario_funcionamento (cod_empresa, dia_da_semana, hora_inicio, hora_fim) VALUES (4, 'Saturday', '06:00:00', '23:57:00');
INSERT INTO horario_funcionamento (cod_empresa, dia_da_semana, hora_inicio, hora_fim) VALUES (4, 'Sunday', '07:00:00', '23:59:00');
INSERT INTO horario_funcionamento (cod_empresa, dia_da_semana, hora_inicio, hora_fim) VALUES (37, 'Friday', '13:00:00', '23:00:00');
INSERT INTO horario_funcionamento (cod_empresa, dia_da_semana, hora_inicio, hora_fim) VALUES (37, 'Monday', '06:00:00', '23:00:00');
INSERT INTO horario_funcionamento (cod_empresa, dia_da_semana, hora_inicio, hora_fim) VALUES (37, 'Tuesday', '06:00:00', '21:00:00');
INSERT INTO horario_funcionamento (cod_empresa, dia_da_semana, hora_inicio, hora_fim) VALUES (37, 'Thursday', '06:00:00', '23:00:00');
INSERT INTO horario_funcionamento (cod_empresa, dia_da_semana, hora_inicio, hora_fim) VALUES (37, 'Saturday', '06:00:00', '00:00:00');


ALTER TABLE horario_funcionamento ENABLE TRIGGER ALL;

--
-- TOC entry 2147 (class 0 OID 24842)
-- Dependencies: 1630 2133 2145
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE pedido DISABLE TRIGGER ALL;



ALTER TABLE pedido ENABLE TRIGGER ALL;


--
-- TOC entry 2148 (class 0 OID 24854)
-- Dependencies: 1631 2136 2147
-- Data for Name: itens_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE itens_pedido DISABLE TRIGGER ALL;



ALTER TABLE itens_pedido ENABLE TRIGGER ALL;

--
-- TOC entry 2125 (class 0 OID 24617)
-- Dependencies: 1596
-- Data for Name: promocao_venda_coletiva; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE promocao_venda_coletiva DISABLE TRIGGER ALL;



ALTER TABLE promocao_venda_coletiva ENABLE TRIGGER ALL;

--
-- TOC entry 2146 (class 0 OID 24835)
-- Dependencies: 1628 2125 2145
-- Data for Name: participantes_venda_coletiva; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE participantes_venda_coletiva DISABLE TRIGGER ALL;



ALTER TABLE participantes_venda_coletiva ENABLE TRIGGER ALL;

--
-- TOC entry 2150 (class 0 OID 24871)
-- Dependencies: 1633 2141 2148
-- Data for Name: pedido_personalizado; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE pedido_personalizado DISABLE TRIGGER ALL;



ALTER TABLE pedido_personalizado ENABLE TRIGGER ALL;

--
-- TOC entry 2122 (class 0 OID 24590)
-- Dependencies: 1591
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE role DISABLE TRIGGER ALL;

INSERT INTO role (cod_role, nome) VALUES (2, 'geral');
INSERT INTO role (cod_role, nome) VALUES (1, 'admin');


ALTER TABLE role ENABLE TRIGGER ALL;

--
-- TOC entry 2131 (class 0 OID 24679)
-- Dependencies: 1607 2122 2130
-- Data for Name: privilege; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE privilege DISABLE TRIGGER ALL;

INSERT INTO privilege (cod_funcionario, cod_role) VALUES (1, 1);
INSERT INTO privilege (cod_funcionario, cod_role) VALUES (3, 1);


ALTER TABLE privilege ENABLE TRIGGER ALL;

--
-- TOC entry 2137 (class 0 OID 24740)
-- Dependencies: 1616 2125 2136
-- Data for Name: produto_venda_coletiva; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE produto_venda_coletiva DISABLE TRIGGER ALL;



ALTER TABLE produto_venda_coletiva ENABLE TRIGGER ALL;

--
-- TOC entry 2138 (class 0 OID 24747)
-- Dependencies: 1618 2136
-- Data for Name: promocao; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE promocao DISABLE TRIGGER ALL;

INSERT INTO promocao (cod_promocao, cod_produto, data_inicio, data_fim, preco_promocional, anuncio, removed, cod_tamanho_produto) VALUES (1, 1, '2011-04-01', '2011-04-28', 15.90, 'coco gg', 1, 5);
INSERT INTO promocao (cod_promocao, cod_produto, data_inicio, data_fim, preco_promocional, anuncio, removed, cod_tamanho_produto) VALUES (2, 1, '2011-04-20', '2011-05-26', 67.00, '', 1, 5);
INSERT INTO promocao (cod_promocao, cod_produto, data_inicio, data_fim, preco_promocional, anuncio, removed, cod_tamanho_produto) VALUES (4, 1, '2011-04-20', '2011-04-28', 56.00, '', 1, 5);
INSERT INTO promocao (cod_promocao, cod_produto, data_inicio, data_fim, preco_promocional, anuncio, removed, cod_tamanho_produto) VALUES (3, 1, '2011-04-01', '2011-04-21', 67.00, '', 1, 6);
INSERT INTO promocao (cod_promocao, cod_produto, data_inicio, data_fim, preco_promocional, anuncio, removed, cod_tamanho_produto) VALUES (5, 1, '2011-04-27', '2011-04-30', 67.00, '', 1, 6);
INSERT INTO promocao (cod_promocao, cod_produto, data_inicio, data_fim, preco_promocional, anuncio, removed, cod_tamanho_produto) VALUES (6, 3, '2011-12-01', '2011-12-15', 1.00, '', 0, 12);
INSERT INTO promocao (cod_promocao, cod_produto, data_inicio, data_fim, preco_promocional, anuncio, removed, cod_tamanho_produto) VALUES (7, 3, '2011-12-02', '2011-12-10', 1.26, '', 0, 12);
INSERT INTO promocao (cod_promocao, cod_produto, data_inicio, data_fim, preco_promocional, anuncio, removed, cod_tamanho_produto) VALUES (8, 1, '2011-12-01', '2011-12-15', 49.00, '', 0, 8);
INSERT INTO promocao (cod_promocao, cod_produto, data_inicio, data_fim, preco_promocional, anuncio, removed, cod_tamanho_produto) VALUES (10, 1, '2011-12-16', '2011-12-28', 48.00, '', 0, 8);
INSERT INTO promocao (cod_promocao, cod_produto, data_inicio, data_fim, preco_promocional, anuncio, removed, cod_tamanho_produto) VALUES (9, 1, '2011-11-01', '2011-11-30', 2.00, '', 1, 8);
INSERT INTO promocao (cod_promocao, cod_produto, data_inicio, data_fim, preco_promocional, anuncio, removed, cod_tamanho_produto) VALUES (11, 1, '2011-12-02', '2011-12-14', 30.00, '', 0, 10);


ALTER TABLE promocao ENABLE TRIGGER ALL;

--
-- TOC entry 2154 (class 0 OID 25133)
-- Dependencies: 1639 2134 2135
-- Data for Name: recado_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE recado_cliente DISABLE TRIGGER ALL;

INSERT INTO recado_cliente (cod_recado_cliente, data, texto, hora, cod_empresa, cod_produto) VALUES (43, '2011-12-12', '', '14:00:00', 37, 1);
INSERT INTO recado_cliente (cod_recado_cliente, data, texto, hora, cod_empresa, cod_produto) VALUES (44, '2011-12-12', '', '14:00:00', 37, 2);
INSERT INTO recado_cliente (cod_recado_cliente, data, texto, hora, cod_empresa, cod_produto) VALUES (46, '2011-12-12', '', '14:00:00', 37, 1);
INSERT INTO recado_cliente (cod_recado_cliente, data, texto, hora, cod_empresa, cod_produto) VALUES (47, '2011-12-12', '', '14:00:00', 37, 2);


ALTER TABLE recado_cliente ENABLE TRIGGER ALL;

--
-- TOC entry 2121 (class 0 OID 24579)
-- Dependencies: 1589
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE resource DISABLE TRIGGER ALL;

INSERT INTO resource (cod_resource, name) VALUES (1, 'empresa');
INSERT INTO resource (cod_resource, name) VALUES (2, 'index');
INSERT INTO resource (cod_resource, name) VALUES (3, 'error');
INSERT INTO resource (cod_resource, name) VALUES (4, 'login');
INSERT INTO resource (cod_resource, name) VALUES (5, 'ingredients');
INSERT INTO resource (cod_resource, name) VALUES (6, 'funcionario');


ALTER TABLE resource ENABLE TRIGGER ALL;

--
-- TOC entry 2123 (class 0 OID 24599)
-- Dependencies: 1592 2121 2122
-- Data for Name: role_has_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE role_has_resource DISABLE TRIGGER ALL;

INSERT INTO role_has_resource (cod_role, cod_resource) VALUES (1, 1);
INSERT INTO role_has_resource (cod_role, cod_resource) VALUES (2, 2);
INSERT INTO role_has_resource (cod_role, cod_resource) VALUES (2, 3);
INSERT INTO role_has_resource (cod_role, cod_resource) VALUES (2, 4);
INSERT INTO role_has_resource (cod_role, cod_resource) VALUES (1, 5);
INSERT INTO role_has_resource (cod_role, cod_resource) VALUES (1, 6);


ALTER TABLE role_has_resource ENABLE TRIGGER ALL;

--
-- TOC entry 2149 (class 0 OID 24863)
-- Dependencies: 1632 2135 2148
-- Data for Name: sabores_pizza; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE sabores_pizza DISABLE TRIGGER ALL;



ALTER TABLE sabores_pizza ENABLE TRIGGER ALL;

--
-- TOC entry 2140 (class 0 OID 24772)
-- Dependencies: 1621 2126 2134
-- Data for Name: tipos_produtos_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE tipos_produtos_empresa DISABLE TRIGGER ALL;

INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (1, 9);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (2, 9);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (1, 10);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (2, 10);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (1, 12);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (2, 12);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (1, 16);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (1, 13);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (2, 13);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (1, 32);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (2, 32);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (1, 28);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (2, 28);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (2, 26);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (1, 37);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (2, 37);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (6, 37);
INSERT INTO tipos_produtos_empresa (cod_tipo_produto, cod_empresa) VALUES (4, 4);


ALTER TABLE tipos_produtos_empresa ENABLE TRIGGER ALL;

-- Completed on 2011-12-21 16:43:23

--
-- PostgreSQL database dump complete
--

