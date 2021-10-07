/*import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  User get currentUser;
  Stream<User> authStateChanges();

  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<User?> createUserWithEmailandPassword(String email, String password);
  Future<User?> signInWithEmailandPassword(String email, String password);
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _fAuth = FirebaseAuth.instance;

  @override
  Stream<User> authStateChanges() {
    _fAuth.authStateChanges();
    throw UnimplementedError();
  }

  @override
  Future<User?> createUserWithEmailandPassword(
      String email, String password) async {
    final userCredential = await _fAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  @override
  Future<User?> signInWithEmailandPassword(
      String email, String password) async {
    final userCredential = await _fAuth.signInWithCredential(
      EmailAuthProvider.credential(
        email: email,
        password: password,
      ),
    );
    return userCredential.user;
  }

  @override
  User get currentUser {
    _fAuth.currentUser;
    throw UnimplementedError();
  }

  @override
  Future<User> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<User> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    await _fAuth.signOut();
  }
}
*/