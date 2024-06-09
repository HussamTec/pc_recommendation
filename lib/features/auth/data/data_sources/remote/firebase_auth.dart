import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../models/user_model.dart';

class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // bool isAuthenticated = false;

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User signed up successfully
      // isAuthenticated = true;
    } catch (e) {
      // An error occurred while signing up the user
      print(e);
      rethrow;
    }
  }
  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User signed up successfully
      // isAuthenticated = true;
    } catch (e) {
      // An error occurred while signing up the user
      print(e);
      rethrow;
    }
  }
  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Logout failed: $e');
    }
  }
  Future<UserModel> getCurrentUser() async {
   User? firebaseUser =_auth.currentUser;
     return UserModel(
     id: firebaseUser?.uid ?? '',
     email: firebaseUser?.email ?? '',
   );
  }

  @override
  Future<void> googleAuth() async{
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _auth.signInWithCredential(credential);
      }
    } catch (error) {
      print('Google sign-in error: $error');
    }
  }

  @override
  Future<bool> assignUserName(String userName) async {
    // Get the current user ID
    final String uid = _auth.currentUser!.uid;

      // Create a query to check if any document in the collection has the 'username' field equal to the provided username.
      final query = _firestore.collection('UserNames').where('username', isEqualTo: userName).limit(1);

      // Get a snapshot of the query results.
      final snapshot = await query.get();

      // Check if there are any documents in the snapshot (meaning the username exists).
      snapshot.docs.isNotEmpty;

     if(snapshot.docs.isNotEmpty!=true){
       // Create a new document in the 'userNames' collection with the userID as document name
       final docRef = _firestore.collection('userNames').doc(uid);
       // Set the username field in the document
       await docRef.set({
         'username': userName,
       });
       return true;
     }else{
       return false;
     }
  }

}
