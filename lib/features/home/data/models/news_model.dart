import 'package:equatable/equatable.dart';

// Define a class representing a News entity
class NewsModel extends Equatable {
  // Attributes of the News entity
  final String imageUrl;   // URL of the news image
  final String title;      // Title of the news
  final String bodyText;   // Body text of the news

  // Constructor for creating a NewsEntity instance
  const NewsModel({
    required this.imageUrl,
    required this.title,
    required this.bodyText,
  });

  // Override the props getter to define the properties for value equality comparison
  @override
  List<Object?> get props => [imageUrl, title, bodyText];

  // Factory method to create a NewsEntity instance from a map
  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
      bodyText: map['bodyText'] as String,
    );
  }
}
