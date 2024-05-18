import 'package:flutter/material.dart';
import 'package:sala_negra/login/login_view.dart';
import 'package:sala_negra/models/session.dart';
import 'package:sala_negra/utilities/app_fonts.dart';

class AccountLogoutButton extends StatelessWidget{
 
  const AccountLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Session.getInstance().closeSession();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
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
                'Cerrar sesión',
                style: AppFonts.largeFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}