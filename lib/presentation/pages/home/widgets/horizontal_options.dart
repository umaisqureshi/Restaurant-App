import 'package:eat_like_app/presentation/presentation.dart';

class HorizontalOptionsWidget extends ConsumerWidget {
  const HorizontalOptionsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double cardHeight = MediaQuery.sizeOf(context).height * 0.1;

    return SizedBox(
      height: cardHeight,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildOptionCard(
            context: context,
            ref: ref,
            isSelected: true,
            productType: ProductType.top,
            imagePath: "assets/images/top_rated.png",
          ),
          _buildOptionCard(
            context: context,
            ref: ref,
            isSelected: false,
            productType: ProductType.burger,
            imagePath: "assets/images/burger.jpg",
          ),
          _buildOptionCard(
            context: context,
            ref: ref,
            isSelected: false,
            productType: ProductType.pizza,
            imagePath: "assets/images/pizza.jpg",
          ),
          _buildOptionCard(
            context: context,
            ref: ref,
            isSelected: false,
            productType: ProductType.pasta,
            imagePath: "assets/images/pasta.png",
          ),
          _buildOptionCard(
            context: context,
            ref: ref,
            isSelected: false,
            productType: ProductType.drink,
            imagePath: "assets/images/drink.jpg",
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard({
    required BuildContext context,
    required WidgetRef ref,
    required bool isSelected,
    required ProductType productType,
    required String imagePath,
  }) {
    return roundedOptionCardWidget(
      context: context,
      imagePath: imagePath,
      isSelected: isSelected,
      onPress: () {
        ref.read(productNotifierProvider.notifier).fetchProducts(productType);
      },
      color: isSelected ? Colors.orange : Colors.white,
    );
  }
}

Widget roundedOptionCardWidget({
  required BuildContext context,
  required String imagePath,
  required bool isSelected,
  required VoidCallback onPress,
  Color color = Colors.white,
}) {
  final double cardWidth = isSelected
      ? MediaQuery.sizeOf(context).width * 0.22
      : MediaQuery.sizeOf(context).width * 0.2;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          color: color,
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? Colors.black.withValues(alpha: 0.8)
                  : Colors.black.withValues(alpha: 0.2),
              blurRadius: 2,
              offset: const Offset(1, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
