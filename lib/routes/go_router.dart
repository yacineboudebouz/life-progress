import 'package:flutter/material.dart';
import 'package:life_progress/routes/routes_state.dart';
import 'package:life_progress/services/app_flow_state.dart';
import 'package:life_progress/ui/home/home_page.dart';
import 'package:life_progress/ui/welcome/select_birthday.dart';
import 'package:life_progress/ui/welcome/select_life_expectancy.dart';
import 'package:life_progress/ui/welcome/welcome_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes { welcome, birthDay, lifeExpectancy, home }

final goRouterProvider = Provider<GoRouter>((ref) {
  final appFlowState = ValueNotifier(RouteStates.unknown);
  ref
    ..onDispose(appFlowState.dispose)
    ..listen(appFlowStateProvider, (_, value) {
      appFlowState.value = value;
    });
  final router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      refreshListenable: appFlowState,
      redirect: (_, state) {
        final appFlowstate = ref.watch(appFlowStateProvider);
        if (!appFlowstate.allowedPaths.contains(state.fullPath)) {
          return appFlowstate.redirectPath;
        }
        return null;
      },
      routes: [
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
  ref.onDispose(router.dispose);
  return router;
});
