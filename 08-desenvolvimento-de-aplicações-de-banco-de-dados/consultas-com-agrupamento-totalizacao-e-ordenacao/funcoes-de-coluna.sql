-- Funções de coluna

select sysdate from dual;
-- retorna a data do sistema operacional

select to_char(sysdate, 'dd/mm/yyyy') from dual;
-- retorna a data do sistema operacional formatada como dia/mês/ano

select to_char(sysdate, 'dd/month/yy') from dual;
-- retorna a data do sistema operacional formatada como dia/mês/ano com o mês por extenso

select trunc(58.548,1) from dual;
-- arredonda números para 1 casa depois da vírgula
-- retorna 58.5

select ename, lower(ename), upper(ename), initcap(ename) from scott.emp;
-- lower: converte para minúsculo
-- upper: converte para maiúsculo
-- initcap: converte a primeira letra de cada palavra para maiúsculo e o restante para minúsculo