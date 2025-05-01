--Criando e gerenciando autorizações e perfis

-- O profile é aquilo que dá as características de como será a senha desse usuário, como por exemplo:
-- quantas tentativas ele tem para logar, se a senha expira, se ele pode usar a mesma senha novamente, bloqueio, etc.

-- Cria o usuário e grarante a permissão de sessão para ele
conn system/manager

create user peter
identified by peter
default tablespace system
quota 15m on system;

grant create session to peter;

conn peter/peter;



