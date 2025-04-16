import 'package:flutter/material.dart';
import 'package:prova/Utils/colors.dart';
import 'package:prova/Utils/FontConstants.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final List<Map<String, dynamic>> _cartItems = [
    {'name': 'Product Title', 'price': 0.00, 'quantity': 1},
    {'name': 'Product Title', 'price': 0.00, 'quantity': 2},
    {'name': 'Product Title', 'price': 0.00, 'quantity': 1},
    {'name': 'Product Title', 'price': 0.00, 'quantity': 4},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Orders", style: TextStyle(color: black)),
            Text("Place Name", style: TextStyle(fontSize: fontSizeSmall, color: gray600)),
          ],
        ),
        backgroundColor: white,
        elevation: 0,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              height: 1,
              thickness: 1,
              color: gray300,
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(),
              const Text("Products", style: TextStyle(
                fontSize: fontSizeH1,
                fontWeight: fontWeightBold,
              )),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  return _buildProductItem(_cartItems[index]);
                },
              ),
              _buildPaymentSummary(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: black,
            foregroundColor: white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text("Order Now"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildProductItem(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: gray100,
      elevation: 0,
      child: ListTile(
        contentPadding: EdgeInsets.all(20),
        title: Text(
          item['name'],
          style: TextStyle(
            fontSize: fontSizeLarge,
            fontWeight: fontWeightBold
          )
        ),
        leading: Text(
          "${item['quantity']} ",
          style: TextStyle(fontSize: fontSizeH4),
        ),
        subtitle: Text("\$${item['price'].toStringAsFixed(2)}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.delete_outline_rounded, color: errorColor, size: iconSize,),
              onPressed: () {
                setState(() {
                  _cartItems.remove(item);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Card(
      color: white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19.0), // Adjust radius as needed
        side: BorderSide(
          width: 3,
          color: gray300,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSummaryRow("Total Items (3)", "\$48,900"),
            _buildSummaryRow("Delivery Fee", "Free"),
            _buildSummaryRow("Discount", "-\$10,900"),
            Divider(),
            _buildSummaryRow("Total", "\$38,000", isBold: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          )),
          Text(value, style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          )),
        ],
      ),
    );
  }
}