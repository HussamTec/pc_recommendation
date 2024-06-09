// lib/data/sources/remote/collection_remote_data_source.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pc_recommendation/features/build/domain/entities/build_entity.dart';

abstract class CollectionRemoteDataSource {
  Stream<List<BuildEntity>> getCollectionData(String collectionName);
}

class CollectionRemoteDataSourceImpl implements CollectionRemoteDataSource {
  final FirebaseFirestore firestore;

  CollectionRemoteDataSourceImpl(this.firestore);

  @override
  Stream<List<BuildEntity>> getCollectionData(String collectionName) {
    return firestore.collection(collectionName).snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => BuildEntity.fromMap(doc.data()))
              .toList(),
    );
  }
}
