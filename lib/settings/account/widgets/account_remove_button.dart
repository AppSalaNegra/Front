import 'package:flutter/material.dart';
import 'package:sala_negra/api/api_operations.dart';
import 'package:sala_negra/login/login_view.dart';
import 'package:sala_negra/models/session.dart';
import 'package:sala_negra/utilities/app_colors.dart';
import 'package:sala_negra/utilities/app_fonts.dart';
import 'package:sala_negra/utilities/sala_negra_toast.dart';

class AccountRemoveButton extends StatelessWidget{
 
  const AccountRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showRemoveConfirmationDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: double.infinity, 
        child: const Row(
          children: [
            Expanded(
              child: Text(
                'Eliminar cuenta',
                style: AppFonts.largeFont,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRemoveConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar eliminar cuenta'),
          content: const Text('¿Estás seguro de que desea eliminar la cuenta? Su e-mail será eliminado de nuestra base de datos'),
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
              onPressed: () async {
                var accountRemoved = await ApiOperations.getInstance().removeAccount(Session.getInstance().id, Session.getInstance().token);
                if(accountRemoved){
                  // ignore: use_build_context_synchronously
                  SalaNegraToast.launchInfoToast(context, 'Cuenta eliminada correctamente');
                  Session.getInstance().closeSession();
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                    settings: const RouteSettings(arguments: false),
                    )
                  );
                }
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