// Import the Equatable package for value equality comparison
import 'package:equatable/equatable.dart';

// Define a class representing a GraphicCard entity
class GraphicCardEntity extends Equatable {
  // Attributes of the GraphicCard entity
  final String id; // Example: "HEADPHONE123"
  final String name;          // Name of the graphic card
  final String manufacturer;  // Manufacturer of the graphic card
  final String memoryBandwidth;  // Manufacturer of the graphic card
  final String coreClockSpeed;  // Manufacturer of the graphic card
  final dynamic price;        // Price of the graphic card
  final String imageUrl;      // URL of the graphic card's image
  final String pageUrl;      // URL of the graphic card's image

  // Constructor for creating a GraphicCardEntity instance
  const GraphicCardEntity({
    required this.name,
    required this.id,
    required this.manufacturer,
    required this.price,
    required this.memoryBandwidth,
    required this.coreClockSpeed,
    required this.imageUrl,
    required this.pageUrl,
  });

  // Override the props getter to define the properties for value equality comparison
  @override
  List<Object?> get props => [name, id,manufacturer, price, coreClockSpeed,memoryBandwidth,imageUrl,pageUrl];

  // Factory method to create a GraphicCardEntity instance from a map
  factory GraphicCardEntity.fromMap(Map<String, dynamic> map) {
    return GraphicCardEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      coreClockSpeed: map['coreClockSpeed'] as String?? '',
      memoryBandwidth: map['memoryBandwidth'] as String?? '',
      manufacturer: map['manufacturer'] as String,
      price: map['price'],
      imageUrl: map['imageUrl'] as String,
      pageUrl: map['pageUrl'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'memoryBandwidth': memoryBandwidth,
      'coreClockSpeed': coreClockSpeed,
      'price': price,
      'imageUrl': imageUrl,
      'pageUrl': pageUrl,
    };
  }

}
