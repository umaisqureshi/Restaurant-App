import 'package:eat_like_app/domain/domain.dart';

class GetFavoritesUseCase {
  final FavoriteRepository _favoriteRepository;

  GetFavoritesUseCase({required FavoriteRepository favoriteRepository})
      : _favoriteRepository = favoriteRepository;

  Future<Either<List<ProductEntity>, Exception>> call() async {
    try {
      final response = await _favoriteRepository.getFavorites();
      return Left(response);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }
}
