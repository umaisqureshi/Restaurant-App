import 'package:eat_like_app/data/data.dart';
import 'package:eat_like_app/domain/entities/cart_entity.dart';
import 'package:eat_like_app/domain/repositories/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  Db db = Db().instance;
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
}
