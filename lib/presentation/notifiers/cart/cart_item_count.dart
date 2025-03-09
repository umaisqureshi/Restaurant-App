import 'package:eat_like_app/presentation/presentation.dart';

class ItemCountNotifier extends StateNotifier<int> {
  ItemCountNotifier() : super(1);

  void increment() {
    state = state + 1;
  }

  void decrement() {
    if (state > 1) {
      state = state - 1;
    }
  }

  void reset() {
    state = 1;
  }
}
