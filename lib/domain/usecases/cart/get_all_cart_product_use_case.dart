import 'package:dartz/dartz.dart';
import 'package:eat_like_app/domain/entities/cart_entity.dart';
import 'package:eat_like_app/domain/repositories/cart_repo.dart';

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
