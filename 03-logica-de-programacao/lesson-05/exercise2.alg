Algoritmo "ESCOLHA"

Var
OP : Inteiro
Num, Resultado: Real


Inicio
Escreval ("Opções")

Escreval ("1 - Calcular o dobro")
Escreval ("2 - Calcular o triplo")

Escreval ("Escolha uma opção")

Leia (OP)

Escreval ("Digite o número a ser calculado")

Leia (Num)

Escolha (OP)
    Caso 1
    Resultado <- Num * 2

    Caso 2
    Resultado <- Num * 3

FimEscolha

Escreval("O número", Num, " com a opção", OP, " escolhida é", Resultado)

Fimalgoritmo