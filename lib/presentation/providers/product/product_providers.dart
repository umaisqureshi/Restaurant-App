import 'package:eat_like_app/core/enum/enums.dart';
import 'package:eat_like_app/presentation/presentation.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepoImpl();
});

final getProductsByTypeUseCaseProvider =
    Provider<GetProductsByTypeUseCase>((ref) {
  final productRepository = ref.read(productRepositoryProvider);
  return GetProductsByTypeUseCase(productRepository);
});

final productsProvider =
    FutureProvider.family<List<ProductEntity>, ProductType>((ref, type) async {
  final getProductsByTypeUseCase = ref.read(getProductsByTypeUseCaseProvider);
  List<ProductEntity> data = await getProductsByTypeUseCase.execute(type);
  return data;
});
