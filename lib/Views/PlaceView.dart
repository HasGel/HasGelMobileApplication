import 'package:flutter/material.dart';
import 'widgets/productItem.dart';

class PlaceView extends StatefulWidget {
  const PlaceView({super.key});
  @override
  _PlaceViewState createState() => _PlaceViewState();
}

class _PlaceViewState extends State<PlaceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Place Logo
            Center(
              child: Image.asset(
                "lib/assets/starbucks.png",
                height: 120,
              ),
            ),
            SizedBox(height: 10),
            // Place Name
            Center(
              child: Text(
                "Starbucks",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            // Place Info
            Center(
              child: Text(
                "Opens Until: 6.00 pm  ·  Block D  ·  ",
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Center(
              child: Text(
                "Available for order",
                style: TextStyle(fontSize: 14, color: Colors.green),
              ),
            ),
            SizedBox(height: 20),
            // Featured Products
            sectionTitle("Featured Products"),
            ProductItem(
              title: "Product Title",
              price: "0.00 ₺",
              image: "lib/assets/starbucks.png",
              description: "Product Description",
            ),
            ProductItem(
              title: "Product Title",
              price: "0.00 ₺",
              image: "lib/assets/starbucks.png",
              description: "Product Description",
            ),
            ProductItem(
              title: "Product Title",
              price: "0.00 ₺",
              image: "lib/assets/starbucks.png",
              description: "Product Description",
            ),
            ProductItem(
              title: "Product Title",
              price: "0.00 ₺",
              image: "lib/assets/starbucks.png",
              description: "Product Description",
            ),
            ProductItem(
              title: "Product Title",
              price: "0.00 ₺",
              image: "lib/assets/starbucks.png",
              description: "Product Description",
            ),
          ],
        ),
      ),
    );
  }

  // Section Title Widget
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
