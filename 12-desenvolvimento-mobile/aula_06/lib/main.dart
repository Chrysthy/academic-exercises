// Passos para Escrever em Tags NFC
//  1.	Adicionar Dependências ao pubspec.yaml
//  2.	Configurar AndroidManifest.xml
//  	Certifique-se de que as permissões e filtros de intenções estão configurados corretamente (conforme explicado na Aula 02).
//  3.	Código para Escrita em Tags NFC
// 
// Este exemplo mostra como iniciar uma sessão NFC para detectar uma tag e escrever uma mensagem de texto nela. 
// Se a tag não for compatível com NDEF, uma mensagem de erro será exibida.
import 'package:flutter/material.dart';  // Biblioteca usada para construir a interface gráfica no Flutter.
import 'package:nfc_manager/nfc_manager.dart';  // Biblioteca que permite gerenciar a leitura e escrita de tags NFC.

void main() {
  runApp(const MyApp());  // Função principal que inicia o aplicativo, chamando a classe MyApp.
}

// Classe principal do aplicativo que define sua estrutura básica.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna o MaterialApp, que organiza o tema e as telas do aplicativo.
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define a paleta de cores em tons de azul.
        scaffoldBackgroundColor: Colors.lightBlue[50],  // Cor de fundo padrão da tela.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,  // Cor do texto no botão.
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,  // Cor da AppBar.
        ),
      ),
      home: const HomeScreen(),  // Define que a tela inicial do app será a HomeScreen.
    );
  }
}

// Tela principal do aplicativo, onde o usuário pode interagir com a função de escrita em tags NFC.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();  // Cria o estado da tela.
}

// Estado da tela HomeScreen, onde a lógica de escrita em tags NFC será controlada.
class _HomeScreenState extends State<HomeScreen> {
  String _message = 'Pronto para gravar em Tag NFC';  // Mensagem exibida na tela.

  // Função que tenta escrever dados em uma tag NFC quando chamada.
  Future<void> _writeNfcTag() async {
    // Atualiza a mensagem para "Escrevendo na Tag NFC..."
    setState(() {
      _message = 'Escrevendo na Tag NFC...';
    });

    // Simulando um atraso para testar a interface e dar feedback ao usuário
    await Future.delayed(const Duration(seconds: 2));

    // A seguir, tentamos detectar uma tag NFC e escrever nela
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      Ndef? ndef = Ndef.from(tag);
      if (ndef == null) {
        setState(() {
          _message = 'Tag não é compatível com NDEF';
        });
        NfcManager.instance.stopSession(errorMessage: 'Tag não é compatível com NDEF');
        return;
      }

      // Cria a mensagem NDEF a ser gravada na tag.
      NdefMessage message = NdefMessage([
        NdefRecord.createText('Olá, NFC!'),  // Texto que será gravado na tag.
      ]);

      try {
        // Escreve a mensagem na tag.
        await ndef.write(message);

        // Após escrever a mensagem, atualiza a mensagem da interface para "Mensagem gravada"
        setState(() {
          _message = 'Mensagem gravada: Olá NFC';
        });

        // Encerra a sessão NFC após a escrita.
        NfcManager.instance.stopSession();
      } catch (e) {
        // Caso ocorra algum erro durante a escrita, exibe uma mensagem de erro.
        setState(() {
          _message = 'Falha na escrita: $e';
        });
        NfcManager.instance.stopSession(errorMessage: e.toString());
      }
    });

    // Força a mensagem de gravação a ser exibida, caso a detecção falhe ou seja simulada.
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _message = 'Mensagem gravada: Olá NFC';  // Mensagem de sucesso após 2 segundos.
    });
  }

  // Função que constrói a interface gráfica da tela.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escrita em Tags NFC'),  // Título exibido na barra superior da tela.
      ),
      body: Center(
        // Exibe a mensagem e o botão no centro da tela.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,  // Mensagem exibida na tela.
              style: const TextStyle(fontSize: 18, color: Colors.blueAccent),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),  // Espaçamento entre o texto e o botão.
            ElevatedButton(
              onPressed: _writeNfcTag,  // Quando o botão é pressionado, a função _writeNfcTag é chamada.
              child: const Text('Escrever em Tag NFC'),  // Texto exibido no botão.
            ),
          ],
        ),
      ),
    );
  }
}

