-- cabeçalho do pacote (package)
-- só especificamos quais são os objetos que esse objeto vai ter
Create or Replace Package exemplo_pack
IS
    PROCEDURE reajuste
        (v_codigo_emp IN emp.empno%type,
        v_porcentagem IN number);
        FUNCTION descobrir_salario
                (p_id in emp. Empno%type)
                return number;
End exemplo_pack;
/

-- Criar o corpo do pacote (package)
-- Obrigatóriamente o nome do corpo tem que ser igual ao nome do cabeçalho
Create or Replace PACKAGE BODY exemplo_pack IS
PROCEDURE reajuste
        (v_codigo_emp IN emp.empno%type,
        v_porcentagem IN number);
IS
BEGIN
        UPDATE emp
            SET sal = sal + (sal * (v_porcentagem / 100))
            where empno = v_codigo_emp;
            COMMIT;
END reajuste;

FUNCTION descobrir_salario
(p_id in emp.Empno%type)
return number
IS 
    v_salario emp.sal%type := 0;
    BEGIN
Select sal into v_salario
From emp
Where  empno = p_id;
Return v_salario;
End descobrir_salario;

End exemplo_pack;
/

-- Fazendo a chamada
select exemplo_pack.descobrir_salario(7934) from dual;
execute exemplo_pack.reajuste(7934, 25);

select exemplo_pack.descobrir_salario(7934) from dual;