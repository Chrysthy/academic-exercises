var bebidas = 'café';

switch (bebidas) {

    case 'café':

        console.log("Bebida escolhida: " + bebidas + " - Valor R$ 1.50.");

        break;

    case 'leite':

        console.log("Bebida escolhida: " + bebidas + " - Valor R$ 2.50.");


        break;

    case 'chá':

        console.log("Bebida escolhida: " + bebidas + " - Valor R$ 4.00.");

        break;

    default:

        console.log("Opção inválida. Escolha entre: Café, Leite ou Chá.");

        break;
}