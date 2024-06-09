import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/usecases/favorites_usecase.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';


class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteDataSourceUseCase favoriteDataSourceUseCase;
  FavoriteBloc({required this.favoriteDataSourceUseCase}) : super(const FavoriteState.initial()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is AddFavorite) {
        emit(const FavoriteState.loading());
        try {
          await favoriteDataSourceUseCase.addFavoriteDataCall(event.favoriteEntity);
          emit(const FavoriteState.success());
        } on FirebaseException catch (error) {
          emit(FavoriteState.failure(error));
        }
      }
      if (event is RemoveFavorite) {
        emit(const FavoriteState.loading());
        try {
          await favoriteDataSourceUseCase.removeDocumentFromFavoritesCall(event.itemId);
          emit(const FavoriteState.success());
        } on FirebaseException catch (error) {
          emit(FavoriteState.failure(error));
        }
      }
    });

  }
}
