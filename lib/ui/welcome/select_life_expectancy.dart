import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:life_progress/controllers/flow_controller.dart';
import 'package:life_progress/routes/go_router.dart';
import 'package:life_progress/ui/theming/app_colors.dart';
import 'package:life_progress/ui/widgets/app_button.dart';
import 'package:life_progress/ui/widgets/app_scaffold.dart';

class SelectLifeExpectancy extends ConsumerStatefulWidget {
  const SelectLifeExpectancy({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectLifeExpectancyState();
}

class _SelectLifeExpectancyState extends ConsumerState<SelectLifeExpectancy> {
  bool _canContinue = false;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(flowControllerProvider);
    final appColors = AppColors.of(context);
    return AppScaffold(
      body: Column(
        children: [
          Text(
            "Select your Life Expectancy",
            style: TextStyle(fontSize: 32, color: appColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const Text(
            "One of the things we need to know is how long you expect to live. This will help us to calculate your remaining time and show you the best content for you.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              leading: const Icon(Icons.child_care),
              title: const Text('Life Expectancy'),
              subtitle: Slider(
                value: state.expectedAge.toDouble(),
                onChanged: (value) {
                  ref
                      .read(flowControllerProvider.notifier)
                      .setAge(value.toInt());
                  setState(() {
                    _canContinue = true;
                  });
                },
                min: 18,
                max: 150,
                thumbColor: appColors.secondary,
              ),
              trailing: Text(
                '${state.expectedAge}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          const Spacer(),
          AppButton(
            text: "Finish",
            canClick: _canContinue,
            onPressed: () {
              GoRouter.of(context).goNamed(AppRoutes.home.name);
            },
          )
        ],
      ),
    );
  }
}
