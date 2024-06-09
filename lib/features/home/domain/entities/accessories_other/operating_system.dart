import 'package:equatable/equatable.dart';

class OperatingSystemEntity extends Equatable {
  final String id; // Example: "WINDOWSOS789"
  final String name; // Example: "Windows 10 Home 64-bit"
  final String manufacturer; // Example: "Microsoft"
  final String version; // Example: "Windows 10 Home"
  final String edition; // Example: "Home"
  final String architecture; // Example: "64-bit"
  final String imageUrl; // Example: "https://example.com/windows_os.jpg"
  final dynamic price; // Example: 139.99 (USD)

  const OperatingSystemEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.version,
    required this.edition,
    required this.architecture,
    required this.imageUrl,
    required this.price,
  });
  factory OperatingSystemEntity.fromMap(Map<String, dynamic> map) {
    return OperatingSystemEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      version: map['version'] as String, // Example: "Windows 10 Home"
      edition: map['edition'] as String, // Example: "Home"
      architecture: map['architecture'] as String, // Example: "64-bit"
      imageUrl: map['imageUrl'] as String, // Example: "https://example.com/windows_os.jpg"
      price: map['price'], // Example: 139.99 (USD)
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    manufacturer,
    version,
    edition,
    architecture,
    imageUrl,
    price,
  ];
}
