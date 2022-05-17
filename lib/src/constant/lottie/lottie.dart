class Lotties {
  static Lotties? _instance;
  static Lotties get instance {
    _instance ??= Lotties._init();
    return _instance!;
  }

  Lotties._init();

  final String lottieTheme = 'assets/lottie/lottie_theme.json';
  final String lottieLoading = 'assets/lottie/lottie_loading.json';
  final String lottieDrop = 'assets/lottie/lottie_drop.json';
}
