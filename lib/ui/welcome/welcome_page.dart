import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_progress/models/welcome_model.dart';
import 'package:life_progress/routes/go_router.dart';
import 'package:life_progress/ui/theming/app_colors.dart';
import 'package:life_progress/ui/widgets/app_button.dart';
import 'package:life_progress/ui/widgets/app_scaffold.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors.of(context);
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: 'Welcome to\n',
              style: TextStyle(fontSize: 30),
              children: [
                TextSpan(
                  text: 'Life Progress',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: appColors.textSecondary),
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
            onPressed: () {
              GoRouter.of(context).goNamed(AppRoutes.birthDay.name);
            },
          )
        ],
      ),
    );
  }
}
