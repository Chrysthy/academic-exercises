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

let numeroConta = prompt("Digite o número da conta do cliente");
let saldo = parseFloat(prompt("Digite o saldo do cliente"));
let debito = parseFloat(prompt("Digite o debito do cliente"));
let credito = parseFloat(prompt("Digite o credito do cliente"));

let conta = new ContaCliente(numeroConta, saldo, debito, credito);
conta.verificarSaldo();