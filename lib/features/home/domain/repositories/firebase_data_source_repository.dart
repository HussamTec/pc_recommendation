abstract class FirebaseDataSourceRepository{
  Future<List<dynamic>?> getData(dataName, Function(Map<String, dynamic>) fromMap);

}