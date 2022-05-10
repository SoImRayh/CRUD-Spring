--
-- PostgreSQL database dump
--

-- Dumped from database version 10.20 (Debian 10.20-1.pgdg90+1)
-- Dumped by pg_dump version 12.0

-- Started on 2022-04-13 05:33:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

--
-- TOC entry 225 (class 1259 OID 24791)
-- Name: agencia_bancaria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agencia_bancaria (
    id integer NOT NULL,
    id_banco integer NOT NULL,
    endereco text,
    fone bigint,
    tipo integer,
    fone1 bigint,
    tipo1 integer,
    agencia text NOT NULL,
    nome_agencia text
);


--
-- TOC entry 224 (class 1259 OID 24789)
-- Name: agencia_bancaria_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.agencia_bancaria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 224
-- Name: agencia_bancaria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.agencia_bancaria_id_seq OWNED BY public.agencia_bancaria.id;


--
-- TOC entry 299 (class 1259 OID 25552)
-- Name: auditlog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auditlog (
    id integer NOT NULL,
    model character varying(255) NOT NULL,
    action character varying(255) NOT NULL,
    old text,
    new text,
    at timestamp(0) without time zone,
    by integer
);


--
-- TOC entry 298 (class 1259 OID 25550)
-- Name: auditlog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auditlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 298
-- Name: auditlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auditlog_id_seq OWNED BY public.auditlog.id;


--
-- TOC entry 207 (class 1259 OID 24583)
-- Name: banco; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.banco (
    id integer NOT NULL,
    nome text NOT NULL,
    numero text
);


--
-- TOC entry 206 (class 1259 OID 24581)
-- Name: banco_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.banco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 206
-- Name: banco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.banco_id_seq OWNED BY public.banco.id;


--
-- TOC entry 231 (class 1259 OID 24869)
-- Name: bandeiras; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bandeiras (
    id integer NOT NULL,
    nome text NOT NULL,
    logomarca text NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 24867)
-- Name: bandeiras_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bandeiras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 230
-- Name: bandeiras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bandeiras_id_seq OWNED BY public.bandeiras.id;


--
-- TOC entry 306 (class 1259 OID 25654)
-- Name: boleto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.boleto (
    id integer NOT NULL,
    emissao date DEFAULT '2022-04-06'::date NOT NULL,
    numero text NOT NULL,
    valor numeric(19,4),
    pagamento_id integer,
    pago boolean,
    tipo_pagamento_id integer
);


--
-- TOC entry 305 (class 1259 OID 25652)
-- Name: boleto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.boleto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 305
-- Name: boleto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.boleto_id_seq OWNED BY public.boleto.id;


--
-- TOC entry 344 (class 1259 OID 26263)
-- Name: caixa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.caixa (
    id integer NOT NULL,
    nome text,
    funcionario_ativo integer
);


--
-- TOC entry 343 (class 1259 OID 26261)
-- Name: caixa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.caixa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3874 (class 0 OID 0)
-- Dependencies: 343
-- Name: caixa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.caixa_id_seq OWNED BY public.caixa.id;


--
-- TOC entry 235 (class 1259 OID 24896)
-- Name: cartao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cartao (
    id integer NOT NULL,
    id_bandeira integer NOT NULL,
    id_operadora integer NOT NULL,
    "id_contaCorrente" integer NOT NULL,
    cartao integer NOT NULL,
    tipo integer NOT NULL,
    dia integer,
    titular text,
    taxa numeric(19,4),
    status boolean DEFAULT true
);


--
-- TOC entry 239 (class 1259 OID 24935)
-- Name: cartao_adicional; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cartao_adicional (
    id integer NOT NULL,
    nome text NOT NULL,
    id_cartao integer NOT NULL,
    status boolean DEFAULT true
);


--
-- TOC entry 238 (class 1259 OID 24933)
-- Name: cartao_adicional_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cartao_adicional_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 238
-- Name: cartao_adicional_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cartao_adicional_id_seq OWNED BY public.cartao_adicional.id;


--
-- TOC entry 234 (class 1259 OID 24894)
-- Name: cartao_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cartao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3876 (class 0 OID 0)
-- Dependencies: 234
-- Name: cartao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cartao_id_seq OWNED BY public.cartao.id;


--
-- TOC entry 237 (class 1259 OID 24922)
-- Name: cartao_parcelas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cartao_parcelas (
    id integer NOT NULL,
    n_parcela integer NOT NULL,
    taxa double precision NOT NULL,
    id_cartao integer NOT NULL,
    status boolean DEFAULT true NOT NULL,
    "dataInicial" date DEFAULT '2022-04-06'::date NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 24920)
-- Name: cartao_parcelas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cartao_parcelas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3877 (class 0 OID 0)
-- Dependencies: 236
-- Name: cartao_parcelas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cartao_parcelas_id_seq OWNED BY public.cartao_parcelas.id;


--
-- TOC entry 209 (class 1259 OID 24594)
-- Name: cd_complementares; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cd_complementares (
    id integer NOT NULL,
    nome text NOT NULL,
    tipo text NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 24592)
-- Name: cd_complementares_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cd_complementares_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3878 (class 0 OID 0)
-- Dependencies: 208
-- Name: cd_complementares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cd_complementares_id_seq OWNED BY public.cd_complementares.id;


--
-- TOC entry 281 (class 1259 OID 25330)
-- Name: cheque; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cheque (
    id integer NOT NULL,
    tipo_pessoa integer NOT NULL,
    cpf_cnpj bigint NOT NULL,
    titular text,
    banco_id integer,
    agencia text,
    conta_corrente text,
    n_cheque text,
    tipo_pagamento_id integer,
    status integer,
    situacao integer DEFAULT 49,
    data_deposito date DEFAULT '2022-04-06'::date NOT NULL,
    data_compensacao date
);


--
-- TOC entry 280 (class 1259 OID 25328)
-- Name: cheque_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cheque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3879 (class 0 OID 0)
-- Dependencies: 280
-- Name: cheque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cheque_id_seq OWNED BY public.cheque.id;


--
-- TOC entry 275 (class 1259 OID 25229)
-- Name: compra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.compra (
    id integer NOT NULL,
    id_fisico integer,
    id_juridico integer,
    tipo_documento integer NOT NULL,
    data date NOT NULL,
    numero integer NOT NULL,
    "valorTotalDoc" numeric(19,4) NOT NULL,
    frete numeric(19,4),
    "outrasDespesas" numeric(19,4),
    observacoes text,
    status boolean DEFAULT false NOT NULL,
    contas_pagar_id integer,
    frete_status boolean DEFAULT false,
    frete_contas_pagar_id integer,
    id_juridico_frete integer,
    id_fisico_frete integer
);


--
-- TOC entry 274 (class 1259 OID 25227)
-- Name: compra_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.compra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3880 (class 0 OID 0)
-- Dependencies: 274
-- Name: compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.compra_id_seq OWNED BY public.compra.id;


--
-- TOC entry 328 (class 1259 OID 26113)
-- Name: configuracao_boleto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.configuracao_boleto (
    id integer NOT NULL,
    boleto_cloud_token text,
    vencimento text,
    especie_doc text,
    juros double precision,
    multa double precision,
    boleto_instrucao text,
    conta_corrente_id integer
);


--
-- TOC entry 327 (class 1259 OID 26111)
-- Name: configuracao_boleto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.configuracao_boleto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 327
-- Name: configuracao_boleto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.configuracao_boleto_id_seq OWNED BY public.configuracao_boleto.id;


--
-- TOC entry 326 (class 1259 OID 26102)
-- Name: configuracao_empresa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.configuracao_empresa (
    id integer NOT NULL,
    nome_loja text NOT NULL,
    cnpj_loja bigint NOT NULL,
    logo text,
    admin_email text,
    endereco_cep text,
    endereco_logradouro text,
    endereco_numero text,
    endereco_bairro text,
    endereco_cidade text,
    endereco_uf text,
    endereco_complemento text,
    boleto_cloud_token_api text
);


--
-- TOC entry 325 (class 1259 OID 26100)
-- Name: configuracao_empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.configuracao_empresa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 325
-- Name: configuracao_empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.configuracao_empresa_id_seq OWNED BY public.configuracao_empresa.id;


--
-- TOC entry 227 (class 1259 OID 24817)
-- Name: conta_corrente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conta_corrente (
    id integer NOT NULL,
    id_agencia_bancaria integer NOT NULL,
    tipo integer NOT NULL,
    aplicacao integer NOT NULL,
    n_conta text NOT NULL,
    contabil integer DEFAULT 1,
    saldo numeric(19,4) DEFAULT 0
);


--
-- TOC entry 226 (class 1259 OID 24815)
-- Name: conta_corrente_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conta_corrente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 226
-- Name: conta_corrente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conta_corrente_id_seq OWNED BY public.conta_corrente.id;


--
-- TOC entry 301 (class 1259 OID 25563)
-- Name: contas_pagar; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contas_pagar (
    id integer NOT NULL,
    id_fisico integer,
    id_juridico integer,
    tipo_documento integer NOT NULL,
    data date NOT NULL,
    numero integer NOT NULL,
    historico text,
    valor numeric(19,4) NOT NULL,
    n_parcela integer DEFAULT 0 NOT NULL,
    status boolean DEFAULT false NOT NULL,
    vencimento date DEFAULT '2022-04-06'::date
);


--
-- TOC entry 300 (class 1259 OID 25561)
-- Name: contas_pagar_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contas_pagar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3884 (class 0 OID 0)
-- Dependencies: 300
-- Name: contas_pagar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contas_pagar_id_seq OWNED BY public.contas_pagar.id;


--
-- TOC entry 314 (class 1259 OID 25833)
-- Name: contas_receber; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contas_receber (
    id integer NOT NULL,
    id_fisico integer,
    id_juridico integer,
    tipo_documento integer NOT NULL,
    data date NOT NULL,
    numero integer,
    historico integer,
    valor numeric(19,4) NOT NULL,
    n_parcela integer NOT NULL,
    status boolean DEFAULT false,
    vencimento date NOT NULL
);


--
-- TOC entry 313 (class 1259 OID 25831)
-- Name: contas_receber_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contas_receber_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 313
-- Name: contas_receber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contas_receber_id_seq OWNED BY public.contas_receber.id;


--
-- TOC entry 229 (class 1259 OID 24848)
-- Name: contato_banco; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contato_banco (
    id integer NOT NULL,
    nome text,
    funcao text,
    fone bigint,
    tipo integer,
    email text,
    id_conta_corrente integer,
    id_agencia_bancaria integer
);


--
-- TOC entry 228 (class 1259 OID 24846)
-- Name: contato_banco_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contato_banco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 228
-- Name: contato_banco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contato_banco_id_seq OWNED BY public.contato_banco.id;


--
-- TOC entry 348 (class 1259 OID 26292)
-- Name: departamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.departamento (
    id integer NOT NULL,
    descricao text NOT NULL,
    departamento_id integer
);


--
-- TOC entry 347 (class 1259 OID 26290)
-- Name: departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 347
-- Name: departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.departamento_id_seq OWNED BY public.departamento.id;


--
-- TOC entry 251 (class 1259 OID 25018)
-- Name: deposito; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.deposito (
    id integer NOT NULL,
    "id_contaCorrente" integer NOT NULL,
    "valorDinheiro" numeric(19,4),
    "valorCheque" numeric(19,4),
    data date DEFAULT '2022-04-06'::date,
    fechamento_caixa_id integer,
    relacao_caixa_id integer,
    tesouraria_id integer,
    fechamento_tesouraria_id integer
);


--
-- TOC entry 297 (class 1259 OID 25497)
-- Name: deposito_cheque; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.deposito_cheque (
    id integer NOT NULL,
    cheque_id integer NOT NULL,
    deposito_id integer NOT NULL
);


--
-- TOC entry 296 (class 1259 OID 25495)
-- Name: deposito_cheque_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.deposito_cheque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 296
-- Name: deposito_cheque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.deposito_cheque_id_seq OWNED BY public.deposito_cheque.id;


--
-- TOC entry 250 (class 1259 OID 25016)
-- Name: deposito_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.deposito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3889 (class 0 OID 0)
-- Dependencies: 250
-- Name: deposito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.deposito_id_seq OWNED BY public.deposito.id;


--
-- TOC entry 322 (class 1259 OID 26020)
-- Name: descricao_evento_bancario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.descricao_evento_bancario (
    id integer NOT NULL,
    descricao text NOT NULL,
    tipo_movimentacao integer NOT NULL,
    altera_saldo boolean NOT NULL
);


--
-- TOC entry 321 (class 1259 OID 26018)
-- Name: descricao_evento_bancario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.descricao_evento_bancario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 321
-- Name: descricao_evento_bancario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.descricao_evento_bancario_id_seq OWNED BY public.descricao_evento_bancario.id;


--
-- TOC entry 295 (class 1259 OID 25482)
-- Name: entrada_produto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.entrada_produto (
    id integer NOT NULL,
    data_entrada date DEFAULT '2022-04-06'::date,
    qnt integer NOT NULL,
    valor_custo numeric(10,0),
    ipi numeric(10,0),
    valor_total numeric(10,0) DEFAULT 0 NOT NULL,
    produto_id integer NOT NULL
);


--
-- TOC entry 294 (class 1259 OID 25480)
-- Name: entrada_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.entrada_produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 294
-- Name: entrada_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.entrada_produto_id_seq OWNED BY public.entrada_produto.id;


--
-- TOC entry 320 (class 1259 OID 25999)
-- Name: evento_bancario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.evento_bancario (
    id integer NOT NULL,
    classificao_contabil text,
    historico text NOT NULL,
    conta_corrente_id integer NOT NULL,
    valor numeric(19,4) NOT NULL,
    descricao_evento_bancario_id integer,
    data date,
    data_compensacao date
);


--
-- TOC entry 319 (class 1259 OID 25997)
-- Name: evento_bancario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.evento_bancario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 319
-- Name: evento_bancario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.evento_bancario_id_seq OWNED BY public.evento_bancario.id;


--
-- TOC entry 310 (class 1259 OID 25792)
-- Name: fechamento_caixa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fechamento_caixa (
    id integer NOT NULL,
    data date DEFAULT '2022-04-06'::date NOT NULL,
    saldo_inicial numeric(19,4) DEFAULT 0 NOT NULL,
    saldo_final numeric(19,4) NOT NULL,
    funcionario_id integer,
    relacao_id integer
);


--
-- TOC entry 309 (class 1259 OID 25790)
-- Name: fechamento_caixa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fechamento_caixa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 309
-- Name: fechamento_caixa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fechamento_caixa_id_seq OWNED BY public.fechamento_caixa.id;


--
-- TOC entry 350 (class 1259 OID 26345)
-- Name: fechamento_tesouraria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fechamento_tesouraria (
    id integer NOT NULL,
    data date DEFAULT '2022-04-06'::date NOT NULL,
    saldo_inicial numeric(19,4) DEFAULT 0 NOT NULL,
    saldo_final numeric(19,4) NOT NULL,
    funcionario_id integer,
    tesouraria_id integer
);


--
-- TOC entry 349 (class 1259 OID 26343)
-- Name: fechamento_tesouraria_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fechamento_tesouraria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 349
-- Name: fechamento_tesouraria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fechamento_tesouraria_id_seq OWNED BY public.fechamento_tesouraria.id;


--
-- TOC entry 241 (class 1259 OID 24951)
-- Name: financeira; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.financeira (
    id integer NOT NULL,
    nome text NOT NULL,
    sigla text NOT NULL,
    "id_contaCorrente" integer NOT NULL,
    dia integer,
    parcelas integer,
    taxa numeric(19,4)
);


--
-- TOC entry 243 (class 1259 OID 24968)
-- Name: financeira_condicao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.financeira_condicao (
    id integer NOT NULL,
    parcela integer,
    id_financeira integer,
    status boolean DEFAULT true,
    dia integer,
    taxa numeric(19,4)
);


--
-- TOC entry 242 (class 1259 OID 24966)
-- Name: financeira_condicao_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.financeira_condicao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 242
-- Name: financeira_condicao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.financeira_condicao_id_seq OWNED BY public.financeira_condicao.id;


--
-- TOC entry 240 (class 1259 OID 24949)
-- Name: financeira_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.financeira_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3896 (class 0 OID 0)
-- Dependencies: 240
-- Name: financeira_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.financeira_id_seq OWNED BY public.financeira.id;


--
-- TOC entry 312 (class 1259 OID 25820)
-- Name: folha_cheque_pagamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.folha_cheque_pagamento (
    id integer NOT NULL,
    numero integer,
    valor numeric(19,4) NOT NULL,
    data_deposito date NOT NULL,
    cheque_id integer
);


--
-- TOC entry 311 (class 1259 OID 25818)
-- Name: folha_cheque_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.folha_cheque_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 311
-- Name: folha_cheque_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.folha_cheque_pagamento_id_seq OWNED BY public.folha_cheque_pagamento.id;


--
-- TOC entry 249 (class 1259 OID 25005)
-- Name: folhas_cheque; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.folhas_cheque (
    id integer NOT NULL,
    numero bigint,
    "id_contaCorrente" integer,
    usado boolean DEFAULT false,
    valor numeric(19,4) DEFAULT 0,
    tipo_pagamento_id integer,
    data_vencimento date,
    compensado boolean DEFAULT false
);


--
-- TOC entry 248 (class 1259 OID 25003)
-- Name: folhas_cheque_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.folhas_cheque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3898 (class 0 OID 0)
-- Dependencies: 248
-- Name: folhas_cheque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.folhas_cheque_id_seq OWNED BY public.folhas_cheque.id;


--
-- TOC entry 245 (class 1259 OID 24981)
-- Name: formas_de_pagamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.formas_de_pagamento (
    id integer NOT NULL,
    descricao text NOT NULL,
    id_classificacao integer NOT NULL,
    tipo integer
);


--
-- TOC entry 244 (class 1259 OID 24979)
-- Name: formas_de_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.formas_de_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 12
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3899 (class 0 OID 0)
-- Dependencies: 244
-- Name: formas_de_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.formas_de_pagamento_id_seq OWNED BY public.formas_de_pagamento.id;


--
-- TOC entry 219 (class 1259 OID 24733)
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fornecedor (
    id integer NOT NULL,
    site text,
    observacoes text,
    id_pessoa_fisica integer,
    id_pessoa_juridica integer
);


--
-- TOC entry 218 (class 1259 OID 24731)
-- Name: fornecedor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fornecedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3900 (class 0 OID 0)
-- Dependencies: 218
-- Name: fornecedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fornecedor_id_seq OWNED BY public.fornecedor.id;


--
-- TOC entry 308 (class 1259 OID 25676)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.funcionario (
    id integer NOT NULL,
    num_ficha text,
    funcao integer,
    fbanco integer,
    fagencia text,
    conta_corrente text,
    tipo_conta integer,
    pessoa_fisica_id integer,
    situacao_trabalhista integer,
    motivo integer,
    departamento_id integer
);


--
-- TOC entry 307 (class 1259 OID 25674)
-- Name: funcionario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.funcionario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3901 (class 0 OID 0)
-- Dependencies: 307
-- Name: funcionario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.funcionario_id_seq OWNED BY public.funcionario.id;


--
-- TOC entry 269 (class 1259 OID 25166)
-- Name: grade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grade (
    id integer NOT NULL,
    produto_id integer NOT NULL,
    produto_cor_id integer NOT NULL,
    produto_tamanho_id integer NOT NULL,
    estoque_atual numeric(19,4),
    estoque_minimo numeric(19,4),
    estoque_de_seguranca numeric(19,4)
);


--
-- TOC entry 268 (class 1259 OID 25164)
-- Name: grade_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 268
-- Name: grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grade_id_seq OWNED BY public.grade.id;


--
-- TOC entry 273 (class 1259 OID 25209)
-- Name: item_pedido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_pedido (
    id integer NOT NULL,
    valor_item numeric(19,4) DEFAULT 0 NOT NULL,
    quant_produto integer DEFAULT 1 NOT NULL,
    venda_id integer NOT NULL,
    produto_id integer NOT NULL,
    grade_id integer,
    gerente_id integer
);


--
-- TOC entry 330 (class 1259 OID 26124)
-- Name: item_pedido_certificado; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_pedido_certificado (
    id integer NOT NULL,
    venda_id integer NOT NULL,
    tipo_certificado integer NOT NULL,
    filiado integer NOT NULL,
    tipo integer NOT NULL,
    cnpj text NOT NULL,
    valor numeric(19,4),
    razao_social_nome text,
    fantasia text,
    forma_pagamento integer DEFAULT 1 NOT NULL,
    justificativa text
);


--
-- TOC entry 329 (class 1259 OID 26122)
-- Name: item_pedido_certificado_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_pedido_certificado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 329
-- Name: item_pedido_certificado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.item_pedido_certificado_id_seq OWNED BY public.item_pedido_certificado.id;


--
-- TOC entry 272 (class 1259 OID 25207)
-- Name: item_pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3904 (class 0 OID 0)
-- Dependencies: 272
-- Name: item_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.item_pedido_id_seq OWNED BY public.item_pedido.id;


--
-- TOC entry 285 (class 1259 OID 25364)
-- Name: items_compra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.items_compra (
    id integer NOT NULL,
    id_compra integer NOT NULL,
    id_produto integer NOT NULL,
    qtde integer NOT NULL,
    "valorUnitario" numeric(19,4),
    ipi numeric(19,4),
    status integer,
    grade_id integer
);


--
-- TOC entry 284 (class 1259 OID 25362)
-- Name: items_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.items_compra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3905 (class 0 OID 0)
-- Dependencies: 284
-- Name: items_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.items_compra_id_seq OWNED BY public.items_compra.id;


--
-- TOC entry 205 (class 1259 OID 24576)
-- Name: migration; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


--
-- TOC entry 293 (class 1259 OID 25461)
-- Name: movimentacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movimentacao (
    id integer NOT NULL,
    valor_movimentacao numeric(19,4),
    tipo_movimentacao_id integer NOT NULL,
    tipo_pagamento_id integer,
    data_movimentacao date DEFAULT '2022-04-06'::date NOT NULL,
    hr_movimentacao time(0) without time zone DEFAULT '08:53:41.195326'::time without time zone NOT NULL,
    bloqueado boolean DEFAULT false NOT NULL
);


--
-- TOC entry 318 (class 1259 OID 25975)
-- Name: movimentacao_caixa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movimentacao_caixa (
    id integer NOT NULL,
    data date DEFAULT '2022-04-06'::date NOT NULL,
    tipo integer NOT NULL,
    operacao integer,
    valor numeric(19,4) NOT NULL,
    cheque_id integer
);


