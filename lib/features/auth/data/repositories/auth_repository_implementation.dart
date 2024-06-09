import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements FirebaseAuthDataSource {
  final FirebaseAuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await dataSource.signUpWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async{
    await dataSource.signInWithEmailAndPassword(email, password);

  }

  @override
  Future<void> signOut() async{
    await dataSource.signOut();

  }

  @override
  Future<void> googleAuth() async{
    await dataSource.googleAuth();

  }

  @override
  Future<void> assignUserName(String userName) async{
    await dataSource.assignUserName(userName);
  }
}
