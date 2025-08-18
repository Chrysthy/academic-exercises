// Configurando o Ambiente de Testes no Flutter
//  Adicionando Dependências de Testes
//    1.	Adicionar Dependências ao pubspec.yaml
//      integration_test:
//      sdk: flutter
//    2.	Instalar Dependências
//      flutter pub get
//  Estrutura do Projeto de Teste
//    1.	Criar Diretório de Testes
//      Crie um diretório chamado test na raiz do projeto.
//    2.	Configurar Arquivo de Teste
//      Crie um arquivo de teste dentro do diretório test, por exemplo, test/aula_12_02_test.dart.
//  Escrevendo um Teste Simples
//    1.	Código de Teste Simples
//    2.	Executar o Teste

// Este código é um teste automatizado. 
// O que ele faz é verificar se a soma de 2 + 2 realmente resulta em 4. 
// Se isso for verdadeiro, o teste passa (é bem-sucedido). 
// Se por algum motivo a soma resultar em um número diferente, o teste falha.

// entre no terminar e execute: flutter test

// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';  // Importa a biblioteca de testes do Flutter

void main() {
  // Função principal que executa o teste
  test('Teste Simples', () {
    // Variável 'resultado' armazena o resultado de uma soma simples
    var resultado = 2 + 2;

    // A função 'expect' verifica se o resultado da soma é igual a 4
    expect(resultado, 4);
  });
}
