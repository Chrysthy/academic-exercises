Algoritmo "semnome"

Var
opcao: inteiro
num, resultado: real

Inicio
escreval ("1 - Multiplica por 2")
escreval ("2 - Multiplica por 3")

leia (opcao)

escreval ("Digite um número")
leia (num)

escolha (opcao)
    caso 1
    resultado <- num *2
       
    caso 2
    resultado <- num *3
       
fimescolha

escreval ("O resultado da opção foi ", resultado)


Fimalgoritmo