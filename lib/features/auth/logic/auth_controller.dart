import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
static Future signInAnon() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous home hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }

  static Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
//TODO  sign out
}
