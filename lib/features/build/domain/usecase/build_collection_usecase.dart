// lib/domain/usecases/get_collection_data.dart

import '../entities/build_entity.dart';
import '../repositories/build_collection_repository.dart';

class GetCollectionData {
  final CollectionRepository repository;

  GetCollectionData(this.repository);

  Stream<List<BuildEntity>> call(String collectionName) {
    return repository.getCollectionData(collectionName);
  }
}
