import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  Authentication();

  bool isLogin() {
    if (FirebaseAuth.instance.currentUser != null) return true;
    return false;
  }
}
