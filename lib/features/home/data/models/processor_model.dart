import 'package:equatable/equatable.dart';

class ProcessorModel extends Equatable {
  // Properties to represent the attributes of a processor
  final String name; // Name of the processor (e.g., "Intel Core i7")
  final String manufacturer; // Manufacturer of the processor (e.g., "Intel")
  final int cores; // Number of cores in the processor
  final double baseClockSpeed; // Base clock speed of the processor in GHz
  final double boostClockSpeed; // Boost clock speed of the processor in GHz
  final int threads; // Number of threads in the processor
  final int cacheSize; // Cache size of the processor in MB
  final String imageUrl; // URL of the processor image
  final double price;  // The processor price

  // Constructor to initialize a ProcessorModel object
  const ProcessorModel({
    required this.name,
    required this.manufacturer,
    required this.cores,
    required this.baseClockSpeed,
    required this.boostClockSpeed,
    required this.threads,
    required this.cacheSize,
    required this.imageUrl,
    required this.price,
  });

  // Override the props getter method to define the attributes used for comparison and equality testing
  @override
  List<Object?> get props => [
    name,
    manufacturer,
    cores,
    baseClockSpeed,
    boostClockSpeed,
    threads,
    cacheSize,
    imageUrl,
    price,
  ];
}
