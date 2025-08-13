// O código implementa um aplicativo Flutter que autentica no Google Drive usando uma conta de serviço.
// Depois de autenticado, ele permite listar os arquivos presentes no Google Drive.
// Exibe um botão para listar os arquivos e mostra um indicador de carregamento enquanto os arquivos são recuperados.

// Passos do código:
// 1. Inicializa o aplicativo Flutter e exibe a interface.
// 2. Autentica usando um arquivo de credenciais de conta de serviço no Google Drive.
// 3. Após autenticar, o usuário pode clicar no botão "Listar Arquivos do Google Drive".
// 4. O aplicativo acessa o Google Drive e exibe os arquivos listados, ou uma mensagem de "Nenhum arquivo encontrado" se não houver arquivos.
// 5. Se houver erros na autenticação ou na listagem dos arquivos, eles são mostrados no console.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Importa o pacote de interface do Flutter
import 'package:googleapis/drive/v3.dart' as drive; // Importa a API do Google Drive
import 'package:googleapis_auth/auth_io.dart'; // Importa as funções de autenticação OAuth
import 'package:flutter/services.dart' show rootBundle; // Permite carregar arquivos locais, como o JSON de credenciais

// A função principal que inicia o aplicativo Flutter
void main() {
  runApp(const MyApp()); // Inicia o aplicativo com o widget MyApp
}

// Widget principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Construtor da classe

  @override
  Widget build(BuildContext context) {
    // Define o que será mostrado na tela
    return const MaterialApp(
      home: GoogleDriveScreen(), // Chama a tela principal que será exibida
    );
  }
}

// Widget que representa a tela onde o Google Drive será acessado
class GoogleDriveScreen extends StatefulWidget {
  const GoogleDriveScreen({super.key}); // Construtor da classe

  @override
  // ignore: library_private_types_in_public_api
  _GoogleDriveScreenState createState() => _GoogleDriveScreenState(); // Cria o estado da tela
}

class _GoogleDriveScreenState extends State<GoogleDriveScreen> {
  // Variáveis para controle do estado do aplicativo
  bool isSignedIn = false; // Verifica se o usuário está autenticado ou não
  late drive.DriveApi driveApi; // Variável que representa a API do Google Drive
  late AuthClient client; // Cliente de autenticação que mantém a sessão ativa
  List<drive.File> files = []; // Lista para armazenar os arquivos obtidos do Google Drive
  bool isLoading = false; // Usado para mostrar um indicador de carregamento

  @override
  void initState() {
    super.initState();
    authenticateWithGoogleDrive(); // Inicia a autenticação assim que a tela é carregada
  }

  // Função responsável por autenticar a conta de serviço no Google Drive
  Future<void> authenticateWithGoogleDrive() async {
    try {
      // Carrega o arquivo de credenciais da conta de serviço (localizado em assets/chave-json.json)
      final credentialsJson = await rootBundle.loadString('assets/chave-json.json');
      
      // Converte o JSON carregado em credenciais de conta de serviço
      final credentials = ServiceAccountCredentials.fromJson(credentialsJson);

      // Define o escopo de acesso (neste caso, permissão para acessar o Google Drive)
      const scopes = [drive.DriveApi.driveScope];

      // Autentica a conta de serviço com as credenciais e escopo definidos
      client = await clientViaServiceAccount(credentials, scopes);

      // Cria uma instância da API do Google Drive usando o cliente autenticado
      driveApi = drive.DriveApi(client);

      // Atualiza o estado para indicar que a autenticação foi realizada com sucesso
      setState(() {
        isSignedIn = true; // O usuário agora está autenticado
      });
    } catch (error) {
      // Caso ocorra algum erro durante a autenticação, o erro é impresso no console
      if (kDebugMode) {
        print('Erro durante a autenticação: $error');
      }
    }
  }

  // Função que lista os arquivos armazenados no Google Drive
  Future<void> listGoogleDriveFiles() async {
    if (isSignedIn) {
      // Se o usuário estiver autenticado, começa o processo de listar arquivos
      setState(() {
        isLoading = true; // Mostra um indicador de carregamento
      });
      try {
        // Chama a API para listar os arquivos presentes no Google Drive
        var fileList = await driveApi.files.list();
        
        // Atualiza a lista de arquivos na interface com os resultados obtidos
        setState(() {
          files = fileList.files ?? []; // Armazena os arquivos retornados ou uma lista vazia
          isLoading = false; // Remove o indicador de carregamento
        });
      } catch (error) {
        // Caso ocorra um erro ao tentar listar os arquivos
        setState(() {
          isLoading = false; // Remove o indicador de carregamento em caso de erro
        });
        if (kDebugMode) {
          print('Erro ao listar arquivos: $error');
        }
      }
    } else {
      // Caso o usuário não esteja autenticado, uma mensagem de erro é mostrada no console
      if (kDebugMode) {
        print('Você precisa se autenticar primeiro.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define como a interface será exibida
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usando a API Google Drive no Flutter'), // Define o título da barra de navegação
      ),
      body: Center(
        // Verifica se o usuário está autenticado
        child: isSignedIn
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo
                children: [
                  const Text('Autenticado com sucesso!'), // Mensagem de autenticação bem-sucedida
                  ElevatedButton(
                    onPressed: listGoogleDriveFiles, // Botão para listar os arquivos do Google Drive
                    child: const Text('Listar Arquivos do Google Drive'), // Texto do botão
                  ),
                  isLoading
                      ? const CircularProgressIndicator() // Mostra um indicador de carregamento enquanto os arquivos estão sendo obtidos
                      : Expanded(
                          child: files.isEmpty
                              ? const Text('Nenhum arquivo encontrado.') // Mensagem caso nenhum arquivo seja encontrado
                              : ListView.builder(
                                  itemCount: files.length, // Define o número de itens na lista
                                  itemBuilder: (context, index) {
                                    // Constrói a lista de arquivos
                                    return ListTile(
                                      title: Text(files[index].name ?? 'Sem nome'), // Mostra o nome do arquivo
                                      subtitle: Text('ID: ${files[index].id}'), // Mostra o ID do arquivo
                                    );
                                  },
                                ),
                        ),
                ],
              )
            : const CircularProgressIndicator(), // Mostra um indicador de carregamento enquanto a autenticação está em andamento
      ),
    );
  }

  @override
  void dispose() {
    client.close(); // Fecha o cliente de autenticação quando a tela é fechada
    super.dispose();
  }
}
