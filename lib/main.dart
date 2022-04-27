import 'package:flutter/material.dart';

import 'package:auth_app/services/google_signin_service.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Auth App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                GoogleSigninService.signout();
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  splashColor: Colors.transparent,
                  minWidth: double.infinity,
                  height: 40.0,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(FontAwesomeIcons.google, color: Colors.white),
                      SizedBox(width: 10.0),
                      Text(
                        'Sign In with Google',
                        style: TextStyle(color: Colors.white, fontSize: 17.0),
                      ),
                    ],
                  ),
                  onPressed: () {
                    GoogleSigninService.signinWithGoogle();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
