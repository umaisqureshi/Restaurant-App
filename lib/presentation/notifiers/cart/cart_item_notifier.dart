import 'package:eat_like_app/presentation/presentation.dart';

class CartItemNotifier extends StateNotifier<CartState> {
  final GetAllCartProductUseCase _getAllCartProductUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final RemoveCartItemUseCase _removeCartItemUseCase;
  final ClearCartUseCase _clearCartUseCase;
  final UpdateCartItemUseCase _updateCartItemUseCase;

  CartItemNotifier({
    required GetAllCartProductUseCase getAllCartProductUseCase,
    required AddToCartUseCase addToCartUseCase,
    required RemoveCartItemUseCase removeCartItemUseCase,
    required ClearCartUseCase clearCartUseCase,
    required UpdateCartItemUseCase updateCartItemUseCase,
  })  : _getAllCartProductUseCase = getAllCartProductUseCase,
        _addToCartUseCase = addToCartUseCase,
        _removeCartItemUseCase = removeCartItemUseCase,
        _clearCartUseCase = clearCartUseCase,
        _updateCartItemUseCase = updateCartItemUseCase,
        super(CartLoading());

  Future<void> addProductToCart(CartEntity product) async {
    try {
      await _addToCartUseCase.execute(product);
      await getAllCartProducts();
    } catch (e) {
      state = CartError(e.toString());
    }
  }

  Future<void> getAllCartProducts() async {
    try {
      final result = await _getAllCartProductUseCase.execute();
      state = result.fold(
        (products) => products.isEmpty ? CartEmpty() : CartLoaded(products),
        (error) => CartError(error.toString()),
      );
    } catch (e) {
      state = CartError(e.toString());
    }
  }

  Future<void> updateCartItem(UpdateCartRequest request) async {
    try {
      await _updateCartItemUseCase.execute(request);
      await getAllCartProducts();
    } catch (e) {
      state = CartError(e.toString());
    }
  }

  Future<void> removeProductFromCart(int id) async {
    try {
      await _removeCartItemUseCase.execute(id);
      await getAllCartProducts();
    } catch (e) {
      state = CartError(e.toString());
    }
  }

  /// Clears the entire cart.
  Future<void> clearCart() async {
    try {
      await _clearCartUseCase.execute();
      state = CartEmpty();
    } catch (e) {
      state = CartError(e.toString());
    }
  }
}
