import 'package:eat_like_app/domain/domain.dart';

class GetAllCartProductUseCase {
  final CartRepo _cartRepository;

  GetAllCartProductUseCase(this._cartRepository);

  Future<Either<List<CartEntity>, Exception>> execute() async {
    try {
      final response = await _cartRepository.getAllCartProducts();
      return Left(response);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }
}
