import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prova/Model/Item.dart';

class Place {
  final String id;
  final String name;
  final String location;
  final String logoUrl;
  final String openingTime;
  final String closingTime;
  final bool isOpen;
  final List<Item>? items;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Place({
    required this.id,
    required this.name,
    required this.location,
    required this.logoUrl,
    required this.openingTime,
    required this.closingTime,
    required this.isOpen,
    this.items,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert Place object to Map for Firebase
  Map<String, dynamic> toFirestore() {
    return {
      'id' : id,
      'name': name,
      'location': location,
      'logoUrl' : logoUrl,
      'openingTime': openingTime,
      'closingTime': closingTime,
      'isOpen': isOpen,
      'categories': items,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory Place.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
     return Place(
       id: data?['id'] ?? '',
       name: data?['name'] ?? '',
       location: data?['location'] ?? '',
       logoUrl: data?['logoUrl'] ?? '',
       openingTime: data?['openingTime'] ?? '',
       closingTime: data?['closingTime'] ?? '',
       isOpen: data?['isOpen'] ?? false,
       items: List<Item>.from(data?['items'] ?? []),
       createdAt: (data?['createdAt'] as Timestamp).toDate(),
       updatedAt: (data?['updatedAt'] as Timestamp).toDate(),
     );
  }
}
