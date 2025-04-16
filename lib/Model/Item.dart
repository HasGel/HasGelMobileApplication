import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String? id;
  final String productName;
  final String description;
  final double price;
  final bool isAvailable;
  final List<String> imageUrls;
  final String category;
  final int stockQuantity;
  final double averageRating;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? sellerId;

  Item({
    this.id,
    required this.productName,
    required this.description,
    required this.price,
    this.isAvailable = true,
    this.imageUrls = const [],
    required this.category,
    this.stockQuantity = 0,
    this.averageRating = 0.0,
    this.createdAt,
    this.updatedAt,
    this.sellerId,
  });

  factory Item.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Item(
      id: snapshot.id,
      productName: data?['productName'] ?? '',
      description: data?['description'] ?? '',
      price: (data?['price'] as num?)?.toDouble() ?? 0.0,
      isAvailable: data?['isAvailable'] ?? false,
      imageUrls: List<String>.from(data?['imageUrls'] ?? []),
      category: data?['category'] ?? 'Uncategorized',
      stockQuantity: data?['stockQuantity'] ?? 0,
      averageRating: (data?['averageRating'] as num?)?.toDouble() ?? 0.0,
      createdAt: (data?['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (data?['updatedAt'] as Timestamp?)?.toDate(),
      sellerId: data?['sellerId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'productName': productName,
      'description': description,
      'price': price,
      'isAvailable': isAvailable,
      'imageUrls': imageUrls,
      'category': category,
      'stockQuantity': stockQuantity,
      'averageRating': averageRating,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      if (sellerId != null) 'sellerId': sellerId,
    };
  }
}