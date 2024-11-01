import 'package:flutter/material.dart';
import 'package:life_progress/services/storage_service.dart';
import 'package:life_progress/ui/theming/theme_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_controller.g.dart';

@Riverpod(keepAlive: true)
class ThemeController extends _$ThemeController {
  @override
  ThemeState build() {
    final storageService = ref.watch(storageServiceProvider);
    return ThemeState(
      isDark: storageService.getTheme(),
      themeData: storageService.getTheme()
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true),
    );
  }

  void toggleTheme() {
    final storageService = ref.watch(storageServiceProvider);
    final isDark = !state.isDark;
    final themeData = isDark ? ThemeData.dark() : ThemeData.light();
    storageService.setTheme(isDark);
    state = state.copyWith(themeData: themeData, isDark: isDark);
  }
}
