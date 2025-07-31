// Estrutura de um Projeto Flutter
//  Estrutura Básica de Diretórios
//    1.	Diretório lib
//      Contém o código Dart do aplicativo.
//      Arquivo principal: main.dart.
//    2.	Diretório android
//      Contém os arquivos específicos da plataforma Android.
//      Inclui o AndroidManifest.xml e os arquivos de configuração do Gradle.
//    3.	Diretório ios
//      Contém os arquivos específicos da plataforma iOS.
//      Inclui o Info.plist e os arquivos de configuração do Xcode.
//    4.	Diretório test
//      Contém os testes unitários do aplicativo.
//    5.	Arquivos Principais
//      pubspec.yaml: Arquivo de configuração do projeto, onde são especificadas as dependências e outras configurações.
//      README.md: Arquivo de descrição do projeto.
//      .gitignore: Arquivo que define quais arquivos e diretórios devem ser ignorados pelo controle de versão Git.

// pubspec.yaml: Configura dependências e metadados do projeto Flutter.
// build.gradle: Gerencia o build e as dependências do projeto Android.
// AndroidManifest.xml: Define permissões e componentes principais do app Android.

import 'package:flutter/material.dart'; // Importa a biblioteca básica de widgets do Flutter

void main() {
  runApp(const MyApp()); // Executa o aplicativo que estamos criando, chamado MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget é a raiz da sua aplicação.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Este é o tema da sua aplicação.
        //
        // TENTE ISSO: Execute seu aplicativo com "flutter run". Você verá
        // que o aplicativo tem uma barra de ferramentas roxa. Depois, sem sair do app,
        // tente mudar a seedColor no colorScheme abaixo para Colors.green
        // e então invoque o "hot reload" (salve suas alterações ou pressione o botão "hot
        // reload" em um IDE com suporte a Flutter, ou pressione "r" se estiver usando
        // a linha de comando para iniciar o app).
        //
        // Perceba que o contador não foi redefinido para zero; o estado do aplicativo
        // não foi perdido durante o recarregamento. Para redefinir o estado, use o "hot restart".
        //
        // Isso funciona para o código também, não apenas para valores: A maioria das mudanças de código pode ser
        // testada com apenas um hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'), // Define a página inicial
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // Este widget é a página inicial da sua aplicação. Ele é stateful, o que significa
  // que possui um objeto State (definido abaixo) que contém campos que afetam
  // como ele é exibido.

  // Esta classe é a configuração do estado. Ela contém os valores (neste
  // caso, o título) fornecidos pelo widget pai (neste caso o widget MyApp)
  // e usados pelo método build do State. Campos em uma subclasse de Widget são
  // sempre marcados como "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // Função que incrementa o contador sempre que o botão for pressionado
  void _incrementCounter() {
    setState(() {
      // Esta chamada ao setState informa ao framework Flutter que algo mudou
      // neste estado, o que faz com que o método build seja chamado novamente
      // para atualizar a interface. Se modificássemos _counter sem chamar setState(),
      // o método build não seria chamado novamente, e nada mudaria na interface.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Este método é executado novamente toda vez que setState é chamado, por exemplo,
    // quando o método _incrementCounter é acionado.
    //
    // O framework Flutter foi otimizado para tornar a execução dos métodos build rápida,
    // para que você possa reconstruir qualquer coisa que precise ser atualizada
    // sem precisar modificar manualmente cada instância de widget.
    return Scaffold(
      appBar: AppBar(
        // TENTE ISSO: Tente mudar a cor aqui para uma cor específica (como Colors.amber)
        // e faça um hot reload para ver a cor da AppBar mudar enquanto o restante das cores
        // permanece o mesmo.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Aqui pegamos o valor do objeto MyHomePage que foi criado pelo
        // método App.build, e o usamos para definir o título da barra de aplicativos.
        title: Text(widget.title),
      ),
      body: Center(
        // Center é um widget de layout que centraliza seu filho.
        child: Column(
          // Column é também um widget de layout. Ele organiza seus filhos
          // verticalmente. Por padrão, ele tenta ajustar sua largura ao conteúdo
          // e tenta ser tão alto quanto o seu pai permitir.
          //
          // Column tem várias propriedades para controlar como ele se ajusta e
          // como ele posiciona seus filhos. Aqui usamos mainAxisAlignment para
          // centralizar os filhos verticalmente; o eixo principal (main axis) é o eixo vertical
          // porque Columns são verticais (o cross axis seria o eixo horizontal).
          //
          // TENTE ISSO: Invoque o "debug painting" (escolha a ação "Toggle Debug Paint"
          // no IDE, ou pressione "p" no console) para ver as linhas de contorno de cada widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Você pressionou o botão este número de vezes:',
            ),
            Text(
              '$_counter', // Exibe o valor do contador
              style: Theme.of(context).textTheme.headlineMedium, // Aplica estilo ao texto
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // Ação executada quando o botão for pressionado
        tooltip: 'Increment', // Texto de dica que aparece ao segurar o botão
        child: const Icon(Icons.add), // Ícone exibido dentro do botão
      ), // Esta vírgula final facilita a formatação automática dos métodos build.
    );
  }
}