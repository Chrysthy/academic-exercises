-- Linguagem PL/SQL
-- Elementos da linguagem PL/SQL
-- Variáveis, constantes, tipos de dados, operadores, expressões, estruturas de controle, tratamento de exceções e pacotes.

SET SERVEROUTPUT ON
ACCEPT p_nome PROMPT 'Digite o nome do funcionário...'
ACCEPT p_sal_mes PROMPT 'Digite o valor do salário...'

-- Accept faz com que o usuário intereja 

-- Declarando variável
Declare 
    v_nome varchar2(50) := '&p_nome';
    v_sal number := &p_sal_mes;
    v_sal_anual number(9,2);
Begin
    v_sal_anual := v_sal * 12;
    DBMS_output.put_line('O salário anual de ' || v_nome || ' é: ' || v_sal_anual);    
End;
/
-- Começar e finalizar o código/executar
-- Precisa colocar / para executar o bloco de código no final do End.