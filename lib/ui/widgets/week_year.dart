import 'package:flutter/material.dart';

class WeekYear extends StatelessWidget {
  const WeekYear({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        child: SizedBox(
      width: 20,
      height: 20,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color ?? Colors.grey,
        ),
      ),
    ));
  }
}
