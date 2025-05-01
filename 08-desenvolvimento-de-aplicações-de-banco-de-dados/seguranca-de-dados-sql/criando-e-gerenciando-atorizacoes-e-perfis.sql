--Criando e gerenciando autorizações e perfis

-- O profile é aquilo que dá as características de como será a senha desse usuário, como por exemplo:
-- quantas tentativas ele tem para logar, se a senha expira, se ele pode usar a mesma senha novamente, bloqueio, etc.

-- Cria o usuário e grarante a permissão de sessão para ele
conn system/manager

create user peter
identified by peter
default tablespace system
quota 15m on system;
--está relacionada a limitar o espaço em disco (quota) que um usuário pode usar dentro de uma tablespace (neste caso, a SYSTEM). 15 megabytes.

grant create session to peter;

conn peter/peter;

show user; -- Verifica se o usuário foi criado com sucesso

--Dando um select na dba users para ver o status do usuário
select username, account_status from dba_users order by username;


-- Bloqueando o usuário
conn system/manager

alter user peter account lock; -- Bloqueia o usuário, ele não consegue mais logar no banco de dados.

conn peter/peter; -- Tenta logar com o usuário bloqueado, não vai conseguir.
-- O status do usuário vai ficar como LOCKED (bloqueado) e não vai conseguir logar no banco de dados.


-- Desbloqueando o usuário
conn system/manager

select username, account_status, lock_date, expiry_Date, default_tablespace, profile from dba_users where username = 'PETER'; -- Verifica o status do usuário antes de desbloquear

alter user peter
account unlock; -- Desbloqueia o usuário, ele consegue logar novamente no banco de dados.