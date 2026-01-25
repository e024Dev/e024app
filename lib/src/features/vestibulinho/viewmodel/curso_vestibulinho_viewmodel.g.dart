// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curso_vestibulinho_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cursosVestibulinho)
const cursosVestibulinhoProvider = CursosVestibulinhoProvider._();

final class CursosVestibulinhoProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CursoModel>>,
          List<CursoModel>,
          FutureOr<List<CursoModel>>
        >
    with $FutureModifier<List<CursoModel>>, $FutureProvider<List<CursoModel>> {
  const CursosVestibulinhoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cursosVestibulinhoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cursosVestibulinhoHash();

  @$internal
  @override
  $FutureProviderElement<List<CursoModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CursoModel>> create(Ref ref) {
    return cursosVestibulinho(ref);
  }
}

String _$cursosVestibulinhoHash() =>
    r'c3ebd45c3e87979d5064718a59c4f06ceb8ba708';
