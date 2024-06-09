// lib/domain/repositories/collection_repository.dart
import '../entities/build_entity.dart';

abstract class CollectionRepository {
  Stream<List<BuildEntity>> getCollectionData(String collectionName);
}
