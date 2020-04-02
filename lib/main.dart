import 'package:flutter/material.dart';

import 'package:passbase_flutter/passbase_flutter.dart';

void main() => runApp(PassbaseFlutterDemoApp());

class PassbaseFlutterDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PassbaseDemoHomePage(),
    );
  }
}

class PassbaseDemoHomePage extends StatefulWidget {
  PassbaseDemoHomePage({Key key}) : super(key: key);

  @override
  _PassbaseDemoHomePageState createState() {
    PassbaseFlutter.initialize(apiKey: "YOUR_PUBLISHABLE_API_KEY");

    PassbaseFlutter.buttonUI.setActionButtonBgColor(color: Colors.red);
    PassbaseFlutter.buttonUI.setSubtitleTextColor(color: Colors.red);
    PassbaseFlutter.buttonUI.setLoadingIndicatorColor(color: Colors.red);
    PassbaseFlutter.buttonUI.setTitleTextColor(color: Colors.red);
    PassbaseFlutter.buttonUI.setDisclaimerTextColor(color: Colors.red);
    PassbaseFlutter.buttonUI.setActionButtonTextColor(color: Colors.white);
    PassbaseFlutter.buttonUI
        .setActionButtonDeactivatedBgColor(color: Colors.red.withAlpha(30));

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
                onVerificationSuccess: (authKey) {
                  // do stuff in case of success
                  print(authKey);
                },
                onVerificationCancel: () {
                  // do stuff in case of cancel
                  print("cancel");
                },
                backgroundColor: Colors.white,
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
