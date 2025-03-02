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
            isSelected: true,
            onPress: () {
              ref
                  .read(productNotifierProvider.notifier)
                  .fetchProducts(ProductType.top);
            },
            context: context,
            color: Colors.orange,
            path: "top_rated.png",
          ),
          roundedOptionCardWidget(
            isSelected: false,
            onPress: () {
              ref
                  .read(productNotifierProvider.notifier)
                  .fetchProducts(ProductType.burger);
            },
            context: context,
            path: "burger.jpg",
          ),
          roundedOptionCardWidget(
            isSelected: false,
            onPress: () {
              ref
                  .read(productNotifierProvider.notifier)
                  .fetchProducts(ProductType.pizza);
            },
            context: context,
            path: "pizza.jpg",
          ),
          roundedOptionCardWidget(
            isSelected: false,
            onPress: () {
              ref
                  .read(productNotifierProvider.notifier)
                  .fetchProducts(ProductType.pasta);
            },
            context: context,
            path: "pasta.png",
          ),
          roundedOptionCardWidget(
            isSelected: false,
            onPress: () {
              ref
                  .read(productNotifierProvider.notifier)
                  .fetchProducts(ProductType.drink);
            },
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
    required bool isSelected,
    required VoidCallback onPress,
    Color color = Colors.white}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        width: isSelected
            ? MediaQuery.sizeOf(context).width * 0.22
            : MediaQuery.sizeOf(context).width * 0.2,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/$path"), fit: BoxFit.cover),
          color: color,
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? Colors.black.withValues(alpha: 0.8)
                  : Colors.black.withValues(alpha: 0.2), // Shadow color
              blurRadius: 2, // Spread of the shadow
              offset: Offset(1, 2), // Shadow position (x, y)
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
