// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  //Register user
  Future<User?> register(String email, String password) async {
    UserCredential userCredential =
        await auth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }
}
