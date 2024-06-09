import 'package:equatable/equatable.dart';

class ThermalPasteEntity extends Equatable {
  final String id; // Example: "THERMALPASTE456"
  final String name; // Example: "Arctic MX-4 Thermal Compound"
  final String manufacturer; // Example: "Arctic"
  final String volume; // Example: "4 grams"
  final String imageUrl; // Example: "https://example.com/thermal_paste.jpg"
  final dynamic price; // Example: 9.99 (USD)

  const ThermalPasteEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.volume,
    required this.imageUrl,
    required this.price,
  });
  factory ThermalPasteEntity.fromMap(Map<String, dynamic> map) {
    return ThermalPasteEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      volume: map['volume'] as String, // Example: "4 grams"
      imageUrl: map['imageUrl'] as String, // Example: "https://example.com/thermal_paste.jpg"
      price: map['price'], // Example: 9.99 (USD)
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    manufacturer,
    volume,
    imageUrl,
    price,
  ];
}
