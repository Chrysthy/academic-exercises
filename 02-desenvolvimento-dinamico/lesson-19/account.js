class ContaCliente {

    constructor(numeroConta, saldo, debito, credito) {

        this.numeroConta = numeroConta;
        this.saldo = saldo;
        this.debito = debito;
        this.credito = credito;

    };

    calcularSaldoAtual() {

        return this.saldo - this.debito + this.debito

    }

    verificarSaldo() {

        const saldoAtual = this.calcularSaldoAtual()

        if (saldoAtual >= 0) {

            alert("Saldo positivo R$ " + saldoAtual)

        } else {

            alert("Saldo Negativo R$ " + saldoAtual)

        }

    }

}