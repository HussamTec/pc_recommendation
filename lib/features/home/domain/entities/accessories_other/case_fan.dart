import 'package:equatable/equatable.dart';

class CaseFanEntity extends Equatable {
  final String id; // Example: "CASEFAN123"
  final String name; // Example: "Noctua NF-A12x25 PWM 120mm Fan"
  final String manufacturer; // Example: "Noctua"
  final String size; // Example: "120mm"
  final String airflow; // Example: "70.5 CFM"
  final String noiseLevel; // Example: "22.6 dB(A)"
  final String imageUrl; // Example: "https://example.com/case_fan.jpg"
  final dynamic price; // Example: 29.99 (USD)

  const CaseFanEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.size,
    required this.airflow,
    required this.noiseLevel,
    required this.imageUrl,
    required this.price,
  });
  factory CaseFanEntity.fromMap(Map<String, dynamic> map) {
    return CaseFanEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      size: map['size'] as String, // Example: "120mm"
      airflow: map['airflow'] as String, // Example: "70.5 CFM"
      noiseLevel: map['noiseLevel'] as String, // Example: "22.6 dB(A)"
      imageUrl: map['imageUrl'] as String, // Example: "https://example.com/case_fan.jpg"
      price: map['price'], // Example: 29.99 (USD)
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    manufacturer,
    size,
    airflow,
    noiseLevel,
    imageUrl,
    price,
  ];
}
