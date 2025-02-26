import 'package:eat_like_app/presentation/presentation.dart';

Widget appBarWidget({required WidgetRef ref, required BuildContext context}) {
  return Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Badge(
          backgroundColor: Colors.black,
          label: TextHelper.textFormat12(text: "0", color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: circularOption(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                  size: 20,
                ),
                onPress: () {
                  showModelSheet(context);
                }),
          ),
        ),
        Text(
          " Eat Shop",
          style: GoogleFonts.dancingScript(
            fontSize: 30,
            color: Colors.teal,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: circularOption(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
                size: 20,
              ),
              onPress: () {}),
        ),
      ],
    ),
  );
}

Future<dynamic> showModelSheet(BuildContext context) {
  return showModalBottomSheet(
      showDragHandle: true,
      useRootNavigator: true,
      isScrollControlled: true,
      elevation: 5,
      constraints: BoxConstraints(
          minHeight: MediaQuery.sizeOf(context).height * 0.7,
          maxHeight: MediaQuery.sizeOf(context).height * 0.85),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      backgroundColor: Colors.teal,
      context: context,
      builder: (context) {
        return CartWidget();
      });
}

Widget circularOption(
    {required Icon icon,
    required VoidCallback onPress,
    Color backgroundColor = Colors.teal}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2), // Shadow color
            blurRadius: 2, // Spread of the shadow
            offset: Offset(1, 1), // Shadow position (x, y)
          ),
        ],
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: icon,
    ),
  );
}
