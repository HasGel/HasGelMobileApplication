class Place {
  final String id;
  final String name;
  final String location;
  final String? logoUrl;
  final String openingTime;
  final String closingTime;
  final bool isOpen;
  final List<String> categories;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Place({
    required this.id,
    required this.name,
    required this.location,
    this.logoUrl,
    required this.openingTime,
    required this.closingTime,
    required this.isOpen,
    required this.categories,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert Place object to Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'logoUrl': logoUrl,
      'openingTime': openingTime,
      'closingTime': closingTime,
      'isOpen': isOpen,
      'categories': categories,
      // 'createdAt': Timestamp.fromDate(createdAt),
      // 'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  // Create Place object from Firebase document
  // factory Place.fromFirestore(DocumentSnapshot doc) {
  //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //   return Place(
  //     id: doc.id,
  //     name: data['name'] ?? '',
  //     location: data['location'] ?? '',
  //     logoUrl: data['logoUrl'],
  //     openingTime: data['openingTime'] ?? '',
  //     closingTime: data['closingTime'] ?? '',
  //     isOpen: data['isOpen'] ?? false,
  //     categories: List<String>.from(data['categories'] ?? []),
  //     createdAt: (data['createdAt'] as Timestamp).toDate(),
  //     updatedAt: (data['updatedAt'] as Timestamp).toDate(),
  //   );
  // }

  // Create a copy of Place with some fields updated
  Place copyWith({
    String? id,
    String? name,
    String? location,
    String? logoUrl,
    String? openingTime,
    String? closingTime,
    bool? isOpen,
    List<String>? categories,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Place(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      logoUrl: logoUrl ?? this.logoUrl,
      openingTime: openingTime ?? this.openingTime,
      closingTime: closingTime ?? this.closingTime,
      isOpen: isOpen ?? this.isOpen,
      categories: categories ?? this.categories,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
