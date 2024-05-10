import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sala_negra/utilities/app_colors.dart';

class AboutBody extends StatelessWidget{
  
  const AboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      width: double.infinity, // Asegura que el contenedor ocupe todo el ancho de la pantalla
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: ElevatedButton(
              onPressed: () {
                // TODO: incrustar quienes somos sala negra
              },
              child: Text(
                'Quiénes somos',
                style: Theme.of(context).textTheme.displayMedium
              ),
            ),
          )
        ],
      ),
    );
  }
}