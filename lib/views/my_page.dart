import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('GridView Shop'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.view_list_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
        backgroundColor: Colors.black87,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 16.0),
        child: Obx(() => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemBuilder: (context, index) => Container(
              color: Colors.red,
              child: Text(controller.productList[index].name),
            ),
            itemCount: controller.productList.length,
          ),
        ),
      ),
    );
  }
}
