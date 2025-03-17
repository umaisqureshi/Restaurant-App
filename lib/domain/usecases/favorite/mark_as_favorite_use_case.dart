import 'package:eat_like_app/domain/domain.dart';

class MarkAsFavoriteUseCase {
  final FavoriteRepository _favoriteRepository;

  MarkAsFavoriteUseCase({required FavoriteRepository favoriteRepository})
      : _favoriteRepository = favoriteRepository;

  Future<void> execute(int productId) async {
    try {
      await _favoriteRepository.markAsFavorite(productId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
