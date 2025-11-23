// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projetos_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projetosRepository)
const projetosRepositoryProvider = ProjetosRepositoryProvider._();

final class ProjetosRepositoryProvider
    extends
        $FunctionalProvider<
          ProjetosRepository,
          ProjetosRepository,
          ProjetosRepository
        >
    with $Provider<ProjetosRepository> {
  const ProjetosRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projetosRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projetosRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProjetosRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProjetosRepository create(Ref ref) {
    return projetosRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjetosRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjetosRepository>(value),
    );
  }
}

String _$projetosRepositoryHash() =>
    r'70912c52f5583a01f3076b1ee82f82f11f371d7a';
