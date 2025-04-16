import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthUser {
  final String id;
  final String email;
  final String name;
  final bool isAdmin;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AuthUser({
    required this.id,
    required this.email,
    required this.name,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AuthUser.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return AuthUser(
      id: data?['id'] ?? '',
      email: data?['email'],
      name: data?['name'],
      isAdmin: data?['isAdmin'] ?? false,
      createdAt: (data?['createdAt'] as Timestamp).toDate(),
      updatedAt: (data?['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'name': name,
      'isAdmin': isAdmin,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

}
