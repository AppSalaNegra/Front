import 'package:flutter/material.dart';
import 'package:sala_negra/settings/about/about_black_button.dart';
import 'package:sala_negra/settings/about/about_social_links.dart';
import 'package:sala_negra/utilities/app_colors.dart';
import 'package:sala_negra/utilities/button_styles.dart';

class AboutBody extends StatelessWidget{
  
  const AboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      width: double.infinity, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AboutBlackButton(title: 'Quiénes somos', padding: 100, onPressed: (){}),
          AboutBlackButton(title: ' Qué hacemos ',padding: 70, onPressed: (){}),
          const AboutSocialLinks(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: BackButton(
                  color: Colors.white,
                  style: ButtonStyles.backButton,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}