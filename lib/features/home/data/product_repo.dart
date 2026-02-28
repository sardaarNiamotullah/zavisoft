import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zavisoft/features/home/data/product_model.dart';

class ProductRepo extends GetxService {
  static const String _baseUrl = 'https://fakestoreapi.com';

  Future<List<ProductModel>> fetchAllProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}