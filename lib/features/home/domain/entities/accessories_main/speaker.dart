import 'package:equatable/equatable.dart';

class SpeakerEntity extends Equatable {
  final String id; // Example: "SPEAKER123"
  final String name; // Example: "Bose SoundLink Revolve+ Bluetooth Speaker"
  final String manufacturer; // Example: "Bose"
  final String type; // Example: "Bluetooth Speaker"
  final String connectivity; // Example: "Bluetooth"
  final String imageUrl; // Example: "https://example.com/speaker.jpg"
  final dynamic price; // Example: 299.99 (USD)

 const SpeakerEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.type,
    required this.connectivity,
    required this.imageUrl,
    required this.price,
  });
  factory SpeakerEntity.fromMap(Map<String, dynamic> map) {
    return SpeakerEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      type: map['type'] as String, // Example: "Bluetooth Speaker"
      connectivity: map['connectivity'] as String, // Example: "Bluetooth"
      imageUrl: map['imageUrl'] as String, // Example: "https://example.com/speaker.jpg"
      price: map['price'], // Example: 299.99 (USD)
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    manufacturer,
    type,
    connectivity,
    imageUrl,
    price,
  ];
}
