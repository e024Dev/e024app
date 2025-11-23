// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alunos_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(alunosRepository)
const alunosRepositoryProvider = AlunosRepositoryProvider._();

final class AlunosRepositoryProvider
    extends
        $FunctionalProvider<
          AlunosRepository,
          AlunosRepository,
          AlunosRepository
        >
    with $Provider<AlunosRepository> {
  const AlunosRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'alunosRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$alunosRepositoryHash();

  @$internal
  @override
  $ProviderElement<AlunosRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AlunosRepository create(Ref ref) {
    return alunosRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AlunosRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AlunosRepository>(value),
    );
  }
}

String _$alunosRepositoryHash() => r'63f704d20190c2e4c43a1cac1ed05dea65494868';
