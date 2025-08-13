// Marcadores e Animações no Mapa
//  Adicionando Marcadores
//    1.	Adicionar um Marcador Simples
//  Adicionando Animações de Movimento de Câmera
//    1.	Animação para Nova Posição

// Este código adiciona um marcador ao mapa na posição especificada, com uma janela de informações.

// Este código adiciona um botão flutuante que, ao ser pressionado, anima a 
//câmera para uma nova posição com uma nova configuração de zoom, inclinação e direção.

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

  // Lista de marcadores.
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    
    // Adiciona um marcador em São Paulo quando o mapa for criado.
    _markers.add(
      Marker(
        markerId: const MarkerId('SaoPauloMarker'), // Identificação do marcador.
        position: _center, // Posição do marcador.
        infoWindow: const InfoWindow(
          title: 'São Paulo', // Título exibido ao clicar no marcador.
          snippet: 'Cidade de São Paulo', // Texto adicional.
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet), // Cor do marcador.
        onTap: () {
          _animateToPosition(_center); // Anima a câmera para a posição do marcador.
        },
      ),
    );
  }

  // Função que é chamada quando o mapa é criado (inicializado).
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller; // Atribui o controlador do mapa à variável mapController.
  }

  // Função chamada quando o usuário clica no mapa para adicionar um novo marcador.
  void _onMapTapped(LatLng position) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()), // Usa a posição como ID.
          position: position, // Posição do clique.
          infoWindow: const InfoWindow(
            title: 'Novo Marcador', // Título do marcador.
            snippet: 'Marcador adicionado no clique', // Texto adicional.
          ),
          icon: BitmapDescriptor.defaultMarker, // Cor padrão do marcador.
          onTap: () {
            _animateToPosition(position); // Anima a câmera para a nova posição.
          },
        ),
      );
      // Anima a câmera para a posição clicada no mapa.
      _animateToPosition(position);
    });
  }

  // Função para animar a câmera para uma nova posição.
  void _animateToPosition(LatLng position) {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: position, // Define a nova posição da câmera.
          zoom: 14.0, // Ajusta o nível de zoom.
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Estrutura da tela, com uma barra superior e um corpo.
      appBar: AppBar(
        title: const Text('Google Maps com Marcadores'), // Título exibido na barra superior.
        backgroundColor: Colors.green[700], // Define a cor de fundo da AppBar (verde).
      ),
      body: GoogleMap( // Exibe o Google Map no corpo da tela.
        onMapCreated: _onMapCreated, // Chama a função _onMapCreated quando o mapa é inicializado.
        initialCameraPosition: CameraPosition(
          target: _center, // Define o ponto central do mapa nas coordenadas de São Paulo.
          zoom: 12.0, // Define o nível de zoom inicial do mapa (12 é um bom valor para cidades grandes).
        ),
        markers: _markers, // Exibe os marcadores no mapa.
        onTap: _onMapTapped, // Adiciona um marcador quando o mapa é clicado.
      ),
    );
  }
}