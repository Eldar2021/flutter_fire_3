part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {}

class SignUpInitial extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpSuccess extends SignUpState {
  SignUpSuccess(this.user);

  final UserCredential user;

  @override
  List<Object?> get props => [user];
}

class SignUpError extends SignUpState {
  SignUpError(this.exception);

  final Exception exception;

  @override
  List<Object?> get props => [];
}
