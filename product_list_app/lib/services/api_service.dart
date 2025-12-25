import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  static const String _baseUrl = 'https://dummyjson.com';
  static const String _productsEndpoint = '$_baseUrl/products';

  Future<ProductListResponse> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_productsEndpoint));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return ProductListResponse.fromJson(data);
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}


