import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:task_6_flutter_flavours/helper/Notification.dart';
import 'package:task_6_flutter_flavours/helper/stringResources.dart';

class App extends StatefulWidget {
  final String flavour;

  const App({Key? key, required this.flavour}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    FcmServices.listenAppFcm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringResources.TITLE,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.flavour),
        ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    FirebaseCrashlytics.instance.crash();
                  },
                  child: Text(StringResources.CRASH_BTN)),
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseMessaging.instance.getToken().then((value) {
                    print('Token is $value');
                  });
                },
                child: Text(StringResources.TOKEN_BTN)),
          ],
        ),
      ),
    );
  }
}
