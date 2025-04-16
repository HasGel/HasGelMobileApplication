import 'package:flutter/material.dart';
import 'package:prova/Utils/colors.dart';
import 'package:prova/Views/PlaceView.dart';
import 'package:prova/Views/CartView.dart';
import 'package:prova/Utils/Assets.dart';
import 'package:prova/Utils/FontConstants.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text("Kadir Has University"),
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
        backgroundColor: white,
        elevation:0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to Feature\nof Delivery",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset(Assets.robot, height: 180),
              ),
              const SizedBox(height: 50),
              const Text(
                "Order Places",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const OrderCard(
                image: Assets.simitci,
                name: "Simitçi Dünyası",
                category: "Cafe",
                location: "D Hall",
              ),
              const OrderCard(
                image: Assets.starbucks,
                name: "Starbucks",
                category: "Coffee Shop",
                location: "D Hall",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "Order Location"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String image;
  final String name;
  final String category;
  final String location;

  const OrderCard({
    required this.image,
    required this.name,
    required this.category,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      clipBehavior: Clip.hardEdge,
        color: gray200,
        elevation: 0,
        child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlaceView()),
          );
        },
          child: Container(
            height: 120, // Fixed height
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                // Image
                Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
                SizedBox(width: 12),
                // Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 8),
                      Text(category, style: TextStyle(color: gray600)),
                      SizedBox(height: 4),
                      Text(location, style: TextStyle(color: gray600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
