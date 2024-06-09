import 'package:equatable/equatable.dart';

class KeyboardEntity extends Equatable {
  final String id; // Example: "KEYBOARD123"
  final String name; // Example: "Logitech G Pro X Mechanical Gaming Keyboard"
  final String manufacturer; // Example: "Logitech"
  final String type; // Example: "Mechanical"
  final String switchType; // Example: "GX Blue"
  final String layout; // Example: "US Layout"
  final String connectivity; // Example: "Wired"
  final String imageUrl; // Example: "https://example.com/keyboard.jpg"
  final dynamic price; // Example: 129.99 (USD)

  const KeyboardEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.type,
    required this.switchType,
    required this.layout,
    required this.connectivity,
    required this.imageUrl,
    required this.price,
  });
  factory KeyboardEntity.fromMap(Map<String, dynamic> map) {
    return KeyboardEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      type: map['type'] as String, // Example: "Mechanical"
      switchType: map['switchType'] as String, // Example: "GX Blue"
      layout: map['layout'] as String, // Example: "US Layout"
      connectivity: map['connectivity'] as String, // Example: "Wired"
      imageUrl: map['imageUrl'] as String, // Example: "https://example.com/keyboard.jpg"
      price: map['price'], // Example: 129.99 (USD)
    );
  }
// Function to convert the KeyboardEntity object to a map representation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'type': type,
      'switchType': switchType,
      'layout': layout,
      'connectivity': connectivity,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
  @override
  List<Object?> get props => [
    id,
    name,
    manufacturer,
    type,
    switchType,
    layout,
    connectivity,
    imageUrl,
    price,
  ];
}
