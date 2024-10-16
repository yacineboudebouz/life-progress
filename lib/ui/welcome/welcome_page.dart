import 'package:flutter/material.dart';
import 'package:life_progress/models/welcome_model.dart';
import 'package:life_progress/ui/theming/app_colors.dart';
import 'package:life_progress/ui/widgets/app_button.dart';
import 'package:life_progress/ui/widgets/app_scaffold.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text.rich(
            TextSpan(
              text: 'Welcome to\n',
              style: TextStyle(fontSize: 30),
              children: [
                TextSpan(
                  text: 'Life Progress',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    leading: Icon(welcomeList[index].icon),
                    title: Text(
                      welcomeList[index].title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(welcomeList[index].description),
                  ),
                );
              },
              itemCount: welcomeList.length,
            ),
          ),
          AppButton(
            text: "Next",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
