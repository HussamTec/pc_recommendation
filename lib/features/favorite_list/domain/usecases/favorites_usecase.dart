import '../entities/favorite_entity.dart';
import '../repositories/firebase_favorite_data_source_repository.dart';

class FavoriteDataSourceUseCase{
  final FavoriteDataSourceRepository favoriteDataSourceRepository;
  FavoriteDataSourceUseCase({required this.favoriteDataSourceRepository});
  Future<void> addFavoriteDataCall(FavoriteEntity favEntity) async {
   await  favoriteDataSourceRepository.addFavoriteData(favEntity);
  }
  Future<void> removeDocumentFromFavoritesCall(String itemId) async {
   await  favoriteDataSourceRepository.removeDocumentFromFavorites(itemId);
  }
}

//userId_favorites