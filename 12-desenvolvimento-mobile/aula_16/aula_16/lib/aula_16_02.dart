// Publicando no Google Play Store
//  Criação de Conta de Desenvolvedor no Google Play
//    1.	Registro na Google Play Console
//      	Acesse Google Play Console e registre-se como desenvolvedor.
//      	Pague a taxa única de inscrição (cerca de $25).

//  Preparação do Aplicativo para Upload
//    1.	Gerar APK/Bundle de Aplicativo
//      	Execute o comando para gerar o APK:
//          flutter build apk --release
//      	Ou, para gerar um bundle de aplicativo (recomendado):
//          flutter build appbundle --release
//    2.	Assinatura do APK/Bundle
//      	Configure a assinatura do aplicativo no arquivo key.properties:
//         storePassword=your-store-password
//         keyPassword=your-key-password
//         keyAlias=your-key-alias
//         storeFile=path/to/your-keystore.jks
//    	  Atualize o arquivo build.gradle com as configurações de assinatura:
//         gradle
//         Copiar código
//          android {
//            ...
//          signingConfigs {
//               release {
//                  keyAlias keystoreProperties['keyAlias']
//                  keyPassword keystoreProperties['keyPassword']
//                   storeFile file(keystoreProperties['storeFile'])
//                   storePassword keystoreProperties['storePassword']
//              }
//          }
//           buildTypes {
//               release {
//                   signingConfig signingConfigs.release
//               }
//        }
//     }

// Submissão do Aplicativo na Google Play
//  1.	Criar um Novo Projeto no Google Play Console
//    	Acesse a Google Play Console e crie um novo projeto para seu aplicativo.
//    	Preencha as informações básicas, como nome, descrição e categoria do aplicativo.
//  2.	Upload do APK/Bundle
//    	Na seção de gerenciamento de versões, faça o upload do APK ou bundle gerado.
//    	Preencha as informações de lançamento, incluindo notas de versão e direcionamentos de público-alvo.
//  3.	Preencher Detalhes da Loja
//    	Adicione capturas de tela, ícones e descrições detalhadas.
//    	Configure os preços e países onde o aplicativo estará disponível.
//  4.	Submeter para Revisão
//    	Revise todas as informações e submeta o aplicativo para revisão.
//    	Acompanhe o status da revisão na Google Play Console.
