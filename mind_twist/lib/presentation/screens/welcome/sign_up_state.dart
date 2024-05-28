import 'package:mind_twist/core/domain/user/user_failure.dart';

enum SignUpStatus { initial, loading, success, failure }

class SignUpState {
  final SignUpStatus status;
  final UserFailure? failure;

  SignUpState({
    required this.status,
    this.failure,
  });

  factory SignUpState.initial() {
    return SignUpState(status: SignUpStatus.initial);
  }

  factory SignUpState.loading() {
    return SignUpState(status: SignUpStatus.loading);
  }

  factory SignUpState.success() {
    return SignUpState(status: SignUpStatus.success);
  }

  factory SignUpState.failure(UserFailure failure) {
    return SignUpState(status: SignUpStatus.failure, failure: failure);
  }
}
