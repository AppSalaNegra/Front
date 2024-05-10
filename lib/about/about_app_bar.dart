import 'package:flutter/material.dart';

class SalaNegraAboutAppBar extends StatelessWidget{
  
  const SalaNegraAboutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Color de la sombra
            spreadRadius: 1, // Radio de propagación de la sombra
            blurRadius: 7, // Radio de desenfoque de la sombra
            offset: const Offset(0, 3), // Desplazamiento de la sombra en x y y
          ),
        ],
      ),
      child: AppBar(
        automaticallyImplyLeading: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
              ],
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        toolbarHeight: 80,
      ),
    );
  }
}