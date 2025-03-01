import 'package:eat_like_app/domain/domain.dart';

class GetProductsByTypeUseCase {
  final ProductRepository _productRepository;

  GetProductsByTypeUseCase(this._productRepository);

  Future<List<ProductEntity>> execute(ProductType type) {
    if (type == ProductType.top) {
      return _productRepository.getTopProducts();
    }
    return _productRepository.getProductsByType(type);
  }
}
