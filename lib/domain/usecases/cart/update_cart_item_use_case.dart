import 'package:eat_like_app/domain/domain.dart';

class UpdateCartItemUseCase {
  final CartRepo cartRepo;

  const UpdateCartItemUseCase(this.cartRepo);

  Future<void> execute(UpdateCartRequest request) {
    return cartRepo.updateCartItem(request);
  }
}
