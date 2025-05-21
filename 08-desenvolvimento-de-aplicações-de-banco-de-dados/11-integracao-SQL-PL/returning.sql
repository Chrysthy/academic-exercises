-- Serve para retornar um valor - que pode ser numerérico, string - mas um valor do resultado de uma opreação
-- Podemos usar para saber quantas linhas foram afetadas pelo update, por exemplo
-- ele trás o resultado de como foi aquela operação dml
-- pode usar com funções de grupo

drop table pessoa;
CREATE TABLE pessoa
(
    codigo NUMBER(5);
    nome VARCHAR2(40);
    status CHAR(1);
);

INSERT INTO PESSOA VALUES (1, 'CHRYSTINE', 'A')
/
INSERT INTO PESSOA VALUES (2, 'NOOB'     , 'A')
/
INSERT INTO PESSOA VALUES (3, 'LEON'     , 'A')
/
INSERT INTO PESSOA VALUES (4, 'COLLIN'   , 'A')
/

COMMIT
/

select * from pessoa;

set serveroutput on;
DECLARE 
    v_nome pessoa.nome%TYPE;

BEGIN 
    UPDATE pessoa
    SET status = 'I'
    WHERE codigo = 1
    RETURNING nome INTO v_nome;
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome);
END;
/

select * from pessoa;
