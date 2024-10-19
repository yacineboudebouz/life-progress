import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:life_progress/controllers/flow_controller.dart';
import 'package:life_progress/routes/go_router.dart';
import 'package:life_progress/ui/theming/app_colors.dart';
import 'package:life_progress/ui/widgets/app_button.dart';
import 'package:life_progress/ui/widgets/app_scaffold.dart';
import 'package:life_progress/utils/extensions.dart';

class SelectBirthDay extends ConsumerStatefulWidget {
  const SelectBirthDay({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectBirthDayState();
}

class _SelectBirthDayState extends ConsumerState<SelectBirthDay> {
  void _SelectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        ref.read(flowControllerProvider.notifier).setBirthday(value);
        setState(() {
          _canContinue = true;
        });
      }
    });
  }

  bool _canContinue = false;

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors.of(context);
    final state = ref.watch(flowControllerProvider);
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Select your birthday",
            style: TextStyle(fontSize: 32, color: appColors.secondary),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Hi there! We need to know your birthday to calculate your age and show you the best content for you.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              onTap: _SelectDate,
              leading: const Icon(Icons.calendar_today_outlined),
              title: const Text(
                "Your Birthday",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(state.birthDay.format()),
            ),
          ),
          const Spacer(),
          AppButton(
            text: "Next",
            canClick: _canContinue,
            onPressed: () {
              GoRouter.of(context).goNamed(AppRoutes.lifeExpectancy.name);
            },
          )
        ],
      ),
    );
  }
}
