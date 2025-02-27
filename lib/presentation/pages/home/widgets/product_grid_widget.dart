import 'package:eat_like_app/presentation/presentation.dart';

class ProductGridWidget extends ConsumerWidget {
  const ProductGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 8,
        itemBuilder: (context, index) {
          return productCardWidget(
              context: context,
              product: ProductEntity(
                  id: "0",
                  name: "Cheesy bless pizza",
                  description:
                      "Indulge in the ultimate comfort food with our Cheesy Bless Pizza! Loaded with a generous layer of gooey, melted mozzarella and a blend of premium cheeses, this pizza is a cheese lover's dream. Topped with a rich tomato sauce, fresh herbs, and a hint of garlic, every bite is a burst of flavor. Perfectly baked to golden perfection, our Cheesy Bless Pizza is crispy on the outside, soft on the inside, and utterly irresistible. Whether you're sharing with friends or enjoying it solo, this pizza is sure to bring a smile to your face.",
                  price: 9.50,
                  rating: 4.3,
                  imageUrl:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg"));
        });
  }
}

Widget productCardWidget({
  required ProductEntity product,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      showModalBottomSheet(
          useRootNavigator: true,
          isScrollControlled: true,
          elevation: 5,
          constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height * 0.7,
              maxHeight: MediaQuery.sizeOf(context).height * 0.85),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          backgroundColor: Colors.orange,
          context: context,
          builder: (context) => ProductDetailWidget(
                product: product,
              ));
    },
    child: Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ImageHelper.imageFromNetwork(
                    imageUrl: product.imageUrl,
                    fit: BoxFit.cover,
                    height: 150,
                    width: double.infinity),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      "${product.rating}",
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHelper.textFormat12(
                    text: product.name, color: Colors.black, isBold: true),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "€${product.price}",
                  style: GoogleFonts.openSans(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
