import 'package:eat_like_app/core/core.dart';
import 'package:eat_like_app/domain/entities/cart_entity.dart';
import 'package:eat_like_app/presentation/presentation.dart';
import 'package:eat_like_app/presentation/providers/cart/cart_providers.dart';

class ProductDetailWidget extends ConsumerStatefulWidget {
  const ProductDetailWidget({super.key, required this.product});

  final ProductEntity product;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
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
          Stack(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/${widget.product.imageUrl}"),
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
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.orange,
                            size: 20,
                          ),
                          onPress: () {
                            context.pop();
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextHelper.textFormat18(
                    text: widget.product.name,
                    color: Colors.black,
                    isBold: true),
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
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextHelper.textFormat24(
                text: "€${widget.product.price}",
                color: Colors.orange,
                isBold: true),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextHelper.textFormat16(
              text: widget.product.description,
              color: Colors.black,
            ),
          ),
          itemCountWidget(ref),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  ref.read(cartNotifierProvider.notifier).addProductToCart(
                      CartEntity(
                          id: widget.product.id!,
                          name: widget.product.name,
                          imageUrl: widget.product.imageUrl,
                          price: widget.product.price,
                          quantity: ref.watch(itemCountNotifier)));
                          Future.delayed(Duration(milliseconds: 500), () {
                            ref.read(cartCountNotifier.notifier).getCartCount();
                          });
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10),
                    child: TextHelper.textFormat18(
                        text: "Add to Cart",
                        color: Colors.white,
                        isBold: true)),
              )),
        ],
      ),
    );
  }
}

Widget itemCountWidget(WidgetRef ref) {
  final cartCount = ref.watch(itemCountNotifier);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextHelper.textFormat18(
            text: "Item Count", color: Colors.black, isBold: true),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => ref.read(itemCountNotifier.notifier).decrement(),
                child: Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
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
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => ref.read(itemCountNotifier.notifier).increment(),
                child: Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
