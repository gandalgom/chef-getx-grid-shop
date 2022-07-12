import 'package:get/get.dart';

import '../models/product_model.dart';
import '../utils/network.dart';

class Controller extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    var productData = await Network.fetchProducts();
    if (productData != null) {
      productList.value = productFromJson(productData);
    }
  }
}