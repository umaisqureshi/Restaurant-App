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

class SelectedProductNotifier extends StateNotifier<ProductType> {
  SelectedProductNotifier() : super(ProductType.top);

  Future<void> updateSelectedProductType(ProductType type) async {
    try {
      state = type;
    } catch (e) {
      state = ProductType.top;
    }
  }
}
