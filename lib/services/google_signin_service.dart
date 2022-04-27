import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninService {
  static final googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  static Future<GoogleSignInAccount?> signinWithGoogle() async {
    try {
      final account = await googleSignIn.signIn();
      log(account.toString());
      return account;
    } catch (e) {
      log('Error: $e');
    }
    return null;
  }

  static Future<void> signout() async {
    await googleSignIn.signOut();
  }
}
