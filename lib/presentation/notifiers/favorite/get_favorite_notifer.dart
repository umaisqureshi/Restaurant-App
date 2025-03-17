import 'package:eat_like_app/presentation/presentation.dart';

class GetFavoriteNotifier extends StateNotifier<List<ProductEntity>> {
  final GetFavoritesUseCase _getFavoritesUseCase;
  GetFavoriteNotifier({
    required GetFavoritesUseCase getFavoritesUseCase,
  })  : _getFavoritesUseCase = getFavoritesUseCase,
        super([]);

  Future<void> getFavorites() async {
    final result = await _getFavoritesUseCase.call();
    result.fold((favorites) {
      state = favorites;
    }, (error) {
      state = [];
    });
  }
}
