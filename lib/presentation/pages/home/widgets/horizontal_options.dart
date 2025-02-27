import 'package:eat_like_app/presentation/presentation.dart';

class HorizontalOptionsWidget extends ConsumerWidget {
  const HorizontalOptionsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.1,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          roundedOptionCardWidget(
            onPress: () {},
            context: context,
            path: "burger.jpg",
          ),
          roundedOptionCardWidget(
            onPress: () {},
            context: context,
            path: "pizza.jpg",
          ),
          roundedOptionCardWidget(
            onPress: () {},
            context: context,
            path: "pasta.png",
          ),
          roundedOptionCardWidget(
            onPress: () {},
            context: context,
            path: "drink.jpg",
          ),
        ],
      ),
    );
  }
}

Widget roundedOptionCardWidget(
    {required BuildContext context,
    required String path,
    required VoidCallback onPress,
    Color color = Colors.white}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.2,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/$path"), fit: BoxFit.fitHeight),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2), // Shadow color
              blurRadius: 2, // Spread of the shadow
              offset: Offset(1, 1), // Shadow position (x, y)
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
