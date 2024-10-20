Algoritmo "MediaNotasTurma"

Var
    nomes: vetor [1..10] de caractere
    notas: vetor [1..10] de real
    contador: inteiro
    soma: real
    media: real

Inicio
    soma <- 0  // Inicializar a soma das notas

    // Entrada de dados: nome e nota de 10 alunos
    para contador de 1 ate 10 faca

        escreval("Digite o nome do aluno ", contador, ":")
        leia(nomes[contador])
        
        escreval("Digite a nota do aluno ", contador, ":")
        leia(notas[contador])
        
        soma <- soma + notas[contador]  // Acumula a soma das notas
        
    fimpara

    // Exibir os nomes e as notas
    para contador de 1 ate 10 faca

        escreval("Nome do aluno: ", nomes[contador], " - Nota: ", notas[contador])

    fimpara

    // Calcular a média
    media <- soma / 10

    // Exibir a média da turma
    escreval("A média da turma é: ", media)

Fimalgoritmo
