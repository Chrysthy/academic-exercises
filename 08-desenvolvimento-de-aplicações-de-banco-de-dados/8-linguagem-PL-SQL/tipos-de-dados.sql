-- Tipos de dados

DECLARE 
    v_deptno NUMBER(2);
    v_loc VARCHAR2(15);
BEGIN
    SELECT deptno, loc 
    INTO v_deptno, v_loc 
    FROM dept 
    WHERE dname= 'SALES';
    
    DBMS_OUTPUT.PUT_LINE('O código do Departamento é' || v_deptno || ' e a localização é ' || v_loc);
END;
/


-- Exemplo 2 percent type: %TYPE
DECLARE 
    v_sum_sal emp.sal%TYPE;
    v_dept_no NUMBER NOT NULL := 30;
BEGIN
    SELECT SUM(sal)  -- group function
    INTO v_sum_sal 
    FROM emp 
    WHERE deptno = v_dept_no;
    
    DBMS_OUTPUT.PUT_LINE('A soma dos saláriosé ' || v_sum_sal);
END;
/