
abstract class FirebaseAuthDataSource {
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> assignUserName(String userName);
  Future<void> googleAuth();
  Future<void> signOut();
}
