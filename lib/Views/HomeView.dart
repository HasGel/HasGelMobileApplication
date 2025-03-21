import 'package:flutter/material.dart';
import 'package:prova/Views/PlaceView.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kadir Has University"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Cart",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
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
                child: Image.asset("lib/assets/robot.png", height: 180),
              ),
              const SizedBox(height: 50),
              const Text(
                "Order Places",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const OrderCard(
                image: "lib/assets/simitci.png",
                name: "Simitçi Dünyası",
                category: "Cafe",
                location: "D Hall",
              ),
              const OrderCard(
                image: "lib/assets/starbucks.png",
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
        child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlaceView()),
          );
        },
        child: ListTile(
          leading: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
          title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("$category\n$location"),
        ),
      ),
    );
  }
}
