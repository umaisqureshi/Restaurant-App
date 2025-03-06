import 'package:eat_like_app/domain/entities/cart_entity.dart';

abstract class CartRepo {
  Future<void> addProductToCart(CartEntity product);
  Future<List<CartEntity>> getAllCartProducts();
  Future<List<CartEntity>> removeProductFromCart(int id);
  Future<void> clearCart();
  Future<int> getCartCount();
}
