import 'package:flutter/material.dart';
import 'package:sala_negra/login/login_form_controller.dart';
import 'package:sala_negra/register/register_view.dart';
import 'package:sala_negra/utilities/app_fonts.dart';
import 'package:sala_negra/utilities/button_styles.dart';
import 'package:sala_negra/utilities/text_fields_decoration.dart';

class LoginForm extends StatelessWidget{
  
  LoginForm({super.key});

  final LoginFormController _controller = LoginFormController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          margin: const EdgeInsets.only(top: 40),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Correo electrónico:', style: AppFonts.formFont,),
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: TextFieldsDecoration.mainFieldShadow, 
              child: TextField(
                expands: false, 
                style: AppFonts.mediumFont,
                controller: _controller.email,
                decoration: 
                TextFieldsDecoration.mainFieldDecoration,
              ),
            ),
          ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Contraseña:', style: AppFonts.formFont,),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: TextFieldsDecoration.mainFieldShadow, 
                child: TextField(
                  obscureText: true,
                  expands: false, 
                  style: AppFonts.mediumFont,
                  decoration: TextFieldsDecoration.mainFieldDecoration,
                  controller: _controller.password,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:70),
          child: ElevatedButton(
            style: ButtonStyles.blackButton,
            onPressed: _controller.validateForm,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Text('Entra',
              style: AppFonts.mediumBlackButton
            ),
            )
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterView(),
                      settings: const RouteSettings(arguments: false),
                      )
                  );
                },
                child: const Text(
                  '¿No tienes cuenta? Regístrate',
                  style: AppFonts.underlined,
                ),
              ), 
            ),
          ),
        ),
      ],
    );
  }
}