import '../repositories/firebase_data_source_repository.dart';

class FirebaseDataSourceUseCase {
  final FirebaseDataSourceRepository firebaseDataSourceRepository;

  FirebaseDataSourceUseCase({required this.firebaseDataSourceRepository});

  Future<List<dynamic>?> getFirebaseDataCall(dataName,Function(Map<String, dynamic>) fromMap) async {
   return await firebaseDataSourceRepository.getData(dataName,fromMap);
  }
}
