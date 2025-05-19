-- É o fato de conseguir usar variáveis dentro dos packages

-- cabeçalho
Create or Replace Package exemplo_pack
Is
        chamadas_reajuste NUMBER := 0;
        chamadas_descobrir_salario NUMBER := 0;

        PROCEDURE reajuste
            (v_codigo_emp IN emp.empno%type,
            v_porcentagem IN number);
        FUNCTION descobrir_salario
            (p_id in emp.Empno%type)
            return number;
End exemplo_pack;
/

CREATE OR REPLACE PACKAGE BODY exemplo_pack IS 
PROCEDURE reajuste
(v_codigo_emp IN emp.empno%type,
v_porcentagem IN number);
IS 
BEGIN
        UPDATE emp
            SET sal = sal + (sal * (v_porcentagem / 100))
            where empno = v_codigo_emp;
            COMMIT;
            chamadas_reajuste:= chamadas_reajuste+1;
END reajuste;


FUNCTION descobrir_salario
(p_id in emp.Empno%type)
return number
IS 
    v_salario emp.sal%type := 0;
    BEGIN
chamadas_descobrir_salario:= chamadas_descobrir_salario+1

Select sal into v_salario
From emp
Where  empno = p_id;
Return v_salario;
End descobrir_salario;

End exemplo_pack;
/

select exemplo_pack.descobrir_salario(7934) from dual;
execute exemplo_pack.reajuste(7934,25);

select exemplo_pack.descobrir_salario(7934) from dual;


SET SERVEROUTPUT ON;
BEGIN   

        DBMS_OUTPUT.PUT_LINE(EXEMPLO_PACK.chamadas_reajuste);
        DBMS_OUTPUT.PUT_LINE(EXEMPLO_PACK.chamadas_descobrir_salario);
END;
/
