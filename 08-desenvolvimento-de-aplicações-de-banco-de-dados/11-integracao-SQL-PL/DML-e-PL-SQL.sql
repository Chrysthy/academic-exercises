conn system/manager

set serveroutput on;
drop table filmes;

CREATE TABLE FILMES (
    filme_id NUMBER(5) primary key,
    titulo   VARCHAR2(100),
    diretor  VARCHAR2(100),
    ano      NUMBER(5),
    pais     VARCHAR2(100),
    duracao NUMBER(5));


CREATE OR REPLACE PACKAGE BODY pkg_filmes AS
    FILME_REPETIDO EXCEPTION;
    CAMPO_NULO EXCEPTION;
    PRAGMA EXCEPTION_INIT (FILME_REPETIDO, -1);
    PRAGMA EXCEPTION_INIT (CAMPO_NULO, -2290);
END pkg_filmes;
/


CREATE OR REPLACE FUNCTION inclui_filme (
    filme_id NUMBER,
    titulo   VARCHAR2,
    diretor  VARCHAR2,
    ano      NUMBER,
    pais     VARCHAR2,
    duracao  NUMBER
)
RETURN NUMBER
IS

    ret NUMBER := 0;
    -- Inclui novo registro e trata as esceções que podem ocorrer. Retorna 0(inclusã ok) ou o código do erro (inclusão nok)
BEGIN 
    -- Para poder retornar ao corpo da função, após o tratamento do erro, coloca-se o comando INSERT dentro de um bloco
    BEGIN
        INSERT INTO filmes VALUES (filme_id, titulo, diretor, ano, pais, duracao);
    EXCEPTION
        WHEN pkg_filmes.FILME_REPETIDO THEN 
            ret := -1;

        -- Um campo not null recebe o valor null
        WHEN pkg_filmes.CAMPO_NULO THEN
            ret := -2290;
        WHEN OTHERS THEN 
            ret := SQLCODE;
        END;
        RETURN ret;
END;
/

-- Usando a function
-- bloco anônimo
DECLARE
    ret NUMBER;
BEGIN
    ret := inclui_filme(1, 'Caçadores da Arca Perdida', 'Steven Spielberg', 1981, 'EUA', 115);
    IF ret = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Inclusão bem sucedida.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Erro na inclusão: ' || ret || ' - Filme repetido');
    END IF;
END;
/

select * from filmes;


