import 'package:eat_like_app/domain/entities/cart_entity.dart';

sealed class CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartEntity> cartProducts;
  CartLoaded(this.cartProducts);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

class CartEmpty extends CartState {}

