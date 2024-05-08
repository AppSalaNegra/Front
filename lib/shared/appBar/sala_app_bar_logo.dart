import 'package:flutter/material.dart';

class SalaNegraAppBarLogo extends StatelessWidget {

final String image;

  SalaNegraAppBarLogo({required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 50, // Ancho de la imagen
      height: 40, // Alto de la imagen
      fit: BoxFit.cover, // Ajuste de la imagen dentro del contenedor
    );
  }
}