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
            context: context,
            path: "pizza.jpg",
          ),
          roundedOptionCardWidget(
            context: context,
            path: "burger.jpg",
          ),
          roundedOptionCardWidget(
            context: context,
            path: "pasta.png",
          ),
          roundedOptionCardWidget(
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
    Color color = Colors.white}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
  );
}
