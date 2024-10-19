enum RouteStates {
  // setup routes
  setup(
    redirectPath: '/welcome',
    allowedPaths: [
      'welcome',
      '/birth-day',
      '/life-expectancy',
    ],
  ),
  // application routes
  home(redirectPath: '/home', allowedPaths: ['/home']),
  unknown(redirectPath: '/', allowedPaths: ['/']);

  const RouteStates({
    required this.redirectPath,
    required this.allowedPaths,
  });

  final String redirectPath;
  final List<String> allowedPaths;
}
