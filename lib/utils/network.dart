import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class Network {
  static var client = http.Client();
  static String uriPath =
      'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';

  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(Uri.parse(uriPath));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    }
    return null;
  }
}