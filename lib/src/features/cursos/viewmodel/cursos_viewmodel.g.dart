// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursos_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CursosViewModel)
const cursosViewModelProvider = CursosViewModelProvider._();

final class CursosViewModelProvider
    extends $AsyncNotifierProvider<CursosViewModel, List<CursoModel>> {
  const CursosViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cursosViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cursosViewModelHash();

  @$internal
  @override
  CursosViewModel create() => CursosViewModel();
}

String _$cursosViewModelHash() => r'd44c79d001f68daa2764aa4484ae14f4121395d4';

abstract class _$CursosViewModel extends $AsyncNotifier<List<CursoModel>> {
  FutureOr<List<CursoModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<CursoModel>>, List<CursoModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<CursoModel>>, List<CursoModel>>,
              AsyncValue<List<CursoModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
