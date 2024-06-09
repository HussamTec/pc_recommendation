import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pc_recommendation/features/favorite_list/domain/repositories/firebase_favorite_data_source_repository.dart';
import '../../../domain/entities/favorite_entity.dart';


class FavoriteDataSource implements FavoriteDataSourceRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> addFavoriteData(FavoriteEntity favoriteEntity) async{
    var userId=_auth.currentUser!.uid;

    final collectionReference = FirebaseFirestore.instance.collection('user_favorites$userId');

    // Add a single document with the provided favorite entity
    await collectionReference.add(favoriteEntity.toMap());
    print('added successfully');
  }

  @override
  Future<void> removeDocumentFromFavorites(String itemId) async {
    var userId=_auth.currentUser!.uid;

    try {
      // Reference to the Firestore collection
      CollectionReference favoritesCollection = FirebaseFirestore.instance.collection('user_favorites$userId');

      // Query for the document with the specified id
      QuerySnapshot snapshot = await favoritesCollection.where('id', isEqualTo: itemId).get();

      // Check if the document exists
      if (snapshot.docs.isNotEmpty) {
        // Document exists, delete it
        await snapshot.docs.first.reference.delete();
        print('Document with id $itemId removed from favorites.');
      } else {
        print('Document with id $itemId not found in favorites.');
      }
    } catch (error) {
      print('Error removing document from favorites: $error');
    }
  }



}

