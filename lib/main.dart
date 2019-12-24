import 'package:flutter/material.dart';

import 'package:passbase_flutter/passbase_flutter.dart';

void main() => runApp(PassbaseFlutterDemoApp());

class PassbaseFlutterDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    PassbaseFlutter.initialize(
        apiKey:
            "YOUR_OWN_PUBLISHABLE_API_KEY");

    // PassbaseFlutter.buttonUI.setActionButtonBgColor(color: Colors.red);
    // PassbaseFlutter.buttonUI.setSubtitleTextColor(color: Colors.red);
    // PassbaseFlutter.buttonUI.setLoadingIndicatorColor(color: Colors.red);
    // PassbaseFlutter.buttonUI.setTitleTextColor(color: Colors.red);
    // PassbaseFlutter.buttonUI.setDisclaimerTextColor(color: Colors.red);
    // PassbaseFlutter.buttonUI.setActionButtonTextColor(color: Colors.white);
    // PassbaseFlutter.buttonUI
    //     .setActionButtonDeactivatedBgColor(color: Colors.red.withAlpha(30));

    return _PassbaseDemoHomePageState();
  }
}

class _PassbaseDemoHomePageState extends State<PassbaseDemoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PassbaseButton(
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
              height: 70,
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              child: Container(
                width: 200,
                child: Center(
                  child: Text("Start verification"),
                ),
              ),
              onPressed: () async {
                await PassbaseFlutter.startVerification(
                  onVerificationSuccess: (authKey) {
                    // do stuff in case of success
                    print(authKey);
                  },
                  onVerificationCancel: () {
                    // do stuff in case of cancel
                    print("cancel");
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