--
-- TOC entry 317 (class 1259 OID 25973)
-- Name: movimentacao_caixa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movimentacao_caixa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 317
-- Name: movimentacao_caixa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movimentacao_caixa_id_seq OWNED BY public.movimentacao_caixa.id;


--
-- TOC entry 292 (class 1259 OID 25459)
-- Name: movimentacao_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movimentacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 292
-- Name: movimentacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movimentacao_id_seq OWNED BY public.movimentacao.id;


--
-- TOC entry 336 (class 1259 OID 26185)
-- Name: movimentacao_tesouraria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movimentacao_tesouraria (
    id integer NOT NULL,
    valor numeric(19,4) NOT NULL,
    tipo integer NOT NULL,
    data date NOT NULL,
    fechamento_caixa_id integer,
    confirmacao_recebimento boolean DEFAULT true,
    relacao_id integer,
    fechamento_tesouraria_id integer
);


--
-- TOC entry 342 (class 1259 OID 26235)
-- Name: movimentacao_tesouraria_cheque; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movimentacao_tesouraria_cheque (
    id integer NOT NULL,
    movimentacao_tesouraria_id integer NOT NULL,
    cheque_id integer NOT NULL
);


--
-- TOC entry 341 (class 1259 OID 26233)
-- Name: movimentacao_tesouraria_cheque_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movimentacao_tesouraria_cheque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 341
-- Name: movimentacao_tesouraria_cheque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movimentacao_tesouraria_cheque_id_seq OWNED BY public.movimentacao_tesouraria_cheque.id;


--
-- TOC entry 335 (class 1259 OID 26183)
-- Name: movimentacao_tesouraria_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movimentacao_tesouraria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 335
-- Name: movimentacao_tesouraria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movimentacao_tesouraria_id_seq OWNED BY public.movimentacao_tesouraria.id;


--
-- TOC entry 233 (class 1259 OID 24880)
-- Name: operadora; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.operadora (
    id integer NOT NULL,
    nome text NOT NULL,
    id_banco integer NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 24878)
-- Name: operadora_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.operadora_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 232
-- Name: operadora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.operadora_id_seq OWNED BY public.operadora.id;


--
-- TOC entry 277 (class 1259 OID 25256)
-- Name: pagamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pagamento (
    id integer NOT NULL,
    valor_pagamento numeric(19,4),
    venda_id integer,
    pessoa_fisica_id integer,
    pessoa_juridica_id integer,
    data_pagamento date DEFAULT '2022-04-06'::date NOT NULL,
    tipo integer,
    compra_id integer,
    fechamento_caixa_id integer,
    em_carteira boolean DEFAULT false,
    gravado boolean DEFAULT false,
    relacao_id integer,
    fechamento_tesouraria_id integer,
    tesouraria boolean DEFAULT false,
    contas_receber_id integer
);


--
-- TOC entry 304 (class 1259 OID 25604)
-- Name: pagamento_cheque_terceiros; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pagamento_cheque_terceiros (
    cheque_id integer NOT NULL,
    tipo_pagamento_contas_pagar_id integer NOT NULL
);


--
-- TOC entry 276 (class 1259 OID 25254)
-- Name: pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 276
-- Name: pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pagamento_id_seq OWNED BY public.pagamento.id;


--
-- TOC entry 303 (class 1259 OID 25591)
-- Name: parcelas_contas_pagar; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parcelas_contas_pagar (
    id integer NOT NULL,
    data_vencimento timestamp(0) without time zone,
    valor numeric(19,4),
    contas_pagar_id integer,
    status boolean DEFAULT false NOT NULL,
    pagamento_id integer
);


--
-- TOC entry 302 (class 1259 OID 25589)
-- Name: parcelas_contas_pagar_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parcelas_contas_pagar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 302
-- Name: parcelas_contas_pagar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parcelas_contas_pagar_id_seq OWNED BY public.parcelas_contas_pagar.id;


--
-- TOC entry 316 (class 1259 OID 25873)
-- Name: parcelas_contas_receber; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parcelas_contas_receber (
    id integer NOT NULL,
    data_vencimento timestamp(0) without time zone,
    valor numeric(19,4),
    contas_receber_id integer,
    status boolean DEFAULT false NOT NULL,
    pagamento_id integer
);


--
-- TOC entry 315 (class 1259 OID 25871)
-- Name: parcelas_contas_receber_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parcelas_contas_receber_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 315
-- Name: parcelas_contas_receber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parcelas_contas_receber_id_seq OWNED BY public.parcelas_contas_receber.id;


--
-- TOC entry 283 (class 1259 OID 25351)
-- Name: parcelas_pagamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parcelas_pagamento (
    id integer NOT NULL,
    data_vencimento timestamp(0) without time zone,
    valor numeric(19,4),
    tipo_pagamento_id integer NOT NULL,
    paga boolean DEFAULT false,
    conta_corrente_id integer,
    data_credito date,
    valor_creditado numeric(19,4)
);


--
-- TOC entry 282 (class 1259 OID 25349)
-- Name: parcelas_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parcelas_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 282
-- Name: parcelas_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parcelas_pagamento_id_seq OWNED BY public.parcelas_pagamento.id;


--
-- TOC entry 211 (class 1259 OID 24605)
-- Name: pessoa_fisica; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pessoa_fisica (
    id integer NOT NULL,
    cpf bigint NOT NULL,
    nome text NOT NULL,
    nascimento date,
    sexo integer,
    escolaridade integer,
    estado_civil integer,
    conjuge text,
    mae text,
    pai text,
    n_identidade text,
    orgao_expeditor text,
    ctps text,
    data_expedicao date,
    pis_pasep text,
    nis text,
    titulo_eleitor text,
    zona text,
    secao text,
    habilitacao text,
    categoria integer,
    cep text,
    uf text,
    cidade text,
    bairro text,
    rua text,
    numero integer,
    quadra text,
    lote text,
    complemento text,
    fone bigint,
    tipo integer,
    fone2 bigint,
    tipo2 integer,
    fone3 bigint,
    tipo3 integer,
    email text,
    situacao integer,
    reside date,
    cnpj bigint,
    razao_social text,
    fantasia text,
    df_cep text,
    df_uf text,
    df_cidade text,
    df_bairro text,
    df_rua text,
    df_numero text,
    df_quadra text,
    df_lote text,
    df_complemento text,
    df_fone bigint,
    df_tipo integer,
    df_fone2 bigint,
    df_tipo2 integer,
    cargo_funcao text,
    salario numeric(19,4),
    admissao date,
    ref_empresa text,
    "ref_foneEmpresa" bigint,
    ref_empresa2 text,
    "ref_foneEmpresa2" bigint,
    ref_empresa3 text,
    "ref_foneEmpresa3" bigint,
    ref_pessoa text,
    "ref_fonePessoa" bigint,
    ref_pessoa2 text,
    "ref_fonePessoa2" bigint,
    ref_pessoa3 text,
    "ref_fonePessoa3" bigint,
    banco integer,
    agencia text,
    banco1 integer,
    agencia1 text,
    banco2 integer,
    agencia2 text,
    bandeira integer,
    vencimento date,
    bandeira1 integer,
    vencimento1 date,
    bandeira2 integer,
    vencimento2 date,
    limite_de_credito numeric(19,4),
    n_max_parcelas integer,
    reservista text,
    categoria_reservista integer,
    serie text,
    emissao date,
    limite_credito_atual numeric(19,4) DEFAULT 0,
    cliente boolean
);


--
-- TOC entry 213 (class 1259 OID 24678)
-- Name: pessoa_fisica_dependentes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pessoa_fisica_dependentes (
    id integer NOT NULL,
    nome text,
    nascimento date,
    parentesco integer,
    id_pessoa_fisica integer,
    cpf bigint,
    sexo integer
);


--
-- TOC entry 212 (class 1259 OID 24676)
-- Name: pessoa_fisica_dependentes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pessoa_fisica_dependentes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 212
-- Name: pessoa_fisica_dependentes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pessoa_fisica_dependentes_id_seq OWNED BY public.pessoa_fisica_dependentes.id;


--
-- TOC entry 215 (class 1259 OID 24694)
-- Name: pessoa_fisica_documento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pessoa_fisica_documento (
    id integer NOT NULL,
    arquivo text NOT NULL,
    id_pessoa_fisica integer NOT NULL,
    identificacao text NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 24692)
-- Name: pessoa_fisica_documento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pessoa_fisica_documento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3916 (class 0 OID 0)
-- Dependencies: 214
-- Name: pessoa_fisica_documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pessoa_fisica_documento_id_seq OWNED BY public.pessoa_fisica_documento.id;


--
-- TOC entry 210 (class 1259 OID 24603)
-- Name: pessoa_fisica_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pessoa_fisica_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3917 (class 0 OID 0)
-- Dependencies: 210
-- Name: pessoa_fisica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pessoa_fisica_id_seq OWNED BY public.pessoa_fisica.id;


--
-- TOC entry 217 (class 1259 OID 24710)
-- Name: pessoa_juridica; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pessoa_juridica (
    id integer NOT NULL,
    cnpj bigint NOT NULL,
    fantasia text NOT NULL,
    razao_social text,
    cep text,
    uf text,
    cidade text,
    bairro text,
    rua text,
    numero text,
    quadra text,
    lote text,
    complemento text,
    fone bigint,
    tipo integer,
    fone1 bigint,
    tipo1 integer,
    email text,
    site text,
    cliente boolean
);


--
-- TOC entry 221 (class 1259 OID 24754)
-- Name: pessoa_juridica_contato; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pessoa_juridica_contato (
    id integer NOT NULL,
    fone bigint,
    tipo integer,
    fone1 bigint,
    tipo1 integer,
    email text,
    observacoes text,
    id_pessoajuridica integer,
    nome text NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 24752)
-- Name: pessoa_juridica_contato_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pessoa_juridica_contato_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3918 (class 0 OID 0)
-- Dependencies: 220
-- Name: pessoa_juridica_contato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pessoa_juridica_contato_id_seq OWNED BY public.pessoa_juridica_contato.id;


--
-- TOC entry 216 (class 1259 OID 24708)
-- Name: pessoa_juridica_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pessoa_juridica_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3919 (class 0 OID 0)
-- Dependencies: 216
-- Name: pessoa_juridica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pessoa_juridica_id_seq OWNED BY public.pessoa_juridica.id;


--
-- TOC entry 223 (class 1259 OID 24780)
-- Name: plano_de_contas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plano_de_contas (
    id integer NOT NULL,
    descricao text NOT NULL,
    "classificacaoContabil" integer NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 24778)
-- Name: plano_de_contas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plano_de_contas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3920 (class 0 OID 0)
-- Dependencies: 222
-- Name: plano_de_contas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plano_de_contas_id_seq OWNED BY public.plano_de_contas.id;


--
-- TOC entry 291 (class 1259 OID 25435)
-- Name: preco_produto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.preco_produto (
    id integer NOT NULL,
    id_produto integer NOT NULL,
    "dataInicial" date DEFAULT '2022-04-06'::date NOT NULL,
    "dataFinal" date,
    preco_custo numeric(19,4) NOT NULL,
    preco_venda numeric(19,4) NOT NULL,
    ipi numeric(19,4),
    qtde numeric(19,4),
    documento text,
    historico text,
    tipo integer,
    grade_id integer
);


--
-- TOC entry 290 (class 1259 OID 25433)
-- Name: preco_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.preco_produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3921 (class 0 OID 0)
-- Dependencies: 290
-- Name: preco_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.preco_produto_id_seq OWNED BY public.preco_produto.id;


--
-- TOC entry 289 (class 1259 OID 25395)
-- Name: preco_venda; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.preco_venda (
    id integer NOT NULL,
    status boolean DEFAULT true,
    margem_lucro double precision DEFAULT 0,
    acrescimo_venda_cartao_debito double precision DEFAULT 0,
    acrescimo_venda_cartao_credito double precision DEFAULT 0,
    acrescimo_venda_crediario double precision DEFAULT 0,
    comissao_vendedor double precision DEFAULT 0,
    comissao_gerente double precision DEFAULT 0
);


--
-- TOC entry 288 (class 1259 OID 25393)
-- Name: preco_venda_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.preco_venda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3922 (class 0 OID 0)
-- Dependencies: 288
-- Name: preco_venda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.preco_venda_id_seq OWNED BY public.preco_venda.id;


--
-- TOC entry 265 (class 1259 OID 25109)
-- Name: produto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.produto (
    id integer NOT NULL,
    ref_loja text NOT NULL,
    ref_fabrica text NOT NULL,
    cod_barras text NOT NULL,
    descricao text NOT NULL,
    usa_fraciona boolean NOT NULL,
    usa_grade boolean NOT NULL,
    cor text,
    caracteristicas text,
    estoque_atual numeric(19,4),
    estoque_minimo numeric(19,4),
    estoque_de_seguranca numeric(19,4),
    preco_custo numeric(19,4),
    margem_lucro numeric(19,4),
    comissao_venda numeric(19,4),
    preco_venda numeric(19,4),
    marca_id integer,
    unidade_id integer NOT NULL,
    grupo_id integer,
    classe_id integer,
    subgrupo_id integer,
    subclasse_id integer
);


--
-- TOC entry 263 (class 1259 OID 25093)
-- Name: produto_classe; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.produto_classe (
    id integer NOT NULL,
    descricao text NOT NULL,
    produto_classe_id integer
);


--
-- TOC entry 262 (class 1259 OID 25091)
-- Name: produto_classe_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.produto_classe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3923 (class 0 OID 0)
-- Dependencies: 262
-- Name: produto_classe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.produto_classe_id_seq OWNED BY public.produto_classe.id;


--
-- TOC entry 255 (class 1259 OID 25044)
-- Name: produto_cor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.produto_cor (
    id integer NOT NULL,
    descricao text NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 25042)
-- Name: produto_cor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.produto_cor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3924 (class 0 OID 0)
-- Dependencies: 254
-- Name: produto_cor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.produto_cor_id_seq OWNED BY public.produto_cor.id;


--
-- TOC entry 261 (class 1259 OID 25077)
-- Name: produto_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.produto_grupo (
    id integer NOT NULL,
    descricao text NOT NULL,
    grupo_id_pai integer
);


--
-- TOC entry 260 (class 1259 OID 25075)
-- Name: produto_grupo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.produto_grupo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3925 (class 0 OID 0)
-- Dependencies: 260
-- Name: produto_grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.produto_grupo_id_seq OWNED BY public.produto_grupo.id;


--
-- TOC entry 264 (class 1259 OID 25107)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3926 (class 0 OID 0)
-- Dependencies: 264
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- TOC entry 267 (class 1259 OID 25150)
-- Name: produto_imagens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.produto_imagens (
    id integer NOT NULL,
    tipo integer NOT NULL,
    arquivo text NOT NULL,
    produto_id integer NOT NULL
);


--
-- TOC entry 266 (class 1259 OID 25148)
-- Name: produto_imagens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.produto_imagens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3927 (class 0 OID 0)
-- Dependencies: 266
-- Name: produto_imagens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.produto_imagens_id_seq OWNED BY public.produto_imagens.id;


--
-- TOC entry 259 (class 1259 OID 25066)
-- Name: produto_marca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.produto_marca (
    id integer NOT NULL,
    descricao text NOT NULL
);


--
-- TOC entry 258 (class 1259 OID 25064)
-- Name: produto_marca_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.produto_marca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3928 (class 0 OID 0)
-- Dependencies: 258
-- Name: produto_marca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.produto_marca_id_seq OWNED BY public.produto_marca.id;


--
-- TOC entry 257 (class 1259 OID 25055)
-- Name: produto_tamanho; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.produto_tamanho (
    id integer NOT NULL,
    descricao text NOT NULL,
    tipo integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 25053)
-- Name: produto_tamanho_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.produto_tamanho_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3929 (class 0 OID 0)
-- Dependencies: 256
-- Name: produto_tamanho_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.produto_tamanho_id_seq OWNED BY public.produto_tamanho.id;


--
-- TOC entry 253 (class 1259 OID 25031)
-- Name: produto_unidade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.produto_unidade (
    id integer NOT NULL,
    abreviacao text NOT NULL,
    descricao text NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 25029)
-- Name: produto_unidade_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.produto_unidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3930 (class 0 OID 0)
-- Dependencies: 252
-- Name: produto_unidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.produto_unidade_id_seq OWNED BY public.produto_unidade.id;


--
-- TOC entry 287 (class 1259 OID 25382)
-- Name: programar_pagamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.programar_pagamento (
    id integer NOT NULL,
    id_compra integer NOT NULL,
    tipo integer NOT NULL,
    n_parcelas integer NOT NULL,
    vencimento date NOT NULL,
    valor numeric(19,4)
);


--
-- TOC entry 286 (class 1259 OID 25380)
-- Name: programar_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.programar_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3931 (class 0 OID 0)
-- Dependencies: 286
-- Name: programar_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.programar_pagamento_id_seq OWNED BY public.programar_pagamento.id;


--
-- TOC entry 346 (class 1259 OID 26274)
-- Name: relacao_caixa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.relacao_caixa (
    id integer NOT NULL,
    funcionario_id integer NOT NULL,
    caixa_id integer NOT NULL
);


--
-- TOC entry 345 (class 1259 OID 26272)
-- Name: relacao_caixa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.relacao_caixa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3932 (class 0 OID 0)
-- Dependencies: 345
-- Name: relacao_caixa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.relacao_caixa_id_seq OWNED BY public.relacao_caixa.id;


--
-- TOC entry 332 (class 1259 OID 26148)
-- Name: remessas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.remessas (
    id integer NOT NULL,
    emissao timestamp(0) without time zone,
    arquivo text,
    conta_corrente_id integer
);


--
-- TOC entry 331 (class 1259 OID 26146)
-- Name: remessas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.remessas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3933 (class 0 OID 0)
-- Dependencies: 331
-- Name: remessas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.remessas_id_seq OWNED BY public.remessas.id;


--
-- TOC entry 338 (class 1259 OID 26198)
-- Name: retorno; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.retorno (
    id integer NOT NULL,
    envio timestamp(0) without time zone,
    arquivo text
);


--
-- TOC entry 337 (class 1259 OID 26196)
-- Name: retorno_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.retorno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3934 (class 0 OID 0)
-- Dependencies: 337
-- Name: retorno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.retorno_id_seq OWNED BY public.retorno.id;


--
-- TOC entry 340 (class 1259 OID 26209)
-- Name: senha_gerente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.senha_gerente (
    id integer NOT NULL,
    funcionario_id integer,
    senha text
);


--
-- TOC entry 339 (class 1259 OID 26207)
-- Name: senha_gerente_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.senha_gerente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3935 (class 0 OID 0)
-- Dependencies: 339
-- Name: senha_gerente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.senha_gerente_id_seq OWNED BY public.senha_gerente.id;


--
-- TOC entry 324 (class 1259 OID 26041)
-- Name: servico; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.servico (
    id integer NOT NULL,
    tipo_fornecedor integer NOT NULL,
    codigo_tabela integer,
    codigo_spc_brasil integer,
    servico text NOT NULL,
    plano_de_contas_id integer NOT NULL,
    setor integer NOT NULL,
    preco_custo numeric(19,4) NOT NULL,
    preco_venda numeric(19,4) NOT NULL,
    pacote boolean,
    cnpj bigint,
    fantasia text,
    preco_venda_associado numeric(19,4) NOT NULL,
    preco_venda_associado_parcelado numeric(19,4) NOT NULL,
    preco_venda_associado_prazo numeric(19,4) NOT NULL,
    preco_venda_parcelado numeric(19,4) NOT NULL,
    preco_venda_prazo numeric(19,4) NOT NULL
);


--
-- TOC entry 323 (class 1259 OID 26039)
-- Name: servico_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.servico_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3936 (class 0 OID 0)
-- Dependencies: 323
-- Name: servico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.servico_id_seq OWNED BY public.servico.id;


--
-- TOC entry 334 (class 1259 OID 26174)
-- Name: tesouraria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tesouraria (
    id integer NOT NULL,
    saldo numeric(19,4) NOT NULL,
    nome text
);


--
-- TOC entry 333 (class 1259 OID 26172)
-- Name: tesouraria_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tesouraria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3937 (class 0 OID 0)
-- Dependencies: 333
-- Name: tesouraria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tesouraria_id_seq OWNED BY public.tesouraria.id;


--
-- TOC entry 279 (class 1259 OID 25285)
-- Name: tipo_pagamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_pagamento (
    id integer NOT NULL,
    pagamento_id integer,
    forma_pagamento_id integer,
    bandeira_id integer,
    n_parcelas integer DEFAULT 1 NOT NULL,
    financeira_id integer,
    operadora_id integer,
    conta_corrente_id integer,
    data_deposito_cheque date,
    qnt_cheques integer DEFAULT 1,
    valor numeric(19,4)
);


--
-- TOC entry 278 (class 1259 OID 25283)
-- Name: tipo_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tipo_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3938 (class 0 OID 0)
-- Dependencies: 278
-- Name: tipo_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipo_pagamento_id_seq OWNED BY public.tipo_pagamento.id;


--
-- TOC entry 247 (class 1259 OID 24997)
-- Name: transferencia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transferencia (
    id integer NOT NULL,
    "contaOrigem" integer NOT NULL,
    "contaDestino" integer NOT NULL,
    "valorOrigem" numeric(19,4) DEFAULT 0 NOT NULL,
    data date DEFAULT '2022-04-06'::date
);


--
-- TOC entry 246 (class 1259 OID 24995)
-- Name: transferencia_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transferencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3939 (class 0 OID 0)
-- Dependencies: 246
-- Name: transferencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transferencia_id_seq OWNED BY public.transferencia.id;


--
-- TOC entry 271 (class 1259 OID 25189)
-- Name: venda; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.venda (
    id integer NOT NULL,
    data date DEFAULT '2022-04-06'::date NOT NULL,
    valor_total numeric(19,4),
    pessoa_fisica_id integer,
    pessoa_juridica_id integer,
    paga boolean DEFAULT false,
    pagamento_id integer,
    funcionario_id integer,
    contas_pagar_id integer,
    nome text,
    numero integer,
    fechada boolean DEFAULT false,
    user_id integer,
    orcamento boolean DEFAULT false,
    confirmacao_desconto boolean DEFAULT true,
    tipo_venda integer
);


--
-- TOC entry 270 (class 1259 OID 25187)
-- Name: venda_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.venda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3940 (class 0 OID 0)
-- Dependencies: 270
-- Name: venda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.venda_id_seq OWNED BY public.venda.id;


