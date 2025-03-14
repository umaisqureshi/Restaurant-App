import 'package:eat_like_app/domain/domain.dart';

abstract class ProductRepository {
  Future addProducts(List<ProductEntity> products);
  Future<List<ProductEntity>> getProductsByType(ProductType type);
  Future<List<ProductEntity>> getTopProducts();
  Future<List<ProductEntity>> getAllProducts();
}
