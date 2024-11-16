import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_progress/controllers/flow_controller.dart';
import 'package:life_progress/ui/home/life_progress.dart';
import 'package:life_progress/ui/home/year_progress.dart';
import 'package:life_progress/ui/theming/theme_controller.dart';
import 'package:life_progress/utils/extensions.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });
  // final VoidCallback onPressed;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  void _selectDate() {
    showDatePicker(
      context: context,
      initialDate: ref.watch(flowControllerProvider).birthDay,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        ref.read(flowControllerProvider.notifier).setBirthday(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeControllerProvider).isDark;
    final state = ref.watch(flowControllerProvider);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Life Progress',
              style: TextStyle(fontSize: 24),
            ),
            Container(),
            const SizedBox(height: 20),
            const Text('Dark Mode'),
            Switch.adaptive(
              activeColor: Colors.blue,
              thumbColor: WidgetStateProperty.all(Colors.white),
              activeTrackColor: Colors.blue[200],
              inactiveThumbColor: Colors.black,
              value: theme,
              onChanged: (value) {
                ref.read(themeControllerProvider.notifier).toggleTheme();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                onTap: _selectDate,
                leading: const Icon(Icons.calendar_today_outlined),
                title: const Text(
                  "Your Birthday",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(state.birthDay.format()),
              ),
            ),
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
                  },
                  min: 18,
                  max: 150,
                ),
                trailing: Text(
                  '${state.expectedAge}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Row(
              children: [
                Builder(builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      // open drawer
                      Scaffold.of(context).openDrawer();
                    },
                  );
                }),
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
