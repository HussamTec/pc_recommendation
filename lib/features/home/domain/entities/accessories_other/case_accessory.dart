import 'package:equatable/equatable.dart';

class CaseAccessoryEntity extends Equatable {
  final String id; // Example: "CASEACC789"
  final String name; // Example: "Corsair LL120 RGB LED PWM Fan"
  final String manufacturer; // Example: "Corsair"
  final String type; // Example: "Case Fan"
  final String imageUrl; // Example: "https://example.com/case_accessory.jpg"
  final dynamic price; // Example: 39.99 (USD)

  const CaseAccessoryEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.type,
    required this.imageUrl,
    required this.price,
  });
  factory CaseAccessoryEntity.fromMap(Map<String, dynamic> map) {
    return CaseAccessoryEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      type: map['type'] as String, // Example: "Case Fan"
      imageUrl: map['imageUrl'] as String, // Example: "https://example.com/case_accessory.jpg"
      price: map['price'], // Example: 39.99 (USD)
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    manufacturer,
    type,
    imageUrl,
    price,
  ];
}
