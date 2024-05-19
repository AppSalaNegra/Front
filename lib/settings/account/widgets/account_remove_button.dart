import 'package:flutter/material.dart';
import 'package:sala_negra/api/api_operations.dart';
import 'package:sala_negra/login/login_view.dart';
import 'package:sala_negra/models/session.dart';
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
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                if(await ApiOperations.getInstance().removeAccount(Session.getInstance().id, Session.getInstance().token)){
                  SalaNegraToast.launchToast('Cuenta eliminada con éxito');
                  Session.getInstance().closeSession();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop(); 
                  Navigator.pushReplacement(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                      settings: const RouteSettings(arguments: false),
                    ),
                  );
                }
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}