import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  Future<UserCredential?> registerUser(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;
    print(user);
    return userCredential;
  }

  Future<UserCredential?> loginUser(String email, String password) async {

    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;
    print(user);
    return userCredential;
  }

}
