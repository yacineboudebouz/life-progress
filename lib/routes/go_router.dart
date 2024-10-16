import 'package:flutter/material.dart';
import 'package:life_progress/ui/welcome/select_birthday.dart';
import 'package:life_progress/ui/welcome/welcome_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  welcome,
  birthDay,
  secondStep,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/welcome',
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
      ]);
});
