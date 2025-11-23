import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/projetos/mapa/prestadores.dart';

class GoogleMapsView extends ConsumerWidget {
  const GoogleMapsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocation = ref.watch(userLocationsProvider);
    final prestadores = ref.watch(
      prestadoresProximosProvider(distanciaMaxima: 10000),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Mapa')),
      body: prestadores.when(
        data: (data) => GoogleMap(
          indoorViewEnabled: true,
          initialCameraPosition: CameraPosition(            
            zoom: 13,
            target: LatLng(
              userLocation.value!.latitude,
              userLocation.value!.longitude,
            ),
          ),
          markers: {
            for (final prestador in data)
              Marker(
                markerId: MarkerId(prestador.id),
                position: LatLng(prestador.latitude, prestador.longitude),
                infoWindow: InfoWindow(title: prestador.nome, snippet: prestador.endereco),
              ),
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            const Center(child: Text('Erro ao carregar prestadores')),
      ),
    );
  }
}
