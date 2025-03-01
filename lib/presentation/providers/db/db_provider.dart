import 'package:eat_like_app/presentation/presentation.dart';

final dbProvider = Provider<Db>((ref) {
  final db = Db();
  return db;
});
