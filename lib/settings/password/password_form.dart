import 'package:flutter/material.dart';
import 'package:sala_negra/api/api_operations.dart';
import 'package:sala_negra/models/session.dart';
import 'package:sala_negra/settings/password/password_form_controller.dart';
import 'package:sala_negra/shared/nav.dart';
import 'package:sala_negra/utilities/app_fonts.dart';
import 'package:sala_negra/utilities/button_styles.dart';
import 'package:sala_negra/utilities/sala_negra_toast.dart';
import 'package:sala_negra/utilities/text_fields_decoration.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm({super.key});

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm>{

  final PasswordFormController _controller = PasswordFormController();
  final _passwordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key:_passwordKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Contraseña:', style: AppFonts.largeFont,),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: TextFieldsDecoration.mainFieldShadow, 
                  child: TextFormField(
                    expands: false, 
                    obscureText: true,
                    style: AppFonts.mediumFont,
                    decoration: TextFieldsDecoration.mainFieldDecoration,
                    controller: _controller.password,
                    validator: (value){
                      if(!_controller.validatePassword(value)){
                        SalaNegraToast.launchToast('Campo contraseña vacío');
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nueva contraseña:', style: AppFonts.largeFont,),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: TextFieldsDecoration.mainFieldShadow, 
                  child: TextFormField(
                    expands: false, 
                    style: AppFonts.mediumFont,
                    decoration: TextFieldsDecoration.mainFieldDecoration,
                    controller: _controller.newPassword,
                    obscureText: true,
                  ),
                )
              ],
            ),
          ),
          Container(          
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Repite la nueva contraseña:', style: AppFonts.largeFont,),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: TextFieldsDecoration.mainFieldShadow, 
                  child: TextFormField(
                    expands: false, 
                    style: AppFonts.mediumFont,
                    decoration: TextFieldsDecoration.mainFieldDecoration,
                    controller: _controller.repeatPassword,
                    validator: (value) {
                      if(!_controller.validateNewPassword(_controller.newPassword.text, value)){
                        SalaNegraToast.launchToast('Las contraseñas no coinciden');
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top:50),
              child: ElevatedButton(
                style: ButtonStyles.yellowButton,
                onPressed: () async {
                  _passwordKey.currentState!.validate();
                  if(_controller.validateForm()){
                    String response = await ApiOperations.getInstance().changePassword(
                      Session.getInstance().id, _controller.password.text, 
                      _controller.newPassword.text, Session.getInstance().token
                    );
                    SalaNegraToast.launchToast(response);
                    if(response == 'Contraseña cambiada con éxito'){Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavBar(),
                        settings: const RouteSettings(arguments: false),
                        )
                    );}
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text('Cambiar',
                  style: AppFonts.mediumYellowButton
                ),
                )
              ),
            )
        ],
      ),
    );
  }

}