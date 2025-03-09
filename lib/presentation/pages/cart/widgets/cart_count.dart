import 'package:eat_like_app/presentation/presentation.dart';

Widget cartItemCountWidget(WidgetRef ref, int count, int id) {
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
              _buildCountButton(
                icon: Icons.remove,
                onPressed: () => _updateCartItem(ref, id, false),
              ),
              _buildCountDisplay(count),
              _buildCountButton(
                icon: Icons.add,
                onPressed: () => _updateCartItem(ref, id, true),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildCountButton(
    {required IconData icon, required VoidCallback onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Icon(icon, color: Colors.white),
      ),
    ),
  );
}

Widget _buildCountDisplay(int count) {
  return Container(
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
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

void _updateCartItem(WidgetRef ref, int id, bool isIncrease) {
  final request = UpdateCartRequest(id: id, isIncrease: isIncrease);
  ref.read(cartNotifierProvider.notifier).updateCartItem(request);

  Future.delayed(const Duration(milliseconds: 100), () {
    ref.read(cartCountNotifier.notifier).getCartCount();
  });
}
