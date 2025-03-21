import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String title;
  final String price;
  final String image;
  final String description;

  const ProductItem(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.description});
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Product Title",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "0.00 ₺",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.green.shade900,
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "lib/assets/starbucks.png",
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
