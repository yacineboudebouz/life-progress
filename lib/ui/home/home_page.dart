import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_progress/controllers/flow_controller.dart';
import 'package:life_progress/ui/home/life_progress.dart';
import 'package:life_progress/ui/home/year_progress.dart';
import 'package:life_progress/ui/widgets/app_scaffold.dart';
import 'package:life_progress/ui/widgets/week_year.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageFlipBuilder(
      frontBuilder: (context) {
        return const LifeProgress();
      },
      backBuilder: (context) {
        return YearProgress();
      },
    );
  }
}
