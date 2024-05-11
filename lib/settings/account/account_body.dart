import 'package:flutter/material.dart';
import 'package:sala_negra/utilities/app_colors.dart';
import 'package:sala_negra/utilities/button_styles.dart';

class AccountBody extends StatelessWidget{
  
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          BackButton(style: ButtonStyles.backButton, color: AppColors.primaryColor,)
        ],
      );
  }
  
}