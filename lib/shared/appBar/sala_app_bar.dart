import 'package:flutter/material.dart';
import 'package:sala_negra/shared/appBar/sala_app_bar_logo.dart';

// AppBar de la parte superior
class SalaNegraAppBar extends StatelessWidget {
  
  final String title;
  
  SalaNegraAppBar({this.title = 'default'});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              SalaNegraAppBarLogo(image: 'assets/img/logo.png'),
              Container(
                padding: const EdgeInsets.only(left: 30, top: 22),
                margin: const EdgeInsets.only(bottom: 25, right: 20),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ], 
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      toolbarHeight: 80,
    );
  }
}