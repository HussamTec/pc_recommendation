import 'package:equatable/equatable.dart';

class CaseEntity extends Equatable {
  final String id; // Example: "CASE123"
  final String name; // Example: "NZXT H510 Compact ATX Mid-Tower"
  final String manufacturer; // Example: "NZXT"
  final String type; // Example: "Mid-Tower"
  final String formFactor; // Example: "ATX"
  final String color; // Example: "Black"
  final String imageUrl; // Example: "https://example.com/pc_case.jpg"
  final String pageUrl; // Example: "https://example.com/pc_case.jpg"
  final dynamic price; // Example: 69.99 (USD)

  const CaseEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.type,
    required this.formFactor,
    required this.color,
    required this.imageUrl,
    required this.pageUrl,
    required this.price,
  });

  factory CaseEntity.fromMap(Map<String, dynamic> map) {
    return CaseEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      manufacturer: map['manufacturer'] ?? '',
      type: map['type'] ?? '',
      formFactor: map['formFactor'] ?? '',
      color: map['color'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      pageUrl: map['pageUrl'] ?? '',
      price: (map['price'] ?? 0.0),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'type': type,
      'formFactor': formFactor,
      'color': color,
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
    formFactor,
    color,
    imageUrl,
    pageUrl,
    price,
  ];
}
