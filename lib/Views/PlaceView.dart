import 'package:flutter/material.dart';
import 'package:prova/Utils/FontConstants.dart';
import 'package:prova/Utils/colors.dart';
import 'widgets/productItem.dart';
import 'ItemView.dart';
import 'package:prova/Utils/Assets.dart';
import 'package:prova/Views/CartView.dart';

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
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartView()),
              );
            },
            child: const Text("Cart", style: TextStyle(color: black)),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              height: 1,
              thickness: 1,
              color: gray300,
            )
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Place Logo
            Center(
              child: Image.asset(
                Assets.starbucks,
                height: 120,
              ),
            ),
            SizedBox(height: 10),
            // Place Name
            Center(
              child: Text(
                "Starbucks",
                style: TextStyle(fontSize: 24, fontWeight: fontWeightBold),
              ),
            ),
            SizedBox(height: 8),
            // Place Info
            Center(
              child: Text(
                "Opens Until: 6.00 pm  ·  Block D",
                style: const TextStyle(fontSize: 14, color: gray700),
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
            Divider(),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(10),
                itemCount: 10,// will change based on items in database
                itemBuilder: (BuildContext context, index) {
                  return productItemWidget(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productItemWidget(context, int index){
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap:() {
        Navigator.of(
          context,
          rootNavigator: true,
        ).push(
          MaterialPageRoute(
            builder: (context) => ItemView(index: index),
          ),
        );
        print(index);
      },
      child: Container(
        child: ProductItem(title: "title", price: "price", image: "image", description: "description"),
      )
    );
  }
  // Section Title Widget
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
    );
  }
}
