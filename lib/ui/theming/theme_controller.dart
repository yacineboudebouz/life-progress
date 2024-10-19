import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_progress/providers/shared_preferences_provider.dart';
import 'package:life_progress/services/storage_service.dart';
import 'package:life_progress/ui/theming/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends StateNotifier<ThemeState> {
  ThemeController({required this.storageService})
      : super(ThemeState(themeData: ThemeData.dark(), isDark: true)) {
    // loadTheme();
  }

  final StorageService storageService;

  void toggleTheme() {
    final isDark = !state.isDark;
    final themeData = isDark ? ThemeData.dark() : ThemeData.light();
    storageService.setTheme(isDark);
    state = state.copyWith(themeData: themeData, isDark: isDark);
  }

  void loadTheme() {
    final isDark = storageService.getTheme();
    final themeData = isDark ? ThemeData.dark() : ThemeData.light();
    state = state.copyWith(themeData: themeData, isDark: isDark);
  }
}

final themeControllerProvider =
    StateNotifierProvider<ThemeController, ThemeState>((ref) {
  return ThemeController(storageService: ref.watch(storageServiceProvider));
});
