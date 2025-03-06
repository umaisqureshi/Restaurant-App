import 'package:eat_like_app/presentation/presentation.dart';

class ProductGridWidget extends ConsumerWidget {
  const ProductGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);
    switch (productState) {
      case ProductInitial():
        ref
            .read(productNotifierProvider.notifier)
            .fetchProducts(ProductType.top);
        Future.delayed(Duration(milliseconds: 500), () {
          ref.read(cartCountNotifier.notifier).getCartCount();
        });
        return const Center(child: CircularProgressIndicator());

      case ProductLoaded():
        final products = (productState).products;
        return buildProductsGrid(
            products: products, context: context, ref: ref);
      case ProductError():
        final message = (productState).message;
        return Center(child: Text('Error: $message'));
    }
  }
}

Widget buildProductsGrid(
    {required List<ProductEntity> products,
    required BuildContext context,
    required WidgetRef ref}) {
  return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return productCardWidget(
            context: context, product: products[index], ref: ref);
      });
}
