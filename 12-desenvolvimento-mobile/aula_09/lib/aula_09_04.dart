// Geolocalização e Serviços de Localização
//  Obtendo a Localização Atual
//    1.	Adicionar Dependências ao pubspec.yaml
//      google_maps_flutter: ^2.0.6
//      geolocator: ^7.7.0
//    2.	Solicitar Permissões de Localização
//      AndroidManifest.xml
//        <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
//        <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
//    3.	Código para Obter a Localização Atual

// Este código obtém a localização atual do dispositivo e atualiza o mapa para exibir a posição do usuário com um marcador.


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart'; // Importa a biblioteca de geolocalização.

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
// Variável para armazenar a posição atual do usuário.

  // Coordenadas de São Paulo, Brasil (latidude e longitude).
  final LatLng _center = const LatLng(-23.550520, -46.633308); // Latitude e longitude de São Paulo.

  // Lista de marcadores.
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // Obtém a localização atual quando a tela é carregada.
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

  // Função para obter a localização atual do usuário.
  Future<void> _getCurrentLocation() async {
    // Solicita permissão de localização se necessário.
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return; // Se a permissão for negada, não faz nada.
      }
    }

    // Verifica se os serviços de localização estão habilitados.
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      await Geolocator.openLocationSettings(); // Pede ao usuário para ativar os serviços de localização.
      return;
    }

    // Obtém a localização atual com alta precisão.
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
// Armazena a localização atual.
      _markers.add(
        Marker(
          markerId: const MarkerId('currentLocation'),
          position: LatLng(position.latitude, position.longitude), // Define a posição do marcador.
          infoWindow: const InfoWindow(
            title: 'Sua localização', // Título exibido ao clicar no marcador.
            snippet: 'Você está aqui', // Texto adicional.
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue), // Cor azul para o marcador de localização.
        ),
      );
      _animateToPosition(LatLng(position.latitude, position.longitude)); // Move a câmera para a localização atual.
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps com Marcadores'), // Título exibido na barra superior.
        backgroundColor: Colors.green[700], // Define a cor de fundo da AppBar.
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated, // Chama a função _onMapCreated quando o mapa é inicializado.
        initialCameraPosition: CameraPosition(
          target: _center, // Define o ponto central do mapa nas coordenadas de São Paulo.
          zoom: 12.0, // Define o nível de zoom inicial do mapa (12 é um bom valor para cidades grandes).
        ),
        markers: _markers, // Exibe os marcadores no mapa.
        onTap: _onMapTapped, // Adiciona um marcador quando o mapa é clicado.
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation, // Move a câmera para a localização atual quando o botão é pressionado.
        child: const Icon(Icons.my_location), // Ícone de localização.
      ),
    );
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
}