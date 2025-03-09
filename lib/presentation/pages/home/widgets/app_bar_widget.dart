import 'package:eat_like_app/presentation/presentation.dart';

Widget appBarWidget({required BuildContext context, required WidgetRef ref}) {
  final int itemCount = ref.watch(cartCountNotifier);

  return Container(
    color: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCartIconWithBadge(context, itemCount),
        _buildAppTitle(),
        _buildNotificationIcon(),
      ],
    ),
  );
}

Widget _buildCartIconWithBadge(BuildContext context, int itemCount) {
  return Badge(
    backgroundColor: Colors.orange,
    label: Text(
      itemCount.toString(),
      style: const TextStyle(color: Colors.white, fontSize: 12),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: circularOption(
        backgroundColor: Colors.white,
        icon: const Icon(
          Icons.shopping_bag,
          color: Colors.orange,
          size: 20,
        ),
        onPress: () => _showCartModalSheet(context),
      ),
    ),
  );
}

Widget _buildAppTitle() {
  return Text(
    "Eat Shop",
    style: GoogleFonts.dancingScript(
      fontSize: 30,
      color: Colors.orange,
    ),
  );
}

Widget _buildNotificationIcon() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
  );
}

Future<void> _showCartModalSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    showDragHandle: true,
    useRootNavigator: true,
    isScrollControlled: true,
    elevation: 5,
    constraints: BoxConstraints(
      minHeight: MediaQuery.sizeOf(context).height * 0.8,
      maxHeight: MediaQuery.sizeOf(context).height * 0.9,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.orange,
    builder: (context) => const CartScreen(),
  );
}

Widget circularOption({
  required Icon icon,
  required VoidCallback onPress,
  Color backgroundColor = Colors.teal,
}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 2,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Center(child: icon),
    ),
  );
}
