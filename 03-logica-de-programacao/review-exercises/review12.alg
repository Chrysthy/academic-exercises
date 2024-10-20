Algoritmo "MATRIZ"

Var
numeros: vetor [1..5, 1..5] de inteiro
i, j: inteiro
soma: inteiro


Inicio


para i de 1 ate 5 faca

    para j de 1 ate 5 faca
     
        soma <- soma + 10
        numeros[i, j] <- soma
     
     fimpara

fimpara

para i de 1 ate 5 faca

    para j de 1 ate 5 faca
     
        escreval ("O valor linha é: ", i, " e o valor coluna é: ", j)
        escreval (numeros[i, j])
     
    fimpara

fimpara


Fimalgoritmo