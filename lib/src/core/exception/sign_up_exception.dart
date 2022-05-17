class SignUpExc implements Exception {
  SignUpExc(this.massage);

  final String massage;

  @override
  String toString() => massage;
}
