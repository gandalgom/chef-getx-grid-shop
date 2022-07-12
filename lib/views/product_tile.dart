import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.imageLink,
    required this.name,
    this.rating,
    required this.price,
    required this.like,
  }) : super(key: key);

  final String imageLink;
  final String name;
  final dynamic rating;
  final String price;
  final RxBool like;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(imageLink, fit: BoxFit.fill),
                ),
                Obx(
                  () => CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () => like.toggle(),
                      icon: like.value
                          ? const Icon(Icons.favorite_rounded)
                          : const Icon(Icons.favorite_border),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 8.0),
            if (rating != null)
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 2.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$rating',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 4.0),
                      const Icon(Icons.star, size: 16.0, color: Colors.white),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 8.0),
            Text('\$$price', style: const TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}
