import 'package:flutter/material.dart';
import 'package:sala_negra/home/cats_bar.dart';
import 'package:sala_negra/home/list_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Lista de elementos
        Positioned.fill(
          child: ListView(
            children: const <Widget>[
              //este elemento empuja todos hacia abajo
              SizedBox(height: 60,),
              ListItem(),
              ListItem(),
              ListItem(),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            color: const Color.fromARGB(245, 255, 255, 255),
            child: const CatsBar(),
          ),
        ),
      ],
    );
  }
}