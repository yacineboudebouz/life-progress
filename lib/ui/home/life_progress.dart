import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_progress/controllers/flow_controller.dart';
import 'package:life_progress/ui/widgets/app_scaffold.dart';
import 'package:life_progress/ui/widgets/week_year.dart';

class LifeProgress extends ConsumerStatefulWidget {
  const LifeProgress({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LifeProgressState();
}

class _LifeProgressState extends ConsumerState<LifeProgress> {
  Color? _getColor(int index, int totalWeeks, int weeksLived) {
    if (index < totalWeeks / 5 && index < weeksLived) {
      return Colors.green;
    }
    if (index > totalWeeks / 5 &&
        index < totalWeeks / 2.5 &&
        index < weeksLived) {
      return Colors.blue;
    }
    if (index > totalWeeks / 2.5 &&
        index < totalWeeks / 1.666666 &&
        index < weeksLived) {
      return Colors.yellow;
    }
    if (index > totalWeeks / 1.666666 &&
        index < totalWeeks / 1.25 &&
        index < weeksLived) {
      return Colors.orange;
    }
    if (index > totalWeeks / 1.25 && index < totalWeeks && index < weeksLived) {
      return Colors.red;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(flowControllerProvider.notifier);
    final progressBarColor =
        _getColor(state.weeksLived - 1, state.weeksInLife, state.weeksLived);
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Text(
              "Life progress : ${state.percentageLivedWeeks}%",
              style: const TextStyle(fontSize: 28),
            ),
            Text(
              "${state.weeksLived} weeks spent, ${state.remainingWeeks} weeks remaining",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: state.percentageLivedWeeks / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(progressBarColor!),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 52),
              itemBuilder: (_, index) {
                final color =
                    _getColor(index, state.weeksInLife, state.weeksLived);
                return Padding(
                  padding: const EdgeInsets.all(0.5),
                  child: WeekYear(
                    color: color,
                  ),
                );
              },
              itemCount: state.weeksInLife,
            ))
          ],
        ),
      ),
    );
  }
}
