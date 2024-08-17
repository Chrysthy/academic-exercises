/*

Os critérios de elegibilidade incluem idade mínima, número mínimo de anos de experiência, nível mínimo de educação e a obrigatoriedade ou não de um certificado. O programa deve verificar se o candidato atende a todos esses critérios e, com base nessa verificação, fornecer um resultado indicando se o candidato é elegível para a vaga.

O código deve utilizar operadores aritméticos e lógicos para realizar as comparações necessárias. Além disso, o resultado da elegibilidade deve ser exibido de forma clara e compreensível para o usuário.

Sua solução precisa ser eficiente, confiável e capaz de lidar com diferentes cenários de candidatos e critérios de elegibilidade. Certifique-se de testar seu código com diferentes conjuntos de dados para garantir sua correta funcionalidade.

*/


//informação dos candidatos
let idade = 20;
let experienciaEmAnos = 3;
let nivelDeEducacao = 'superior';
let certificado = 'true';

//Critérios de Elegibilidade
let idadeMinima = 18;
let experienciaMinima = 2;
let nivelDeEducacaoMinimo = 'superior';
let obrigatorioCertificado = '';

//Verificação
let elegivel =
    idade >= idadeMinima && experienciaEmAnos >= experienciaMinima && nivelDeEducacao === nivelDeEducacaoMinimo && (nivelDeEducacao === nivelDeEducacaoMinimo || certificado) && (!obrigatorioCertificado || certificado);

console.log('É elegível para a vaga? ' + elegivel);


/*
**Resolução**

// Exemplo de verificação de elegibilidade para uma vaga de emprego

// Dados do candidato

var idade = 28;

var experienciaAnos = 5;

var nivelEducacao = “superior”;

var possuiCertificado = true;

// Critérios de elegibilidade

var idadeMinima = 18;

var experienciaMinimaAnos = 3;

var nivelEducacaoMinimo = “superior”;

var certificadoObrigatorio = true;

// Verificação de elegibilidade

var elegivel =

idade >= idadeMinima &&

experienciaAnos >= experienciaMinimaAnos &&

(nivelEducacao === nivelEducacaoMinimo || possuiCertificado) &&

(!certificadoObrigatorio || possuiCertificado);

// Saída do resultado

console.log("Elegível para a vaga? " + elegivel);


*/