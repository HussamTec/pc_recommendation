// lib/data/repositories/collection_repository_impl.dart

import 'package:pc_recommendation/features/build/domain/entities/build_entity.dart';

import '../../domain/repositories/build_collection_repository.dart';
import '../data_source/build_data_source.dart';

class CollectionRepositoryImpl implements CollectionRepository {
  final CollectionRemoteDataSource remoteDataSource;

  CollectionRepositoryImpl(this.remoteDataSource);

  @override
  Stream<List<BuildEntity>> getCollectionData(String collectionName) {
    return remoteDataSource.getCollectionData(collectionName);
  }
}