--
-- TOC entry 3172 (class 2604 OID 24794)
-- Name: agencia_bancaria id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agencia_bancaria ALTER COLUMN id SET DEFAULT nextval('public.agencia_bancaria_id_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 25555)
-- Name: auditlog id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditlog ALTER COLUMN id SET DEFAULT nextval('public.auditlog_id_seq'::regclass);


--
-- TOC entry 3162 (class 2604 OID 24586)
-- Name: banco id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.banco ALTER COLUMN id SET DEFAULT nextval('public.banco_id_seq'::regclass);


--
-- TOC entry 3177 (class 2604 OID 24872)
-- Name: bandeiras id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bandeiras ALTER COLUMN id SET DEFAULT nextval('public.bandeiras_id_seq'::regclass);


--
-- TOC entry 3261 (class 2604 OID 25657)
-- Name: boleto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.boleto ALTER COLUMN id SET DEFAULT nextval('public.boleto_id_seq'::regclass);


--
-- TOC entry 3288 (class 2604 OID 26266)
-- Name: caixa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.caixa ALTER COLUMN id SET DEFAULT nextval('public.caixa_id_seq'::regclass);


--
-- TOC entry 3179 (class 2604 OID 24899)
-- Name: cartao id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartao ALTER COLUMN id SET DEFAULT nextval('public.cartao_id_seq'::regclass);


--
-- TOC entry 3184 (class 2604 OID 24938)
-- Name: cartao_adicional id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartao_adicional ALTER COLUMN id SET DEFAULT nextval('public.cartao_adicional_id_seq'::regclass);


--
-- TOC entry 3181 (class 2604 OID 24925)
-- Name: cartao_parcelas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartao_parcelas ALTER COLUMN id SET DEFAULT nextval('public.cartao_parcelas_id_seq'::regclass);


--
-- TOC entry 3163 (class 2604 OID 24597)
-- Name: cd_complementares id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cd_complementares ALTER COLUMN id SET DEFAULT nextval('public.cd_complementares_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 25333)
-- Name: cheque id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cheque ALTER COLUMN id SET DEFAULT nextval('public.cheque_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 25232)
-- Name: compra id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compra ALTER COLUMN id SET DEFAULT nextval('public.compra_id_seq'::regclass);


--
-- TOC entry 3278 (class 2604 OID 26116)
-- Name: configuracao_boleto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.configuracao_boleto ALTER COLUMN id SET DEFAULT nextval('public.configuracao_boleto_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 26105)
-- Name: configuracao_empresa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.configuracao_empresa ALTER COLUMN id SET DEFAULT nextval('public.configuracao_empresa_id_seq'::regclass);


--
-- TOC entry 3173 (class 2604 OID 24820)
-- Name: conta_corrente id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conta_corrente ALTER COLUMN id SET DEFAULT nextval('public.conta_corrente_id_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 25566)
-- Name: contas_pagar id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contas_pagar ALTER COLUMN id SET DEFAULT nextval('public.contas_pagar_id_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 25836)
-- Name: contas_receber id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contas_receber ALTER COLUMN id SET DEFAULT nextval('public.contas_receber_id_seq'::regclass);


--
-- TOC entry 3176 (class 2604 OID 24851)
-- Name: contato_banco id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contato_banco ALTER COLUMN id SET DEFAULT nextval('public.contato_banco_id_seq'::regclass);


--
-- TOC entry 3290 (class 2604 OID 26295)
-- Name: departamento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departamento ALTER COLUMN id SET DEFAULT nextval('public.departamento_id_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 25021)
-- Name: deposito id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deposito ALTER COLUMN id SET DEFAULT nextval('public.deposito_id_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 25500)
-- Name: deposito_cheque id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deposito_cheque ALTER COLUMN id SET DEFAULT nextval('public.deposito_cheque_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 26023)
-- Name: descricao_evento_bancario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.descricao_evento_bancario ALTER COLUMN id SET DEFAULT nextval('public.descricao_evento_bancario_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 25485)
-- Name: entrada_produto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entrada_produto ALTER COLUMN id SET DEFAULT nextval('public.entrada_produto_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 26002)
-- Name: evento_bancario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evento_bancario ALTER COLUMN id SET DEFAULT nextval('public.evento_bancario_id_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 25795)
-- Name: fechamento_caixa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fechamento_caixa ALTER COLUMN id SET DEFAULT nextval('public.fechamento_caixa_id_seq'::regclass);


--
-- TOC entry 3291 (class 2604 OID 26348)
-- Name: fechamento_tesouraria id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fechamento_tesouraria ALTER COLUMN id SET DEFAULT nextval('public.fechamento_tesouraria_id_seq'::regclass);


--
-- TOC entry 3186 (class 2604 OID 24954)
-- Name: financeira id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.financeira ALTER COLUMN id SET DEFAULT nextval('public.financeira_id_seq'::regclass);


--
-- TOC entry 3187 (class 2604 OID 24971)
-- Name: financeira_condicao id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.financeira_condicao ALTER COLUMN id SET DEFAULT nextval('public.financeira_condicao_id_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 25823)
-- Name: folha_cheque_pagamento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folha_cheque_pagamento ALTER COLUMN id SET DEFAULT nextval('public.folha_cheque_pagamento_id_seq'::regclass);


--
-- TOC entry 3193 (class 2604 OID 25008)
-- Name: folhas_cheque id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folhas_cheque ALTER COLUMN id SET DEFAULT nextval('public.folhas_cheque_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 24984)
-- Name: formas_de_pagamento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.formas_de_pagamento ALTER COLUMN id SET DEFAULT nextval('public.formas_de_pagamento_id_seq'::regclass);


--
-- TOC entry 3169 (class 2604 OID 24736)
-- Name: fornecedor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fornecedor ALTER COLUMN id SET DEFAULT nextval('public.fornecedor_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 25679)
-- Name: funcionario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funcionario ALTER COLUMN id SET DEFAULT nextval('public.funcionario_id_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 25169)
-- Name: grade id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade ALTER COLUMN id SET DEFAULT nextval('public.grade_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 25212)
-- Name: item_pedido id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido ALTER COLUMN id SET DEFAULT nextval('public.item_pedido_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 26127)
-- Name: item_pedido_certificado id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido_certificado ALTER COLUMN id SET DEFAULT nextval('public.item_pedido_certificado_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 25367)
-- Name: items_compra id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items_compra ALTER COLUMN id SET DEFAULT nextval('public.items_compra_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 25464)
-- Name: movimentacao id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao ALTER COLUMN id SET DEFAULT nextval('public.movimentacao_id_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 25978)
-- Name: movimentacao_caixa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao_caixa ALTER COLUMN id SET DEFAULT nextval('public.movimentacao_caixa_id_seq'::regclass);


--
-- TOC entry 3283 (class 2604 OID 26188)
-- Name: movimentacao_tesouraria id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao_tesouraria ALTER COLUMN id SET DEFAULT nextval('public.movimentacao_tesouraria_id_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 26238)
-- Name: movimentacao_tesouraria_cheque id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao_tesouraria_cheque ALTER COLUMN id SET DEFAULT nextval('public.movimentacao_tesouraria_cheque_id_seq'::regclass);


--
-- TOC entry 3178 (class 2604 OID 24883)
-- Name: operadora id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.operadora ALTER COLUMN id SET DEFAULT nextval('public.operadora_id_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 25259)
-- Name: pagamento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento ALTER COLUMN id SET DEFAULT nextval('public.pagamento_id_seq'::regclass);


--
-- TOC entry 3259 (class 2604 OID 25594)
-- Name: parcelas_contas_pagar id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parcelas_contas_pagar ALTER COLUMN id SET DEFAULT nextval('public.parcelas_contas_pagar_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 25876)
-- Name: parcelas_contas_receber id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parcelas_contas_receber ALTER COLUMN id SET DEFAULT nextval('public.parcelas_contas_receber_id_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 25354)
-- Name: parcelas_pagamento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parcelas_pagamento ALTER COLUMN id SET DEFAULT nextval('public.parcelas_pagamento_id_seq'::regclass);


--
-- TOC entry 3164 (class 2604 OID 24608)
-- Name: pessoa_fisica id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica ALTER COLUMN id SET DEFAULT nextval('public.pessoa_fisica_id_seq'::regclass);


--
-- TOC entry 3166 (class 2604 OID 24681)
-- Name: pessoa_fisica_dependentes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica_dependentes ALTER COLUMN id SET DEFAULT nextval('public.pessoa_fisica_dependentes_id_seq'::regclass);


--
-- TOC entry 3167 (class 2604 OID 24697)
-- Name: pessoa_fisica_documento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica_documento ALTER COLUMN id SET DEFAULT nextval('public.pessoa_fisica_documento_id_seq'::regclass);


--
-- TOC entry 3168 (class 2604 OID 24713)
-- Name: pessoa_juridica id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_juridica ALTER COLUMN id SET DEFAULT nextval('public.pessoa_juridica_id_seq'::regclass);


--
-- TOC entry 3170 (class 2604 OID 24757)
-- Name: pessoa_juridica_contato id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_juridica_contato ALTER COLUMN id SET DEFAULT nextval('public.pessoa_juridica_contato_id_seq'::regclass);


--
-- TOC entry 3171 (class 2604 OID 24783)
-- Name: plano_de_contas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plano_de_contas ALTER COLUMN id SET DEFAULT nextval('public.plano_de_contas_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 25438)
-- Name: preco_produto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preco_produto ALTER COLUMN id SET DEFAULT nextval('public.preco_produto_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 25398)
-- Name: preco_venda id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preco_venda ALTER COLUMN id SET DEFAULT nextval('public.preco_venda_id_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 25112)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 25096)
-- Name: produto_classe id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_classe ALTER COLUMN id SET DEFAULT nextval('public.produto_classe_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 25047)
-- Name: produto_cor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_cor ALTER COLUMN id SET DEFAULT nextval('public.produto_cor_id_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 25080)
-- Name: produto_grupo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_grupo ALTER COLUMN id SET DEFAULT nextval('public.produto_grupo_id_seq'::regclass);


--
-- TOC entry 3207 (class 2604 OID 25153)
-- Name: produto_imagens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_imagens ALTER COLUMN id SET DEFAULT nextval('public.produto_imagens_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 25069)
-- Name: produto_marca id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_marca ALTER COLUMN id SET DEFAULT nextval('public.produto_marca_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 25058)
-- Name: produto_tamanho id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_tamanho ALTER COLUMN id SET DEFAULT nextval('public.produto_tamanho_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 25034)
-- Name: produto_unidade id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_unidade ALTER COLUMN id SET DEFAULT nextval('public.produto_unidade_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 25385)
-- Name: programar_pagamento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programar_pagamento ALTER COLUMN id SET DEFAULT nextval('public.programar_pagamento_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 26277)
-- Name: relacao_caixa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relacao_caixa ALTER COLUMN id SET DEFAULT nextval('public.relacao_caixa_id_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 26151)
-- Name: remessas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.remessas ALTER COLUMN id SET DEFAULT nextval('public.remessas_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 26201)
-- Name: retorno id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.retorno ALTER COLUMN id SET DEFAULT nextval('public.retorno_id_seq'::regclass);


--
-- TOC entry 3286 (class 2604 OID 26212)
-- Name: senha_gerente id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.senha_gerente ALTER COLUMN id SET DEFAULT nextval('public.senha_gerente_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 26044)
-- Name: servico id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.servico ALTER COLUMN id SET DEFAULT nextval('public.servico_id_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 26177)
-- Name: tesouraria id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tesouraria ALTER COLUMN id SET DEFAULT nextval('public.tesouraria_id_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 25288)
-- Name: tipo_pagamento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_pagamento ALTER COLUMN id SET DEFAULT nextval('public.tipo_pagamento_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 25000)
-- Name: transferencia id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transferencia ALTER COLUMN id SET DEFAULT nextval('public.transferencia_id_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 25192)
-- Name: venda id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venda ALTER COLUMN id SET DEFAULT nextval('public.venda_id_seq'::regclass);


--
-- TOC entry 3738 (class 0 OID 24791)
-- Dependencies: 225
-- Data for Name: agencia_bancaria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.agencia_bancaria (id, id_banco, endereco, fone, tipo, fone1, tipo1, agencia, nome_agencia) FROM stdin;
\.


--
-- TOC entry 3812 (class 0 OID 25552)
-- Dependencies: 299
-- Data for Name: auditlog; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auditlog (id, model, action, old, new, at, by) FROM stdin;
\.


--
-- TOC entry 3720 (class 0 OID 24583)
-- Dependencies: 207
-- Data for Name: banco; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.banco (id, nome, numero) FROM stdin;
1	Banco do Brasil S.A. 	001
2	Caixa Econômica Federal 	104
3	Itaú Unibanco S.A. 	341
4	Banco Bradesco S.A. 	237
5	Banco BTG Pactual S.A. 	208
6	HSBC Brasil S.A. - Banco de Investimento 	269
7	Banco Safra S.A. 	422
8	Banco Votorantim S.A. 	655
9	Banco Citibank S.A. 	745
10	Banco BNP Paribas Brasil S.A. 	752
11	Banco Credit Suisse (Brasil) S.A. 	505
12	Banco do Nordeste do Brasil S.A. 	004
13	JPMorgan Chase Bank, National Association 	488
14	Banco Cooperativo Sicredi S.A. 	748
15	Banco PAN S.A. 	623
16	Banco Santander (Brasil) S.A. 	033
17	Banco Mercantil de Investimentos S.A. 	
18	Banco Alfa de Investimentos S.A. 	
19	BB Banco de Investimento S.A. 	
20	Banif Banco de Investimento (Brasil) S.A. 	
21	J. Malucelli Distribuidora de Títulos e Valores Mobiliários LTDA. 	
22	Banco Losango S.A. - Banco Múltiplo 	
23	Banco Volvo Brasil S.A. 	
24	Banco Itaú Veículos S.A. 	
25	Banco Volkswagen S.A. 	
26	Banco Ford S.A. 	
27	Banco CNH Industrial Capital S.A. 	
28	Banco Toyota do Brasil S.A. 	
29	Banco PSA Finance Brasil S.A. 	
30	Banco Honda S.A. 	
31	Banco Fidis S.A. 	
32	Banco de Lage Landen Brasil S.A. 	
33	Banco GMAC S.A. 	
34	Banco IBM S.A. 	
35	Banco Moneo S.A. 	
36	Banco CSF S.A. 	
37	Banco Mercedes-Benz do Brasil S.A. 	
38	Banco Yamaha Motor do Brasil S.A. 	
39	Banco Itaucard S.A. 	
40	Banco Itauleasing S.A. 	
41	Scania Banco S.A. 	
42	Banco Randon S.A. 	
43	UNIPRIME Central - Central Interestadual de Cooperativas de Crédito Ltda. 	
44	BV Financeira S.A. - Crédito, Financiamento e Investimento 	
45	Companhia de Crédito, Financiamento e Investimento RCI Brasil 	
46	Omni SA Crédito Financiamento Investimento 	
47	Finamax S.A. - Crédito, Financiamento e Investimento 	
48	BMW Financeira S.A. - Crédito, Financiamento e Investimento 	
49	Santana S.A. - Crédito, Financiamento e Investimento 	
50	BEC Distribuidora de Títulos e Valores Mobiliários LTDA. 	
51	BEM - Distribuidora de Títulos e Valores Mobiliários LTDA. 	
52	BMC Asset Management - Distribuidora de Títulos e Valores Mobiliários LTDA. 	
53	Bradesco Administradora de Consórcios LTDA. 	
54	Bradesco Leasing S.A. Arrecadamento Mercantil 	
55	Bradesco S.A. Corretora de Títulos e Valores Mobiliários 	
56	BRAM - Bradesco Asset Management S.A. Distribuidora de Títulos e Valores Mobiliários 	
57	Crediare S.A. Crédito, Financiamento e Investimento 	
58	Everest Leasing S.A. Arrendamento Mercantil 	
59	Tibre Distribuidora de Títulos e Valores Mobiliários LTDA. 	
60	Ágora Corretora de Títulos e Valores Mobiliários S.A. 	
61	Administradora de Consórcio RCI Brasil LTDA 	
62	Aymoré Crédito, Financiamento e Investimento S.A. 	
63	Banco RCI Brasil S.A. 	
64	Santander Brasil Administradora de Consórcio LTDA. 	
65	Santander Brasil Asset Manag Distribuidora de Títulos e Valores Mobiliários S.A. 	
66	Santander Corretora de Câmbio e Valores Mobiliários S.A. 	
67	Santander Leasing S.A. Arrendamento Mercantil 	
68	Santander Securities Services Brasil Distribuidora de Títulos e Valores Mobiliários S.A. 	
69	Dibens Leasing S.A. Arrendamento Mercantil 	
70	Financeira Itaú CBD S.A. Crédito, Financiamento e Investimento 	
71	Intrag Distribuidora de Títulos e Valores Mobiliários LTDA. 	
72	Itaú Corretora de Valores S.A. 	
73	Itauvest Distribuidora de Títulos e Valores Mobiliários S.A. 	
74	Itaú Administradora de Consórcios LTDA. 	
75	Luizacred S.A. Sociedade de Crédito, Financiamento e Investimento 	
76	Microinvest S.A. Sociedade de Crédito ao Microempreendedor 	
77	Itaú Unibanco Veículos Administradora de Consórcios LTDA. 	
78	Itaú Distribuidora de Títulos e Valores Mobiliários S.A. 	
79	ABC Brasil Distribuidora de Títulos e Valores Mobiliários S.A. 	
80	Agiplan Financeira S.A. - Crédito Financiamento e Investimento 	
81	Agiplan Administradora de Consórcios Ltda 	
82	Alfa Arrendamento Mercantil S.A. 	
83	Alfa Corretora de Câmbio e Valores Mobiliários S.A. 	
84	Financeira Alfa S.A. Crédito, Financiamento e Investimentos 	
85	LLA - Distribuidora de Títulos e Valores Mobiliários LTDA. 	
86	Bancoob Distribuidora de Títulos e Valores Mobiliários LTDA. 	
87	Banestes Distribuidora de Títulos e Valores Mobiliários S/A 	
88	Banrisul S.A. - Administradora de Consórcios 	
89	Banrisul S/A Corretora de Valores Mobiliários e Câmbio 	
90	Barclays Corretora de Títulos e Valores Mobiliários S.A. 	
91	Barigui S.A. Crédito, Financiamento e Investimentos 	
92	Barigui Companhia Hipotecária 	
93	BB Administradora de Consórcios S.A. 	
94	BB Gestão de Recursos - Distribuidora de Títulos e Valores Mobiliários S.A. 	
95	BB Leasing S/A Arrendamento Mercantil 	
96	Besc-Distribuidora de Títulos e Valores Mobiliários SA-Bescval 	
97	Bacor Corretora de Câmbio e Valores Mobiliários S.A. 	
98	Bahia Administração de Recursos Distribuidora de Títulos e Valores Mobiliários S.A. 	
99	Haitong do Brasil Distribuidora de Títulos e Valores Mobiliários S.A. 	
100	Haitong Securities do Brasil Corretora de Câmbio e Valores Mobiliários S.A. 	
101	Bexs Corretora de Câmbio S/A 	
102	BMG Leasing S.A. - Arrendamento Mercantil 	
103	Cifra S.A. Crédito, Financiamento e Investimento 	
104	BMW Leasing do Brasil S.A. - Arrendamento Mercantil 	
105	BNY Mellon Serviços Financeiros Distribuidora de Títulos e Valores Mobiliários S.A. 	
106	Merrill Lynch S.A. Corretora de Títulos e Valores Mobiliários 	
107	BR Consórcios Administradora de Consórcios LTDA 	
108	CONBR Administradora de Consórcios LTDA. 	
109	BR Partners Corretora de Títulos e Valores Mobiliários S.A. 	
110	Brasil Plural Corretora de Câmbio, Títulos e Valores Mobiliários S.A. 	
111	Geração Futuro Corretora de Valores SA. 	
112	BRB - Distribuidora de Títulos e Valores Mobiliários SA 	
113	BRKB Distribuidora de Títulos e Valores Mobiliário S.A. 	
114	Brascan CIA. Hipotecária 	
115	BTG Pactual Asset Management S.A. Distribuidora de Títulos e Valores Mobiliários 	
116	BTG Pactual Corretora de Títulos e Valores Mobiliários S.A. 	
117	Caixa Consórcios S.A Administradora de Consórcios 	
118	CGD Investimentos Corretora de Valores e Câmbio S.A. 	
119	CCB Brasil Arrendamento Mercantil S/A 	
120	CCB Brasil Distribuidora de Títulos e Valores Mobiliários S.A. 	
121	CCB Brasil S.A. - Crédito, Financiamentos e Investimentos 	
122	Citibank Distribuidora de Títulos e Valores Mobiliários S.A 	
123	Citibank Leasing S.A - Arrendamento Mercantil 	
124	CM Capital Markets Corretora de Câmbio, Títulos e Valores Mobiliários LTDA 	
125	CM Capital Markets Distribuidora de Títulos e Valores Mobiliários LTDA 	
126	Coinvalores Corretora de Câmbio e Valores Mobiliários LTDA. 	
127	COIN-Distribuidora de Títulos e Valores Mobiliários LTDA 	
128	Companhia Província de Crédito Imobiliário 	
129	Companhia Hipotecária Piratini - CHP 	
130	Confidence Corretora de Câmbio S.A. 	
131	Ca Indosuez Wealth (Brazil) S.A. Distribuidora de Títulos e Valores Mobiliários 	
132	Credit Suisse (Brasil) Distribuidora de Títulos e Valores Mobiliários S.A. 	
133	Credit Suisse (Brasil) S.A. Corretora de Títulos e Valores Mobiliários 	
134	Credit Suisse Hedging-Griffo Corretora de Valores S.A 	
135	Dacasa Financeira S.A.-Soc. de Créd. Financ. e Investimento 	
136	Uniletra Corretora de Câmbio, Títulos e Valores Mobiliários S.A. 	
137	Daycoval Leasing - Banco Múltiplo S.A. 	
138	Deutsche Bank - Corretora de Valores S.A. 	
139	Fator S.A. - Corretora de Valores 	
140	Gazincred S.A. Sociedade de Crédito, Financiamento e Investimento 	
141	Gmac Administradora de Consórcios LTDA 	
142	Golcred S/A - Crédito, Financiamento e Investimento 	
143	Globo Administradora de Consórcios LTDA. 	
144	Goldman Sachs do Brasil Corretora de Títulos e Valores Mobiliárias S.A. 	
145	Estrela Mineira Crédito, Financiamento e Investimento S/A 	
146	Zema Administradora de Consórcio LTDA 	
147	H H Picchioni S/A Corretora de Câmbio e Valores Mobiliários 	
148	PBM - Picchioni - Belgo - Mineira Distribuidora de Títulos e Valres Mobiliários S/A 	
149	HS Financeira S/A Crédito, Financiamento e Investimentos 	
150	HS Administradora de Consórcios LTDA 	
151	Honda Leasing S.A. - Arrendamento Mercantil 	
152	Kirton Administradora de Consórcio Ltda. 	
153	Bradesco-Kirton Corretora de Títulos e Valores Mobiliários S.A. 	
154	Industrial do Brasil Distribuidora de Títulos e Valores Mobiliários LTDA. 	
155	Distribuidora Intercap de Títulos e Valores Mobiliários S.A. 	
156	Guide Investimentos S.A. - Corretora de Valores 	
157	ING Corretora de Câmbio e Títulos S.A. 	
158	Intermedium Distribuidora de Títulos e Valores Mobiliários LTDA. 	
159	John Deere Distribuidora de Títulos e Valores Mobiliários LTDA. 	
160	Lecca Crédito, Financiamento e Investimento S/A 	
161	Lecca Distribuidora de Títulos e Valores Mobiliários LTDA 	
162	Mapfre Distribuidora de Títulos e Valores Mobiliários S.A. 	
163	Mapfre Administradora de Consórcios S.A. 	
164	Massey Ferguson Administradora de Consórcios LTDA 	
165	Maggi Administradora de Consórcios LTDA 	
166	Valtra Administradora de Consórcios LTDA 	
167	Mercantil do Brasil Corretora S.A. - Câmbio, Títulos e Valores Mobiliários 	
168	Mercantil do Brasil Distribuidora S.A. - Títulos e Valores Mobiliários 	
169	Mercantil do Brasil Financeira S.A - Crédito, Financiamento e Investimentos 	
170	Mercantil do Brasil Leasing S.A. - Arrendamento Mercantil 	
171	Mercedes-Benz Administradora de Consórcios LTDA. 	
172	Mercedes-Benz Leasing do Brasil Arrendamento Mercantil S.A. 	
173	Modal Distribuidora de Títulos e Valores Mobiliários LTDA 	
174	Morgan Stanley Corretora de Títulos e Valores Mobiliários S.A. 	
175	Máxima S.A. Corretora de Câmbio, Títulos e Valores Mobiliários 	
176	IclaTrust Distribuidora de Títulos e Valores Mobiliários S.A. 	
177	Positiva Corretora de Câmbio, Títulos e Valores Mobiliários S.A. 	
178	Omni S.A. Arrendamento Mercantil 	
179	Ourinvest Distribuidora de Títulos e Valores Mobiliários S.A. 	
180	PAN Arrendamento Mercantil S.A. 	
181	PAN Administradora de Consórcio LTDA 	
182	Pernambucanas Financiadora S.A. - Crédito, Financiamento e Investimento 	
183	Finaxis Corretora de Títulos e Valores Mobiliários S.A. 	
184	Pine Investimentos Distribuidoras de Títulos e Valores Mobiliários LTDA 	
185	Planner Corretora de Valores S.A. 	
186	Planner Sociedade de Crédito ao Microempreendedor S.A. 	
187	Planner Trustee Distribuidora de Títulos e Valores Mobiliários LTDA. 	
188	PortoSeg S.A. - Crédito, Financiamento e Investimento 	
189	Porto Seguro Administradora de Consórcios LTDA 	
190	Portopar Distribuidora de Títulos e Valores Mobiliários LTDA 	
191	PSA Finance Arrendamento Mercantil S.A. 	
192	Randon Administradora de Consórcios LTDA. 	
193	Cotação Distribuidora de Títulos e Valores Mobiliários S.A 	
194	BRQualy Administradora de Consórcios LTDA. 	
195	CNF - Administradora de Consórcios Nacional LTDA 	
196	Itabens Administradora de Consórcios LTDA 	
197	Portobens Administradora de Consórcios LTDA 	
198	Rodobens Administradora de Consórcios LTDA. 	
199	J. Safra Corretora de Valores e Câmbio LTDA 	
200	Safra Leasing S.A. Arrendamento Mercantil 	
201	Santinvest S.A - Crédito, Financiamento e Investimentos 	
202	Santinvest S.A - Distribuidora de Títulos e Valores Mobiliários 	
203	Scania Administradora de Consórcios LTDA. 	
204	Administradora de Consórcios Sicredi LTDA 	
205	Sinosserra Financeira S/A - Sociedade de Crédito, Financiamento e Investimento 	
206	Sinosserra Administradora de Consórcios S/A. 	
207	SG Equipment Finance S.A. Arrendamento Mercantil 	
208	Societe Generale S.A. Corretora de Câmbio, Títulos e Valores Mobiliários 	
209	Socopa Sociedade Corretora Paulista S.A. 	
210	Sofisa S.A. Crédito, Financiamento e Investimento 	
211	UBS Brasil Corretora de Câmbio, Títulos e Valores Mobiliários S.A. 	
212	Consórcio Nacional Volkswagen - Administradora de Consórcio LTDA. 	
213	Volvo Administradora de Consórcio LTDA. 	
214	BV Leasing - Arrendamento Mercantil S.A. 	
215	Votorantim - Corretora de Títulos e Valores Mobiliários LTDA. 	
216	Votorantim Asset Management Distribuidora de Títulos e Valores Mobiliários LTDA 	
217	VR Distribuidora de Títulos e Valores Mobiliários LTDA. 	
218	Western Union Corretora de Câmbio S.A. 	
219	XP Investimentos Corretora de Câmbio, Títulos e Valores Mobiliários S/A 	
220	Clear Corretora de Títulos e Valores Mobiliários S.A. 	
221	Yamaha Administradora de Consórcio LTDA. 	
222	BTG Pactual Serviços Financeiros S.A. Distribuidora de Títulos e Valores Mobiliários 	
223	Administradora de Consórcio Nacional Gazin LTDA 	
224	Administradora de Consórcio Nacional Honda LTDA 	
225	Banco Caterpillar S.A. 	
226	BRB - Crédito, Financiamento e Investimento S.A. 	
227	Citigroup Global Markets Brasil, Corretora de Câmbio, Títulos e Valores Mobiliários S.A. 	
228	J.P. Morgan S.A. - Distribuidora de Títulos e Valores Mobiliários 	
229	Ponta Administradora de Consórcios LTDA. 	
230	J.P. Morgan Corretora de Câmbio e Valores Mobiliários S.A. 	
231	Cooperativa de Crédito Mútuo dos Despachantes de Trâns.Sta.Catarina e Rio Grande do Sul - SICOOB 	
232	Banco CBSS S.A. 	
233	Banco Komatsu S.A. 	
234	Banco Vipal S.A. 	
235	Redecard S.A. 	
236	Banco da Amazônia S.A. 	003
237	Banco Nacional de Desenvolvimento Econômico e Social 	007
238	Banco INBURSA de Investimentos S.A. 	012
239	Natixis Brasil S.A. Banco Múltiplo 	014
240	BNY Mellon Banco S.A. 	017
241	Banco Tricury S.A. 	018
242	BANESTES S.A. Banco do Estado do Espírito Santo 	021
243	Banco BANDEPE S.A. 	024
244	Banco Alfa S.A. 	025
245	Banco Itaú Consignado S.A. 	029
246	Banco Bradesco BBI S.A. 	036
247	Banco do Estado do Pará S.A. 	037
248	Banco Cargill S.A. 	040
249	Banco do Estado do Rio Grande do Sul S.A. 	041
250	Banco do Estado de Sergipe S.A. 	047
251	Hipercard Banco Múltiplo S.A. 	062
252	Banco Bradescard S.A. 	063
253	Goldman Sachs do Brasil Banco Múltiplo S.A. 	064
254	Banco Andbank (Brasil) S.A. 	065
255	Banco Morgan Stanley S.A. 	066
256	Banco Crefisa S.A. 	069
257	BRB - Banco de Brasília S.A. 	070
258	Banco J. Safra S.A. 	074
259	Banco ABN AMRO S.A. 	075
260	Banco KDB S.A. 	076
261	Banco Inter S.A. 	077
262	Haitong Banco de Investimento do Brasil S.A. 	078
263	Banco Original do Agronegócio S.A. 	079
264	BBN Banco Brasileiro de Negócios S.A. 	081
265	Banco Topázio S.A. 	082
266	Banco da China Brasil S.A. 	083
267	Uniprime Norte do Paraná - Coop de Economia e Crédito Mútuo dos Médicos, Profissionais das Ciências 	084
268	Cooperativa Central de Crédito Urbano-CECRED 	085-x 
269	Cooperativa Central de Economia e Crédito Mútuo das Unicreds de Santa Catarina e Paraná 	087-6 
270	Cooperativa de Crédito Rural da Região da Mogiana 	089-2 
271	Cooperativa Central de Economia e Crédito Mutuo - SICOOB UNIMAIS 	090-2 
272	Unicred Central do Rio Grande do Sul 	091-4 
273	Brickell S.A. Crédito, Financiamento e Investimento 	092
274	Banco Finaxis S.A. 	094
275	Banco Confidence de Câmbio S.A. 	095
276	Banco B3 S.A. 	096
277	Cooperativa Central de Crédito Noroeste Brasileiro Ltda. 	097
278	CREDIALIANÇA COOPERATIVA DE CRÉDITO RURAL 	098-1 
279	Banco BOCOM BBM S.A. 	107
280	Central das Cooperativas de Economia e Crédito Mútuo do Estado do Espírito Santo Ltda. 	114-7 
281	Standard Chartered Bank (Brasil) S/A–Bco Invest. 	118
282	Banco Western Union do Brasil S.A. 	119
283	Banco Rodobens S.A. 	120
284	Banco Agibank S.A. 	121
285	Banco Bradesco BERJ S.A. 	122
286	Banco Woori Bank do Brasil S.A. 	124
287	Brasil Plural S.A. - Banco Múltiplo 	125
288	BR Partners Banco de Investimento S.A. 	126
289	MS Bank S.A. Banco de Câmbio 	128
290	UBS Brasil Banco de Investimento S.A. 	129
291	ICBC do Brasil Banco Múltiplo S.A. 	132
292	Gradual Corretora de Câmbio,Títulos e Valores Mobiliários S.A. 	135
293	CONFEDERACAO NACIONAL DAS COOPERATIVAS CENTRAIS UNICREDS 	136
294	Intesa Sanpaolo Brasil S.A. - Banco Múltiplo 	139
295	BEXS Banco de Câmbio S.A. 	144
296	Commerzbank Brasil S.A. - Banco Múltiplo 	163
297	Banco Olé Bonsucesso Consignado S.A. 	169
298	Banco Itaú BBA S.A. 	184
299	Banco Bradesco Cartões S.A. 	204
300	Banco Original S.A. 	212
301	Banco Arbi S.A. 	213
302	Banco John Deere S.A. 	217
303	Banco BS2 S.A. 	218
304	Banco Credit Agricole Brasil S.A. 	222
305	Banco Fibra S.A. 	224
306	Banco Cifra S.A. 	233
307	Banco Clássico S.A. 	241
308	Banco Máxima S.A. 	243
309	Banco ABC Brasil S.A. 	246
310	Banco Boavista Interatlântico S.A. 	248
311	Banco Investcred Unibanco S.A. 	249
312	BCV - Banco de Crédito e Varejo S.A. 	250
313	Paraná Banco S.A. 	254
314	Banco Fator S.A. 	265
315	Banco Cédula S.A. 	266
316	Banco de La Nacion Argentina 	300
317	Banco BMG S.A. 	318
318	China Construction Bank (Brasil) Banco Múltiplo S.A. 	320
319	Banco Société Générale Brasil S.A. 	366
320	Banco Mizuho do Brasil S.A. 	370
321	Banco J. P. Morgan S.A. 	376
322	Banco Mercantil do Brasil S.A. 	389
323	Banco Bradesco Financiamentos S.A. 	394
324	Kirton Bank S.A. - Banco Múltiplo 	399
325	Banco Capital S.A. 	412
326	Banco MUFG Brasil S.A. 	456
327	Banco Sumitomo Mitsui Brasileiro S.A. 	464
328	Banco Caixa Geral - Brasil S.A. 	473
329	Citibank N.A. 	477
330	Banco ItauBank S.A 	479
331	Deutsche Bank S.A. - Banco Alemão 	487
332	ING Bank N.V. 	492
333	Banco de La Republica Oriental del Uruguay 	494
334	Banco de La Provincia de Buenos Aires 	495
335	Banco Luso Brasileiro S.A. 	600
336	Banco Industrial do Brasil S.A. 	604
337	Banco VR S.A. 	610
338	Banco Paulista S.A. 	611
339	Banco Guanabara S.A. 	612
340	Banco Pecúnia S.A. 	613
341	Banco Ficsa S.A. 	626
342	Banco Intercap S.A. 	630
343	Banco Rendimento S.A. 	633
344	Banco Triângulo S.A. 	634
345	Banco Sofisa S.A. 	637
346	Banco Alvorada S.A. 	641
347	Banco Pine S.A. 	643
348	Itaú Unibanco Holding S.A. 	652
349	Banco Indusval S.A. 	653
350	Banco A.J.Renner S.A. 	654
351	Banco Porto Real de Investimentos S.A. 	658
352	Banco Daycoval S.A. 	707
353	Banco Ourinvest S.A. 	712
354	Banif-Banco Internacional do Funchal (Brasil)S.A. 	719
355	Banco Maxinvest S.A. 	720
356	Banco Cetelem S.A. 	739
357	Banco Ribeirão Preto S.A. 	741
358	Banco Semear S.A. 	743
359	Banco Modal S.A. 	746
360	Banco Rabobank International Brasil S.A. 	747
361	Scotiabank Brasil S.A. Banco Múltiplo 	751
362	Novo Banco Continental S.A. - Banco Múltiplo 	753
363	Banco Sistema S.A. 	754
364	Bank of America Merrill Lynch Banco Múltiplo S.A. 	755
365	Banco Cooperativo do Brasil S.A. - BANCOOB 	756
366	Banco KEB HANA do Brasil S.A. 	757
\.


--
-- TOC entry 3744 (class 0 OID 24869)
-- Dependencies: 231
-- Data for Name: bandeiras; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bandeiras (id, nome, logomarca) FROM stdin;
1	Mastercard	Mastercard.ico
2	Visa	Visa.ico
3	Visa Electron	Visa Electron.ico
4	Mastercard - Débito	Mastercard - Débito.ico
5	Elo	Elo.ico
6	Diners Club	Diners Club.ico
7	American Express	American Express.ico
8	Hipercard	Hipercard.ico
9	Hiper	Hiper.ico
10	Maestro	Maestro.ico
11	Alelo	Alelo.ico
12	Aura	Aura.ico
13	Banricompras	Banricompras.ico
14	Cabal	Cabal.ico
15	MinasCred	MinasCred.ico
16	Redeshop	Redeshop.ico
17	Sodexo	Sodexo.ico
18	Ticket	Ticket.ico
19	VR Refeição	VR Refeição.ico
\.


--
-- TOC entry 3819 (class 0 OID 25654)
-- Dependencies: 306
-- Data for Name: boleto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.boleto (id, emissao, numero, valor, pagamento_id, pago, tipo_pagamento_id) FROM stdin;
\.


--
-- TOC entry 3857 (class 0 OID 26263)
-- Dependencies: 344
-- Data for Name: caixa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.caixa (id, nome, funcionario_ativo) FROM stdin;
\.


--
-- TOC entry 3748 (class 0 OID 24896)
-- Dependencies: 235
-- Data for Name: cartao; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cartao (id, id_bandeira, id_operadora, "id_contaCorrente", cartao, tipo, dia, titular, taxa, status) FROM stdin;
\.


--
-- TOC entry 3752 (class 0 OID 24935)
-- Dependencies: 239
-- Data for Name: cartao_adicional; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cartao_adicional (id, nome, id_cartao, status) FROM stdin;
\.


--
-- TOC entry 3750 (class 0 OID 24922)
-- Dependencies: 237
-- Data for Name: cartao_parcelas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cartao_parcelas (id, n_parcela, taxa, id_cartao, status, "dataInicial") FROM stdin;
\.


--
-- TOC entry 3722 (class 0 OID 24594)
-- Dependencies: 209
-- Data for Name: cd_complementares; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cd_complementares (id, nome, tipo) FROM stdin;
1	Masculino	sexo
2	Feminino	sexo
3	Ensino fundamental incompleto	escolaridade
4	Ensino fundamental completo	escolaridade
5	Ensino médio incompleto	escolaridade
6	Ensino médio completo	escolaridade
7	Ensino superior incompleto	escolaridade
8	Ensino superior completo	escolaridade
9	Pós-graduação	escolaridade
10	Doutorado	escolaridade
11	Mestrado	escolaridade
12	Solteiro(a)	estado-civil
13	Casado(a)	estado-civil
14	Viúvo(a)	estado-civil
15	Separado(a) judicialmente	estado-civil
16	Divorciado(a)	estado-civil
17	A	cnh
18	B	cnh
19	C	cnh
20	D	cnh
21	E	cnh
22	ACC	cnh
23	Motor-Casa	cnh
24	Fixo	tipo-de-telefone
25	Celular	tipo-de-telefone
26	Whatsapp	tipo-de-telefone
27	Celular + WhatsApp	tipo-de-telefone
28	Fixo + WhatsApp	tipo-de-telefone
29	Cônjuge	grau-de-parentesco
30	Filho	grau-de-parentesco
31	Filha	grau-de-parentesco
32	Pai	grau-de-parentesco
33	Mãe	grau-de-parentesco
34	Conta corrente	tipo-de-conta-bancaria
35	Poupança	tipo-de-conta-bancaria
36	Aplicação financeira	tipo-de-conta-bancaria
37	Aplicação de conta bancária	tipo-de-conta-bancaria
38	Dinheiro	forma-pagamento
39	Cartão de crédito	forma-pagamento
40	Cartão de débito	forma-pagamento
41	Financeira	forma-pagamento
42	Cheque a vista	forma-pagamento
43	Cheque predatado	forma-pagamento
44	Crediário próprio	forma-pagamento
45	Boleto bancário	forma-pagamento
46	Nota fiscal	tipo-documento
47	Recibo	tipo-documento
48	Pedido	tipo-documento
49	Em carteira	situacao-cheque
50	Depositado	situacao-cheque
51	Disponível	situacao-cheque
52	Utilizado	situacao-cheque
53	Compensado	status-cheque
54	A compensar	status-cheque
55	Devolvido	status-cheque
56	Disponível	status-cheque
60	Pago	situacao-cheque
57	Entrada	movimentacao-extrato
58	Contas a Receber	movimentacao-extrato
59	Contas a Pagar	movimentacao-extrato
61	Pagamentos Diversos	tipo-de-aplicacao
62	Recebimentos Diversos	tipo-de-aplicacao
63	Indefinido	funcao-funcionario
64	vendedor	funcao-funcionario
65	gerente	funcao-funcionario
66	dono	funcao-funcionario
67	Indefinido	setor-funcionario
68	Vendas	setor-funcionario
69	Compras	setor-funcionario
70	Conta Corrente	tipo-conta-funcionario
71	Conta Salário	tipo-conta-funcionario
72	CAM	tipo-reservista
73	CDI	tipo-reservista
74	CI	tipo-reservista
75	CRM	tipo-reservista
76	Ativo	situacao-trabalhista
77	Inativo	situacao-trabalhista
78	Afastado	situacao-trabalhista
79	Férias	motivo-afastamento
80	Dispensa Médica	motivo-afastamento
81	Licença Maternidade	motivo-afastamento
82	Licença Paternidade	motivo-afastamento
83	Luto	motivo-afastamento
84	Casamento	motivo-afastamento
85	Doação Voluntária de Sangue	motivo-afastamento
86	Alistamento Eleitoral	motivo-afastamento
87	Convocação para Depoimento	motivo-afastamento
88	Serviço Militar	motivo-afastamento
89	Realização de Vestibular	motivo-afastamento
90	Convocação para comparecimento em juízo	motivo-afastamento
91	Entrada	movimentacao-produto
92	Saída	movimentacao-produto
93	Recebimento de Venda	movimentacao-caixa
94	Recebimento de Cliente	movimentacao-caixa
95	Suprir Caixa	movimentacao-caixa
96	Retirar Caixa	movimentacao-caixa
97	Pagto. Fornecedor	movimentacao-caixa
98	Crédito	tipo-evento-bancario
99	Débito	tipo-evento-bancario
100	SPC Brasil	tipo-fornecedor-servico
101	CDL Anápolis	tipo-fornecedor-servico
102	Terceiros	tipo-fornecedor-servico
104	Outros Serviços	movimentacao-caixa-recebimento-servico
105	Gerente Financeiro	funcao-funcionario
\.


--
-- TOC entry 3794 (class 0 OID 25330)
-- Dependencies: 281
-- Data for Name: cheque; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cheque (id, tipo_pessoa, cpf_cnpj, titular, banco_id, agencia, conta_corrente, n_cheque, tipo_pagamento_id, status, situacao, data_deposito, data_compensacao) FROM stdin;
\.


--
-- TOC entry 3788 (class 0 OID 25229)
-- Dependencies: 275
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.compra (id, id_fisico, id_juridico, tipo_documento, data, numero, "valorTotalDoc", frete, "outrasDespesas", observacoes, status, contas_pagar_id, frete_status, frete_contas_pagar_id, id_juridico_frete, id_fisico_frete) FROM stdin;
\.


--
-- TOC entry 3841 (class 0 OID 26113)
-- Dependencies: 328
-- Data for Name: configuracao_boleto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.configuracao_boleto (id, boleto_cloud_token, vencimento, especie_doc, juros, multa, boleto_instrucao, conta_corrente_id) FROM stdin;
\.


--
-- TOC entry 3839 (class 0 OID 26102)
-- Dependencies: 326
-- Data for Name: configuracao_empresa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.configuracao_empresa (id, nome_loja, cnpj_loja, logo, admin_email, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro, endereco_cidade, endereco_uf, endereco_complemento, boleto_cloud_token_api) FROM stdin;
\.


--
-- TOC entry 3740 (class 0 OID 24817)
-- Dependencies: 227
-- Data for Name: conta_corrente; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conta_corrente (id, id_agencia_bancaria, tipo, aplicacao, n_conta, contabil, saldo) FROM stdin;
\.


--
-- TOC entry 3814 (class 0 OID 25563)
-- Dependencies: 301
-- Data for Name: contas_pagar; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contas_pagar (id, id_fisico, id_juridico, tipo_documento, data, numero, historico, valor, n_parcela, status, vencimento) FROM stdin;
\.


--
-- TOC entry 3827 (class 0 OID 25833)
-- Dependencies: 314
-- Data for Name: contas_receber; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contas_receber (id, id_fisico, id_juridico, tipo_documento, data, numero, historico, valor, n_parcela, status, vencimento) FROM stdin;
\.


--
-- TOC entry 3742 (class 0 OID 24848)
-- Dependencies: 229
-- Data for Name: contato_banco; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contato_banco (id, nome, funcao, fone, tipo, email, id_conta_corrente, id_agencia_bancaria) FROM stdin;
\.


--
-- TOC entry 3861 (class 0 OID 26292)
-- Dependencies: 348
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.departamento (id, descricao, departamento_id) FROM stdin;
\.


--
-- TOC entry 3764 (class 0 OID 25018)
-- Dependencies: 251
-- Data for Name: deposito; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.deposito (id, "id_contaCorrente", "valorDinheiro", "valorCheque", data, fechamento_caixa_id, relacao_caixa_id, tesouraria_id, fechamento_tesouraria_id) FROM stdin;
\.


--
-- TOC entry 3810 (class 0 OID 25497)
-- Dependencies: 297
-- Data for Name: deposito_cheque; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.deposito_cheque (id, cheque_id, deposito_id) FROM stdin;
\.


--
-- TOC entry 3835 (class 0 OID 26020)
-- Dependencies: 322
-- Data for Name: descricao_evento_bancario; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.descricao_evento_bancario (id, descricao, tipo_movimentacao, altera_saldo) FROM stdin;
1	Depósito	98	f
2	Transferência	98	f
3	Compensação Cheques Terceiros	98	f
4	Compensação Cheques Próprios	98	f
5	Devolução de Cheque	98	f
6	Crédito Cartão de Crédito	98	t
7	Crédito Cartão de Débito	98	t
8	Tarifa Bancária	99	t
9	Saque Bancário	99	t
10	Aplicação Financeira	99	t
11	Resgate Aplicação Financeira	98	t
12	Crédito Financeira	98	t
\.


--
-- TOC entry 3808 (class 0 OID 25482)
-- Dependencies: 295
-- Data for Name: entrada_produto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.entrada_produto (id, data_entrada, qnt, valor_custo, ipi, valor_total, produto_id) FROM stdin;
\.


--
-- TOC entry 3833 (class 0 OID 25999)
-- Dependencies: 320
-- Data for Name: evento_bancario; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.evento_bancario (id, classificao_contabil, historico, conta_corrente_id, valor, descricao_evento_bancario_id, data, data_compensacao) FROM stdin;
\.


--
-- TOC entry 3823 (class 0 OID 25792)
-- Dependencies: 310
-- Data for Name: fechamento_caixa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.fechamento_caixa (id, data, saldo_inicial, saldo_final, funcionario_id, relacao_id) FROM stdin;
\.


--
-- TOC entry 3863 (class 0 OID 26345)
-- Dependencies: 350
-- Data for Name: fechamento_tesouraria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.fechamento_tesouraria (id, data, saldo_inicial, saldo_final, funcionario_id, tesouraria_id) FROM stdin;
\.


--
-- TOC entry 3754 (class 0 OID 24951)
-- Dependencies: 241
-- Data for Name: financeira; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.financeira (id, nome, sigla, "id_contaCorrente", dia, parcelas, taxa) FROM stdin;
\.


--
-- TOC entry 3756 (class 0 OID 24968)
-- Dependencies: 243
-- Data for Name: financeira_condicao; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.financeira_condicao (id, parcela, id_financeira, status, dia, taxa) FROM stdin;
\.


--
-- TOC entry 3825 (class 0 OID 25820)
-- Dependencies: 312
-- Data for Name: folha_cheque_pagamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.folha_cheque_pagamento (id, numero, valor, data_deposito, cheque_id) FROM stdin;
\.


--
-- TOC entry 3762 (class 0 OID 25005)
-- Dependencies: 249
-- Data for Name: folhas_cheque; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.folhas_cheque (id, numero, "id_contaCorrente", usado, valor, tipo_pagamento_id, data_vencimento, compensado) FROM stdin;
\.


--
-- TOC entry 3758 (class 0 OID 24981)
-- Dependencies: 245
-- Data for Name: formas_de_pagamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.formas_de_pagamento (id, descricao, id_classificacao, tipo) FROM stdin;
1	Dinheiro	1	\N
2	Cartão de Crédito	1	\N
3	Cartão de Débito	1	\N
4	Cheque Predatado	1	\N
5	Cheque à Vista	1	\N
6	Crediário Próprio	1	\N
7	Financeira	1	\N
8	Dinheiro	1	2
9	Débito Conta Corrente	1	2
10	Cheque a Vista	1	2
11	Cheque Pre Datado	1	2
12	Cheques Terceiros	1	2
13	Dinheiro	1	3
14	Cartão de Crédito	1	3
15	Cartão de Débito	1	3
16	Cheque Pre Datado	1	3
17	Cheques à Vista	1	3
22	Boleto	1	3
\.


--
-- TOC entry 3732 (class 0 OID 24733)
-- Dependencies: 219
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.fornecedor (id, site, observacoes, id_pessoa_fisica, id_pessoa_juridica) FROM stdin;
\.


--
-- TOC entry 3821 (class 0 OID 25676)
-- Dependencies: 308
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.funcionario (id, num_ficha, funcao, fbanco, fagencia, conta_corrente, tipo_conta, pessoa_fisica_id, situacao_trabalhista, motivo, departamento_id) FROM stdin;
\.


--
-- TOC entry 3782 (class 0 OID 25166)
-- Dependencies: 269
-- Data for Name: grade; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.grade (id, produto_id, produto_cor_id, produto_tamanho_id, estoque_atual, estoque_minimo, estoque_de_seguranca) FROM stdin;
\.


--
-- TOC entry 3786 (class 0 OID 25209)
-- Dependencies: 273
-- Data for Name: item_pedido; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item_pedido (id, valor_item, quant_produto, venda_id, produto_id, grade_id, gerente_id) FROM stdin;
\.


--
-- TOC entry 3843 (class 0 OID 26124)
-- Dependencies: 330
-- Data for Name: item_pedido_certificado; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item_pedido_certificado (id, venda_id, tipo_certificado, filiado, tipo, cnpj, valor, razao_social_nome, fantasia, forma_pagamento, justificativa) FROM stdin;
\.


--
-- TOC entry 3798 (class 0 OID 25364)
-- Dependencies: 285
-- Data for Name: items_compra; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.items_compra (id, id_compra, id_produto, qtde, "valorUnitario", ipi, status, grade_id) FROM stdin;
\.


--
-- TOC entry 3718 (class 0 OID 24576)
-- Dependencies: 205
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.migration (version, apply_time) FROM stdin;
m000000_000000_base	1649235219
m180828_170101_banco	1649235219
m180828_170101_cd_complementares	1649235219
m180828_170101_insert_bancos	1649235219
m180828_174914_insert_cd_complementares	1649235219
m180829_190101_pessoa_fisica	1649235219
m180829_190101_pessoa_fisica_dependentes	1649235219
m180829_190101_pessoa_fisica_documento	1649235219
m180920_180101_pessoa_juridica	1649235220
m180921_021055_fornecedor	1649235220
m180921_162807_pessoa_juridica_contato	1649235220
m180922_164643_plano_de_contas	1649235220
m180922_211233_agencia_bancaria	1649235220
m180922_211547_conta_corrente	1649235220
m180922_211611_contato_banco	1649235220
m181023_162844_bandeiras	1649235220
m181023_163107_insert_bandeiras	1649235220
m181023_163710_operadora	1649235220
m181023_164625_cartao	1649235220
m181023_165737_cartao_parcelas	1649235220
m181024_173713_cartao_adicional	1649235220
m181024_180346_financeira	1649235220
m181024_180913_financeira_condicao	1649235220
m181026_164701_formas_de_pagamento	1649235220
m181029_171139_transferencia	1649235220
m181029_171802_folhasCheque	1649235220
m181126_162428_deposito	1649235220
m181130_171735_produto_unidade	1649235220
m181130_172009_produto_cor	1649235220
m181130_172058_produto_tamanho	1649235220
m181130_172131_produto_marca	1649235220
m181130_172205_produto_grupo	1649235220
m181130_172505_produto_classe	1649235220
m181130_172655_produto	1649235220
m181130_173540_produto_imagens	1649235220
m181130_173755_grade	1649235220
m181206_175553_venda	1649235220
m181206_175614_item_pedido	1649235220
m190110_130339_compra	1649235220
m190115_130108_pagamento	1649235220
m190115_130109_tipo_pagamento	1649235220
m190115_130110_cheque	1649235220
m190115_130126_parcelas_pagamento	1649235220
m190121_131823_items_compra	1649235220
m190121_133201_programar_pagamento	1649235220
m190121_135217_preco_venda	1649235220
m190121_174721_add_cheque_in_deposito	1649235221
m190121_181246_insert_new_cd_complementares	1649235221
m190121_193736_add_column_cheque	1649235221
m190122_102206_preco_produto	1649235221
m190122_111847_att_cartao_parcelas	1649235221
m190122_154601_insert_plano_contas	1649235221
m190122_154806_insert_formas_pagamento	1649235221
m190122_162937_insert_cd_complementares	1649235221
m190122_163420_movimentacao	1649235221
m190125_180248_entrada_produto	1649235221
m190128_173110_deposito_cheque	1649235221
m190130_153550_add_column_conta_corrente	1649235221
m190130_182555_add_column_cartao_adicional	1649235221
m190130_194831_add_column_cartao	1649235221
m190131_122015_add_column_financeira	1649235221
m190208_170729_drop_column_financeira_condicao	1649235221
m190208_170740_add_column_financeira	1649235221
m190208_172755_add_column_produto_tamanho	1649235221
m190213_090217_create_auditlog_table	1649235221
m190214_173034_insert_auth_item_group	1649235221
m190214_174051_insert_auth_item	1649235221
m190214_174056_insert_auth_item_child	1649235221
m190227_172648_contas_a_pagar	1649235221
m190227_172734_parcelas_contas_a_pagar	1649235221
m190228_171331_alter_money_in_columns	1649235221
m190307_182310_add_column_pessoa_juridica_contato	1649235221
m190307_182311_add_column_formas_de_pagamento	1649235221
m190307_182320_insert_formas_de_pagamento	1649235221
m190307_182370_pagamento_cheque_terceiros	1649235221
m190307_182380_insert_auth_item	1649235221
m190307_182385_insert_auth_item_child	1649235221
m190307_182390_add_column_parcelas_pagamento	1649235221
m190307_182395_add_column_folha_de_cheque	1649235221
m190307_182400_alter_column_to_money_items_compra	1649235221
m190307_182401_alter_column_to_money_transferencia	1649235221
m190307_182403_add_column_folha_de_cheque	1649235221
m190307_182405_drop_column_tipo_pagamento	1649235221
m190307_182407_create_indexes	1649235221
m190307_182408_boletos	1649235221
m190307_182409_add_column_pagamento_id	1649235221
m190307_182410_add_column_compra	1649235221
m190307_182411_add_column_venda	1649235221
m190307_182412_add_remove_columns_boleto	1649235221
m190531_173104_funcionario	1649235222
m190531_174704_add_columns_pessoa_fisica	1649235222
m190531_180201_insert_cd_complementares	1649235222
m190531_181003_add_columns_pessoa_fisica_dependentes	1649235222
m190610_135027_alter_column_valor_item_item_pedido	1649235222
m190610_163452_alter_column_valor_total_venda	1649235222
m190610_163453_add_column_funcionario_id_venda	1649235222
m190610_163454_alter_column_cpf_venda	1649235222
m190610_163455_alter_column_df_numero_pesssoa_fisica	1649235222
m190610_163456_insert_auth_item	1649235222
m190610_163457_insert_auth_item_child	1649235222
m190610_163458_insert_cd_complementares	1649235222
m190610_163459_alter_column_situacao_motivo_funcionario	1649235222
m190610_163460_alter_column_emissao_pessoa_fisica	1649235222
m190610_163461_insert_auth_item	1649235222
m190610_163462_alter_columns_preco_produto	1649235222
m190610_163463_insert_cd_complementares	1649235222
m190711_122502_alter_columns_ip	1649235222
m190711_122503_alter_column_valor_movimentacao_movimentacao	1649235222
m190711_122504_add_column_data_transferencia	1649235222
m190711_122505_create_caixa	1649235222
m190722_143602_alter_column_data_deposito_default_value	1649235222
m190801_185927_add_column_vencimento_contas_pagar	1649235222
m190802_131004_folha_cheque_pagamento	1649235222
m190807_113333_contas_receber	1649235222
m190808_180651_add_column_frete_status_compra	1649235222
m190812_135140_add_column_numero_venda	1649235222
m190821_164250_parcela_contas_receber	1649235222
m190821_191226_insert_formas_pagagmento	1649235222
m190821_191227_add_column_frete_contas_pagar_id_compra	1649235222
m190904_183126_update_table_preco_venda	1649235222
m190904_183127_update_cartao	1649235222
m190904_183128_add_column_grade_id_item_pedido	1649235222
m190904_183129_add_column_grade_id_item_compra	1649235222
m190917_164620_init_produto_unidade	1649235222
m190917_164621_add_column_conta_corrente_id_parcelas_pagamento	1649235222
m190917_164622_add_columns_grade	1649235222
m190917_164623_add_column_grade_id_preco_produto	1649235222
m190925_171225_add_columns_para_fechamento	1649235222
m190925_171226_add_column_user_id_venda	1649235222
m191003_143900_add_column_dia_financeira_condicao	1649235222
m191003_143901_add_column_parcelas_financeira	1649235222
m191003_143902_add_column_taxa_financeira	1649235222
m191008_110609_add_column_compensado_folhas_cheque	1649235223
m191014_134739_add_frete_fornecedor_compra	1649235223
m191015_155136_movimentacao_caixa	1649235223
m191017_161509_insert_cd_complementares	1649235223
m191017_193508_add_column_movimentacao_caixa	1649235223
m191021_122757_add_column_cheque	1649235223
m191031_171923_add_tipo_pagamento_id_boleto	1649235223
m191031_172906_insert_forma_pagamento	1649235223
m191104_121641_evento_bancario	1649235223
m191104_121642_descricao_evento_bancario	1649235223
m191105_194500_add_column_descricao_evento_bancario_id	1649235223
m191105_194501_drop_columns_evento_bancario	1649235223
m191106_181854_add_data_column_evento_bancario	1649235223
m191106_192809_add_data_column_evento_bancario_compensacao	1649235223
m191112_161639_servico	1649235223
m191112_172631_add_eventos_bancarios	1649235223
m191114_181335_add_permissao_cheque_vendedor	1649235223
m191118_145058_add_column_venda_orcamento	1649235223
m191119_144651_permissoes_servico	1649235223
m191119_172521_add_nome_user	1649235223
m191127_115844_insert_descricao_eventos_bancarios	1649235223
m191127_143018_update_forma_de_pagamento	1649235223
m191129_185426_update_permission	1649235223
m191202_124013_update_auth_item_child	1649235223
m191202_150437_add_vendedor_permissions	1649235223
m191219_112856_add_pessoa_fisica_limite_atual	1649235223
m191219_115554_add_pagamento_carteira	1649235223
m191219_142144_create_table_configuracao_empresa	1649235223
m191219_144521_create_table_configuracao_boleto	1649235223
m191220_143859_add_column_servico_preco_venda_associado	1649235223
m191220_152511_insert_cd_compementares_recebimento_servico	1649235223
m191226_151606_item_pedido_certificado	1649235223
m200102_152608_add_columns_item_pedido_certificado	1649235223
m200106_141354_insert_evento_bancario	1649235223
m200107_133258_confirmacao_venda_desconto	1649235223
m200107_141354_arquivos_remessa	1649235223
m200108_124506_add_colums_servico	1649235223
m200108_141354_delete_columns_empresa	1649235223
m200109_111817_add_column_tipo_pagamento_certificado	1649235224
m200109_141355_add_column_conta	1649235224
m200110_124400_tesouraria	1649235224
m200110_141356_add_column_conta	1649235224
m200111_141356_arquivos_retorno	1649235224
m200111_141357_add_column_token_api	1649235224
m200112_141200_drop_columns_configuracao_boleto	1649235224
m200112_141201_add_column_parcelas_pagamento	1649235224
m200113_141001_create_table_senha_gerente	1649235224
m200113_141003_add_gerente_id	1649235224
m200114_141000_add_column_parcelas_pagamento	1649235224
m200114_145253_fechamento_caixa_tesouraria	1649235224
m200114_160229_justificativa_item_pedido_certificado	1649235224
m200115_123552_movimentacao_tesouraria_cheque	1649235224
m200115_141000_alter_sequence_plano_de_contas	1649235224
m200117_112229_add_column_gravado_pagamento	1649235224
m200118_150851_confirmar_recebimento	1649235224
m200127_135322_multiplo_caixa	1649235224
m200203_113835_relacao_caixa	1649235224
m200204_154409_add_columns_funcionario	1649235224
m200205_112845_drop_sub_departamento	1649235224
m200205_124335_relacao_id_fechamento	1649235224
m200206_133838_add_column_tipo_venda	1649235224
m200402_190501_add_column_cliente_fisico	1649235224
m200406_235308_add_column_cliente_juridico	1649235224
m200407_215333_inserindo_rotas_cliente_pf_pj	1649235224
m200408_012458_inserindo_rotas_departamento	1649235224
m200413_114611_add_column_deposito	1649235224
m200413_124659_alter_column_conta_corrente	1649235224
m200413_152903_create_fechamento_tesouraria	1649235224
m200413_152904_add_column_pagamento	1649235224
m200414_152904_add_column_movimentacao_tesouraria	1649235224
m200415_152904_add_column_deposito	1649235224
m200416_152904_inserindo_gerente_financeiro_cd_complementares	1649235224
m200417_152905_removendo_formas_pagamento	1649235224
m200417_152906_add_column_pagamento	1649235224
\.


--
-- TOC entry 3806 (class 0 OID 25461)
-- Dependencies: 293
-- Data for Name: movimentacao; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.movimentacao (id, valor_movimentacao, tipo_movimentacao_id, tipo_pagamento_id, data_movimentacao, hr_movimentacao, bloqueado) FROM stdin;
\.


--
-- TOC entry 3831 (class 0 OID 25975)
-- Dependencies: 318
-- Data for Name: movimentacao_caixa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.movimentacao_caixa (id, data, tipo, operacao, valor, cheque_id) FROM stdin;
\.


--
-- TOC entry 3849 (class 0 OID 26185)
-- Dependencies: 336
-- Data for Name: movimentacao_tesouraria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.movimentacao_tesouraria (id, valor, tipo, data, fechamento_caixa_id, confirmacao_recebimento, relacao_id, fechamento_tesouraria_id) FROM stdin;
\.


--
-- TOC entry 3855 (class 0 OID 26235)
-- Dependencies: 342
-- Data for Name: movimentacao_tesouraria_cheque; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.movimentacao_tesouraria_cheque (id, movimentacao_tesouraria_id, cheque_id) FROM stdin;
\.


--
-- TOC entry 3746 (class 0 OID 24880)
-- Dependencies: 233
-- Data for Name: operadora; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.operadora (id, nome, id_banco) FROM stdin;
\.


--
-- TOC entry 3790 (class 0 OID 25256)
-- Dependencies: 277
-- Data for Name: pagamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pagamento (id, valor_pagamento, venda_id, pessoa_fisica_id, pessoa_juridica_id, data_pagamento, tipo, compra_id, fechamento_caixa_id, em_carteira, gravado, relacao_id, fechamento_tesouraria_id, tesouraria, contas_receber_id) FROM stdin;
\.


--
-- TOC entry 3817 (class 0 OID 25604)
-- Dependencies: 304
-- Data for Name: pagamento_cheque_terceiros; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pagamento_cheque_terceiros (cheque_id, tipo_pagamento_contas_pagar_id) FROM stdin;
\.


--
-- TOC entry 3816 (class 0 OID 25591)
-- Dependencies: 303
-- Data for Name: parcelas_contas_pagar; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.parcelas_contas_pagar (id, data_vencimento, valor, contas_pagar_id, status, pagamento_id) FROM stdin;
\.


--
-- TOC entry 3829 (class 0 OID 25873)
-- Dependencies: 316
-- Data for Name: parcelas_contas_receber; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.parcelas_contas_receber (id, data_vencimento, valor, contas_receber_id, status, pagamento_id) FROM stdin;
\.


--
-- TOC entry 3796 (class 0 OID 25351)
-- Dependencies: 283
-- Data for Name: parcelas_pagamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.parcelas_pagamento (id, data_vencimento, valor, tipo_pagamento_id, paga, conta_corrente_id, data_credito, valor_creditado) FROM stdin;
\.


--
-- TOC entry 3724 (class 0 OID 24605)
-- Dependencies: 211
-- Data for Name: pessoa_fisica; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pessoa_fisica (id, cpf, nome, nascimento, sexo, escolaridade, estado_civil, conjuge, mae, pai, n_identidade, orgao_expeditor, ctps, data_expedicao, pis_pasep, nis, titulo_eleitor, zona, secao, habilitacao, categoria, cep, uf, cidade, bairro, rua, numero, quadra, lote, complemento, fone, tipo, fone2, tipo2, fone3, tipo3, email, situacao, reside, cnpj, razao_social, fantasia, df_cep, df_uf, df_cidade, df_bairro, df_rua, df_numero, df_quadra, df_lote, df_complemento, df_fone, df_tipo, df_fone2, df_tipo2, cargo_funcao, salario, admissao, ref_empresa, "ref_foneEmpresa", ref_empresa2, "ref_foneEmpresa2", ref_empresa3, "ref_foneEmpresa3", ref_pessoa, "ref_fonePessoa", ref_pessoa2, "ref_fonePessoa2", ref_pessoa3, "ref_fonePessoa3", banco, agencia, banco1, agencia1, banco2, agencia2, bandeira, vencimento, bandeira1, vencimento1, bandeira2, vencimento2, limite_de_credito, n_max_parcelas, reservista, categoria_reservista, serie, emissao, limite_credito_atual, cliente) FROM stdin;
\.


--
-- TOC entry 3726 (class 0 OID 24678)
-- Dependencies: 213
-- Data for Name: pessoa_fisica_dependentes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pessoa_fisica_dependentes (id, nome, nascimento, parentesco, id_pessoa_fisica, cpf, sexo) FROM stdin;
\.


--
-- TOC entry 3728 (class 0 OID 24694)
-- Dependencies: 215
-- Data for Name: pessoa_fisica_documento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pessoa_fisica_documento (id, arquivo, id_pessoa_fisica, identificacao) FROM stdin;
\.


--
-- TOC entry 3730 (class 0 OID 24710)
-- Dependencies: 217
-- Data for Name: pessoa_juridica; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pessoa_juridica (id, cnpj, fantasia, razao_social, cep, uf, cidade, bairro, rua, numero, quadra, lote, complemento, fone, tipo, fone1, tipo1, email, site, cliente) FROM stdin;
\.


--
-- TOC entry 3734 (class 0 OID 24754)
-- Dependencies: 221
-- Data for Name: pessoa_juridica_contato; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pessoa_juridica_contato (id, fone, tipo, fone1, tipo1, email, observacoes, id_pessoajuridica, nome) FROM stdin;
\.


--
-- TOC entry 3736 (class 0 OID 24780)
-- Dependencies: 223
-- Data for Name: plano_de_contas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.plano_de_contas (id, descricao, "classificacaoContabil") FROM stdin;
1	Caixa	1
\.


--
-- TOC entry 3804 (class 0 OID 25435)
-- Dependencies: 291
-- Data for Name: preco_produto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.preco_produto (id, id_produto, "dataInicial", "dataFinal", preco_custo, preco_venda, ipi, qtde, documento, historico, tipo, grade_id) FROM stdin;
\.


--
-- TOC entry 3802 (class 0 OID 25395)
-- Dependencies: 289
-- Data for Name: preco_venda; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.preco_venda (id, status, margem_lucro, acrescimo_venda_cartao_debito, acrescimo_venda_cartao_credito, acrescimo_venda_crediario, comissao_vendedor, comissao_gerente) FROM stdin;
\.


--
-- TOC entry 3778 (class 0 OID 25109)
-- Dependencies: 265
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.produto (id, ref_loja, ref_fabrica, cod_barras, descricao, usa_fraciona, usa_grade, cor, caracteristicas, estoque_atual, estoque_minimo, estoque_de_seguranca, preco_custo, margem_lucro, comissao_venda, preco_venda, marca_id, unidade_id, grupo_id, classe_id, subgrupo_id, subclasse_id) FROM stdin;
\.


--
-- TOC entry 3776 (class 0 OID 25093)
-- Dependencies: 263
-- Data for Name: produto_classe; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.produto_classe (id, descricao, produto_classe_id) FROM stdin;
\.


--
-- TOC entry 3768 (class 0 OID 25044)
-- Dependencies: 255
-- Data for Name: produto_cor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.produto_cor (id, descricao) FROM stdin;
\.


--
-- TOC entry 3774 (class 0 OID 25077)
-- Dependencies: 261
-- Data for Name: produto_grupo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.produto_grupo (id, descricao, grupo_id_pai) FROM stdin;
\.


--
-- TOC entry 3780 (class 0 OID 25150)
-- Dependencies: 267
-- Data for Name: produto_imagens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.produto_imagens (id, tipo, arquivo, produto_id) FROM stdin;
\.


--
-- TOC entry 3772 (class 0 OID 25066)
-- Dependencies: 259
-- Data for Name: produto_marca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.produto_marca (id, descricao) FROM stdin;
\.


--
-- TOC entry 3770 (class 0 OID 25055)
-- Dependencies: 257
-- Data for Name: produto_tamanho; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.produto_tamanho (id, descricao, tipo) FROM stdin;
\.


--
-- TOC entry 3766 (class 0 OID 25031)
-- Dependencies: 253
-- Data for Name: produto_unidade; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.produto_unidade (id, abreviacao, descricao) FROM stdin;
\.


--
-- TOC entry 3800 (class 0 OID 25382)
-- Dependencies: 287
-- Data for Name: programar_pagamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.programar_pagamento (id, id_compra, tipo, n_parcelas, vencimento, valor) FROM stdin;
\.


--
-- TOC entry 3859 (class 0 OID 26274)
-- Dependencies: 346
-- Data for Name: relacao_caixa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.relacao_caixa (id, funcionario_id, caixa_id) FROM stdin;
\.


--
-- TOC entry 3845 (class 0 OID 26148)
-- Dependencies: 332
-- Data for Name: remessas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.remessas (id, emissao, arquivo, conta_corrente_id) FROM stdin;
\.


--
-- TOC entry 3851 (class 0 OID 26198)
-- Dependencies: 338
-- Data for Name: retorno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.retorno (id, envio, arquivo) FROM stdin;
\.


--
-- TOC entry 3853 (class 0 OID 26209)
-- Dependencies: 340
-- Data for Name: senha_gerente; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.senha_gerente (id, funcionario_id, senha) FROM stdin;
\.


--
-- TOC entry 3837 (class 0 OID 26041)
-- Dependencies: 324
-- Data for Name: servico; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.servico (id, tipo_fornecedor, codigo_tabela, codigo_spc_brasil, servico, plano_de_contas_id, setor, preco_custo, preco_venda, pacote, cnpj, fantasia, preco_venda_associado, preco_venda_associado_parcelado, preco_venda_associado_prazo, preco_venda_parcelado, preco_venda_prazo) FROM stdin;
\.


--
-- TOC entry 3847 (class 0 OID 26174)
-- Dependencies: 334
-- Data for Name: tesouraria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tesouraria (id, saldo, nome) FROM stdin;
1	0.0000	Tesouraria
\.


--
-- TOC entry 3792 (class 0 OID 25285)
-- Dependencies: 279
-- Data for Name: tipo_pagamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tipo_pagamento (id, pagamento_id, forma_pagamento_id, bandeira_id, n_parcelas, financeira_id, operadora_id, conta_corrente_id, data_deposito_cheque, qnt_cheques, valor) FROM stdin;
\.


--
-- TOC entry 3760 (class 0 OID 24997)
-- Dependencies: 247
-- Data for Name: transferencia; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transferencia (id, "contaOrigem", "contaDestino", "valorOrigem", data) FROM stdin;
\.


--
-- TOC entry 3784 (class 0 OID 25189)
-- Dependencies: 271
-- Data for Name: venda; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.venda (id, data, valor_total, pessoa_fisica_id, pessoa_juridica_id, paga, pagamento_id, funcionario_id, contas_pagar_id, nome, numero, fechada, user_id, orcamento, confirmacao_desconto, tipo_venda) FROM stdin;
\.


--
-- TOC entry 3941 (class 0 OID 0)
-- Dependencies: 224
-- Name: agencia_bancaria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.agencia_bancaria_id_seq', 1, false);


--
-- TOC entry 3942 (class 0 OID 0)
-- Dependencies: 298
-- Name: auditlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auditlog_id_seq', 1, false);


--
-- TOC entry 3943 (class 0 OID 0)
-- Dependencies: 206
-- Name: banco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.banco_id_seq', 366, true);


--
-- TOC entry 3944 (class 0 OID 0)
-- Dependencies: 230
-- Name: bandeiras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bandeiras_id_seq', 1, false);


--
-- TOC entry 3945 (class 0 OID 0)
-- Dependencies: 305
-- Name: boleto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.boleto_id_seq', 1, false);


--
-- TOC entry 3946 (class 0 OID 0)
-- Dependencies: 343
-- Name: caixa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.caixa_id_seq', 1, false);


--
-- TOC entry 3947 (class 0 OID 0)
-- Dependencies: 238
-- Name: cartao_adicional_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cartao_adicional_id_seq', 1, false);


--
-- TOC entry 3948 (class 0 OID 0)
-- Dependencies: 234
-- Name: cartao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cartao_id_seq', 1, false);


--
-- TOC entry 3949 (class 0 OID 0)
-- Dependencies: 236
-- Name: cartao_parcelas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cartao_parcelas_id_seq', 1, false);


--
-- TOC entry 3950 (class 0 OID 0)
-- Dependencies: 208
-- Name: cd_complementares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cd_complementares_id_seq', 105, true);


--
-- TOC entry 3951 (class 0 OID 0)
-- Dependencies: 280
-- Name: cheque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cheque_id_seq', 1, false);


--
-- TOC entry 3952 (class 0 OID 0)
-- Dependencies: 274
-- Name: compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.compra_id_seq', 1, false);


--
-- TOC entry 3953 (class 0 OID 0)
-- Dependencies: 327
-- Name: configuracao_boleto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.configuracao_boleto_id_seq', 1, false);


--
-- TOC entry 3954 (class 0 OID 0)
-- Dependencies: 325
-- Name: configuracao_empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.configuracao_empresa_id_seq', 1, false);


--
-- TOC entry 3955 (class 0 OID 0)
-- Dependencies: 226
-- Name: conta_corrente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conta_corrente_id_seq', 1, false);


--
-- TOC entry 3956 (class 0 OID 0)
-- Dependencies: 300
-- Name: contas_pagar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contas_pagar_id_seq', 1, false);


--
-- TOC entry 3957 (class 0 OID 0)
-- Dependencies: 313
-- Name: contas_receber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contas_receber_id_seq', 1, false);


--
-- TOC entry 3958 (class 0 OID 0)
-- Dependencies: 228
-- Name: contato_banco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contato_banco_id_seq', 1, false);


--
-- TOC entry 3959 (class 0 OID 0)
-- Dependencies: 347
-- Name: departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.departamento_id_seq', 1, false);


--
-- TOC entry 3960 (class 0 OID 0)
-- Dependencies: 296
-- Name: deposito_cheque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.deposito_cheque_id_seq', 1, false);


--
-- TOC entry 3961 (class 0 OID 0)
-- Dependencies: 250
-- Name: deposito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.deposito_id_seq', 1, false);


--
-- TOC entry 3962 (class 0 OID 0)
-- Dependencies: 321
-- Name: descricao_evento_bancario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.descricao_evento_bancario_id_seq', 1, false);


--
-- TOC entry 3963 (class 0 OID 0)
-- Dependencies: 294
-- Name: entrada_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.entrada_produto_id_seq', 1, false);


--
-- TOC entry 3964 (class 0 OID 0)
-- Dependencies: 319
-- Name: evento_bancario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.evento_bancario_id_seq', 1, false);


--
-- TOC entry 3965 (class 0 OID 0)
-- Dependencies: 309
-- Name: fechamento_caixa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fechamento_caixa_id_seq', 1, false);


--
-- TOC entry 3966 (class 0 OID 0)
-- Dependencies: 349
-- Name: fechamento_tesouraria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fechamento_tesouraria_id_seq', 1, false);


--
-- TOC entry 3967 (class 0 OID 0)
-- Dependencies: 242
-- Name: financeira_condicao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.financeira_condicao_id_seq', 1, false);


--
-- TOC entry 3968 (class 0 OID 0)
-- Dependencies: 240
-- Name: financeira_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.financeira_id_seq', 1, false);


--
-- TOC entry 3969 (class 0 OID 0)
-- Dependencies: 311
-- Name: folha_cheque_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.folha_cheque_pagamento_id_seq', 1, false);


--
-- TOC entry 3970 (class 0 OID 0)
-- Dependencies: 248
-- Name: folhas_cheque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.folhas_cheque_id_seq', 1, false);


--
-- TOC entry 3971 (class 0 OID 0)
-- Dependencies: 244
-- Name: formas_de_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.formas_de_pagamento_id_seq', 1, false);


--
-- TOC entry 3972 (class 0 OID 0)
-- Dependencies: 218
-- Name: fornecedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fornecedor_id_seq', 1, false);


--
-- TOC entry 3973 (class 0 OID 0)
-- Dependencies: 307
-- Name: funcionario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.funcionario_id_seq', 1, false);


--
-- TOC entry 3974 (class 0 OID 0)
-- Dependencies: 268
-- Name: grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grade_id_seq', 1, false);


--
-- TOC entry 3975 (class 0 OID 0)
-- Dependencies: 329
-- Name: item_pedido_certificado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.item_pedido_certificado_id_seq', 1, false);


--
-- TOC entry 3976 (class 0 OID 0)
-- Dependencies: 272
-- Name: item_pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.item_pedido_id_seq', 1, false);


--
-- TOC entry 3977 (class 0 OID 0)
-- Dependencies: 284
-- Name: items_compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.items_compra_id_seq', 1, false);


--
-- TOC entry 3978 (class 0 OID 0)
-- Dependencies: 317
-- Name: movimentacao_caixa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movimentacao_caixa_id_seq', 1, false);


--
-- TOC entry 3979 (class 0 OID 0)
-- Dependencies: 292
-- Name: movimentacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movimentacao_id_seq', 1, false);


--
-- TOC entry 3980 (class 0 OID 0)
-- Dependencies: 341
-- Name: movimentacao_tesouraria_cheque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movimentacao_tesouraria_cheque_id_seq', 1, false);


--
-- TOC entry 3981 (class 0 OID 0)
-- Dependencies: 335
-- Name: movimentacao_tesouraria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movimentacao_tesouraria_id_seq', 1, false);


--
-- TOC entry 3982 (class 0 OID 0)
-- Dependencies: 232
-- Name: operadora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.operadora_id_seq', 1, false);


--
-- TOC entry 3983 (class 0 OID 0)
-- Dependencies: 276
-- Name: pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pagamento_id_seq', 1, false);


--
-- TOC entry 3984 (class 0 OID 0)
-- Dependencies: 302
-- Name: parcelas_contas_pagar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.parcelas_contas_pagar_id_seq', 1, false);


--
-- TOC entry 3985 (class 0 OID 0)
-- Dependencies: 315
-- Name: parcelas_contas_receber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.parcelas_contas_receber_id_seq', 1, false);


--
-- TOC entry 3986 (class 0 OID 0)
-- Dependencies: 282
-- Name: parcelas_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.parcelas_pagamento_id_seq', 1, false);


--
-- TOC entry 3987 (class 0 OID 0)
-- Dependencies: 212
-- Name: pessoa_fisica_dependentes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pessoa_fisica_dependentes_id_seq', 1, false);


--
-- TOC entry 3988 (class 0 OID 0)
-- Dependencies: 214
-- Name: pessoa_fisica_documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pessoa_fisica_documento_id_seq', 1, false);


--
-- TOC entry 3989 (class 0 OID 0)
-- Dependencies: 210
-- Name: pessoa_fisica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pessoa_fisica_id_seq', 1, false);


--
-- TOC entry 3990 (class 0 OID 0)
-- Dependencies: 220
-- Name: pessoa_juridica_contato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pessoa_juridica_contato_id_seq', 1, false);


--
-- TOC entry 3991 (class 0 OID 0)
-- Dependencies: 216
-- Name: pessoa_juridica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pessoa_juridica_id_seq', 1, false);


--
-- TOC entry 3992 (class 0 OID 0)
-- Dependencies: 222
-- Name: plano_de_contas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.plano_de_contas_id_seq', 1, true);


--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 290
-- Name: preco_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.preco_produto_id_seq', 1, false);


--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 288
-- Name: preco_venda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.preco_venda_id_seq', 1, false);


--
-- TOC entry 3995 (class 0 OID 0)
-- Dependencies: 262
-- Name: produto_classe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.produto_classe_id_seq', 1, false);


--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 254
-- Name: produto_cor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.produto_cor_id_seq', 1, false);


--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 260
-- Name: produto_grupo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.produto_grupo_id_seq', 1, false);


--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 264
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.produto_id_seq', 1, false);


--
-- TOC entry 3999 (class 0 OID 0)
-- Dependencies: 266
-- Name: produto_imagens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.produto_imagens_id_seq', 1, false);


--
-- TOC entry 4000 (class 0 OID 0)
-- Dependencies: 258
-- Name: produto_marca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.produto_marca_id_seq', 1, false);


--
-- TOC entry 4001 (class 0 OID 0)
-- Dependencies: 256
-- Name: produto_tamanho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.produto_tamanho_id_seq', 1, false);


--
-- TOC entry 4002 (class 0 OID 0)
-- Dependencies: 252
-- Name: produto_unidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.produto_unidade_id_seq', 1, false);


--
-- TOC entry 4003 (class 0 OID 0)
-- Dependencies: 286
-- Name: programar_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.programar_pagamento_id_seq', 1, false);


--
-- TOC entry 4004 (class 0 OID 0)
-- Dependencies: 345
-- Name: relacao_caixa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.relacao_caixa_id_seq', 1, false);


--
-- TOC entry 4005 (class 0 OID 0)
-- Dependencies: 331
-- Name: remessas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.remessas_id_seq', 1, false);


--
-- TOC entry 4006 (class 0 OID 0)
-- Dependencies: 337
-- Name: retorno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.retorno_id_seq', 1, false);


--
-- TOC entry 4007 (class 0 OID 0)
-- Dependencies: 339
-- Name: senha_gerente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.senha_gerente_id_seq', 1, false);


--
-- TOC entry 4008 (class 0 OID 0)
-- Dependencies: 323
-- Name: servico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.servico_id_seq', 1, false);


--
-- TOC entry 4009 (class 0 OID 0)
-- Dependencies: 333
-- Name: tesouraria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tesouraria_id_seq', 1, false);


--
-- TOC entry 4010 (class 0 OID 0)
-- Dependencies: 278
-- Name: tipo_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_pagamento_id_seq', 1, false);


--
-- TOC entry 4011 (class 0 OID 0)
-- Dependencies: 246
-- Name: transferencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transferencia_id_seq', 1, false);


--
-- TOC entry 4012 (class 0 OID 0)
-- Dependencies: 270
-- Name: venda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.venda_id_seq', 1, false);


--
-- TOC entry 3320 (class 2606 OID 24799)
-- Name: agencia_bancaria agencia_bancaria_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agencia_bancaria
    ADD CONSTRAINT agencia_bancaria_pkey PRIMARY KEY (id);


--
-- TOC entry 3397 (class 2606 OID 25560)
-- Name: auditlog auditlog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditlog
    ADD CONSTRAINT auditlog_pkey PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 24591)
-- Name: banco banco_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (id);


--
-- TOC entry 3326 (class 2606 OID 24877)
-- Name: bandeiras bandeiras_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bandeiras
    ADD CONSTRAINT bandeiras_pkey PRIMARY KEY (id);


--
-- TOC entry 3403 (class 2606 OID 25663)
-- Name: boleto boleto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.boleto
    ADD CONSTRAINT boleto_pkey PRIMARY KEY (id);


--
-- TOC entry 3443 (class 2606 OID 26271)
-- Name: caixa caixa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.caixa
    ADD CONSTRAINT caixa_pkey PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 24943)
-- Name: cartao_adicional cartao_adicional_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartao_adicional
    ADD CONSTRAINT cartao_adicional_pkey PRIMARY KEY (id);


--
-- TOC entry 3332 (class 2606 OID 24927)
-- Name: cartao_parcelas cartao_parcelas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartao_parcelas
    ADD CONSTRAINT cartao_parcelas_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 24904)
-- Name: cartao cartao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartao
    ADD CONSTRAINT cartao_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 24602)
-- Name: cd_complementares cd_complementares_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cd_complementares
    ADD CONSTRAINT cd_complementares_pkey PRIMARY KEY (id);


--
-- TOC entry 3379 (class 2606 OID 25338)
-- Name: cheque cheque_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cheque
    ADD CONSTRAINT cheque_pkey PRIMARY KEY (id);


--
-- TOC entry 3372 (class 2606 OID 25238)
-- Name: compra compra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id);


--
-- TOC entry 3425 (class 2606 OID 26166)
-- Name: configuracao_boleto configuracao_boleto_conta_corrente_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.configuracao_boleto
    ADD CONSTRAINT configuracao_boleto_conta_corrente_id_key UNIQUE (conta_corrente_id);


--
-- TOC entry 3427 (class 2606 OID 26121)
-- Name: configuracao_boleto configuracao_boleto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.configuracao_boleto
    ADD CONSTRAINT configuracao_boleto_pkey PRIMARY KEY (id);


--
-- TOC entry 3423 (class 2606 OID 26110)
-- Name: configuracao_empresa configuracao_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.configuracao_empresa
    ADD CONSTRAINT configuracao_empresa_pkey PRIMARY KEY (id);


--
-- TOC entry 3322 (class 2606 OID 24825)
-- Name: conta_corrente conta_corrente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT conta_corrente_pkey PRIMARY KEY (id);


--
-- TOC entry 3399 (class 2606 OID 25573)
-- Name: contas_pagar contas_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contas_pagar
    ADD CONSTRAINT contas_pagar_pkey PRIMARY KEY (id);


--
-- TOC entry 3411 (class 2606 OID 25839)
-- Name: contas_receber contas_receber_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contas_receber
    ADD CONSTRAINT contas_receber_pkey PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 24856)
-- Name: contato_banco contato_banco_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contato_banco
    ADD CONSTRAINT contato_banco_pkey PRIMARY KEY (id);


--
-- TOC entry 3447 (class 2606 OID 26300)
-- Name: departamento departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3395 (class 2606 OID 25502)
-- Name: deposito_cheque deposito_cheque_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deposito_cheque
    ADD CONSTRAINT deposito_cheque_pkey PRIMARY KEY (id);


--
-- TOC entry 3346 (class 2606 OID 25023)
-- Name: deposito deposito_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deposito
    ADD CONSTRAINT deposito_pkey PRIMARY KEY (id);


--
-- TOC entry 3419 (class 2606 OID 26028)
-- Name: descricao_evento_bancario descricao_evento_bancario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.descricao_evento_bancario
    ADD CONSTRAINT descricao_evento_bancario_pkey PRIMARY KEY (id);


--
-- TOC entry 3393 (class 2606 OID 25489)
-- Name: entrada_produto entrada_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entrada_produto
    ADD CONSTRAINT entrada_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3417 (class 2606 OID 26007)
-- Name: evento_bancario evento_bancario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evento_bancario
    ADD CONSTRAINT evento_bancario_pkey PRIMARY KEY (id);


--
-- TOC entry 3407 (class 2606 OID 25799)
-- Name: fechamento_caixa fechamento_caixa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fechamento_caixa
    ADD CONSTRAINT fechamento_caixa_pkey PRIMARY KEY (id);


--
-- TOC entry 3449 (class 2606 OID 26352)
-- Name: fechamento_tesouraria fechamento_tesouraria_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fechamento_tesouraria
    ADD CONSTRAINT fechamento_tesouraria_pkey PRIMARY KEY (id);


--
-- TOC entry 3338 (class 2606 OID 24973)
-- Name: financeira_condicao financeira_condicao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.financeira_condicao
    ADD CONSTRAINT financeira_condicao_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 24959)
-- Name: financeira financeira_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.financeira
    ADD CONSTRAINT financeira_pkey PRIMARY KEY (id);


--
-- TOC entry 3409 (class 2606 OID 25825)
-- Name: folha_cheque_pagamento folha_cheque_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folha_cheque_pagamento
    ADD CONSTRAINT folha_cheque_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 25010)
-- Name: folhas_cheque folhas_cheque_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folhas_cheque
    ADD CONSTRAINT folhas_cheque_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 24989)
-- Name: formas_de_pagamento formas_de_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.formas_de_pagamento
    ADD CONSTRAINT formas_de_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 24741)
-- Name: fornecedor fornecedor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (id);


--
-- TOC entry 3405 (class 2606 OID 25684)
-- Name: funcionario funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id);


--
-- TOC entry 3366 (class 2606 OID 25171)
-- Name: grade grade_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (id);


--
-- TOC entry 3429 (class 2606 OID 26132)
-- Name: item_pedido_certificado item_pedido_certificado_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido_certificado
    ADD CONSTRAINT item_pedido_certificado_pkey PRIMARY KEY (id);


--
-- TOC entry 3370 (class 2606 OID 25216)
-- Name: item_pedido item_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 3383 (class 2606 OID 25369)
-- Name: items_compra items_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items_compra
    ADD CONSTRAINT items_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 24580)
-- Name: migration migration_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- TOC entry 3415 (class 2606 OID 25981)
-- Name: movimentacao_caixa movimentacao_caixa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao_caixa
    ADD CONSTRAINT movimentacao_caixa_pkey PRIMARY KEY (id);


--
-- TOC entry 3391 (class 2606 OID 25469)
-- Name: movimentacao movimentacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT movimentacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3441 (class 2606 OID 26240)
-- Name: movimentacao_tesouraria_cheque movimentacao_tesouraria_cheque_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao_tesouraria_cheque
    ADD CONSTRAINT movimentacao_tesouraria_cheque_pkey PRIMARY KEY (id);


--
-- TOC entry 3435 (class 2606 OID 26190)
-- Name: movimentacao_tesouraria movimentacao_tesouraria_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao_tesouraria
    ADD CONSTRAINT movimentacao_tesouraria_pkey PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 24888)
-- Name: operadora operadora_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.operadora
    ADD CONSTRAINT operadora_pkey PRIMARY KEY (id);


--
-- TOC entry 3374 (class 2606 OID 25262)
-- Name: pagamento pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3401 (class 2606 OID 25597)
-- Name: parcelas_contas_pagar parcelas_contas_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parcelas_contas_pagar
    ADD CONSTRAINT parcelas_contas_pagar_pkey PRIMARY KEY (id);


--
-- TOC entry 3413 (class 2606 OID 25879)
-- Name: parcelas_contas_receber parcelas_contas_receber_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parcelas_contas_receber
    ADD CONSTRAINT parcelas_contas_receber_pkey PRIMARY KEY (id);


--
-- TOC entry 3381 (class 2606 OID 25356)
-- Name: parcelas_pagamento parcelas_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parcelas_pagamento
    ADD CONSTRAINT parcelas_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3302 (class 2606 OID 24615)
-- Name: pessoa_fisica pessoa_fisica_cpf_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT pessoa_fisica_cpf_key UNIQUE (cpf);


--
-- TOC entry 3306 (class 2606 OID 24686)
-- Name: pessoa_fisica_dependentes pessoa_fisica_dependentes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica_dependentes
    ADD CONSTRAINT pessoa_fisica_dependentes_pkey PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 24702)
-- Name: pessoa_fisica_documento pessoa_fisica_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica_documento
    ADD CONSTRAINT pessoa_fisica_documento_pkey PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 24613)
-- Name: pessoa_fisica pessoa_fisica_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT pessoa_fisica_pkey PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 24720)
-- Name: pessoa_juridica pessoa_juridica_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_juridica
    ADD CONSTRAINT pessoa_juridica_cnpj_key UNIQUE (cnpj);


--
-- TOC entry 3316 (class 2606 OID 24762)
-- Name: pessoa_juridica_contato pessoa_juridica_contato_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_juridica_contato
    ADD CONSTRAINT pessoa_juridica_contato_pkey PRIMARY KEY (id);


--
-- TOC entry 3312 (class 2606 OID 24718)
-- Name: pessoa_juridica pessoa_juridica_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_juridica
    ADD CONSTRAINT pessoa_juridica_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 24788)
-- Name: plano_de_contas plano_de_contas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plano_de_contas
    ADD CONSTRAINT plano_de_contas_pkey PRIMARY KEY (id);


--
-- TOC entry 3389 (class 2606 OID 25441)
-- Name: preco_produto preco_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preco_produto
    ADD CONSTRAINT preco_produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3387 (class 2606 OID 25401)
-- Name: preco_venda preco_venda_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preco_venda
    ADD CONSTRAINT preco_venda_pkey PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 25101)
-- Name: produto_classe produto_classe_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_classe
    ADD CONSTRAINT produto_classe_pkey PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2606 OID 25052)
-- Name: produto_cor produto_cor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_cor
    ADD CONSTRAINT produto_cor_pkey PRIMARY KEY (id);


--
-- TOC entry 3358 (class 2606 OID 25085)
-- Name: produto_grupo produto_grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_grupo
    ADD CONSTRAINT produto_grupo_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 25158)
-- Name: produto_imagens produto_imagens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_imagens
    ADD CONSTRAINT produto_imagens_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 25074)
-- Name: produto_marca produto_marca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_marca
    ADD CONSTRAINT produto_marca_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 25117)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 25063)
-- Name: produto_tamanho produto_tamanho_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_tamanho
    ADD CONSTRAINT produto_tamanho_pkey PRIMARY KEY (id);


--
-- TOC entry 3348 (class 2606 OID 25041)
-- Name: produto_unidade produto_unidade_abreviacao_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_unidade
    ADD CONSTRAINT produto_unidade_abreviacao_key UNIQUE (abreviacao);


--
-- TOC entry 3350 (class 2606 OID 25039)
-- Name: produto_unidade produto_unidade_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_unidade
    ADD CONSTRAINT produto_unidade_pkey PRIMARY KEY (id);


--
-- TOC entry 3385 (class 2606 OID 25387)
-- Name: programar_pagamento programar_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programar_pagamento
    ADD CONSTRAINT programar_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3445 (class 2606 OID 26279)
-- Name: relacao_caixa relacao_caixa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relacao_caixa
    ADD CONSTRAINT relacao_caixa_pkey PRIMARY KEY (id);


--
-- TOC entry 3431 (class 2606 OID 26156)
-- Name: remessas remessas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.remessas
    ADD CONSTRAINT remessas_pkey PRIMARY KEY (id);


--
-- TOC entry 3437 (class 2606 OID 26206)
-- Name: retorno retorno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.retorno
    ADD CONSTRAINT retorno_pkey PRIMARY KEY (id);


--
-- TOC entry 3439 (class 2606 OID 26217)
-- Name: senha_gerente senha_gerente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.senha_gerente
    ADD CONSTRAINT senha_gerente_pkey PRIMARY KEY (id);


--
-- TOC entry 3421 (class 2606 OID 26049)
-- Name: servico servico_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.servico
    ADD CONSTRAINT servico_pkey PRIMARY KEY (id);


--
-- TOC entry 3433 (class 2606 OID 26182)
-- Name: tesouraria tesouraria_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tesouraria
    ADD CONSTRAINT tesouraria_pkey PRIMARY KEY (id);


--
-- TOC entry 3377 (class 2606 OID 25292)
-- Name: tipo_pagamento tipo_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_pagamento
    ADD CONSTRAINT tipo_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 25002)
-- Name: transferencia transferencia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transferencia
    ADD CONSTRAINT transferencia_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 25196)
-- Name: venda venda_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (id);


--
-- TOC entry 3300 (class 1259 OID 25650)
-- Name: index_cd_complementares_tipo; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cd_complementares_tipo ON public.cd_complementares USING btree (tipo);


--
-- TOC entry 3375 (class 1259 OID 25651)
-- Name: index_tipo_pagamento_pagamento_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tipo_pagamento_pagamento_id ON public.tipo_pagamento USING btree (pagamento_id);


--
-- TOC entry 3561 (class 2606 OID 25992)
-- Name: boleto boleto_tipo_pagamento_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.boleto
    ADD CONSTRAINT boleto_tipo_pagamento_fk FOREIGN KEY (tipo_pagamento_id) REFERENCES public.tipo_pagamento(id);


--
-- TOC entry 3540 (class 2606 OID 25339)
-- Name: cheque cheque_banco_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cheque
    ADD CONSTRAINT cheque_banco_id_fk FOREIGN KEY (banco_id) REFERENCES public.banco(id);


--
-- TOC entry 3539 (class 2606 OID 25344)
-- Name: cheque cheque_pagamento_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cheque
    ADD CONSTRAINT cheque_pagamento_id_fk FOREIGN KEY (tipo_pagamento_id) REFERENCES public.tipo_pagamento(id);


--
-- TOC entry 3518 (class 2606 OID 25239)
-- Name: compra compra_complementar_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_complementar_fk FOREIGN KEY (tipo_documento) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3521 (class 2606 OID 25669)
-- Name: compra compra_contas_pagar_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_contas_pagar_fk FOREIGN KEY (contas_pagar_id) REFERENCES public.contas_pagar(id);


--
-- TOC entry 3522 (class 2606 OID 25886)
-- Name: compra compra_frete_contas_pagar_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_frete_contas_pagar_fk FOREIGN KEY (frete_contas_pagar_id) REFERENCES public.contas_pagar(id);


--
-- TOC entry 3519 (class 2606 OID 25244)
-- Name: compra compra_pessoa_fisica_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pessoa_fisica_fk FOREIGN KEY (id_fisico) REFERENCES public.fornecedor(id);


--
-- TOC entry 3520 (class 2606 OID 25249)
-- Name: compra compra_pessoa_juridica_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pessoa_juridica_fk FOREIGN KEY (id_juridico) REFERENCES public.fornecedor(id);


--
-- TOC entry 3584 (class 2606 OID 26167)
-- Name: configuracao_boleto configuracao_boleto_conta_corrente_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.configuracao_boleto
    ADD CONSTRAINT configuracao_boleto_conta_corrente_fk FOREIGN KEY (conta_corrente_id) REFERENCES public.conta_corrente(id);


--
-- TOC entry 3557 (class 2606 OID 25574)
-- Name: contas_pagar contas_pagar_complementar_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contas_pagar
    ADD CONSTRAINT contas_pagar_complementar_fk FOREIGN KEY (tipo_documento) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3556 (class 2606 OID 25579)
-- Name: contas_pagar contas_pagar_pessoa_fisica_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contas_pagar
    ADD CONSTRAINT contas_pagar_pessoa_fisica_fk FOREIGN KEY (id_fisico) REFERENCES public.fornecedor(id);


--
-- TOC entry 3555 (class 2606 OID 25584)
-- Name: contas_pagar contas_pagar_pessoa_juridica_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contas_pagar
    ADD CONSTRAINT contas_pagar_pessoa_juridica_fk FOREIGN KEY (id_juridico) REFERENCES public.fornecedor(id);


--
-- TOC entry 3554 (class 2606 OID 25503)
-- Name: deposito_cheque deposito_cheque_cheque_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deposito_cheque
    ADD CONSTRAINT deposito_cheque_cheque_id_fk FOREIGN KEY (cheque_id) REFERENCES public.cheque(id);


--
-- TOC entry 3553 (class 2606 OID 25508)
-- Name: deposito_cheque deposito_cheque_deposito_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deposito_cheque
    ADD CONSTRAINT deposito_cheque_deposito_id_fk FOREIGN KEY (deposito_id) REFERENCES public.deposito(id);


--
-- TOC entry 3494 (class 2606 OID 25948)
-- Name: deposito deposito_fechamento_caixa_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deposito
    ADD CONSTRAINT deposito_fechamento_caixa_fk FOREIGN KEY (fechamento_caixa_id) REFERENCES public.fechamento_caixa(id);


--
-- TOC entry 3497 (class 2606 OID 26378)
-- Name: deposito deposito_fechamento_tesouraria_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deposito
    ADD CONSTRAINT deposito_fechamento_tesouraria_fk FOREIGN KEY (fechamento_tesouraria_id) REFERENCES public.fechamento_tesouraria(id);


--
-- TOC entry 3578 (class 2606 OID 26034)
-- Name: evento_bancario descricao_evento_bancario_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evento_bancario
    ADD CONSTRAINT descricao_evento_bancario_fk FOREIGN KEY (descricao_evento_bancario_id) REFERENCES public.descricao_evento_bancario(id);


--
-- TOC entry 3552 (class 2606 OID 25490)
-- Name: entrada_produto entrada_produto_id_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entrada_produto
    ADD CONSTRAINT entrada_produto_id_produto_fk FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- TOC entry 3479 (class 2606 OID 24826)
-- Name: conta_corrente fk_agenciaBancaria; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT "fk_agenciaBancaria" FOREIGN KEY (id_agencia_bancaria) REFERENCES public.agencia_bancaria(id);


--
-- TOC entry 3480 (class 2606 OID 24862)
-- Name: contato_banco fk_agenciaBancaria; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contato_banco
    ADD CONSTRAINT "fk_agenciaBancaria" FOREIGN KEY (id_agencia_bancaria) REFERENCES public.agencia_bancaria(id);


--
-- TOC entry 3477 (class 2606 OID 24836)
-- Name: conta_corrente fk_aplicacao; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT fk_aplicacao FOREIGN KEY (aplicacao) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3459 (class 2606 OID 24661)
-- Name: pessoa_fisica fk_banco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT fk_banco FOREIGN KEY (banco) REFERENCES public.banco(id);


--
-- TOC entry 3475 (class 2606 OID 24800)
-- Name: agencia_bancaria fk_banco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agencia_bancaria
    ADD CONSTRAINT fk_banco FOREIGN KEY (id_banco) REFERENCES public.banco(id);


--
-- TOC entry 3482 (class 2606 OID 24889)
-- Name: operadora fk_banco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.operadora
    ADD CONSTRAINT fk_banco FOREIGN KEY (id_banco) REFERENCES public.banco(id);


--
-- TOC entry 3460 (class 2606 OID 24666)
-- Name: pessoa_fisica fk_banco1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT fk_banco1 FOREIGN KEY (banco1) REFERENCES public.banco(id);


--
-- TOC entry 3461 (class 2606 OID 24671)
-- Name: pessoa_fisica fk_banco2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT fk_banco2 FOREIGN KEY (banco2) REFERENCES public.banco(id);


--
-- TOC entry 3485 (class 2606 OID 24905)
-- Name: cartao fk_bandeira; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartao
    ADD CONSTRAINT fk_bandeira FOREIGN KEY (id_bandeira) REFERENCES public.bandeiras(id);


--
-- TOC entry 3592 (class 2606 OID 26285)
-- Name: relacao_caixa fk_caixa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relacao_caixa
    ADD CONSTRAINT fk_caixa FOREIGN KEY (caixa_id) REFERENCES public.caixa(id);


--
-- TOC entry 3486 (class 2606 OID 24928)
-- Name: cartao_parcelas fk_cartao; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartao_parcelas
    ADD CONSTRAINT fk_cartao FOREIGN KEY (id_cartao) REFERENCES public.cartao(id);


--
-- TOC entry 3487 (class 2606 OID 24944)
-- Name: cartao_adicional fk_cartaoCredito; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartao_adicional
    ADD CONSTRAINT "fk_cartaoCredito" FOREIGN KEY (id_cartao) REFERENCES public.cartao(id);


--
-- TOC entry 3453 (class 2606 OID 24631)
-- Name: pessoa_fisica fk_categoria; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3499 (class 2606 OID 25102)
-- Name: produto_classe fk_classe_pai; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_classe
    ADD CONSTRAINT fk_classe_pai FOREIGN KEY (produto_classe_id) REFERENCES public.produto_classe(id);


--
-- TOC entry 3524 (class 2606 OID 25968)
-- Name: compra fk_compra_fornecedor_fisico_frete; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT fk_compra_fornecedor_fisico_frete FOREIGN KEY (id_fisico_frete) REFERENCES public.fornecedor(id);


--
-- TOC entry 3523 (class 2606 OID 25963)
-- Name: compra fk_compra_fornecedor_juridico_frete; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT fk_compra_fornecedor_juridico_frete FOREIGN KEY (id_juridico_frete) REFERENCES public.fornecedor(id);


--
-- TOC entry 3481 (class 2606 OID 24857)
-- Name: contato_banco fk_contaCorrente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contato_banco
    ADD CONSTRAINT "fk_contaCorrente" FOREIGN KEY (id_conta_corrente) REFERENCES public.conta_corrente(id);


--
-- TOC entry 3483 (class 2606 OID 24915)
-- Name: cartao fk_contaCorrente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartao
    ADD CONSTRAINT "fk_contaCorrente" FOREIGN KEY ("id_contaCorrente") REFERENCES public.conta_corrente(id);


--
-- TOC entry 3488 (class 2606 OID 24960)
-- Name: financeira fk_contaCorrente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.financeira
    ADD CONSTRAINT "fk_contaCorrente" FOREIGN KEY ("id_contaCorrente") REFERENCES public.conta_corrente(id);


--
-- TOC entry 3493 (class 2606 OID 25024)
-- Name: deposito fk_contaCorrente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deposito
    ADD CONSTRAINT "fk_contaCorrente" FOREIGN KEY ("id_contaCorrente") REFERENCES public.conta_corrente(id);


--
-- TOC entry 3476 (class 2606 OID 24841)
-- Name: conta_corrente fk_contabil; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT fk_contabil FOREIGN KEY (contabil) REFERENCES public.plano_de_contas(id);


--
-- TOC entry 3510 (class 2606 OID 25734)
-- Name: venda fk_contas_pagar_comissao_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT fk_contas_pagar_comissao_funcionario FOREIGN KEY (contas_pagar_id) REFERENCES public.contas_pagar(id);


--
-- TOC entry 3574 (class 2606 OID 25840)
-- Name: contas_receber fk_contas_receber_cliente_fisico; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contas_receber
    ADD CONSTRAINT fk_contas_receber_cliente_fisico FOREIGN KEY (id_fisico) REFERENCES public.pessoa_fisica(id);


--
-- TOC entry 3573 (class 2606 OID 25845)
-- Name: contas_receber fk_contas_receber_cliente_juridico; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contas_receber
    ADD CONSTRAINT fk_contas_receber_cliente_juridico FOREIGN KEY (id_juridico) REFERENCES public.pessoa_juridica(id);


--
-- TOC entry 3569 (class 2606 OID 26317)
-- Name: funcionario fk_departamento; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT fk_departamento FOREIGN KEY (departamento_id) REFERENCES public.departamento(id);


--
-- TOC entry 3594 (class 2606 OID 26327)
-- Name: departamento fk_departamento; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT fk_departamento FOREIGN KEY (departamento_id) REFERENCES public.departamento(id);


--
-- TOC entry 3580 (class 2606 OID 26029)
-- Name: descricao_evento_bancario fk_descricao_evento_bancario_cd_complementares; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.descricao_evento_bancario
    ADD CONSTRAINT fk_descricao_evento_bancario_cd_complementares FOREIGN KEY (tipo_movimentacao) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3457 (class 2606 OID 24651)
-- Name: pessoa_fisica fk_dfTipo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT "fk_dfTipo" FOREIGN KEY (df_tipo) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3458 (class 2606 OID 24656)
-- Name: pessoa_fisica fk_dfTipo2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT "fk_dfTipo2" FOREIGN KEY (df_tipo2) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3451 (class 2606 OID 24621)
-- Name: pessoa_fisica fk_escolaridade; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT fk_escolaridade FOREIGN KEY (escolaridade) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3452 (class 2606 OID 24626)
-- Name: pessoa_fisica fk_estadoCivil; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT "fk_estadoCivil" FOREIGN KEY (estado_civil) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3579 (class 2606 OID 26008)
-- Name: evento_bancario fk_evento_bancario_conta_corrente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evento_bancario
    ADD CONSTRAINT fk_evento_bancario_conta_corrente FOREIGN KEY (conta_corrente_id) REFERENCES public.conta_corrente(id);


--
-- TOC entry 3530 (class 2606 OID 26363)
-- Name: pagamento fk_fechamento_tesouraria_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT fk_fechamento_tesouraria_id FOREIGN KEY (fechamento_tesouraria_id) REFERENCES public.fechamento_tesouraria(id);


--
-- TOC entry 3489 (class 2606 OID 24974)
-- Name: financeira_condicao fk_financeira; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.financeira_condicao
    ADD CONSTRAINT fk_financeira FOREIGN KEY (id_financeira) REFERENCES public.financeira(id);


--
-- TOC entry 3571 (class 2606 OID 25826)
-- Name: folha_cheque_pagamento fk_folha_cheque_pagamento_cheque; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folha_cheque_pagamento
    ADD CONSTRAINT fk_folha_cheque_pagamento_cheque FOREIGN KEY (cheque_id) REFERENCES public.cheque(id);


--
-- TOC entry 3492 (class 2606 OID 25011)
-- Name: folhas_cheque fk_folhasCheque; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folhas_cheque
    ADD CONSTRAINT "fk_folhasCheque" FOREIGN KEY ("id_contaCorrente") REFERENCES public.conta_corrente(id);


--
-- TOC entry 3570 (class 2606 OID 25800)
-- Name: fechamento_caixa fk_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fechamento_caixa
    ADD CONSTRAINT fk_funcionario FOREIGN KEY (funcionario_id) REFERENCES public.funcionario(id);


--
-- TOC entry 3593 (class 2606 OID 26280)
-- Name: relacao_caixa fk_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relacao_caixa
    ADD CONSTRAINT fk_funcionario FOREIGN KEY (funcionario_id) REFERENCES public.funcionario(id);


--
-- TOC entry 3566 (class 2606 OID 25705)
-- Name: funcionario fk_funcionario_Banco; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT "fk_funcionario_Banco" FOREIGN KEY (fbanco) REFERENCES public.banco(id);


--
-- TOC entry 3563 (class 2606 OID 25685)
-- Name: funcionario fk_funcionario_funcao_cd_complementares; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT fk_funcionario_funcao_cd_complementares FOREIGN KEY (funcao) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3596 (class 2606 OID 26353)
-- Name: fechamento_tesouraria fk_funcionario_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fechamento_tesouraria
    ADD CONSTRAINT fk_funcionario_id FOREIGN KEY (funcionario_id) REFERENCES public.funcionario(id);


--
-- TOC entry 3568 (class 2606 OID 25755)
-- Name: funcionario fk_funcionario_motivo_cd_complementares; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT fk_funcionario_motivo_cd_complementares FOREIGN KEY (motivo) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3565 (class 2606 OID 25700)
-- Name: funcionario fk_funcionario_pessoaFisica; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT "fk_funcionario_pessoaFisica" FOREIGN KEY (pessoa_fisica_id) REFERENCES public.pessoa_fisica(id);


--
-- TOC entry 3567 (class 2606 OID 25750)
-- Name: funcionario fk_funcionario_situacao_trabalhista_cd_complementares; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT fk_funcionario_situacao_trabalhista_cd_complementares FOREIGN KEY (situacao_trabalhista) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3564 (class 2606 OID 25695)
-- Name: funcionario fk_funcionario_tipo_conta_cd_complementares; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT fk_funcionario_tipo_conta_cd_complementares FOREIGN KEY (tipo_conta) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3508 (class 2606 OID 25177)
-- Name: grade fk_grade_cor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT fk_grade_cor_id FOREIGN KEY (produto_cor_id) REFERENCES public.produto_cor(id);


--
-- TOC entry 3509 (class 2606 OID 25172)
-- Name: grade fk_grade_produto_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT fk_grade_produto_id FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- TOC entry 3507 (class 2606 OID 25182)
-- Name: grade fk_grade_tamanho_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT fk_grade_tamanho_id FOREIGN KEY (produto_tamanho_id) REFERENCES public.produto_tamanho(id);


--
-- TOC entry 3498 (class 2606 OID 25086)
-- Name: produto_grupo fk_grupo_pai; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_grupo
    ADD CONSTRAINT fk_grupo_pai FOREIGN KEY (grupo_id_pai) REFERENCES public.produto_grupo(id);


--
-- TOC entry 3585 (class 2606 OID 26133)
-- Name: item_pedido_certificado fk_item_pedido_certificado_venda; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido_certificado
    ADD CONSTRAINT fk_item_pedido_certificado_venda FOREIGN KEY (venda_id) REFERENCES public.venda(id);


--
-- TOC entry 3515 (class 2606 OID 25928)
-- Name: item_pedido fk_item_pedido_grade; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT fk_item_pedido_grade FOREIGN KEY (grade_id) REFERENCES public.grade(id);


--
-- TOC entry 3517 (class 2606 OID 25217)
-- Name: item_pedido fk_item_pedido_produto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT fk_item_pedido_produto FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- TOC entry 3516 (class 2606 OID 25222)
-- Name: item_pedido fk_item_pedido_venda; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT fk_item_pedido_venda FOREIGN KEY (venda_id) REFERENCES public.venda(id);


--
-- TOC entry 3543 (class 2606 OID 25933)
-- Name: items_compra fk_items_compra_grade; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items_compra
    ADD CONSTRAINT fk_items_compra_grade FOREIGN KEY (grade_id) REFERENCES public.grade(id);


--
-- TOC entry 3577 (class 2606 OID 25982)
-- Name: movimentacao_caixa fk_movimentacao_caixa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao_caixa
    ADD CONSTRAINT fk_movimentacao_caixa FOREIGN KEY (operacao) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3576 (class 2606 OID 25987)
-- Name: movimentacao_caixa fk_movimentacao_caixa_cheque; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao_caixa
    ADD CONSTRAINT fk_movimentacao_caixa_cheque FOREIGN KEY (cheque_id) REFERENCES public.cheque(id);


--
-- TOC entry 3590 (class 2606 OID 26246)
-- Name: movimentacao_tesouraria_cheque fk_movimentacao_tesouraria_cheque_cheque; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao_tesouraria_cheque
    ADD CONSTRAINT fk_movimentacao_tesouraria_cheque_cheque FOREIGN KEY (cheque_id) REFERENCES public.cheque(id);


--
-- TOC entry 3591 (class 2606 OID 26241)
-- Name: movimentacao_tesouraria_cheque fk_movimentacao_tesouraria_cheque_movimentacao_tesouraria; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao_tesouraria_cheque
    ADD CONSTRAINT fk_movimentacao_tesouraria_cheque_movimentacao_tesouraria FOREIGN KEY (movimentacao_tesouraria_id) REFERENCES public.movimentacao_tesouraria(id);


--
-- TOC entry 3484 (class 2606 OID 24910)
-- Name: cartao fk_operadora; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartao
    ADD CONSTRAINT fk_operadora FOREIGN KEY (id_operadora) REFERENCES public.operadora(id);


--
-- TOC entry 3562 (class 2606 OID 25664)
-- Name: boleto fk_pagamento; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.boleto
    ADD CONSTRAINT fk_pagamento FOREIGN KEY (pagamento_id) REFERENCES public.pagamento(id);


--
-- TOC entry 3541 (class 2606 OID 25938)
-- Name: parcelas_pagamento fk_parcelas_pagamento_conta_corrente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parcelas_pagamento
    ADD CONSTRAINT fk_parcelas_pagamento_conta_corrente FOREIGN KEY (conta_corrente_id) REFERENCES public.conta_corrente(id);


--
-- TOC entry 3469 (class 2606 OID 24742)
-- Name: fornecedor fk_pessoaFisica; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT "fk_pessoaFisica" FOREIGN KEY (id_pessoa_fisica) REFERENCES public.pessoa_fisica(id);


--
-- TOC entry 3462 (class 2606 OID 25710)
-- Name: pessoa_fisica fk_pessoaFisica_categoria_reservista_cd_complementares; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT "fk_pessoaFisica_categoria_reservista_cd_complementares" FOREIGN KEY (categoria_reservista) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3468 (class 2606 OID 24747)
-- Name: fornecedor fk_pessoaJuridica; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT "fk_pessoaJuridica" FOREIGN KEY (id_pessoa_juridica) REFERENCES public.pessoa_juridica(id);


--
-- TOC entry 3470 (class 2606 OID 24773)
-- Name: pessoa_juridica_contato fk_pessoaJuridica; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_juridica_contato
    ADD CONSTRAINT "fk_pessoaJuridica" FOREIGN KEY (id_pessoajuridica) REFERENCES public.pessoa_juridica(id);


--
-- TOC entry 3463 (class 2606 OID 25715)
-- Name: pessoa_fisica_dependentes fk_pessoa_fisica_dependentes_sexo_cd_complementares; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica_dependentes
    ADD CONSTRAINT fk_pessoa_fisica_dependentes_sexo_cd_complementares FOREIGN KEY (sexo) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3490 (class 2606 OID 24990)
-- Name: formas_de_pagamento fk_planoDeContas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.formas_de_pagamento
    ADD CONSTRAINT "fk_planoDeContas" FOREIGN KEY (id_classificacao) REFERENCES public.plano_de_contas(id);


--
-- TOC entry 3548 (class 2606 OID 25775)
-- Name: preco_produto fk_preco_produto_cd_complementares; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preco_produto
    ADD CONSTRAINT fk_preco_produto_cd_complementares FOREIGN KEY (tipo) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3503 (class 2606 OID 25133)
-- Name: produto fk_produto_classe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_classe FOREIGN KEY (classe_id) REFERENCES public.produto_classe(id);


--
-- TOC entry 3502 (class 2606 OID 25128)
-- Name: produto fk_produto_grupo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_grupo FOREIGN KEY (grupo_id) REFERENCES public.produto_grupo(id);


--
-- TOC entry 3506 (class 2606 OID 25159)
-- Name: produto_imagens fk_produto_imagens_produto_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto_imagens
    ADD CONSTRAINT fk_produto_imagens_produto_id FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- TOC entry 3500 (class 2606 OID 25118)
-- Name: produto fk_produto_marca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_marca FOREIGN KEY (marca_id) REFERENCES public.produto_marca(id);


--
-- TOC entry 3505 (class 2606 OID 25143)
-- Name: produto fk_produto_subclasse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_subclasse FOREIGN KEY (subclasse_id) REFERENCES public.produto_classe(id);


--
-- TOC entry 3504 (class 2606 OID 25138)
-- Name: produto fk_produto_subgrupo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_subgrupo FOREIGN KEY (subgrupo_id) REFERENCES public.produto_grupo(id);


--
-- TOC entry 3501 (class 2606 OID 25123)
-- Name: produto fk_produto_unidade; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_unidade FOREIGN KEY (unidade_id) REFERENCES public.produto_unidade(id);


--
-- TOC entry 3495 (class 2606 OID 26332)
-- Name: deposito fk_relacao_caixa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deposito
    ADD CONSTRAINT fk_relacao_caixa FOREIGN KEY (relacao_caixa_id) REFERENCES public.relacao_caixa(id);


--
-- TOC entry 3581 (class 2606 OID 26060)
-- Name: servico fk_servico_cd_complementares_setor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.servico
    ADD CONSTRAINT fk_servico_cd_complementares_setor FOREIGN KEY (setor) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3582 (class 2606 OID 26055)
-- Name: servico fk_servico_cd_complementares_tipo_fornecedor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.servico
    ADD CONSTRAINT fk_servico_cd_complementares_tipo_fornecedor FOREIGN KEY (tipo_fornecedor) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3583 (class 2606 OID 26050)
-- Name: servico fk_servico_plano_de_contas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.servico
    ADD CONSTRAINT fk_servico_plano_de_contas FOREIGN KEY (plano_de_contas_id) REFERENCES public.plano_de_contas(id);


--
-- TOC entry 3450 (class 2606 OID 24616)
-- Name: pessoa_fisica fk_sexo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT fk_sexo FOREIGN KEY (sexo) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3496 (class 2606 OID 26337)
-- Name: deposito fk_tesouraria; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deposito
    ADD CONSTRAINT fk_tesouraria FOREIGN KEY (tesouraria_id) REFERENCES public.tesouraria(id);


--
-- TOC entry 3595 (class 2606 OID 26358)
-- Name: fechamento_tesouraria fk_tesouraria_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fechamento_tesouraria
    ADD CONSTRAINT fk_tesouraria_id FOREIGN KEY (tesouraria_id) REFERENCES public.tesouraria(id);


--
-- TOC entry 3454 (class 2606 OID 24636)
-- Name: pessoa_fisica fk_tipo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT fk_tipo FOREIGN KEY (tipo) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3467 (class 2606 OID 24721)
-- Name: pessoa_juridica fk_tipo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_juridica
    ADD CONSTRAINT fk_tipo FOREIGN KEY (tipo) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3472 (class 2606 OID 24763)
-- Name: pessoa_juridica_contato fk_tipo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_juridica_contato
    ADD CONSTRAINT fk_tipo FOREIGN KEY (tipo) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3474 (class 2606 OID 24805)
-- Name: agencia_bancaria fk_tipo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agencia_bancaria
    ADD CONSTRAINT fk_tipo FOREIGN KEY (tipo) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3478 (class 2606 OID 24831)
-- Name: conta_corrente fk_tipo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conta_corrente
    ADD CONSTRAINT fk_tipo FOREIGN KEY (tipo) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3466 (class 2606 OID 24726)
-- Name: pessoa_juridica fk_tipo1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_juridica
    ADD CONSTRAINT fk_tipo1 FOREIGN KEY (tipo1) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3471 (class 2606 OID 24768)
-- Name: pessoa_juridica_contato fk_tipo1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_juridica_contato
    ADD CONSTRAINT fk_tipo1 FOREIGN KEY (tipo1) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3473 (class 2606 OID 24810)
-- Name: agencia_bancaria fk_tipo1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agencia_bancaria
    ADD CONSTRAINT fk_tipo1 FOREIGN KEY (tipo1) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3455 (class 2606 OID 24641)
-- Name: pessoa_fisica fk_tipo2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT fk_tipo2 FOREIGN KEY (tipo2) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3456 (class 2606 OID 24646)
-- Name: pessoa_fisica fk_tipo3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT fk_tipo3 FOREIGN KEY (tipo3) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3511 (class 2606 OID 25729)
-- Name: venda fk_venda_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT fk_venda_funcionario FOREIGN KEY (funcionario_id) REFERENCES public.funcionario(id);


--
-- TOC entry 3513 (class 2606 OID 25197)
-- Name: venda fk_venda_pessoa_fisica_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT fk_venda_pessoa_fisica_id FOREIGN KEY (pessoa_fisica_id) REFERENCES public.pessoa_fisica(id);


--
-- TOC entry 3512 (class 2606 OID 25202)
-- Name: venda fk_venda_pessoa_juridica_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT fk_venda_pessoa_juridica_id FOREIGN KEY (pessoa_juridica_id) REFERENCES public.pessoa_juridica(id);


--
-- TOC entry 3572 (class 2606 OID 25850)
-- Name: contas_receber fk_venda_pessoa_juridica_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contas_receber
    ADD CONSTRAINT fk_venda_pessoa_juridica_id FOREIGN KEY (tipo_documento) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3491 (class 2606 OID 25632)
-- Name: folhas_cheque folhas_cheque_tipo_pagamento_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folhas_cheque
    ADD CONSTRAINT folhas_cheque_tipo_pagamento_fk FOREIGN KEY (tipo_pagamento_id) REFERENCES public.tipo_pagamento(id);


--
-- TOC entry 3514 (class 2606 OID 26223)
-- Name: item_pedido gerente_id_item_pedido_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT gerente_id_item_pedido_fk FOREIGN KEY (gerente_id) REFERENCES public.senha_gerente(id);


--
-- TOC entry 3544 (class 2606 OID 25375)
-- Name: items_compra itemsCompras_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items_compra
    ADD CONSTRAINT "itemsCompras_produto_fk" FOREIGN KEY (id_produto) REFERENCES public.produto(id);


--
-- TOC entry 3545 (class 2606 OID 25370)
-- Name: items_compra items_compra_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items_compra
    ADD CONSTRAINT items_compra_fk FOREIGN KEY (id_compra) REFERENCES public.compra(id);


--
-- TOC entry 3587 (class 2606 OID 26373)
-- Name: movimentacao_tesouraria movimentacao_tesouraria_fechamento_tesouraria_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao_tesouraria
    ADD CONSTRAINT movimentacao_tesouraria_fechamento_tesouraria_fk FOREIGN KEY (fechamento_tesouraria_id) REFERENCES public.fechamento_tesouraria(id);


--
-- TOC entry 3551 (class 2606 OID 25470)
-- Name: movimentacao movimentacao_tipo_movimentacao_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT movimentacao_tipo_movimentacao_fk FOREIGN KEY (tipo_movimentacao_id) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3550 (class 2606 OID 25475)
-- Name: movimentacao movimentacao_tipo_pagamento_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT movimentacao_tipo_pagamento_fk FOREIGN KEY (tipo_pagamento_id) REFERENCES public.tipo_pagamento(id);


--
-- TOC entry 3546 (class 2606 OID 25388)
-- Name: programar_pagamento pPgamento_compra_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programar_pagamento
    ADD CONSTRAINT "pPgamento_compra_fk" FOREIGN KEY (id_compra) REFERENCES public.compra(id);


--
-- TOC entry 3533 (class 2606 OID 25303)
-- Name: tipo_pagamento pagamento_bandeiras_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_pagamento
    ADD CONSTRAINT pagamento_bandeiras_id_fk FOREIGN KEY (bandeira_id) REFERENCES public.bandeiras(id);


--
-- TOC entry 3560 (class 2606 OID 25607)
-- Name: pagamento_cheque_terceiros pagamento_cheque_terceiros_cheque_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento_cheque_terceiros
    ADD CONSTRAINT pagamento_cheque_terceiros_cheque_fk FOREIGN KEY (cheque_id) REFERENCES public.cheque(id);


--
-- TOC entry 3559 (class 2606 OID 25612)
-- Name: pagamento_cheque_terceiros pagamento_cheque_terceiros_tipo_pagamento_contas_pagar_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento_cheque_terceiros
    ADD CONSTRAINT pagamento_cheque_terceiros_tipo_pagamento_contas_pagar_fk FOREIGN KEY (tipo_pagamento_contas_pagar_id) REFERENCES public.tipo_pagamento(id);


--
-- TOC entry 3528 (class 2606 OID 25278)
-- Name: pagamento pagamento_compra_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_compra_id_fk FOREIGN KEY (compra_id) REFERENCES public.compra(id);


--
-- TOC entry 3536 (class 2606 OID 25318)
-- Name: tipo_pagamento pagamento_conta_corrente_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_pagamento
    ADD CONSTRAINT pagamento_conta_corrente_id_fk FOREIGN KEY (conta_corrente_id) REFERENCES public.conta_corrente(id);


--
-- TOC entry 3529 (class 2606 OID 25953)
-- Name: pagamento pagamento_fechamento_caixa_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_fechamento_caixa_fk FOREIGN KEY (fechamento_caixa_id) REFERENCES public.fechamento_caixa(id);


--
-- TOC entry 3534 (class 2606 OID 25308)
-- Name: tipo_pagamento pagamento_financeira_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_pagamento
    ADD CONSTRAINT pagamento_financeira_id_fk FOREIGN KEY (financeira_id) REFERENCES public.financeira(id);


--
-- TOC entry 3532 (class 2606 OID 25298)
-- Name: tipo_pagamento pagamento_formas_de_pagamento_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_pagamento
    ADD CONSTRAINT pagamento_formas_de_pagamento_id_fk FOREIGN KEY (forma_pagamento_id) REFERENCES public.formas_de_pagamento(id);


--
-- TOC entry 3535 (class 2606 OID 25313)
-- Name: tipo_pagamento pagamento_operadora_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_pagamento
    ADD CONSTRAINT pagamento_operadora_id_fk FOREIGN KEY (operadora_id) REFERENCES public.operadora(id);


--
-- TOC entry 3531 (class 2606 OID 25293)
-- Name: tipo_pagamento pagamento_pagamento_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_pagamento
    ADD CONSTRAINT pagamento_pagamento_id_fk FOREIGN KEY (pagamento_id) REFERENCES public.pagamento(id);


--
-- TOC entry 3525 (class 2606 OID 25263)
-- Name: pagamento pagamento_pessoa_fisica_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pessoa_fisica_id_fk FOREIGN KEY (pessoa_fisica_id) REFERENCES public.pessoa_fisica(id);


--
-- TOC entry 3526 (class 2606 OID 25268)
-- Name: pagamento pagamento_pessoa_juridica_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pessoa_juridica_id_fk FOREIGN KEY (pessoa_juridica_id) REFERENCES public.pessoa_juridica(id);


--
-- TOC entry 3527 (class 2606 OID 25273)
-- Name: pagamento pagamento_venda_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_venda_id_fk FOREIGN KEY (venda_id) REFERENCES public.venda(id);


--
-- TOC entry 3558 (class 2606 OID 25598)
-- Name: parcelas_contas_pagar parcelas_contas_pagar_contas_pagar_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parcelas_contas_pagar
    ADD CONSTRAINT parcelas_contas_pagar_contas_pagar_id_fk FOREIGN KEY (contas_pagar_id) REFERENCES public.contas_pagar(id);


--
-- TOC entry 3575 (class 2606 OID 25880)
-- Name: parcelas_contas_receber parcelas_contas_receber_contas_receber_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parcelas_contas_receber
    ADD CONSTRAINT parcelas_contas_receber_contas_receber_id_fk FOREIGN KEY (contas_receber_id) REFERENCES public.contas_receber(id);


--
-- TOC entry 3542 (class 2606 OID 25357)
-- Name: parcelas_pagamento parcelas_pagamento_tipo_pagamento_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parcelas_pagamento
    ADD CONSTRAINT parcelas_pagamento_tipo_pagamento_id_fk FOREIGN KEY (tipo_pagamento_id) REFERENCES public.tipo_pagamento(id);


--
-- TOC entry 3464 (class 2606 OID 24687)
-- Name: pessoa_fisica_dependentes pessoaFisicaDependentes_pessoaFisica_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica_dependentes
    ADD CONSTRAINT "pessoaFisicaDependentes_pessoaFisica_fk" FOREIGN KEY (id_pessoa_fisica) REFERENCES public.pessoa_fisica(id);


--
-- TOC entry 3465 (class 2606 OID 24703)
-- Name: pessoa_fisica_documento pessoaFisicaDocumento_pessoaFisica_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pessoa_fisica_documento
    ADD CONSTRAINT "pessoaFisicaDocumento_pessoaFisica_fk" FOREIGN KEY (id_pessoa_fisica) REFERENCES public.pessoa_fisica(id);


--
-- TOC entry 3549 (class 2606 OID 25442)
-- Name: preco_produto preco_produto_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preco_produto
    ADD CONSTRAINT preco_produto_fk FOREIGN KEY (id_produto) REFERENCES public.produto(id);


--
-- TOC entry 3547 (class 2606 OID 25943)
-- Name: preco_produto preco_produto_grade_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preco_produto
    ADD CONSTRAINT preco_produto_grade_fk FOREIGN KEY (grade_id) REFERENCES public.grade(id);


--
-- TOC entry 3586 (class 2606 OID 26191)
-- Name: remessas remessas_conta_corrente_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.remessas
    ADD CONSTRAINT remessas_conta_corrente_fk FOREIGN KEY (conta_corrente_id) REFERENCES public.conta_corrente(id);


--
-- TOC entry 3589 (class 2606 OID 26218)
-- Name: senha_gerente senha_gerente_funcionario_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.senha_gerente
    ADD CONSTRAINT senha_gerente_funcionario_fk FOREIGN KEY (funcionario_id) REFERENCES public.funcionario(id);


--
-- TOC entry 3537 (class 2606 OID 25428)
-- Name: cheque situacao_dados_cd_cheque_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cheque
    ADD CONSTRAINT situacao_dados_cd_cheque_fk FOREIGN KEY (situacao) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3538 (class 2606 OID 25423)
-- Name: cheque status_dados_cd_cheque_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cheque
    ADD CONSTRAINT status_dados_cd_cheque_fk FOREIGN KEY (status) REFERENCES public.cd_complementares(id);


--
-- TOC entry 3588 (class 2606 OID 26228)
-- Name: movimentacao_tesouraria tesouraria_fechamento_caixa_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimentacao_tesouraria
    ADD CONSTRAINT tesouraria_fechamento_caixa_fk FOREIGN KEY (fechamento_caixa_id) REFERENCES public.fechamento_caixa(id);


-- Completed on 2022-04-13 05:33:43

--
-- PostgreSQL database dump complete
--

