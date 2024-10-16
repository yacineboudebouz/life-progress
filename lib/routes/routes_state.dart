enum RouteStates {
  // setup routes
  setup(
    redirectPath: '/first-step',
    allowedPaths: [
      'welcome',
      '/birth-day',
      '/life-expectancy',
    ],
  ),
  // application routes
  home(redirectPath: '/home', allowedPaths: ['/home']);

  const RouteStates({
    required this.redirectPath,
    required this.allowedPaths,
  });

  final String redirectPath;
  final List<String> allowedPaths;
}
