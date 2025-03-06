import 'package:eat_like_app/domain/usecases/cart/get_cart_count_use_case.dart';
import 'package:eat_like_app/presentation/presentation.dart';

final itemCountNotifier = StateNotifierProvider<ItemCountNotifier, int>((ref) {
  return ItemCountNotifier();
});

final cartRepoProvider = Provider<CartRepo>((ref) {
  return CartRepoImpl();
});

final addToCartUseCaseProvider = Provider<AddToCartUseCase>((ref) {
  final cartRepo = ref.watch(cartRepoProvider);
  return AddToCartUseCase(cartRepo);
});

final cartCountUseCaseProvider = Provider<GetCartCountUseCase>((ref) {
  final cartRepo = ref.watch(cartRepoProvider);
  return GetCartCountUseCase(cartRepo);
});

final getAllCartProductUseCaseProvider =
    Provider<GetAllCartProductUseCase>((ref) {
  final cartRepo = ref.watch(cartRepoProvider);
  return GetAllCartProductUseCase(cartRepo);
});
final removeCartItemUseCaseProvider = Provider<RemoveCartItemUseCase>((ref) {
  final cartRepo = ref.watch(cartRepoProvider);
  return RemoveCartItemUseCase(cartRepo);
});

final clearCartUseCaseProvider = Provider<ClearCartUseCase>((ref) {
  final cartRepo = ref.watch(cartRepoProvider);
  return ClearCartUseCase(cartRepo);
});

final cartNotifierProvider = StateNotifierProvider<CartItemNotifier, CartState>(
  (ref) {
    final getAllCartProductUseCase = ref.read(getAllCartProductUseCaseProvider);
    final addToCartUseCase = ref.read(addToCartUseCaseProvider);
    final removeCartItemUseCase = ref.read(removeCartItemUseCaseProvider);
    final clearCartUseCase = ref.read(clearCartUseCaseProvider);

    return CartItemNotifier(
      getAllCartProductUseCase: getAllCartProductUseCase,
      addToCartUseCase: addToCartUseCase,
      removeCartItemUseCase: removeCartItemUseCase,
      clearCartUseCase: clearCartUseCase,
    );
  },
);

final cartCountNotifier = StateNotifierProvider<CartCountNotifier, int>((ref) {
  final getCartCountUseCase = ref.read(cartCountUseCaseProvider);
  return CartCountNotifier(getCartCountUseCase);
});
