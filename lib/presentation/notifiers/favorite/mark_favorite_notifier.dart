import 'package:eat_like_app/presentation/presentation.dart';

class MarkFavoriteNotifier extends StateNotifier<bool> {
  final MarkAsFavoriteUseCase _markAsFavoriteUseCase;

  MarkFavoriteNotifier({required MarkAsFavoriteUseCase markAsFavoriteUseCase})
      : _markAsFavoriteUseCase = markAsFavoriteUseCase,
        super(false);

  Future<void> markAsFavorite(int productId) async {
    try {
      await _markAsFavoriteUseCase.execute(productId);
      state = true;
    } catch (e) {
      state = false;
    }
  }
}
