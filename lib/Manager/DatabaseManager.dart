import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prova/Model/AuthUser.dart';
import 'package:prova/Model/Item.dart';
import 'package:prova/Model/Place.dart';

class DataBaseManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(AuthUser user) async {
    try {
      await _firestore
          .collection('users')
          .add({
            'id': user.id,
            'name': user.name,
            'email' : user.email,
            'isAdmin' : user.isAdmin,
            'createdAt' : user.createdAt,
            'updatedAt' : user.updatedAt,
          });
    } catch (e) {
      print("Error creating user: $e");
      rethrow;
    }
  }

  Future<void> deleteUser({required String userID}) async {
    try {
      await _firestore.collection('users').doc(userID).delete();
    } catch (e) {
      print("Error deleting user $e");
      rethrow;
    }
  }

  Future<void> createPlace(Place place) async {
    try{
      await _firestore.collection('place').add({
        'id' : place.id,
        'name' : place.name,
        'location' : place.location,
        'openingTime' : place.openingTime,
        'closingTime' : place.closingTime,
        'isOpen' : place.isOpen,
        'items' : place.items,
        'createdAt' : place.createdAt,
        'updatedAt' : place.updatedAt,
      });
    } catch (e) {
      print("Error creating place $e");
      rethrow;
    }
  }

  Future<void> deletePlace({required String placeID}) async {
    try {
      await _firestore.collection('place').doc(placeID).delete();
    } catch (e) {
      print("Error deleting place $e");
      rethrow;
    }
  }

  Future<void> createItem(Item item) async {
    try{
      await _firestore.collection('place').add({
        'id' : item.id,
        'name' : item.productName,
        'description' : item.description,
        'price' : item.price,
        'isAvailable' : item.isAvailable,
        'imageUrls' : item.imageUrls,
        'category' : item.category,
        'stockQuantity' : item.stockQuantity,
        'averageRating': item.averageRating,
        'createdAt': item.createdAt,
        'updatedAt': item.updatedAt,
        'sellerId': item.sellerId,
      });
    } catch (e) {
      print("Error creating item $e");
      rethrow;
    }
  }

  Future<void> deleteItem({required String itemID}) async {
    try {
      await _firestore.collection('Item').doc(itemID).delete();
    } catch (e) {
      print("Error deleting item $e");
      rethrow;
    }
  }

}