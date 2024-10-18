Algoritmo "NOTASDOSALUNOS"

Var
notas: vetor [1..5] de real
contadorLoop1: inteiro
media: real
soma: real

Inicio
soma <- 0


para contadorLoop1 de 1 ate 5 faca
    escreva ("Digite a nota do(a) aluno(a): ", contadorLoop1, "de 1 a 5: ")
    leia(notas[contadorLoop1])
     
    soma <- soma  + notas[contadorLoop1]
fimpara

     


Fimalgoritmo