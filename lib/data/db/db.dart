import 'package:eat_like_app/core/constant/products.dart';
import 'package:eat_like_app/data/data.dart';
import 'package:eat_like_app/presentation/presentation.dart';

class Db {
  static final Db _db = Db._internal();
  factory Db() {
    return _db;
  }
  Db._internal();
  Db get instance => _db;
  Isar? isar;

  void init() {
    openDb();
  }

  Future<void> addProducts(List<ProductEntity> products) async {
    await isar!.writeTxn(() async {
      for (ProductEntity product in products) {
        final collection = ProductCollection()
          ..name = product.name
          ..description = product.description
          ..price = product.price
          ..isTopRated = product.isTopRated ?? false
          ..type = product.type
          ..imageUrl = product.imageUrl
          ..rating = product.rating ?? 0.0;

        await isar!.productCollections.put(collection);
      }
    });
  }

  Future<List<ProductEntity>> getProductsByType(ProductType type) async {
    List<ProductCollection> data =
        await isar!.productCollections.filter().typeEqualTo(type).findAll();
    List<ProductEntity> products =
        data.map((e) => ProductEntity.fromCollection(e)).toList();
    return products;
  }

  Future<List<ProductEntity>> getTopRatedProducts() async {
    List<ProductCollection> data = await isar!.productCollections
        .where()
        .isTopRatedEqualTo(true)
        .findAll();

    List<ProductEntity> products =
        data.map((e) => ProductEntity.fromCollection(e)).toList();

    return products;
  }

  void openDb() async {
    isar = await DBConfig.openDB();
    clearDB();
    addProducts(products);
  }

  void clearDB() {
    isar!.writeTxn(() async {
      isar?.productCollections.clear();
    });
  }

  void closeDb() {
    isar?.close();
  }
}
