import 'package:flutter/material.dart';
import 'package:themoviedb_dev/helpers/app_texts.dart';
import 'package:themoviedb_dev/ui/widgets/welcome_widget/welcome_search_widget.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFCCCCCC),
      width: double.infinity,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppTexts.welcomeWidgetTitle,
              style: TextStyle(
                fontSize: 38,
                height: 1.1,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              AppTexts.welcomeWidgetSubtitle,
              style: TextStyle(
                fontSize: 26,
                height: 1,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            WelcomeSearchWidget(),
          ],
        ),
      ),
    );
  }
}
