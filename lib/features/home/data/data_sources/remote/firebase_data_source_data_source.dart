import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/repositories/firebase_data_source_repository.dart';


class FirebaseDataSource implements FirebaseDataSourceRepository {


  @override
  Future<List<dynamic>?> getData(dataName,Function(Map<String, dynamic>) fromMap) async{
    final QuerySnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFirestore.instance.collection(dataName).get();
    return snapshot.docs.map((doc) => fromMap(doc.data())).toList();
  }
}
