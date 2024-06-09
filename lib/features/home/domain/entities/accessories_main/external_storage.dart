import 'package:equatable/equatable.dart';

class ExternalStorageEntity extends Equatable {
  final String id; // Example: "EXTERNAL123"
  final String name; // Example: "Seagate Backup Plus Portable External Hard Drive"
  final String manufacturer; // Example: "Seagate"
  final dynamic capacity; // Example: 2000 (GB)
  final String interfaceType; // Example: "USB 3.0"
  final String imageUrl; // Example: "https://example.com/external_storage.jpg"
  final dynamic price; // Example: 79.99 (USD)

  const ExternalStorageEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.capacity,
    required this.interfaceType,
    required this.imageUrl,
    required this.price,
  });
  factory ExternalStorageEntity.fromMap(Map<String, dynamic> map) {
    return ExternalStorageEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      capacity: map['capacity'], // Example: 2000 (GB)
      interfaceType: map['interfaceType'] as String, // Example: "USB 3.0"
      imageUrl: map['imageUrl'] as String, // Example: "https://example.com/external_storage.jpg"
      price: map['price'], // Example: 79.99 (USD)
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    manufacturer,
    capacity,
    interfaceType,
    imageUrl,
    price,
  ];
}
