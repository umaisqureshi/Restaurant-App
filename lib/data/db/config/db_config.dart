import 'package:eat_like_app/data/data.dart';
import 'package:eat_like_app/data/db/collections/cart_collection.dart';

class DBConfig {
  static Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [ProductCollectionSchema, CartProductCollectionSchema],
      directory: dir.path,
    );
    return isar;
  }
}
