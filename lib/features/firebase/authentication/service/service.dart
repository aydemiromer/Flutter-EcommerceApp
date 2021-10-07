import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  User get currentUser;
  Stream<User>  authStateChanges();

  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<User> createUserWithEmailandPassword(String email, String password);
  Future<User> signInWithEmailandPassword(String email, String password);
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _fAuth = FirebaseAuth.instance;

  @override
  Stream<User>  authStateChanges() => _fAuth.authStateChanges();

  @override
  User get currentUser {
    _fAuth.currentUser;
    
  }

  @override
  Future<User> createUserWithEmailandPassword(
      String email, String password) async {
    final userCredential = await _fAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  @override
  Future<User> signInWithEmailandPassword(
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
  Future<User> signInWithFacebook() {
    
    throw UnimplementedError();
  }

  @override
  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential =
            await _fAuth.signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ));
        return userCredential.user;
      } else {
        throw FirebaseAuthException(
          message: 'Missing Google ID Token',
          code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
        );
      }
    } else {
      throw FirebaseAuthException(
          message: 'Sign in aborted by user', code: 'ERROR_ABORTED_BY_USER');
    }
  }

  @override
  Future<void> signOut() async {
    await _fAuth.signOut();
  }
}
