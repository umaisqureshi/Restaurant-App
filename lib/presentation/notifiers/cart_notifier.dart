import 'package:eat_like_app/domain/usecases/cart/get_cart_count_use_case.dart';
import 'package:eat_like_app/presentation/presentation.dart';

class ItemCountNotifier extends StateNotifier<int> {
  ItemCountNotifier() : super(1);

  void increment() {
    state = state + 1;
  }

  void decrement() {
    if (state > 1) {
      state = state - 1;
    }
  }

  void reset() {
    state = 1;
  }
}

class CartCountNotifier extends StateNotifier<int> {
  final GetCartCountUseCase getCartCountUseCase;
  CartCountNotifier(this.getCartCountUseCase) : super(0);

  void getCartCount() {
    getCartCountUseCase.execute().then((value) {
      state = value;
    }).catchError((e) {
      state = 0;
    });
  }
}

class CartItemNotifier extends StateNotifier<CartState> {
  final GetAllCartProductUseCase getAllCartProductUseCase;
  final AddToCartUseCase addToCartUseCase;
  final RemoveCartItemUseCase removeCartItemUseCase;
  final ClearCartUseCase clearCartUseCase;

  CartItemNotifier({
    required this.getAllCartProductUseCase,
    required this.addToCartUseCase,
    required this.removeCartItemUseCase,
    required this.clearCartUseCase,
  }) : super(CartLoading());

  void addProductToCart(CartEntity product) {
    addToCartUseCase.execute(product).then((value) {
      state = CartProductAdded();
      getAllCartProducts();
    }).catchError((e) {
      state = CartError(e.toString());
    });
  }

  Future<void> getAllCartProducts() async {
    final products = await getAllCartProductUseCase.execute();

    state = products.fold(
      (r) => r.isEmpty ? CartEmpty() : CartLoaded(r),
      (l) => CartError(l.toString()),
    );
  }

  void removeProductFromCart(int id) {
    removeCartItemUseCase.execute(id).then((value) {
      state = CartLoaded(value);
    }).catchError((e) {
      state = CartError(e.toString());
    });
  }

  void clearCart() {
    state = CartEmpty();
  }
}
