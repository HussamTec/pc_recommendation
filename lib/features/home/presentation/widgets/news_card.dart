import 'package:flutter/material.dart';

import '../../domain/entities/news_entity.dart';
import 'black_gradient_line.dart';

class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String bodyText;
  const NewsCard({
    required this.imageUrl,
    required this.title,
    required this.bodyText,

    super.key,
    required this.newsEntity,
  });

  final NewsEntity? newsEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Column(
          children: [
            const BlackGradientLine(),
            const SizedBox(height: 10,),
            Image.network(imageUrl),
            ListTile(
              title: Text(title,style: const TextStyle(color: Colors.white,fontSize: 26),),
              subtitle: Text(bodyText,style: const TextStyle(color: Colors.white),),
              // Add more information as needed
            ),
          ],
        ),
      ),
    );
  }
}
