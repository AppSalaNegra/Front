import 'package:flutter/material.dart';
import 'package:sala_negra/utilities/app_fonts.dart';
import 'package:sala_negra/utilities/button_styles.dart';
import 'package:sala_negra/utilities/text_fields_decoration.dart';

class PasswordForm extends StatelessWidget{
  
  const PasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nueva contraseña:', style: AppFonts.largeFont,),
              Container(
                margin: const EdgeInsets.only(top: 10),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Repite la nueva contraseña:', style: AppFonts.largeFont,),
              Container(
                margin: const EdgeInsets.only(top: 10),
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
            padding: const EdgeInsets.only(top:50),
            child: ElevatedButton(
              style: ButtonStyles.yellowButton,
              onPressed: (){},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Text('Cambiar',
                style: AppFonts.mediumYellowButton
              ),
              )
            ),
          )
      ],
    );
  }

}