import 'package:eat_like_app/presentation/presentation.dart';

class ProductGridWidget extends ConsumerWidget {
  const ProductGridWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);

    return _buildProductGridContent(productState, ref, context);
  }

  Widget _buildProductGridContent(
      ProductState productState, WidgetRef ref, BuildContext context) {
    switch (productState) {
      case ProductInitial():
        _initializeProducts(ref);
        return const Center(child: CircularProgressIndicator());

      case ProductLoaded():
        return _buildProductsGrid(
          products: productState.products,
          context: context,
          ref: ref,
        );

      case ProductError():
        return Center(child: Text('Error: ${productState.message}'));
    }
  }

  void _initializeProducts(WidgetRef ref) {
    ref.read(productNotifierProvider.notifier).fetchProducts(ProductType.top);
    Future.delayed(const Duration(milliseconds: 100), () {
      ref.read(cartCountNotifier.notifier).getCartCount();
    });
  }

  Widget _buildProductsGrid({
    required List<ProductEntity> products,
    required BuildContext context,
    required WidgetRef ref,
  }) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return productCardWidget(
          context: context,
          product: products[index],
          ref: ref,
        );
      },
    );
  }
}
