import 'package:eat_like_app/domain/domain.dart';

abstract class FavoriteRepository {
  Future<List<ProductEntity>> getFavorites();
  Future<void> markAsFavorite(int productId);
}
