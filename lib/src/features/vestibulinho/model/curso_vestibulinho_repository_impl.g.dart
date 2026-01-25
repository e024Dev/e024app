// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curso_vestibulinho_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cursoVestibulinhoRepository)
const cursoVestibulinhoRepositoryProvider =
    CursoVestibulinhoRepositoryProvider._();

final class CursoVestibulinhoRepositoryProvider
    extends
        $FunctionalProvider<
          CursoVestibulinhoRepository,
          CursoVestibulinhoRepository,
          CursoVestibulinhoRepository
        >
    with $Provider<CursoVestibulinhoRepository> {
  const CursoVestibulinhoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cursoVestibulinhoRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cursoVestibulinhoRepositoryHash();

  @$internal
  @override
  $ProviderElement<CursoVestibulinhoRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CursoVestibulinhoRepository create(Ref ref) {
    return cursoVestibulinhoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CursoVestibulinhoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CursoVestibulinhoRepository>(value),
    );
  }
}

String _$cursoVestibulinhoRepositoryHash() =>
    r'28cee687e58dddedae6cde62ad166d0085fea508';
