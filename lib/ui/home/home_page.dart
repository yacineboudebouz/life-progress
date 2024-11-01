import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_progress/ui/home/life_progress.dart';
import 'package:life_progress/ui/home/year_progress.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    widget.onPressed();
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
          Expanded(
            child: PageFlipBuilder(
              frontBuilder: (context) {
                return const LifeProgress();
              },
              backBuilder: (context) {
                return const YearProgress();
              },
            ),
          ),
        ],
      ),
    );
  }
}
