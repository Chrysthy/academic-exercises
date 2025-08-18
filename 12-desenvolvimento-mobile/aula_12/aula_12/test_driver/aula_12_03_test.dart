// Passos:
//  Passo 1: Preparação do Ambiente
//  Passo 2: Configuração do Projeto para Testes Integrados
//  Passo 3: Criação dos Arquivos de Teste
//  Passo 4: Adicionando Chaves aos Widgets
//  Passo 5: Executando o Teste Integrado
//  Passo 6: Verificação dos Resultados
//  Passo 7: Análise e Melhoria dos Testes

// Para executar o teste: flutter drive --target=test_driver/aula_12_03_test.dart 

// Após a execução:
// Os testes integrados foram executados com sucesso! O log mostra que:
//  O Flutter Driver se conectou corretamente ao aplicativo.
//  O teste para verificar se o botão incrementa o contador foi executado e passou.
//  Não houve erros, e todos os testes foram finalizados com sucesso.
//  Isso confirma que a implementação do contador e o teste estão funcionando como esperado.

// Agora que tudo está funcionando, você pode adicionar mais testes integrados para cobrir outras 
// partes da sua aplicação ou melhorar a cobertura de testes. Se precisar de mais ajuda com testes adicionais ou ajustes, estou à disposição!

import 'package:flutter_driver/driver_extension.dart';
// ignore: depend_on_referenced_packages
import 'package:aula_12/main.dart' as app;

void main() {
  // Habilita a extensão para o Flutter Driver
  enableFlutterDriverExtension();

  // Chama a função main() do seu aplicativo
  app.main();
}
