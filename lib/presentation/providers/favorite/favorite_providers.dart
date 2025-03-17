import 'package:eat_like_app/presentation/presentation.dart';

final favoriteRepositoryProvider = Provider<FavoriteRepository>((ref) {
  return FavoriteRepoImpl();
});

final getFavoritesUseCaseProvider = Provider<GetFavoritesUseCase>((ref) {
  final favoriteRepository = ref.watch(favoriteRepositoryProvider);
  return GetFavoritesUseCase(favoriteRepository: favoriteRepository);
});

final markAsFavoriteUseCaseProvider = Provider<MarkAsFavoriteUseCase>((ref) {
  final favoriteRepository = ref.watch(favoriteRepositoryProvider);
  return MarkAsFavoriteUseCase(favoriteRepository: favoriteRepository);
});

final getFavoriteNotifierProvider =
    StateNotifierProvider<GetFavoriteNotifier, List<ProductEntity>>(
  (ref) {
    return GetFavoriteNotifier(
        getFavoritesUseCase: ref.watch(getFavoritesUseCaseProvider));
  },
);

final markFavoriteNotifierProvider =
    StateNotifierProvider<MarkFavoriteNotifier, bool>(
  (ref) {
    return MarkFavoriteNotifier(
        markAsFavoriteUseCase: ref.watch(markAsFavoriteUseCaseProvider));
  },
);
