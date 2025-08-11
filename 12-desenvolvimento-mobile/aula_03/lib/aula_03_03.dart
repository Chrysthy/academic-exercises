// Uso de Imagens
//  1.	Image Widget
//    O Image widget é usado para exibir imagens na aplicação.
// Reproduzindo Vídeos
//  2.	Video Player
//    Para reproduzir vídeos, usamos o pacote video_player.

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// Função principal onde o programa começa a ser executado
void main() {
  runApp(const MyApp()); // Executa o aplicativo MyApp
}

// MyApp é o widget principal que gerencia a navegação entre as telas
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de Imagem e Vídeo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // Define a página inicial do aplicativo
    );
  }
}

// Classe que gerencia a tela inicial
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagens e Vídeos'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // --- 1. Image Widget ---
          // Exemplo básico de exibição de uma imagem usando o widget Image
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Exemplo de Imagem:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Carregando uma imagem da internet usando Image.network
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://images.app.goo.gl/mypou7o4ysnqkdfNA',
              width: 300,
            ),
          ),
          const Divider(), // Linha divisória entre a seção de imagem e vídeo

          // --- 2. Video Player ---
          // Exemplo básico de reprodução de vídeo
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Exemplo de Vídeo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const VideoPlayerWidget(), // Widget personalizado para exibir o vídeo
        ],
      ),
    );
  }
}

// Widget responsável por gerenciar o player de vídeo
class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

// Classe de estado para gerenciar o controle do vídeo
class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller; // Controlador para o player de vídeo

  @override
  void initState() {
    super.initState();
    // Inicia o controlador com um vídeo da internet
    // ignore: deprecated_member_use
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((_) {
        // Atualiza o estado quando o vídeo é carregado
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Verifica se o vídeo foi inicializado antes de exibi-lo
        _controller.value.isInitialized
            ? AspectRatio(
                // Mantém a proporção correta do vídeo
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(), // Exibe um indicador de progresso enquanto o vídeo carrega
        const SizedBox(height: 20),
        // Botão para controlar a reprodução do vídeo (play/pause)
        FloatingActionButton(
          onPressed: () {
            setState(() {
              // Alterna entre play e pause
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          // Ícone muda dependendo se o vídeo está tocando ou não
          child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Libera os recursos do controlador quando o widget é destruído
    _controller.dispose();
  }
}
