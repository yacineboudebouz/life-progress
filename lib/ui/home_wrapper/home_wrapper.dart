import 'package:flutter/material.dart';
import 'package:life_progress/ui/home/home_page.dart';
import 'dart:math';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleNavBar() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final value = _controller.value;
          final translationX = value * width / 2.5;
          final translationY = value * height / 6;
          final scale = 0.7 + 0.3 * (1 - value);
          final rotation = -pi / 16 * (value);
          return Stack(
            children: [
              Container(
                height: height,
                width: width,
                color: Colors.deepPurple,
              ),
              Transform(
                transform:
                    Matrix4.translationValues(translationX, translationY, 0.0)
                      ..scale(scale)
                      ..rotateZ(rotation),
                child: HomePage(),
              ),
            ],
          );
        },
      ),
    );
  }
}
