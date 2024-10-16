enum RouteStates {
  // setup routes
  setup(
    redirectPath: '/first-step',
    allowedPaths: [
      'welcome',
      '/birth-day',
      '/second-step',
      '/third-step',
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
