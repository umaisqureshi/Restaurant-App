import 'package:eat_like_app/presentation/presentation.dart';

class GetAllProductsUseCase {
  final ProductRepository productRepository;
  final Db db = Db();

  GetAllProductsUseCase({required this.productRepository});

  Future<void> execute() async {
    List<ProductEntity> products = await productRepository.getAllProducts();
    db.addProducts(products);
    return;
  }
}
