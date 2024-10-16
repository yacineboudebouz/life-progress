// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WelcomeModel {
  String title;
  String description;
  IconData icon;
  WelcomeModel({
    required this.title,
    required this.description,
    required this.icon,
  });
}

final welcomeList = [
  WelcomeModel(
      title: "Measure your life progress",
      description:
          "See the progress of your life and current year with easy to use calendar",
      icon: Icons.calendar_month_outlined),

  //
  WelcomeModel(
      title: "Widget",
      description:
          "Always be up to date with your life with a user friendly widgets",
      icon: Icons.widgets_outlined),
  WelcomeModel(
      title: "AppTheme",
      description:
          "Support dark and light theme modes based on your preferences",
      icon: Icons.color_lens_outlined),
];
