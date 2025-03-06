import 'package:eat_like_app/presentation/presentation.dart';

class GetCartCountUseCase {
  final CartRepo _cartRepository;

  GetCartCountUseCase(this._cartRepository);

  Future<int> execute() {
    return _cartRepository.getCartCount();
  }
}
