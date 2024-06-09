import 'package:equatable/equatable.dart';

class MousePadEntity extends Equatable {
  final String id; // Example: "MOUSEPAD456"
  final String name; // Example: "SteelSeries QcK Gaming Mouse Pad"
  final String manufacturer; // Example: "SteelSeries"
  final String size; // Example: "Large"
  final String surfaceType; // Example: "Cloth"
  final String imageUrl; // Example: "https://example.com/mousepad.jpg"
  final dynamic price; // Example: 19.99 (USD)

 const MousePadEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.size,
    required this.surfaceType,
    required this.imageUrl,
    required this.price,
  });
  factory MousePadEntity.fromMap(Map<String, dynamic> map) {
    return MousePadEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      size: map['size'] as String, // Example: "Large"
      surfaceType: map['surfaceType'] as String, // Example: "Cloth"
      imageUrl: map['imageUrl'] as String, // Example: "https://example.com/mousepad.jpg"
      price: map['price'], // Example: 19.99 (USD)
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    manufacturer,
    size,
    surfaceType,
    imageUrl,
    price,
  ];
}
