//if, else if and else
let idade = 17;

if (idade < 16) {
    console.log('Você não pode votar ainda.');

} else if (idade < 18) {
    console.log('Você pode votar, porém não é obrigatório.');

} else {
    console.log('O seu voto é obrigatório.');

}


//switch
let diaDaSemana = 'Oi';

switch (diaDaSemana) {
    case 'Domingo':

        console.log('Hoje é Domingo.');


        break;

    case 'Segunda':

        console.log('Hoje é Segunda.');


        break;


    case 'Terça':

        console.log('Hoje é Terça.');


        break;


    case 'Quarta':

        console.log('Hoje é Quarta.');


        break;


    case 'Quinta':

        console.log('Hoje é Quinta.');


        break;


    case 'Sexta':

        console.log('Hoje é Sexta.');


        break;


    case 'Sábado':

        console.log('Hoje é Sábado.');


        break;

    default:

        console.log('Isso é um dia da semana?');


        break;
}