import 'package:eat_like_app/data/data.dart';

class Db {
  static final Db _instance = Db._internal();
  factory Db() => _instance;
  Db._internal();

  Isar? _isar;

  Future<void> init() async {
    await _openDb();
    await _clearDb();
  }

  Future<void> _openDb() async {
    _isar = await DBConfig.openDB();
  }

  Future<void> _clearDb() async {
    await _isar?.writeTxn(() async {
      await _isar?.productCollections.clear();
      await _isar?.cartProductCollections.clear();
    });
  }

  Future<void> addProducts(List<ProductEntity> products) async {
    if (_isar == null) throw Exception("Database is not initialized");

    await _isar!.writeTxn(() async {
      for (final product in products) {
        final collection = ProductCollection()
          ..name = product.name
          ..description = product.description
          ..price = product.price
          ..isTopRated = product.isTopRated
          ..type = product.type
          ..imageUrl = product.imageUrl
          ..rating = product.rating;

        await _isar!.productCollections.put(collection);
      }
    });
  }

  Future<List<ProductEntity>> getProductsByType(ProductType type) async {
    if (_isar == null) throw Exception("Database is not initialized");

    final data =
        await _isar!.productCollections.filter().typeEqualTo(type).findAll();

    return data.map(ProductEntity.fromCollection).toList();
  }

  Future<List<ProductEntity>> getTopRatedProducts() async {
    if (_isar == null) throw Exception("Database is not initialized");

    final data = await _isar!.productCollections
        .where()
        .isTopRatedEqualTo(true)
        .findAll();

    return data.map(ProductEntity.fromCollection).toList();
  }

  Future<void> addProductToCart(CartEntity product) async {
    if (_isar == null) throw Exception("Database is not initialized");

    await _isar!.writeTxn(() async {
      final existingCollection = await _isar!.cartProductCollections
          .where()
          .productIdEqualTo(product.id)
          .findFirst();

      if (existingCollection != null) {
        existingCollection.quantity =
            (existingCollection.quantity ?? 1) + product.quantity;
        await _isar!.cartProductCollections.put(existingCollection);
      } else {
        final newCollection = CartProductCollection()
          ..name = product.name
          ..price = product.price
          ..productId = product.id
          ..imageUrl = product.imageUrl
          ..quantity = product.quantity;

        await _isar!.cartProductCollections.put(newCollection);
      }
    });
  }

  Future<void> updateCartItem(UpdateCartRequest request) async {
    if (_isar == null) throw Exception("Database is not initialized");

    await _isar!.writeTxn(() async {
      final existingCollection = await _isar!.cartProductCollections
          .where()
          .productIdEqualTo(request.id)
          .findFirst();

      if (existingCollection != null) {
        if (request.isIncrease) {
          existingCollection.quantity = (existingCollection.quantity ?? 1) + 1;
          await _isar!.cartProductCollections.put(existingCollection);
        } else {
          if (existingCollection.quantity! > 1) {
            existingCollection.quantity =
                (existingCollection.quantity ?? 1) - 1;
            await _isar!.cartProductCollections.put(existingCollection);
          } else {
            await _isar!.cartProductCollections.delete(request.id);
          }
        }
      }
    });
  }

  Future<int> getCartProductCount() async {
    if (_isar == null) throw Exception("Database is not initialized");

    final data = await _isar!.cartProductCollections.where().findAll();
    return data.length;
  }

  Future<List<CartEntity>> removeProductFromCart(int id) async {
    if (_isar == null) throw Exception("Database is not initialized");

    await _isar!.writeTxn(() async {
      await _isar!.cartProductCollections.delete(id);
    });

    return getAllCartProducts();
  }

  Future<List<CartEntity>> getAllCartProducts() async {
    if (_isar == null) throw Exception("Database is not initialized");

    final data = await _isar!.cartProductCollections.where().findAll();
    return data.map(CartEntity.fromCollection).toList();
  }

  Future<void> clearCart() async {
    if (_isar == null) throw Exception("Database is not initialized");

    await _isar!.writeTxn(() async {
      await _isar!.cartProductCollections.clear();
    });
  }

  Future<void> closeDb() async {
    await _isar?.close();
  }
}
