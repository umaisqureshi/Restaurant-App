import 'package:eat_like_app/domain/domain.dart';

class ProductEntity {
  final int? id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  final ProductType type;
  final bool isTopRated;

  ProductEntity({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.type,
    required this.isTopRated,
    required this.rating,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'] as int?,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      type: ProductType.values.firstWhere(
        (e) => e.toString() == 'ProductType.${json['type']}',
        orElse: () => ProductType.top,
      ),
      isTopRated: json['isTopRated'] as bool,
    );
  }

  static ProductEntity fromCollection(ProductCollection e) {
    return ProductEntity(
      id: e.id,
      name: e.name ?? "",
      description: e.description ?? "",
      price: e.price ?? 0.0,
      imageUrl: e.imageUrl ?? "",
      rating: e.rating ?? 0.0,
      type: e.type,
      isTopRated: e.isTopRated ?? false,
    );
  }
}
