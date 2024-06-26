import 'package:flutter/material.dart';

class SalaNegraAppBarLogo extends StatelessWidget {

final String image;

  const SalaNegraAppBarLogo({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 50, 
      height: 40, 
      fit: BoxFit.cover,
    );
  }
}