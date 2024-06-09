import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable {
  final String name;
  final String id;
  final String manufacturer;
  final dynamic price;
  final String imageUrl;

   const FavoriteEntity({
    required this.name,
    required this.id,
    required this.manufacturer,
    required this.price,
    required this.imageUrl,
  });

  factory FavoriteEntity.fromMap(Map<String, dynamic> data) {
    return FavoriteEntity(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      manufacturer: data['manufacturer'] ?? '',
      price: data['price'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name': name,
      'manufacturer': manufacturer,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  @override
  List<Object?> get props =>
      [
        id,
        name,
        manufacturer,
        price,
        imageUrl,
      ];
}
