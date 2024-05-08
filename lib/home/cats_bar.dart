import 'package:flutter/material.dart';
import 'cats_button.dart';

class CatsBar extends StatelessWidget {

  static const List cats = ["Todos","Familiares","Canalla","Teatro","Poesía","Magia","Música"];

  const CatsBar({ super.key });

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ButtonBar(
      children: cats.map((cat) {
          return CatButton(
            title: cat,
            onPressed: () {
              print("Botón $cat presionado");
            },
          );
        }).toList(),
      ),
    );
  }
}