import 'package:eat_like_app/core/helpers/total_calculator_helper.dart';
import 'package:eat_like_app/presentation/presentation.dart';

class CartWidget extends ConsumerWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartNotifierProvider);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity, // Ensure full screen height
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            cartHeaderWidget(context),
            const SizedBox(height: 10),
            Expanded(
                child: buildCart(cartState, context,
                    ref)), // Use Expanded for dynamic height
          ],
        ),
      ),
    );
  }

  Widget cartItemCountWidget(WidgetRef ref, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      count.toString(),
                      style: GoogleFonts.openSans(
                          color: Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
        return const Center(child: Text('Cart is empty'));
    }
  }

  Widget cartWidget({
    required BuildContext context,
    required WidgetRef ref,
    required List<CartEntity> cartProducts,
  }) {
    final cartCount = ref.watch(cartCountNotifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: buildCartList(cartProducts, context, ref),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextHelper.textFormat18(
              text: "Payment Summary", color: Colors.black, isBold: true),
        ),
        const SizedBox(height: 10),
        subTotalWidget(cartProducts),
        const SizedBox(height: 10),
        orderConfirmedButton(cartCount: cartCount),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget subTotalWidget(List<CartEntity> items) {
    int subTotal = TotalCalculatorHelper.totalCalculator(items);
    double tax = TotalCalculatorHelper.getFivePercentTax(subTotal);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 110,
        width: double.infinity,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextHelper.textFormat16(
                      text: "Subtotal", color: Colors.black),
                  TextHelper.textFormat16(
                      text: "€$subTotal", color: Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextHelper.textFormat16(
                      text: "Tax (5%)", color: Colors.black),
                  TextHelper.textFormat16(text: "€$tax", color: Colors.orange),
                ],
              ),
              Divider(
                color: Colors.grey[200],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextHelper.textFormat16(
                      text: "Total", color: Colors.black, isBold: true),
                  TextHelper.textFormat16(
                      text: "€${(tax + subTotal)}",
                      color: Colors.orange,
                      isBold: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
        background: slideLeftBackground(),
        onDismissed: (direction) {},
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            await showDialogWidget(context, cart, ref);
          }
          return;
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
              Container(
                margin: const EdgeInsets.all(8),
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/${cart.imageUrl}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextHelper.textFormat16(text: cart.name, color: Colors.black),
                  TextHelper.textFormat16(
                      text: "Price: ${cart.price}",
                      color: Colors.orange,
                      isBold: true),
                ],
              ),
              const Spacer(),
              cartItemCountWidget(ref, cart.quantity),
            ],
          ),
        ),
      ),
    );
  }

  showDialogWidget(BuildContext context, CartEntity cart, WidgetRef ref) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: TextHelper.textFormat18(
                text: "Are you sure you want to delete ${cart.name}?",
                color: Colors.black),
            actions: <Widget>[
              ElevatedButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  ref
                      .read(cartNotifierProvider.notifier)
                      .removeProductFromCart(cart.id);
                  Future.delayed(const Duration(milliseconds: 100), () {
                    ref.read(cartCountNotifier.notifier).getCartCount();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

Widget orderConfirmedButton({required int cartCount}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextHelper.textFormat18(
                text: "Process order (items ${cartCount.toString()})",
                color: Colors.white,
                isBold: true),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    ),
  );
}

Widget cartHeaderWidget(BuildContext context) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: circularOption(
            backgroundColor: Colors.white,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.orange,
              size: 20,
            ),
            onPress: () {
              Navigator.pop(context);
            }),
      ),
      const SizedBox(width: 20),
      TextHelper.textFormat24(
          text: "Orders", color: Colors.white, isBold: true),
    ],
  );
}

Widget slideLeftBackground() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(10),
    ),
    alignment: Alignment.centerRight,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            " Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
  );
}
