// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData themeData;
  final bool isDark;
  ThemeState({
    required this.themeData,
    required this.isDark,
  });

  ThemeState copyWith({
    ThemeData? themeData,
    bool? isDark,
  }) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
      isDark: isDark ?? this.isDark,
    );
  }
}
