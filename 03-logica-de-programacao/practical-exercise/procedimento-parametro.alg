Algoritmo "ProcedimentoParametroMultiplicacao"

    procedimento multiplicacao (a, b: inteiro)

    var

    multi: inteiro

    inicio

    multi <- a * b
    resultado <- multi

    fimprocedimento

Var

a, b, resultado: inteiro

Inicio

Escreval("Digite o primeiro número: ")
Leia(a)

Escreval("Digite o segundo número: ")
Leia(b)

multiplicacao(a, b)

Escreval("A multiplicação dos números ", a, " e", b, " é: ", resultado)

Fimalgoritmo