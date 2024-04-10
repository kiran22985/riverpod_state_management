import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterDemo extends StateNotifier<int> {
  CounterDemo() : super(0);
  void increment() {
    state++;
  }
}
