import 'package:http/http.dart' as http;

class Network {
  static const String uriPath =
      'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';

  static Future<String?> fetchProducts() async {
    var response = await http.Client().get(Uri.parse(uriPath));

    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
}