class SignInExc implements Exception {
  SignInExc(this.message);

  final String? message;

  @override
  String toString() {
    return message ?? 'sign in exception';
  }
}
