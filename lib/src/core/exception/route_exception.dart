class RouteExc implements Exception {
  RouteExc();

  @override
  String toString() => 'Route not found!';
}
