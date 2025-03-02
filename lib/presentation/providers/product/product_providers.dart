import 'package:eat_like_app/presentation/presentation.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepoImpl();
});

final getProductsByTypeUseCaseProvider =
    Provider<GetProductsByTypeUseCase>((ref) {
  final productRepository = ref.read(productRepositoryProvider);
  return GetProductsByTypeUseCase(productRepository);
});

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  final getProductsByTypeUseCase = ref.read(getProductsByTypeUseCaseProvider);
  return ProductNotifier(getProductsByTypeUseCase);
});
