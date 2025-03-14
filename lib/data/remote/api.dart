import 'package:http/http.dart' as http;
import 'package:eat_like_app/data/data.dart';

class ApiService {
  static const String baseUrl = "http://localhost:8000";

  static Future<List<ProductEntity>> getAllProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));
    if (response.statusCode == 200) {
      List<dynamic> products = jsonDecode(response.body);
      return products.map((e) => ProductEntity.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
