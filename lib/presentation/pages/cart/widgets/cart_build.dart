import 'package:eat_like_app/presentation/presentation.dart';

Widget buildCart(BuildContext context, WidgetRef ref) {
  final cartState = ref.watch(cartNotifierProvider);

  switch (cartState) {
    case CartLoading():
      ref.read(cartNotifierProvider.notifier).getAllCartProducts();
      return const Center(child: CircularProgressIndicator());
    case CartLoaded():
      return cartWidget(
          context: context, ref: ref, cartProducts: cartState.cartProducts);
    case CartError():
      debugPrint(cartState.message);
      return Center(child: Text('Error: ${cartState.message}'));
    case CartEmpty():
      return Center(
        child: TextHelper.textFormat16(
          text: 'Cart is empty\nPlease add something from the menu!',
          color: Colors.black,
          isBold: true,
        ),
      );
  }
}
