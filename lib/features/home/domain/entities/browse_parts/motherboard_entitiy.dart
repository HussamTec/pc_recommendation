import 'package:equatable/equatable.dart';

class MotherboardEntity extends Equatable {
  final String id; // Example: "MB123"
  final String name; // Example: "MSI MPG Z490 Gaming Carbon WiFi"
  final String manufacturer; // Example: "MSI"
  final String socketType; // Example: "LGA1200"
  final String chipset; // Example: "Intel Z490"
  final String pros; // Example: "Intel Z490"
  final String cons; // Example: "Intel Z490"
  final dynamic maxMemory; // Example: 128 (GB)
  final dynamic pcieSlots; // Example: 3
  final String imageUrl; // Example: "https://example.com/motherboard.jpg"
  final String pageUrl; // Example: "https://example.com/motherboard.jpg"
  final dynamic price; // Example: 199.99 (USD)

  const MotherboardEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.socketType,
    required this.chipset,
    required this.maxMemory,
    required this.pcieSlots,
    required this.pros,
    required this.cons,
    required this.imageUrl,
    required this.pageUrl,
    required this.price,
  });

  factory MotherboardEntity.fromMap(Map<String, dynamic> map) {
    return MotherboardEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      manufacturer: map['manufacturer'] ?? '',
      socketType: map['socketType'] ?? '',
      chipset: map['chipset'] ?? '',
      pros: map['pros'] ?? '',
      cons: map['cons'] ?? '',
      maxMemory: (map['maxMemory'] ?? 0) as int,
      pcieSlots: (map['pcieSlots'] ?? 0) as int,
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
      'socketType': socketType,
      'chipset': chipset,
      'maxMemory': maxMemory,
      'pros': pros,
      'cons': cons,
      'pcieSlots': pcieSlots,
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
    socketType,
    chipset,
    maxMemory,
    pros,
    cons,
    pcieSlots,
    imageUrl,
    pageUrl,
    price,
  ];
}
