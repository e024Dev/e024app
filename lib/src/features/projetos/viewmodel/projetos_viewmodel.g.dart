// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projetos_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projetos)
const projetosProvider = ProjetosProvider._();

final class ProjetosProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProjetoModel>>,
          List<ProjetoModel>,
          FutureOr<List<ProjetoModel>>
        >
    with
        $FutureModifier<List<ProjetoModel>>,
        $FutureProvider<List<ProjetoModel>> {
  const ProjetosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projetosProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projetosHash();

  @$internal
  @override
  $FutureProviderElement<List<ProjetoModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProjetoModel>> create(Ref ref) {
    return projetos(ref);
  }
}

String _$projetosHash() => r'5f46d40913506b50b737870e8eec478788349f5a';
