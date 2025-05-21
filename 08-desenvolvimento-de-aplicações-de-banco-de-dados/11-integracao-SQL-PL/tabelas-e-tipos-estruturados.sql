
conn scott/tiger
set serveroutput on;
DROP TABLE NOVO_DEPTO;
CREATE TABLE NOVO_DEPTO AS (SELECT * FROM DEPT WHERE DEPTNO=0);
SELECT * FROM NOVO_DEPTO;

Declare 
    TYPE Tp_Tab_dept
    IS TABLE OF dept%ROWTYPE -- mesmo tipo da linha da tabela dept
    INDEX BY BINARY_INTEGER; -- indexada por um número inteiro

    dept_tab1 Tp_Tab_dept;
    C Binary_interger;
    recdept dept%rowtype;
Begin 
        C := 0;
 -- Popula a tabela PL/SQL Dept_Tab1
        For RecDept in (Select * from dept) Loop
                Dept_Tab1(C).deptno := RecDept.deptno;
                Dept_Tab1(C).dname := RecDept.dname;
                Dept_Tab1(C).loc := RecDept.loc;
                C := C + 1;
                DBMS_OUTPUT.PUT_LINE('Registro: ' || C || 'Codigo do Depto: ' || recdept.deptno || 'Nome o Depto: ' || recdept.dname || 'Local do Depto: ' || recdept.loc);
        end loop;

        For RecDEPT in (Select * from dept) Loop    
                Dept_Tab1(C).deptno := RecDept.deptno;
                Dept_Tab1(C).dname := RecDept.dname;
                Dept_Tab1(C).loc := RecDept.loc;
                If dept_tab1(C).loc = 'NEW YORK' Then
                        Insert into NOVO_DEPTO (deptno, dname, loc)
                        Values (c+1, recdept.dname, recdept.loc);
                End If;
        End Loop;

        Commit;
End;
/

SELECT * FROM NOVO_DEPTO;


