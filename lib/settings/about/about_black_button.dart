import 'package:flutter/material.dart';
import 'package:sala_negra/utilities/app_fonts.dart';
import 'package:sala_negra/utilities/button_styles.dart';

class AboutBlackButton extends StatelessWidget{

  final String title;
  final double padding;
  final void Function() onPressed;

  const AboutBlackButton({super.key, required this.title, required this.onPressed, required this.padding});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
            padding: EdgeInsets.only(top: padding),
            child: ElevatedButton(
              style: ButtonStyles.blackButton,
              onPressed: onPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                title,
                style: AppFonts.mediumBlackButton
              ),
              )
            ),
          );
  }

}