import 'package:eat_like_app/presentation/presentation.dart';

class ProductDetailWidget extends ConsumerStatefulWidget {
  const ProductDetailWidget({super.key, required this.product});

  final ProductEntity product;

  @override
  ConsumerState<ProductDetailWidget> createState() =>
      _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends ConsumerState<ProductDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView(
        children: [
          _buildProductImageSection(),
          const SizedBox(height: 20),
          _buildProductHeaderSection(),
          const SizedBox(height: 10),
          _buildProductPriceSection(),
          const SizedBox(height: 15),
          _buildProductDescriptionSection(),
          _buildItemCountWidget(ref),
          const SizedBox(height: 10),
          _buildAddToCartButton(ref),
        ],
      ),
    );
  }


  Widget _buildProductImageSection() {
    return Stack(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage("assets/images/${widget.product.imageUrl}"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: circularOption(
                  backgroundColor: Colors.white,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.orange,
                    size: 20,
                  ),
                  onPress: () => context.pop(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductHeaderSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextHelper.textFormat18(
            text: widget.product.name,
            color: Colors.black,
            isBold: true,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.product.rating.toString()}/5.0",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductPriceSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextHelper.textFormat24(
        text: "€${widget.product.price}",
        color: Colors.orange,
        isBold: true,
      ),
    );
  }

  Widget _buildProductDescriptionSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextHelper.textFormat16(
        text: widget.product.description,
        color: Colors.black,
      ),
    );
  }

  Widget _buildAddToCartButton(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          _addProductToCart(ref);
          context.pop();
          SnackbarWidget().showSnackBar("Product added successfully", context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: TextHelper.textFormat18(
            text: "Add to Cart",
            color: Colors.white,
            isBold: true,
          ),
        ),
      ),
    );
  }

  void _addProductToCart(WidgetRef ref) {
    final cartNotifier = ref.read(cartNotifierProvider.notifier);
    final itemCount = ref.read(itemCountNotifier);

    cartNotifier.addProductToCart(
      CartEntity(
        id: widget.product.id!,
        name: widget.product.name,
        imageUrl: widget.product.imageUrl,
        price: widget.product.price,
        quantity: itemCount,
      ),
    );

    Future.delayed(const Duration(milliseconds: 100), () {
      ref.read(cartCountNotifier.notifier).getCartCount();
    });
  }}

Widget _buildItemCountWidget(WidgetRef ref) {
  final cartCount = ref.watch(itemCountNotifier);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextHelper.textFormat18(
          text: "Item Count",
          color: Colors.black,
          isBold: true,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              _buildCountButton(
                icon: Icons.remove,
                onPressed: () => ref.read(itemCountNotifier.notifier).decrement(),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    cartCount.toString(),
                    style: GoogleFonts.openSans(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _buildCountButton(
                icon: Icons.add,
                onPressed: () => ref.read(itemCountNotifier.notifier).increment(),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildCountButton({required IconData icon, required VoidCallback onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: 30,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    ),
  );
}