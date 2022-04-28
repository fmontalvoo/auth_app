import 'dart:developer';

import 'package:http/http.dart' as http;

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
      final gooleKey = await account?.authentication;
      log(account.toString());
      final token = gooleKey?.idToken;
      log('Token ID: $token');

      final signinApi = Uri(
        scheme: 'https',
        host: 'auth-app-backend-07.herokuapp.com',
        path: '/auth/google_signin',
      );

      final session = await http.post(signinApi, body: {'token': token});

      if (session.statusCode == 200) {
        log('Signin Success');
        log(session.body);
        return account;
      } else {
        log('Signin Failed');
        return null;
      }
    } catch (e) {
      log('Error: $e');
    }
    return null;
  }

  static Future<void> signout() async {
    await googleSignIn.signOut();
  }
}
