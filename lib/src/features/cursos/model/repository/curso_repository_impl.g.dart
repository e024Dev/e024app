// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curso_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cursoRepositoryImpl)
const cursoRepositoryImplProvider = CursoRepositoryImplProvider._();

final class CursoRepositoryImplProvider
    extends
        $FunctionalProvider<
          CursoRepositoryImpl,
          CursoRepositoryImpl,
          CursoRepositoryImpl
        >
    with $Provider<CursoRepositoryImpl> {
  const CursoRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cursoRepositoryImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cursoRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<CursoRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CursoRepositoryImpl create(Ref ref) {
    return cursoRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CursoRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CursoRepositoryImpl>(value),
    );
  }
}

String _$cursoRepositoryImplHash() =>
    r'8882b7f80ef66554acc8cf90921e8729e0120871';
