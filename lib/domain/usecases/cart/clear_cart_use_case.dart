import 'package:eat_like_app/domain/domain.dart';

class ClearCartUseCase {
  final CartRepo _cartRepository;

  ClearCartUseCase(this._cartRepository);

  Future<void> execute() {
    return _cartRepository.clearCart();
  }
}
