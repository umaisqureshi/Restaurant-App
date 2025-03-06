import 'package:eat_like_app/data/db/collections/cart_collection.dart';

class CartEntity {
  final int id;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;

  CartEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  double get total => price * quantity;

  CartEntity copyWith({
    int? id,
    String? name,
    double? price,
    int? quantity,
    String? imageUrl,
  }) {
    return CartEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  static CartEntity fromCollection(CartProductCollection e) {
    return CartEntity(
      id: e.id,
      imageUrl: e.imageUrl!,
      name: e.name!,
      price: e.price!,
      quantity: e.quantity!,
    );
  }
}
