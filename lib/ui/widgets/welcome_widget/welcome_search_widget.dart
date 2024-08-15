import 'package:flutter/material.dart';
import 'package:themoviedb_dev/helpers/app_texts.dart';

class WelcomeSearchWidget extends StatelessWidget {
  const WelcomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            style: const TextStyle(
              color: Color(0xFFDFDFDF),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              hintText: AppTexts.welcomeSearchLabel,
              hintStyle: const TextStyle(
                color: Color(0xFFCCCCCC),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xFF1DD4A9),
                    Color(0xFF01B4E3),
                  ]),
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                width: 100,
                height: 48,
                alignment: Alignment.center,
                child: const Text(
                  AppTexts.welcomeSearchButtonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
