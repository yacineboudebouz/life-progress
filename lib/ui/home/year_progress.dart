import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_progress/controllers/flow_controller.dart';
import 'package:life_progress/ui/widgets/app_scaffold.dart';
import 'package:life_progress/ui/widgets/week_year.dart';

class YearProgress extends ConsumerStatefulWidget {
  const YearProgress({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _YearProgressState();
}

class _YearProgressState extends ConsumerState<YearProgress> {
  Color? _getColor(int index, int weeksLived) {
    if (index < weeksLived) {
      return Colors.orange;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(flowControllerProvider.notifier);
    return AppScaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Text(
            "Year progress : ${state.percentageLivedWeeksFromLastBirthday}%",
            style: const TextStyle(fontSize: 28),
          ),
          Text(
            "${state.weeksTilBirthday} weeks until your birthday",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          LinearProgressIndicator(
            value: state.percentageLivedWeeksFromLastBirthday / 100,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7),
              itemBuilder: (context, index) {
                final color =
                    _getColor(index, state.weeksLivedFromLastBirthday);
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: WeekYear(
                    color: color,
                  ),
                );
              },
              itemCount: 52,
            ),
          )
        ],
      ),
    ));
  }
}
