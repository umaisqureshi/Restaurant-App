import 'package:eat_like_app/domain/entities/cart_entity.dart';
import 'package:eat_like_app/domain/repositories/cart_repo.dart';

class AddToCartUseCase {
  final CartRepo _cartRepository;

  AddToCartUseCase(this._cartRepository);

  Future<void> execute(CartEntity product) async {
    await _cartRepository.addProductToCart(product);
  }
}
