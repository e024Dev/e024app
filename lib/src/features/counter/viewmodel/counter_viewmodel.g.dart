// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CounterViewModel)
const counterViewModelProvider = CounterViewModelProvider._();

final class CounterViewModelProvider
    extends $NotifierProvider<CounterViewModel, int> {
  const CounterViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterViewModelHash();

  @$internal
  @override
  CounterViewModel create() => CounterViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$counterViewModelHash() => r'aef1887e72f44385a478cf40c829642fa428f3c6';

abstract class _$CounterViewModel extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
