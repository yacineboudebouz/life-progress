import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_progress/providers/shared_preferences_provider.dart';

import 'package:life_progress/routes/go_router.dart';
import 'package:life_progress/ui/theming/app_colors.dart';
import 'package:life_progress/ui/theming/theme_controller.dart';
import 'package:life_progress/utils/observor.dart';

void main() {
  runApp(ProviderScope(
    observers: [MyObserver()],
    child: const LifeProgress(),
  ));
}

class LifeProgress extends StatelessWidget {
  const LifeProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const _EagerInitialization(child: MyApp());
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = <AsyncValue>[
      ref.watch(sharedPreferencesProvider),
    ];

    if (values.every((value) => value.hasValue)) {
      return child;
    }

    return const SizedBox();
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final theme = ref.watch(themeControllerProvider);
    final appColors = ref.watch(themeControllerProvider).isDark
        ? ref.watch(darkColors)
        : ref.watch(lightColors);
    return AppColors(
      data: appColors,
      child: MaterialApp.router(
        theme: theme.themeData,
        title: "Life progress",
        routerConfig: router,
      ),
    );
  }
}
