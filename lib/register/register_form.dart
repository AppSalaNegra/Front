import 'package:flutter/material.dart';
import 'package:sala_negra/login/login_view.dart';
import 'package:sala_negra/utilities/app_fonts.dart';
import 'package:sala_negra/utilities/button_styles.dart';
import 'package:sala_negra/utilities/text_fields_decoration.dart';

class RegisterForm extends StatelessWidget{
  
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nombre:', style: AppFonts.formFont,),
              Container(
                decoration: TextFieldsDecoration.mainFieldShadow, 
                child: TextField(
                  expands: false, 
                  style: AppFonts.mediumFont,
                  decoration: TextFieldsDecoration.mainFieldDecoration
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Apellidos:', style: AppFonts.formFont,),
              Container(
                decoration: TextFieldsDecoration.mainFieldShadow, 
                child: TextField(
                  expands: false, 
                  style: AppFonts.mediumFont,
                  decoration: TextFieldsDecoration.mainFieldDecoration
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Correo electrónico:', style: AppFonts.formFont,),
              Container(
                decoration: TextFieldsDecoration.mainFieldShadow, 
                child: TextField(
                  expands: false, 
                  style: AppFonts.mediumFont,
                  decoration: TextFieldsDecoration.mainFieldDecoration
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Contraseña:', style: AppFonts.formFont,),
              Container(
                decoration: TextFieldsDecoration.mainFieldShadow, 
                child: TextField(
                  expands: false, 
                  style: AppFonts.mediumFont,
                  decoration: TextFieldsDecoration.mainFieldDecoration
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Repetir contraseña:', style: AppFonts.formFont,),
              Container(
                decoration: TextFieldsDecoration.mainFieldShadow, 
                child: TextField(
                  expands: false, 
                  style: AppFonts.mediumFont,
                  decoration: TextFieldsDecoration.mainFieldDecoration
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ElevatedButton(
            style: ButtonStyles.blackButton,
            onPressed: (){},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Text('Regístrate',
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
                      builder: (context) => const LoginView(),
                      settings: const RouteSettings(arguments: false),
                      )
                  );
                },
                child: const Text(
                  '¿Ya tienes cuenta? Inicia sesión',
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