import 'package:flutter/material.dart';
import 'package:sala_negra/settings/account/widgets/account_change_password_button.dart';
import 'package:sala_negra/settings/account/widgets/account_logout_button.dart';
import 'package:sala_negra/settings/account/widgets/account_remove_button.dart';
import 'package:sala_negra/utilities/app_colors.dart';
import 'package:sala_negra/utilities/button_styles.dart';

class AccountBody extends StatelessWidget{
  
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          const AccountChangePasswordButton(),
          const AccountLogoutButton(),
          const AccountRemoveButton(),
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