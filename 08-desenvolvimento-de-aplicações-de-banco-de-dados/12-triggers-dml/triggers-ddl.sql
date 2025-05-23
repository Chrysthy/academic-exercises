-- Example 

conn system/manager
set serveroutput on;
drop table empregado;
drop table funcionario;
create table empregado as (select * from scott.emp);

CREATE OR REPLACE TRIGGER vigia3
AFTER RENAME ON SCHEMA
BEGIN
    DBMS_OUTPUT.PUT_LINE('O comando ' || ORA_SYSEVENT || ' acima foi executado pelo usuário ' || ORA_LOGIN_USER || 
    ' em um objeto criado pelo usuário ' || ORA_DICT_OBJ_OWNER || ' no objeto: ' || ORA_DICT_OBJ_NAME);
END;
/

RENAME empregado TO funcionario;
