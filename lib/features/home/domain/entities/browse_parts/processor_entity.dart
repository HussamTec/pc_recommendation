import 'package:equatable/equatable.dart';

class ProcessorEntity extends Equatable {
  final String name; // Name of the processor (e.g., "Intel Core i7")
  final String id; //Id of the processor (e.g., "123cori7")
  final String manufacturer; // Manufacturer of the processor (e.g., "Intel")
  final dynamic cores; // Number of cores in the processor
  final dynamic baseClockSpeed; // Base clock speed of the processor in GHz
  final dynamic boostClockSpeed; // Boost clock speed of the processor in GHz
  final dynamic threads; // Number of threads in the processor
  final dynamic cacheSize; // Cache size of the processor in MB
  final String imageUrl; //processor image url
  final String pageUrl; //processor image url
  final dynamic price; //processor image url

  const ProcessorEntity({
    required this.name,
    required this.id,
    required this.manufacturer,
    required this.cores,
    required this.baseClockSpeed,
    required this.boostClockSpeed,
    required this.threads,
    required this.cacheSize,
    required this.imageUrl,
    required this.pageUrl,
    required this.price,
  });
  factory ProcessorEntity.fromMap(Map<String, dynamic> map) {
    return ProcessorEntity(
      name: map['name'],
      id: map['id'],
      manufacturer: map['manufacturer'],
      cores: map['cores'],
      baseClockSpeed: map['baseClockSpeed'],
      boostClockSpeed: map['boostClockSpeed'],
      threads: map['threads'],
      cacheSize: map['cacheSize'],
      imageUrl: map['imageUrl'],
      pageUrl: map['pageUrl'],
      price: map['price'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'manufacturer': manufacturer,
      'cores': cores,
      'baseClockSpeed': baseClockSpeed,
      'boostClockSpeed': boostClockSpeed,
      'threads': threads,
      'cacheSize': cacheSize,
      'imageUrl': imageUrl,
      'pageUrl': pageUrl,
      'price': price,
    };
  }
  @override
  List<Object?> get props => [
    name,
    id,
    manufacturer,
    cores,
    baseClockSpeed,
    boostClockSpeed,
    threads,
    cacheSize,
    imageUrl,
    pageUrl,
    price,
  ];

  @override
  bool get stringify => true;
}
