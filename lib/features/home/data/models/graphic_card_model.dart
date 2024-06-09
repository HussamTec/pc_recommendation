import 'package:equatable/equatable.dart';

class GraphicCardModel extends Equatable {
  final String name;
  final String manufacturer;
  final dynamic price;
  final String imageUrl;

  const GraphicCardModel({
    required this.name,
    required this.manufacturer,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, manufacturer, price, imageUrl];

  factory GraphicCardModel.fromMap(Map<String, dynamic> map) {
    return GraphicCardModel(
      name: map['name'] as String,
      manufacturer: map['manufacturer'] as String,
      price: map['price'] as double,
      imageUrl: map['imageUrl'] as String,
    );
  }

}
