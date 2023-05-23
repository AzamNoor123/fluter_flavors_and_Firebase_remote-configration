part of 'fcm_bloc.dart';

@immutable
abstract class FcmState {}

class FcmInitial extends FcmState {}

class FcmTokenLoadedState extends FcmState {
  final String token;

  FcmTokenLoadedState(this.token);
}
