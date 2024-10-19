// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppColorsData {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color text;
  final Color textSecondary;
  final Color textTertiary;
  AppColorsData({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.text,
    required this.textSecondary,
    required this.textTertiary,
  });

  AppColorsData copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? text,
    Color? textSecondary,
    Color? textTertiary,
  }) {
    return AppColorsData(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      text: text ?? this.text,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
    );
  }
}

class AppColors extends InheritedWidget {
  const AppColors({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);
  final AppColorsData data;

  static AppColorsData of(BuildContext context) {
    final appColors = context.dependOnInheritedWidgetOfExactType<AppColors>();
    if (appColors != null) {
      return appColors.data;
    } else {
      throw Exception('AppColors not found in context');
    }
  }

  @override
  bool updateShouldNotify(covariant AppColors oldWidget) {
    return data != oldWidget.data;
  }
}

final lightColors = Provider<AppColorsData>((ref) {
  return AppColorsData(
    primary: const Color(0xFF6200EE),
    secondary: const Color(0xFF03DAC6),
    tertiary: const Color(0xFF018786),
    text: const Color(0xFF000000),
    textSecondary: const Color(0xFFffffff),
    textTertiary: const Color(0xFF000000),
  );
});

final darkColors = Provider<AppColorsData>((ref) {
  return AppColorsData(
    primary: const Color(0xFFBB86FC),
    secondary: const Color(0xFF03DAC6),
    tertiary: const Color(0xFF018786),
    text: const Color(0xFFffffff),
    textSecondary: const Color(0xFFffffff),
    textTertiary: const Color(0xFFffffff),
  );
});
