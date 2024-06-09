import 'package:pc_recommendation/features/favorite_list/domain/entities/favorite_entity.dart';
import 'package:pc_recommendation/features/favorite_list/domain/repositories/firebase_favorite_data_source_repository.dart';

class FavoriteDataSourceRepositoryImpl extends FavoriteDataSourceRepository {
  FavoriteDataSourceRepository favoriteDataSourceRepository;

  FavoriteDataSourceRepositoryImpl(
      {required this.favoriteDataSourceRepository});

  @override
  Future<void> addFavoriteData(FavoriteEntity favEntity) async{
    await favoriteDataSourceRepository.addFavoriteData(favEntity);
  }

  @override
  Future<void> removeDocumentFromFavorites(String itemId) async{
    await favoriteDataSourceRepository.removeDocumentFromFavorites(itemId);

  }
}
