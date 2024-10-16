import 'package:flutter/material.dart';

class WeekYear extends StatelessWidget {
  const WeekYear({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: color ?? Colors.grey,
      ),
    );
  }
}
