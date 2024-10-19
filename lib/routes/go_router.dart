import 'package:flutter/material.dart';
import 'package:life_progress/routes/routes_state.dart';
import 'package:life_progress/services/app_flow_state.dart';
import 'package:life_progress/ui/home/home_page.dart';
import 'package:life_progress/ui/welcome/select_birthday.dart';
import 'package:life_progress/ui/welcome/select_life_expectancy.dart';
import 'package:life_progress/ui/welcome/welcome_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
part 'go_router.g.dart';

enum AppRoutes { welcome, birthDay, lifeExpectancy, home }

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final appFlowState = ValueNotifier(RouteStates.unknown);

  ref
    ..onDispose(appFlowState.dispose)

    /// here whenever the value of teh flow changed
    /// we change the local var [appFlowState] to redirect
    /// the user based on that change
    ..listen(appFlowStateProvider, (_, value) {
      appFlowState.value = value;
    });
  final router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      refreshListenable: appFlowState,

      /// here to redirect to home page when the user completes the
      /// welcome steps anad this logic is valid also when using any
      /// kind of this routing, onBoarding, authentification ..etc
      redirect: (_, state) {
        final appFlowstate = ref.watch(appFlowStateProvider);
        if (!appFlowstate.allowedPaths.contains(state.fullPath)) {
          return appFlowstate.redirectPath;
        }
        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (_, __) => const MaterialPage(child: Scaffold()),
        ),
        GoRoute(
          path: '/welcome',
          pageBuilder: (context, state) =>
              const MaterialPage(child: WelcomePage()),
          name: AppRoutes.welcome.name,
        ),
        GoRoute(
            path: '/birth-day',
            pageBuilder: (context, state) =>
                const MaterialPage(child: SelectBirthDay()),
            name: AppRoutes.birthDay.name),
        GoRoute(
            path: '/life-expectancy',
            pageBuilder: (context, state) =>
                const MaterialPage(child: SelectLifeExpectancy()),
            name: AppRoutes.lifeExpectancy.name),
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              const MaterialPage(child: HomePage()),
          name: AppRoutes.home.name,
        ),
      ]);
  // always dispose providers
  ref.onDispose(router.dispose);
  return router;
}
