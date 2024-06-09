import 'package:equatable/equatable.dart';

class StorageEntity extends Equatable {
  final String id; // Example: "STORAGE789"
  final String name; // Example: "Samsung 970 EVO Plus 1TB NVMe SSD"
  final String manufacturer; // Example: "Samsung"
  final String type; // Example: "NVMe SSD"
  final dynamic capacity; // Example: 1000 (GB)
  final String imageUrl; // Example: "https://example.com/storage.jpg"
  final String pageUrl; // Example: "https://example.com/storage.jpg"
  final dynamic price; // Example: 179.99 (USD)

  const StorageEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.type,
    required this.capacity,
    required this.imageUrl,
    required this.pageUrl,
    required this.price,
  });

  factory StorageEntity.fromMap(Map<String, dynamic> map) {
    return StorageEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      manufacturer: map['manufacturer'] ?? '',
      type: map['type'] ?? '',
      capacity: (map['capacity'] ?? 0),
      imageUrl: map['imageUrl'] ?? '',
      pageUrl: map['pageUrl'] ?? '',
      price: (map['price'] ?? 0.0),
    );
  }
// Function to convert the StorageEntity object to a map representation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'type': type,
      'capacity': capacity,
      'imageUrl': imageUrl,
      'pageUrl': pageUrl,
      'price': price,
    };
  }
  @override
  List<Object?> get props => [
    id,
    name,
    manufacturer,
    type,
    capacity,
    imageUrl,
    pageUrl,
    price,
  ];
}
