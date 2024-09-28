enum AppStatus {
  authenticated,
  unauthenticated;

  bool get isAuthenticated => this == authenticated;
}
