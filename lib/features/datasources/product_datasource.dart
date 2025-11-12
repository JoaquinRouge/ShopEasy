import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_easy/features/entitites/product.dart';

class ProductDatasource {
  final _apiUrl = "https://fakestoreapi.com/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Error during fetch products");
    }
  }
}
