import 'package:equatable/equatable.dart';

class PowerSupplyEntity extends Equatable {
  final String id; // Example: "PSU789"
  final String name; // Example: "Corsair RM750x 750 Watt 80+ Gold Certified Fully Modular PSU"
  final String manufacturer; // Example: "Corsair"
  final dynamic wattage; // Example: 750 (Watts)
  final String efficiencyRating; // Example: "80+ Gold"
  final String isModular; // Example: true
  final String pros;
  final String cons;
  final String imageUrl; // Example: "https://example.com/power_supply.jpg"
  final String pageUrl; // Example: "https://example.com/power_supply.jpg"
  final dynamic price; // Example: 119.99 (USD)

  const PowerSupplyEntity({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.wattage,
    required this.efficiencyRating,
    required this.isModular,
    required this.pros,
    required this.cons,
    required this.imageUrl,
    required this.pageUrl,
    required this.price,
  });

  factory PowerSupplyEntity.fromMap(Map<String, dynamic> map) {
    return PowerSupplyEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      manufacturer: map['manufacturer'] ?? '',
      pros: map['pros'] ?? '',
      cons: map['cons'] ?? '',
      wattage: (map['wattage'] ?? 0),
      efficiencyRating: map['efficiencyRating'] ?? '',
      isModular: map['isModular'] ?? 'false',
      imageUrl: map['imageUrl'] ?? '',
      pageUrl: map['pageUrl'] ?? '',
      price: (map['price'] ?? 0.0),
    );
  }
// Function to convert the PowerSupplyEntity object to a map representation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'manufacturer': manufacturer,
      'wattage': wattage,
      'efficiencyRating': efficiencyRating,
      'isModular': isModular,
      'pros': pros,
      'cons': cons,
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
    wattage,
    efficiencyRating,
    isModular,
    pros,
    cons,
    imageUrl,
    pageUrl,
    price,
  ];
}
