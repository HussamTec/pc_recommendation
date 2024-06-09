import 'package:equatable/equatable.dart';

class MonitorEntity extends Equatable {
  final String id; // Example: "MONITOR456"
  final String name; // Example: "Dell S2721QS 27-Inch 4K UHD IPS Monitor"
  final String manufacturer; // Example: "Dell"
  final dynamic screenSize; // Example: 27.0 (inches)
  final String resolution; // Example: "3840x2160 (4K UHD)"
  final String panelType; // Example: "IPS"
  final String imageUrl; // Example: "https://example.com/monitor.jpg"
  final String pageUrl; // Example: "https://example.com/monitor.jpg"
  final dynamic price; // Example: 349.99 (USD)

  const MonitorEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.screenSize,
    required this.resolution,
    required this.panelType,
    required this.imageUrl,
    required this.pageUrl,
    required this.price,
  });

  factory MonitorEntity.fromMap(Map<String, dynamic> map) {
    return MonitorEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      manufacturer: map['manufacturer'] ?? '',
      screenSize: (map['screenSize'] ?? 0.0).toDouble(),
      resolution: map['resolution'] ?? '',
      panelType: map['panelType'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      pageUrl: map['pageUrl'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
    );
  }

  // Function to convert the MonitorEntity object to a map representation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'screenSize': screenSize,
      'resolution': resolution,
      'panelType': panelType,
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
    screenSize,
    resolution,
    panelType,
    imageUrl,
    pageUrl,
    price,
  ];
}
