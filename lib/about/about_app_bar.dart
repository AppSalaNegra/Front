import 'package:flutter/material.dart';

class SalaNegraAboutAppBar extends StatelessWidget{
  
  const SalaNegraAboutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), 
            spreadRadius: 1, 
            blurRadius: 7, 
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset(
                'assets/img/horizontal_brillo.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}