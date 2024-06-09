import 'package:equatable/equatable.dart';

class FanControllerEntity extends Equatable {
  final String id; // Example: "FANCTRL456"
  final String name; // Example: "NZXT GRID+ V3 Fan Controller"
  final String manufacturer; // Example: "NZXT"
  final dynamic fanPorts; // Example: 6
  final String controlMethod; // Example: "PWM"
  final String imageUrl; // Example: "https://example.com/fan_controller.jpg"
  final dynamic price; // Example: 49.99 (USD)

  const FanControllerEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.fanPorts,
    required this.controlMethod,
    required this.imageUrl,
    required this.price,
  });
  factory FanControllerEntity.fromMap(Map<String, dynamic> map) {
    return FanControllerEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      fanPorts: map['fanPorts'] as int, // Example: 6
      controlMethod: map['controlMethod'] as String, // Example: "PWM"
      imageUrl: map['imageUrl'] as String, // Example: "https://example.com/fan_controller.jpg"
      price: map['price'], // Example: 49.99 (USD)
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    manufacturer,
    fanPorts,
    controlMethod,
    imageUrl,
    price,
  ];
}
