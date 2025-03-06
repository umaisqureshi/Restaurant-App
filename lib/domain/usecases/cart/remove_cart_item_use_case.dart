import 'package:eat_like_app/domain/domain.dart';

class RemoveCartItemUseCase {
  final CartRepo _cartRepository;

  RemoveCartItemUseCase(this._cartRepository);

  Future<List<CartEntity>> execute(int productId) async {
    return await _cartRepository.removeProductFromCart(productId);
  }
}
