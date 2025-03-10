import 'package:eat_like_app/presentation/presentation.dart';

class CartCountNotifier extends StateNotifier<int> {
  final GetCartCountUseCase _getCartCountUseCase;

  CartCountNotifier(this._getCartCountUseCase) : super(0);

  Future<void> getCartCount() async {
    try {
      final count = await _getCartCountUseCase.execute();
      state = count;
    } catch (e) {
      state = 0;
    }
  }

}
