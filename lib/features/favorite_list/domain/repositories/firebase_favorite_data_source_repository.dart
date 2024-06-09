import 'package:pc_recommendation/features/favorite_list/domain/entities/favorite_entity.dart';

abstract class FavoriteDataSourceRepository{
  Future<void> addFavoriteData(FavoriteEntity favEntity);
  Future<void> removeDocumentFromFavorites(String itemId);

}