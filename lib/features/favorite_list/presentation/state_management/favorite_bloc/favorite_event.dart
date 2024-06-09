
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/favorite_entity.dart';

part 'favorite_event.freezed.dart'; // Add this line

@freezed
abstract class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.addFavorite(FavoriteEntity favoriteEntity) = AddFavorite;
  const factory FavoriteEvent.removeFavorite(String itemId) = RemoveFavorite;
}
