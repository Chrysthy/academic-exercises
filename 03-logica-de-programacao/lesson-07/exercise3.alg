Algoritmo "NOTASDOSALUNOS"

Var
notas: vetor [1..5] de real
nomes: vetor [1..5] de caractere

i: inteiro

media: real
soma: real

Inicio
soma <- 0


para i de 1 ate 5 faca
     escreva ("Digite o nome do(a) aluno(a): ", i, "de 5: ")
     leia(nomes[i])

     escreva ("Digite a nota do(a) aluno(a): ", i, "de 5: ")
     leia (notas[i])

     soma <- soma + notas[i]
fimpara

media <- soma / notas[i]

escreval ("Média de notas da turma: ", media)



Fimalgoritmo