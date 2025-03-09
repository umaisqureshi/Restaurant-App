import 'package:eat_like_app/presentation/presentation.dart';

Widget cartHeaderWidget(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      children: [
        circularOption(
          backgroundColor: Colors.white,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.orange,
            size: 20,
          ),
          onPress: () => Navigator.pop(context),
        ),
        const SizedBox(width: 20),
        TextHelper.textFormat24(
          text: "Orders",
          color: Colors.white,
          isBold: true,
        ),
      ],
    ),
  );
}
