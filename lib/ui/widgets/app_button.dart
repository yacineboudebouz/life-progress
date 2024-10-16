import 'package:flutter/material.dart';
import 'package:life_progress/ui/theming/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key, this.onPressed, required this.text, this.canClick = true});
  final VoidCallback? onPressed;
  final String text;
  final bool canClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: canClick ? onPressed : null,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 15),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
