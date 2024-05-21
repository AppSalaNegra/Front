import 'package:flutter/material.dart';
import 'package:sala_negra/api/api_operations.dart';
import 'package:sala_negra/login/login_view.dart';
import 'package:sala_negra/models/session.dart';
import 'package:sala_negra/utilities/app_colors.dart';
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
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent), 
                foregroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)), 
                overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return AppColors.primaryColor.withAlpha(120); 
                  }
                  return Colors.transparent;
                }),
              ),
              onPressed: () {
                List<String> userEvents = Session.getInstance().userEvents.map((event) => event.id).toList();
                ApiOperations.getInstance().updateUserEvents(Session.getInstance().id, userEvents, Session.getInstance().token);
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
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white), 
              ),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}