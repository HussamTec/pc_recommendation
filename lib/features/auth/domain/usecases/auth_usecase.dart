import '../repositories/auth_repository.dart';

class AuthUseCase {
  final FirebaseAuthDataSource firebaseAuthDataSourceRepository;

  AuthUseCase({required this.firebaseAuthDataSourceRepository});

  Future<void> signUpCall(String email, String password) async {
    await firebaseAuthDataSourceRepository.signUpWithEmailAndPassword(email, password);
  }

  Future<void> signInCall(String email, String password) async {
    await firebaseAuthDataSourceRepository.signInWithEmailAndPassword(email, password);
  }

  Future<void> assignUserNameCall(String userName) async {
    await firebaseAuthDataSourceRepository.assignUserName(userName);
  }

  Future<void> signOutCall() async {
    await firebaseAuthDataSourceRepository.signOut();
  }
  Future<void> googleAuthCall() async {
    await firebaseAuthDataSourceRepository.googleAuth();
  }
}
