import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dummy_data.dart';

/// Fetches product data from the public DummyJSON REST API.
/// Docs: https://dummyjson.com/docs/products
class ApiService {
  static const String _baseUrl = 'https://dummyjson.com';

  static Future<List<Product>> fetchProducts({
    int limit = 8,
    int skip = 0,
  }) async {
    final uri = Uri.parse(
      '$_baseUrl/products?limit=$limit&skip=$skip'
      '&select=title,price,brand,category,discountPercentage',
    );
    final response = await http.get(uri).timeout(const Duration(seconds: 10));
    if (response.statusCode != 200) {
      throw Exception('API error: ${response.statusCode}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final items = (data['products'] as List).cast<Map<String, dynamic>>();
    return [
      for (var i = 0; i < items.length; i++) Product.fromJson(items[i], i),
    ];
  }
}
