import 'package:equatable/equatable.dart';

class OpticalDriveEntity extends Equatable {
  final String id; // Example: "OPTICALDRIVE123"
  final String name; // Example: "ASUS DRW-24B1ST DVD/CD Writer"
  final String manufacturer; // Example: "ASUS"
  final String interfaceType; // Example: "SATA"
  final String readSpeed; // Example: "24x DVD, 48x CD"
  final String writeSpeed; // Example: "24x DVD, 48x CD"
  final String imageUrl; // Example: "https://example.com/optical_drive.jpg"
  final dynamic price; // Example: 19.99 (USD)

  const OpticalDriveEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.interfaceType,
    required this.readSpeed,
    required this.writeSpeed,
    required this.imageUrl,
    required this.price,
  });
  factory OpticalDriveEntity.fromMap(Map<String, dynamic> map) {
    return OpticalDriveEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      interfaceType: map['interfaceType'] as String, // Example: "SATA"
      readSpeed: map['readSpeed'] as String, // Example: "24x DVD, 48x CD"
      writeSpeed: map['writeSpeed'] as String, // Example: "24x DVD, 48x CD"
      imageUrl: map['imageUrl'] as String, // Example: "https://example.com/optical_drive.jpg"
      price: map['price'], // Example: 19.99 (USD)
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    manufacturer,
    interfaceType,
    readSpeed,
    writeSpeed,
    imageUrl,
    price,
  ];
}
