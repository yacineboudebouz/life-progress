import 'package:flutter/material.dart';
import 'package:life_progress/ui/theming/app_colors.dart';

class AppButton extends StatefulWidget {
  const AppButton(
      {super.key, this.onPressed, required this.text, this.canClick = true});
  final VoidCallback? onPressed;
  final String text;
  final bool canClick;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _hovered = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _hovered = false;
        });
      },
      child: AnimatedScale(
        scale: _hovered ? 0.95 : 1,
        duration: const Duration(milliseconds: 50),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: widget.canClick ? widget.onPressed : null,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 15),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: Text(
              widget.text,
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
