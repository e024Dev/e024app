import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_viewmodel.g.dart';

@riverpod
class CounterViewModel extends _$CounterViewModel {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}
