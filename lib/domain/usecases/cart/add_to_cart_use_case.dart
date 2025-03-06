import 'package:eat_like_app/domain/domain.dart';

class AddToCartUseCase {
  final CartRepo _cartRepository;

  AddToCartUseCase(this._cartRepository);

  Future<void> execute(CartEntity product) async {
    await _cartRepository.addProductToCart(product);
  }
}
