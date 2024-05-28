import 'package:mind_twist/core/domain/user/user_failure.dart';

enum SignInStatus { initial, loading, success, failure }

class SignInState {
  final SignInStatus status;
  final UserFailure? failure;

  SignInState({
    required this.status,
    this.failure,
  });

  factory SignInState.initial() {
    return SignInState(status: SignInStatus.initial);
  }

  factory SignInState.loading() {
    return SignInState(status: SignInStatus.loading);
  }

  factory SignInState.success() {
    return SignInState(status: SignInStatus.success);
  }

  factory SignInState.failure(UserFailure failure) {
    return SignInState(status: SignInStatus.failure, failure: failure);
  }
}
