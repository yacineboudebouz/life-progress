import 'package:flutter/material.dart';

class WeekLife extends StatelessWidget {
  const WeekLife({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: color ?? Colors.grey,
      ),
    );
  }
}
