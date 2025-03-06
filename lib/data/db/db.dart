import 'package:eat_like_app/data/data.dart';


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
          ..isTopRated = product.isTopRated
          ..type = product.type
          ..imageUrl = product.imageUrl
          ..rating = product.rating;

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

  // Cart Collection
  Future<void> addProductToCart(CartEntity product) async {
    await isar!.writeTxn(() async {
      final existingCollection = await isar!.cartProductCollections
          .where()
          .productIdEqualTo(product.id)
          .findFirst();

      if (existingCollection != null) {
        existingCollection.quantity =
            (existingCollection.quantity ?? 1) + product.quantity;
        await isar!.cartProductCollections.put(existingCollection);
      } else {
        final newCollection = CartProductCollection()
          ..name = product.name
          ..price = product.price
          ..productId = product.id
          ..imageUrl = product.imageUrl
          ..quantity = product.quantity;

        await isar!.cartProductCollections.put(newCollection);
      }
    });
  }

  Future<int> getCartProductCount() async {
    List<CartProductCollection> data =
        await isar!.cartProductCollections.where().findAll();
    return data.length;
  }

  Future<List<CartEntity>> removeProductFromCart(int id) async {
    await isar!.writeTxn(() async {
      await isar!.cartProductCollections.delete(id);
    });
    return getAllCartProducts();
  }

  Future<List<CartEntity>> getAllCartProducts() async {
    List<CartProductCollection> data =
        await isar!.cartProductCollections.where().findAll();
    List<CartEntity> products =
        data.map((e) => CartEntity.fromCollection(e)).toList();
    return products;
  }

  Future<void> clearCart() async {
    await isar!.writeTxn(() async {
      await isar!.cartProductCollections.clear();
    });
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
