import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocalizacaoPage extends StatefulWidget {
  const LocalizacaoPage({super.key});

  @override
  State<LocalizacaoPage> createState() => _LocalizacaoPageState();
}

class _LocalizacaoPageState extends State<LocalizacaoPage> {
  BitmapDescriptor makerLogo = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
    _iconeLogo();
    _permissao();
  }

  Future<void> _permissao() async {
    LocationPermission permission;

    bool ativado = await Geolocator.isLocationServiceEnabled();

    if (!ativado) {
      return Future.error('Habilite a localização no seu dispositivo');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error(
            'Permissão de localização negada. Autorize a localização');
      }
    }
  }

  void _iconeLogo() async {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        devicePixelRatio: 2.5,
      ),
      'assets/logotipo.png',
    ).then((icone) {
      setState(() {
        makerLogo = icone;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    LatLng posicaoInicial = const LatLng(-22.2208, -49.9486);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Localização'),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(target: posicaoInicial, zoom: 16),
        markers: {
          Marker(
            markerId: const MarkerId('LojaBurguer'),
            position: posicaoInicial,
            icon: makerLogo,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Rua Paraíba, 125 - Centro',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ));
                },
              );
            },
          ),
        },
      ),
    );
  }
}
