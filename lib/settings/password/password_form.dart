import 'package:flutter/material.dart';
import 'package:sala_negra/utilities/app_fonts.dart';
import 'package:sala_negra/utilities/button_styles.dart';

class PasswordForm extends StatelessWidget{
  
  const PasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Contraseña:', style: AppFonts.largeFont,),
              TextField()
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nueva contraseña:', style: AppFonts.largeFont,),
              TextField()
            ],
          ),
        ),
        Container(          
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Repite la nueva contraseña:', style: AppFonts.largeFont,),
              TextField()
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