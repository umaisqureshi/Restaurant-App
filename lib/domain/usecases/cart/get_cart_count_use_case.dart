import 'package:eat_like_app/domain/domain.dart';

class GetCartCountUseCase {
  final CartRepo _cartRepository;

  GetCartCountUseCase(this._cartRepository);

  Future<int> execute() {
    return _cartRepository.getCartCount();
  }
}
