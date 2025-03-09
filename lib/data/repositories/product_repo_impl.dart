import 'package:eat_like_app/data/data.dart';

class ProductRepoImpl implements ProductRepository {
  final Db db = Db();

  @override
  Future<List<ProductEntity>> getTopProducts() async {
    return db.getTopRatedProducts();
  }

  @override
  Future addProducts(List<ProductEntity> products) {
    return db.addProducts(products);
  }

  @override
  Future<List<ProductEntity>> getProductsByType(ProductType type) {
    return db.getProductsByType(type);
  }
}
