import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 60,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(product.imageLink, fit: BoxFit.fill),
                ),
                Obx(
                  () => CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15.0,
                    child: IconButton(
                      onPressed: () => product.like.toggle(),
                      iconSize: 18.0,
                      icon: product.like.value
                          ? const Icon(Icons.favorite_rounded)
                          : const Icon(Icons.favorite_border),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 2.0,
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${product.rating}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(Icons.star, size: 16.0, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Text('\$${product.price}', style: const TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}
