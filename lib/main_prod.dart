import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_6_flutter_flavours/app.dart';
import 'package:task_6_flutter_flavours/helper/constantResources.dart';
import 'bloc/fcm_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FirebaseMessaging.instance.getToken().then((value) {
    print('value is $value');
  });

  runApp(BlocProvider(
      create: (context) => FcmBloc(),
      child: App(flavour: ConstantResources.PROD)));
}
