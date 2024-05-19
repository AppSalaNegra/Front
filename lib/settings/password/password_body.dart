import 'package:flutter/material.dart';
import 'package:sala_negra/settings/password/password_form.dart';
import 'package:sala_negra/utilities/app_colors.dart';
import 'package:sala_negra/utilities/button_styles.dart';

class PasswordBody extends StatelessWidget{
  
  const PasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          PasswordForm(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: BackButton(
                  color: AppColors.primaryColor,
                  style: ButtonStyles.backButton,
                ),
              ),
            ),
          ),
        ],
      );
  }
  
}