import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterTabsStateNotifier extends StateNotifier<int> {
  CounterTabsStateNotifier() : super(0);
  void increment() {
    state++;
  }

  void decreement() {
    state--;
  }
}

class CounterTabsChangeNotifier extends ChangeNotifier {
  int _clicks = 0;

  int get clicks => _clicks;

  void increment() {
    _clicks++;
    notifyListeners();
  }

  void decreement() {
    _clicks--;
    notifyListeners();
  }
}
