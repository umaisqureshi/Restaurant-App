import 'package:eat_like_app/data/data.dart';

part 'cart_collection.g.dart';

@collection
class CartProductCollection {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String? name;

    @Index(type: IndexType.value)
  String? imageUrl;

  @Index(type: IndexType.value)
  double? price;

  @Index(type: IndexType.value)
  int? productId;

  @Index(type: IndexType.value)
  int? quantity;
}
