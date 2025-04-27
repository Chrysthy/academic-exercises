/* Lógico_1: */

CREATE TABLE VENDEDOR (
    Código do vendedor number(5) PRIMARY KEY,
    nome_vendedor varchar2(50),
    endereco varchar2(50),
    percentual_de_comissao number(2,1)
);

CREATE TABLE CLIENTE (
    cod_cliente number(5) PRIMARY KEY,
    endereco_do_cliente varchar2(50),
    limite_de_credito number(9,2),
    nome_do_cliente varchar2(50)
);

CREATE TABLE PEDIDO (
    codigo_do_pedido number(5) PRIMARY KEY,
    data_do_pedido date
);

CREATE TABLE PECA (
    codigo_da_peca number(5) PRIMARY KEY,
    descricao_da_peca varchar2(50),
    quantidade_em_estoque number(5),
    preco_unitario_da_peca number(9,2),
    FK_DEPOSITO_codigo_do_Deposito NUMERIC(4)
);

CREATE TABLE DEPOSITO (
    codigo_do_Deposito NUMERIC(4) 4 PRIMARY KEY,
    Endereco_do_deposito varchar2(100)
);

CREATE TABLE atende_VENDEDOR_CLIENTE_PEDIDO (
    fk_VENDEDOR_Atributo_1 number(5),
    fk_CLIENTE_cod_cliente number(5),
    fk_PEDIDO_codigo_do_pedido number(5)
);

CREATE TABLE PEDIDO_PEÇA (
    fk_PECA_codigo_da_peca number(5),
    fk_PEDIDO_codigo_do_pedido number(5),
    quantidade_de_pecas_solicitadas number(5),
    preco_cotado_da_peca number(9,2)
);
 
ALTER TABLE PECA ADD CONSTRAINT FK_PECA_2
    FOREIGN KEY (FK_DEPOSITO_codigo_do_Deposito)
    REFERENCES DEPOSITO (codigo_do_Deposito)
    ON DELETE SET NULL;
 
ALTER TABLE atende_VENDEDOR_CLIENTE_PEDIDO ADD CONSTRAINT FK_atende_VENDEDOR_CLIENTE_PEDIDO_1
    FOREIGN KEY (fk_VENDEDOR_Atributo_1)
    REFERENCES VENDEDOR (Código do vendedor)
    ON DELETE RESTRICT;
 
ALTER TABLE atende_VENDEDOR_CLIENTE_PEDIDO ADD CONSTRAINT FK_atende_VENDEDOR_CLIENTE_PEDIDO_2
    FOREIGN KEY (fk_CLIENTE_cod_cliente)
    REFERENCES CLIENTE (cod_cliente)
    ON DELETE NO ACTION;
 
ALTER TABLE atende_VENDEDOR_CLIENTE_PEDIDO ADD CONSTRAINT FK_atende_VENDEDOR_CLIENTE_PEDIDO_3
    FOREIGN KEY (fk_PEDIDO_codigo_do_pedido)
    REFERENCES PEDIDO (codigo_do_pedido)
    ON DELETE NO ACTION;
 
ALTER TABLE PEDIDO_PEÇA ADD CONSTRAINT FK_PEDIDO_PEÇA_1
    FOREIGN KEY (fk_PECA_codigo_da_peca)
    REFERENCES PECA (codigo_da_peca)
    ON DELETE RESTRICT;
 
ALTER TABLE PEDIDO_PEÇA ADD CONSTRAINT FK_PEDIDO_PEÇA_2
    FOREIGN KEY (fk_PEDIDO_codigo_do_pedido)
    REFERENCES PEDIDO (codigo_do_pedido)
    ON DELETE SET NULL;