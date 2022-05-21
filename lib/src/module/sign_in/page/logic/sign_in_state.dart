part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {}

class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInSuccess extends SignInState {
  SignInSuccess(this.user);

  final UserCredential user;

  @override
  List<Object?> get props => [user];
}

class SignInError extends SignInState {
  SignInError(this.exception);

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}
