import 'package:equatable/equatable.dart';

class RamEntity extends Equatable {
  final String id; // Example: "RAM456"
  final String name; // Example: "Corsair Vengeance RGB Pro 16GB"
  final String manufacturer; // Example: "Corsair"
  final String speed; // Example: "DDR4-3200"
  final dynamic capacity; // Example: 16 (GB)
  final String imageUrl; // Example: "https://example.com/ram.jpg"
  final String pageUrl; // Example: "https://example.com/ram.jpg"
  final dynamic price; // Example: 89.99 (USD)

  const RamEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.speed,
    required this.capacity,
    required this.imageUrl,
    required this.pageUrl,
    required this.price,
  });

  factory RamEntity.fromMap(Map<String, dynamic> map) {
    return RamEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      manufacturer: map['manufacturer'] ?? '',
      speed: map['speed'] ?? '',
      capacity: (map['capacity'] ?? 0),
      imageUrl: map['imageUrl'] ?? '',
      pageUrl: map['pageUrl'] ?? '',
      price: (map['price'] ?? 0.0),
    );
  }
// Function to convert the RamEntity object to a map representation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'speed': speed,
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
    speed,
    capacity,
    imageUrl,
    pageUrl,
    price,
  ];
}
