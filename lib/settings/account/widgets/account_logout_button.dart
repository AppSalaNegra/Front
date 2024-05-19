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
        _showLogoutConfirmationDialog(context);
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

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar cierre de sesión'),
          content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Session.getInstance().closeSession();
                Navigator.of(context).pop(); 
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                    settings: const RouteSettings(arguments: false),
                  ),
                );
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}