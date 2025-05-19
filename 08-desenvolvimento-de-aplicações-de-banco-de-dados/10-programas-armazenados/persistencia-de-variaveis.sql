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