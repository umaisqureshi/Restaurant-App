import 'package:eat_like_app/presentation/presentation.dart';

Widget buildCart(CartState state, BuildContext context, WidgetRef ref) {
  switch (state) {
    case CartLoading():
      ref.read(cartNotifierProvider.notifier).getAllCartProducts();
      return const Center(child: CircularProgressIndicator());
    case CartLoaded():
      return cartWidget(
          context: context, ref: ref, cartProducts: state.cartProducts);
    case CartError():
      debugPrint(state.message);
      return Center(child: Text('Error: ${state.message}'));
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
