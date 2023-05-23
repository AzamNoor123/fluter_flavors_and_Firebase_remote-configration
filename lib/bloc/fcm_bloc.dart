import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fcm_event.dart';
part 'fcm_state.dart';

class FcmBloc extends Bloc<FcmEvent, FcmState> {
  FcmBloc() : super(FcmInitial()) {
    on<SetToken>((event, emit) {
      FirebaseMessaging.instance.getToken().then((value) {
        print('$value');
      });
    });
  }
}
