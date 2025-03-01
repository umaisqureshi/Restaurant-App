import 'package:eat_like_app/data/data.dart';

part 'product_collection.g.dart';

@collection
class ProductCollection {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? name;

  @Index(type: IndexType.value)
  bool? isTopRated;

  @Index(type: IndexType.value)
  String? description;

  @Index(type: IndexType.value)
  double? price;

  @Index(type: IndexType.value)
  String? imageUrl;

  @Index(type: IndexType.value)
  double? rating;

  @enumerated
  ProductType type = ProductType.top;
}
