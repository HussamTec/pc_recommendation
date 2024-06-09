import 'package:pc_recommendation/features/home/domain/repositories/firebase_data_source_repository.dart';

class FirebaseDataSourceRepositoryImpl implements FirebaseDataSourceRepository {
  final FirebaseDataSourceRepository dataSource;

  FirebaseDataSourceRepositoryImpl({required this.dataSource});

  @override
  Future<List<dynamic>?> getData(dataName,Function(Map<String, dynamic>) fromMap) async {
    return await dataSource.getData(dataName,fromMap);
  }
}
