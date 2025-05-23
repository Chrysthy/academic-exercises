-- Example 1
select user_name, to_char(data, 'dd/mm/yyyy-HH:mi:ss'), antigo_nome, novo_nome, antigo_salario, novo_salario from aud_emp;


conn system/manager
set serveroutput on;
drop table empregado;
drop table funcionario;
create table empregado as (select * from scott.emp);

CREATE OR REPLACE TRIGGER vigia
AFTER RENAME ON SCHEMA
BEGIN
    DBMS_OUTPUT.PUT_LINE('Algo trocou de nome');
END;
/

RENAME empregado TO funcionario;

