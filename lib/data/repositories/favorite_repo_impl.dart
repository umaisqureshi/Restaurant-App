import 'package:eat_like_app/data/data.dart';

class FavoriteRepoImpl extends FavoriteRepository {
  @override
  Future<List<ProductEntity>> getFavorites() async {
    return await ApiService.getFavorites();
  }

  @override
  Future<void> markAsFavorite(int productId) async {
    return await ApiService.markAsFavorite(productId);
  }
}
