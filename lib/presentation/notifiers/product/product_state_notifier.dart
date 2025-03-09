import 'package:eat_like_app/presentation/presentation.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final GetProductsByTypeUseCase getProductsByTypeUseCase;

  ProductNotifier(this.getProductsByTypeUseCase) : super(ProductInitial());

  Future<void> fetchProducts(ProductType type) async {
    try {
      final result = await getProductsByTypeUseCase.execute(type);
      state = ProductLoaded(result);
    } catch (e) {
      state = ProductError(e.toString());
    }
  }
}
