import 'package:eat_like_app/presentation/presentation.dart';

Widget productCardWidget({
  required ProductEntity product,
  required BuildContext context,
  required WidgetRef ref,
}) {
  return GestureDetector(
    onTap: () => _showProductDetailModal(context, ref, product),
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
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductImage(product),
          _buildProductDetails(product),
        ],
      ),
    ),
  );
}

Widget _buildProductImage(ProductEntity product) {
  return Expanded(
    child: Stack(
      children: [
        ImageHelper.imageFromGallery(
          path: product.imageUrl,
          fit: BoxFit.cover,
          height: 150,
          width: double.infinity,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Text(
              "${product.rating}",
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildProductDetails(ProductEntity product) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextHelper.textFormat12(
          text: product.name,
          color: Colors.black,
          isBold: true,
        ),
        const SizedBox(height: 2),
        Text(
          "€${product.price}",
          style: GoogleFonts.openSans(
            color: Colors.orange,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 2),
      ],
    ),
  );
}

void _showProductDetailModal(
    BuildContext context, WidgetRef ref, ProductEntity product) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    elevation: 5,
    constraints: BoxConstraints(
      minHeight: MediaQuery.sizeOf(context).height * 0.85,
      maxHeight: MediaQuery.sizeOf(context).height * 0.9,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.orange,
    builder: (context) => ProductDetailWidget(product: product),
  ).whenComplete(() {
    ref.read(itemCountNotifier.notifier).reset();
  });
}
