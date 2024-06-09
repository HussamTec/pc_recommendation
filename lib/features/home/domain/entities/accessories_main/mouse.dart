import 'package:equatable/equatable.dart';

class MouseEntity extends Equatable {
  final String id; // Example: "MOUSE789"
  final String name; // Example: "Logitech G502 Hero Gaming Mouse"
  final String manufacturer; // Example: "Logitech"
  final String type; // Example: "Wired"
  final String sensorType; // Example: "Optical"
  final dynamic dpi; // Example: 16000
  final String imageUrl; // Example: "https://example.com/mouse.jpg"
  final dynamic price; // Example: 79.99 (USD)

 const MouseEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.type,
    required this.sensorType,
    required this.dpi,
    required this.imageUrl,
    required this.price,
  });
  factory MouseEntity.fromMap(Map<String, dynamic> map) {
    return MouseEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      type: map['type'] as String, // Example: "Wired"
      sensorType: map['sensorType'] as String, // Example: "Optical"
      dpi: map['dpi'], // Example: 16000
      imageUrl: map['imageUrl'] as String, // Example: "https://example.com/mouse.jpg"
      price: map['price'], // Example: 79.99 (USD)
    );
  }
  // Function to convert the MouseEntity object to a map representation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'type': type,
      'sensorType': sensorType,
      'dpi': dpi,
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
    sensorType,
    dpi,
    imageUrl,
    price,
  ];
}
