// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prestadores.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(prestadoresProximos)
const prestadoresProximosProvider = PrestadoresProximosFamily._();

final class PrestadoresProximosProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PrestadorModel>>,
          List<PrestadorModel>,
          FutureOr<List<PrestadorModel>>
        >
    with
        $FutureModifier<List<PrestadorModel>>,
        $FutureProvider<List<PrestadorModel>> {
  const PrestadoresProximosProvider._({
    required PrestadoresProximosFamily super.from,
    required double super.argument,
  }) : super(
         retry: null,
         name: r'prestadoresProximosProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$prestadoresProximosHash();

  @override
  String toString() {
    return r'prestadoresProximosProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<PrestadorModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PrestadorModel>> create(Ref ref) {
    final argument = this.argument as double;
    return prestadoresProximos(ref, distanciaMaxima: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PrestadoresProximosProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$prestadoresProximosHash() =>
    r'69ea1d3e229020d6e9b8ee4db23840db03180f50';

final class PrestadoresProximosFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<PrestadorModel>>, double> {
  const PrestadoresProximosFamily._()
    : super(
        retry: null,
        name: r'prestadoresProximosProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PrestadoresProximosProvider call({double distanciaMaxima = 5000.0}) =>
      PrestadoresProximosProvider._(argument: distanciaMaxima, from: this);

  @override
  String toString() => r'prestadoresProximosProvider';
}
