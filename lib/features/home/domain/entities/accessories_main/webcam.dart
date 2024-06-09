import 'package:equatable/equatable.dart';

class WebcamEntity extends Equatable {
  final String id; // Example: "WEBCAM789"
  final String name; // Example: "Logitech C920 HD Pro Webcam"
  final String manufacturer; // Example: "Logitech"
  final String resolution; // Example: "1080p"
  final String interfaceType; // Example: "USB 2.0"
  final String imageUrl; // Example: "https://example.com/webcam.jpg"
  final dynamic price; // Example: 79.99 (USD)

 const WebcamEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.resolution,
    required this.interfaceType,
    required this.imageUrl,
    required this.price,
  });
  factory WebcamEntity.fromMap(Map<String, dynamic> map) {
    return WebcamEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      resolution: map['resolution'] as String, // Example: "1080p"
      interfaceType: map['interfaceType'] as String, // Example: "USB 2.0"
      imageUrl: map['imageUrl'] as String, // Example: "https://example.com/webcam.jpg"
      price: map['price'], // Example: 79.99 (USD)
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    manufacturer,
    resolution,
    interfaceType,
    imageUrl,
    price,
  ];
}
