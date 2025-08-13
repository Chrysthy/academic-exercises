// Este código implementa um aplicativo Flutter que autentica uma conta de serviço no Google Calendar.
// O aplicativo exibe uma interface simples onde o usuário pode autenticar a conta de serviço
// e listar os eventos do calendário associado à conta ou que foi compartilhado com ela.

// Funcionamento:
// 1. Ao iniciar, o aplicativo tenta autenticar usando um arquivo JSON contendo credenciais de uma conta de serviço.
// 2. Após a autenticação bem-sucedida, o usuário pode clicar em um botão para listar os eventos do Google Calendar.
// 3. O aplicativo faz uma solicitação à API do Google Calendar para listar eventos do calendário principal ("primary").
// 4. Os eventos obtidos são exibidos em uma lista, com o título e o ID de cada evento.
// 5. Se não houver eventos ou ocorrer um erro, uma mensagem será exibida.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Flutter UI
import 'package:googleapis/calendar/v3.dart' as calendar; // API do Google Calendar
import 'package:googleapis_auth/auth_io.dart'; // Autenticação OAuth
import 'package:flutter/services.dart' show rootBundle; // Carregar arquivos locais, como o JSON de credenciais

// Função principal que inicia o aplicativo Flutter
void main() {
  runApp(const MyApp()); // Inicia o aplicativo
}

// Widget principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GoogleCalendarScreen(), // Define a tela principal do aplicativo
    );
  }
}

// Widget que representa a tela onde o Google Calendar será acessado
class GoogleCalendarScreen extends StatefulWidget {
  const GoogleCalendarScreen({super.key});

  @override
  // Cria o estado da tela
  // ignore: library_private_types_in_public_api
  _GoogleCalendarScreenState createState() => _GoogleCalendarScreenState();
}

class _GoogleCalendarScreenState extends State<GoogleCalendarScreen> {
  // Variáveis para controle do estado do aplicativo
  bool isSignedIn = false; // Verifica se o usuário está autenticado ou não
  late calendar.CalendarApi calendarApi; // API do Google Calendar
  late AuthClient client; // Cliente para manter a autenticação
  List<calendar.Event> events = []; // Lista para armazenar os eventos do Google Calendar
  bool isLoading = false; // Usado para mostrar um indicador de carregamento

  @override
  void initState() {
    super.initState();
    authenticateWithGoogleCalendar(); // Inicia a autenticação quando a tela é carregada
  }

  // Função responsável por autenticar a conta de serviço no Google Calendar
  Future<void> authenticateWithGoogleCalendar() async {
    try {
      // Carrega o arquivo de credenciais da conta de serviço
      final credentialsJson = await rootBundle.loadString('assets/chave-json.json');
      
      // Converte o JSON carregado em credenciais de conta de serviço
      final credentials = ServiceAccountCredentials.fromJson(credentialsJson);

      // Define o escopo de acesso para a API do Google Calendar
      const scopes = [calendar.CalendarApi.calendarReadonlyScope];

      // Autentica a conta de serviço com as credenciais e o escopo
      client = await clientViaServiceAccount(credentials, scopes);

      // Cria uma instância da API do Google Calendar
      calendarApi = calendar.CalendarApi(client);

      // Atualiza o estado para indicar que a autenticação foi realizada com sucesso
      setState(() {
        isSignedIn = true; // O usuário agora está autenticado
      });
    } catch (error) {
      // Caso ocorra algum erro durante a autenticação
      if (kDebugMode) {
        print('Erro durante a autenticação: $error');
      }
    }
  }

  // Função que lista os eventos do Google Calendar
  Future<void> listGoogleCalendarEvents() async {
    if (isSignedIn) {
      // Se o usuário estiver autenticado, começa o processo de listar eventos
      setState(() {
        isLoading = true; // Mostra um indicador de carregamento
      });
      try {
        // Chama a API para listar os eventos do Google Calendar
        var eventsList = await calendarApi.events.list("primary"); // "primary" refere-se ao calendário principal
        
        // Atualiza a lista de eventos com os resultados obtidos
        setState(() {
          events = eventsList.items ?? []; // Armazena os eventos retornados ou uma lista vazia
          isLoading = false; // Remove o indicador de carregamento
        });
      } catch (error) {
        // Caso ocorra um erro ao tentar listar os eventos
        setState(() {
          isLoading = false; // Remove o indicador de carregamento em caso de erro
        });
        if (kDebugMode) {
          print('Erro ao listar eventos: $error');
        }
      }
    } else {
      // Caso o usuário não esteja autenticado
      if (kDebugMode) {
        print('Você precisa se autenticar primeiro.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Calendar API Flutter'), // Título da barra de navegação
      ),
      body: Center(
        // Verifica se o usuário está autenticado
        child: isSignedIn
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo
                children: [
                  const Text('Autenticado com sucesso!'), // Mensagem de autenticação bem-sucedida
                  ElevatedButton(
                    onPressed: listGoogleCalendarEvents, // Botão para listar eventos do Google Calendar
                    child: const Text('Listar Eventos do Google Calendar'), // Texto do botão
                  ),
                  isLoading
                      ? const CircularProgressIndicator() // Mostra um indicador de carregamento enquanto os eventos estão sendo obtidos
                      : Expanded(
                          child: events.isEmpty
                              ? const Text('Nenhum evento encontrado.') // Mensagem caso nenhum evento seja encontrado
                              : ListView.builder(
                                  itemCount: events.length, // Define o número de itens na lista
                                  itemBuilder: (context, index) {
                                    // Constrói a lista de eventos
                                    return ListTile(
                                      title: Text(events[index].summary ?? 'Sem título'), // Mostra o título do evento
                                      subtitle: Text('ID: ${events[index].id}'), // Mostra o ID do evento
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
