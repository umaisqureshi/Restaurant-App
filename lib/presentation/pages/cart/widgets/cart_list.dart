import 'package:eat_like_app/presentation/presentation.dart';

Widget buildCartList(
    List<CartEntity> cart, BuildContext context, WidgetRef ref) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: cart.length,
    itemBuilder: (context, index) {
      return cartItemWidget(context: context, cart: cart[index], ref: ref);
    },
  );
}

Widget cartItemWidget({
  required BuildContext context,
  required CartEntity cart,
  required WidgetRef ref,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(cart.id),
      background: _buildSlideLeftBackground(),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          await _showDeleteDialog(context, cart, ref);
        }
        return null;
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildCartItemImage(cart),
            _buildCartItemDetails(cart),
            const Spacer(),
            cartItemCountWidget(ref, cart.quantity, cart.id),
          ],
        ),
      ),
    ),
  );
}

Widget _buildCartItemImage(CartEntity cart) {
  return Container(
    margin: const EdgeInsets.all(8),
    width: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: AssetImage("assets/images/${cart.imageUrl}"),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _buildCartItemDetails(CartEntity cart) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextHelper.textFormat16(text: cart.name, color: Colors.black),
      TextHelper.textFormat16(
        text: "Price: ${cart.price}",
        color: Colors.orange,
        isBold: true,
      ),
    ],
  );
}

Widget _buildSlideLeftBackground() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(10),
    ),
    alignment: Alignment.centerRight,
    child: const Padding(
      padding: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.delete, color: Colors.white),
          SizedBox(width: 10),
          Text(
            "Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}

Future<void> _showDeleteDialog(
    BuildContext context, CartEntity cart, WidgetRef ref) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: TextHelper.textFormat18(
          text: "Are you sure you want to delete ${cart.name}?",
          color: Colors.black,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel", style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(cartNotifierProvider.notifier)
                  .removeProductFromCart(cart.id);
              Future.delayed(const Duration(milliseconds: 100), () {
                ref.read(cartCountNotifier.notifier).getCartCount();
              });
              Navigator.of(context).pop();
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}
