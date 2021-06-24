import 'package:flutter/material.dart';

import 'package:passbase_flutter/passbase_flutter.dart';

void main() => runApp(PassbaseFlutterDemoApp());

class PassbaseFlutterDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PassbaseSDK.prefillUserEmail = "testuser@mail.com";
    PassbaseSDK.initialize(publishableApiKey: "YOUR_PUBLISHABLE_API_KEY");
    return MaterialApp(
      home: PassbaseDemoHomePage(),
    );
  }
}

class PassbaseDemoHomePage extends StatefulWidget {
  PassbaseDemoHomePage({Key key}) : super(key: key);

  @override
  _PassbaseDemoHomePageState createState() {
    return _PassbaseDemoHomePageState();
  }
}

class _PassbaseDemoHomePageState extends State<PassbaseDemoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 107, 236),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Image.asset(
                'lib/assets/shield-icon.png',
                width: 50,
                height: 50,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                children: <Widget>[
                  Text(
                    'Welcome to Passbase',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'Exo',
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Start your first verification by clicking on the button below.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: 'Exo',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: PassbaseButton(
                onFinish: (identityAccessKey) {
                  // do stuff in case of success
                  print(identityAccessKey);
                },
                onError: (errorCode) {
                  // do stuff in case of cancel
                  print(errorCode);
                },
                onStart: () {
                  // do stuff in case of start
                  print("start");
                },
                width: 300,
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}