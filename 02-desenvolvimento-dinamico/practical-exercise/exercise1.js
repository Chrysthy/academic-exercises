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
