import 'package:flutter/material.dart';
import 'package:sala_negra/settings/password/password_view.dart';
import 'package:sala_negra/utilities/app_fonts.dart';

class AccountChangePasswordButton extends StatelessWidget{
  
  const AccountChangePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PasswordView(),
            settings: const RouteSettings(arguments: false),
            )
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: double.infinity, 
        child: const Row(
          children: [
            Expanded(
              child: Text(
                'Cambiar contraseña',
                style: AppFonts.largeFont,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              size: 30,
            )
          ],
        ),
      ),
    );

  }

}