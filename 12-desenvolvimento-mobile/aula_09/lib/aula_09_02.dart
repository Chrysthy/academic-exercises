// Exibindo Mapas e Configurando Propriedades

//  Passos para Exibir um Mapa
//    1.	Adicionar Dependências ao pubspec.yaml
//        google_maps_flutter: ^2.0.6
//    2.	Obter Chaves de API do Google Maps
//        Acesse o Google Cloud Console.
//        Crie um projeto e ative a API do Google Maps.
//        Gere uma chave de API.
//    3.	Configurar o AndroidManifest.xml
//    4.	Configurar o Info.plist para iOS
//    5.	Código para Exibir o Mapa

// Este código configura um mapa básico usando o Google Maps no Flutter, 
// exibindo um mapa centrado em uma localização específica.

import 'package:flutter/material.dart'; // Importa a biblioteca de interface gráfica do Flutter.
// ignore: depend_on_referenced_packages
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Importa a biblioteca do Google Maps para Flutter.

void main() {
  runApp(const MyApp()); // Função principal que inicia o aplicativo.
}

// MyApp é o widget principal do aplicativo.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MapScreen(), // Define a tela inicial como a classe MapScreen (a tela do mapa).
    );
  }
}

// Classe MapScreen representa a tela do mapa.
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapScreenState createState() => _MapScreenState(); // Cria o estado da tela.
}

// Classe que controla o estado da tela do mapa.
class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController; // Variável para controlar o Google Map.

  // Coordenadas de São Paulo, Brasil (latidude e longitude).
  final LatLng _center = const LatLng(-23.550520, -46.633308); // Latitude e longitude de São Paulo.

  // Função que é chamada quando o mapa é criado (inicializado).
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller; // Atribui o controlador do mapa à variável mapController.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Estrutura da tela, com uma barra superior e um corpo.
      appBar: AppBar(
        title: const Text('Aula 09.02 - Google Maps no Flutter'), // Título exibido na barra superior.
        backgroundColor: Colors.green[700], // Define a cor de fundo da AppBar (verde).
      ),
      body: GoogleMap( // Exibe o Google Map no corpo da tela.
        onMapCreated: _onMapCreated, // Chama a função _onMapCreated quando o mapa é inicializado.
        initialCameraPosition: CameraPosition(
          target: _center, // Define o ponto central do mapa nas coordenadas de São Paulo.
          zoom: 12.0, // Define o nível de zoom inicial do mapa (12 é um bom valor para cidades grandes).
        ),
      ),
    );
  }
}