import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/projetos/mapa/prestador_model.dart';

part 'prestadores.g.dart';

@riverpod
Future<List<PrestadorModel>> prestadoresProximos(
  Ref ref, {
  double distanciaMaxima = 5000,
}) async {
  final position = await ref.watch(userLocationsProvider.future);
  final response = await ref
      .read(supabaseProvider)
      .rpc(
        'buscar_prestadores_proximos',
        params: {
          'lat': position.latitude,
          'lng': position.longitude,
          // 'max_dist': distanciaMaxima,
        },
      );
  return [
    for (final item in response) PrestadorModel.fromJson(item),
  ];
}
