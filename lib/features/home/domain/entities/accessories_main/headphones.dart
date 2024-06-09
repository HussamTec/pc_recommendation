import 'package:equatable/equatable.dart';

class HeadphoneEntity extends Equatable {
  final String id; // Example: "HEADPHONE123"
  final String name; // Example: "Sony WH-1000XM4 Wireless Noise-Canceling Headphones"
  final String manufacturer; // Example: "Sony"
  final String type; // Example: "Over-ear"
  final String wireless; // Example: true
  final String noiseCanceling; // Example: true
  final String connectivity; // Example: "Bluetooth"
  final String imageUrl; // Example: "https://example.com/headphone.jpg"
  final dynamic price; // Example: 349.99 (USD)

  const HeadphoneEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.type,
    required this.wireless,
    required this.noiseCanceling,
    required this.connectivity,
    required this.imageUrl,
    required this.price,
  });
  factory HeadphoneEntity.fromMap(Map<String, dynamic> map) {
    return HeadphoneEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      type: map['type'] as String, // Example: "Over-ear"
      wireless: map['wireless'] as String, // Example: true
      noiseCanceling: map['noiseCanceling'] as String, // Example: true
      connectivity: map['connectivity'] as String, // Example: "Bluetooth"
      imageUrl: map['imageUrl'] as String, // Example: "https://example.com/headphone.jpg"
      price: map['price'], // Example: 349.99 (USD)
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    manufacturer,
    type,
    wireless,
    noiseCanceling,
    connectivity,
    imageUrl,
    price,
  ];
}
