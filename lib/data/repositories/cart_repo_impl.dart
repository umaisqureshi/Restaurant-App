import 'package:eat_like_app/data/data.dart';

class CartRepoImpl extends CartRepo {
  Db db = Db();
  @override
  Future<void> addProductToCart(CartEntity product) {
    return db.addProductToCart(product);
  }

  @override
  Future<List<CartEntity>> getAllCartProducts() {
    return db.getAllCartProducts();
  }

  @override
  Future<void> clearCart() {
    return db.clearCart();
  }

  @override
  Future<List<CartEntity>> removeProductFromCart(int id) {
    return db.removeProductFromCart(id);
  }

  @override
  Future<int> getCartCount() {
    return db.getCartProductCount();
  }

  @override
  Future<void> updateCartItem(UpdateCartRequest request) {
    return db.updateCartItem(request);
  }
}
