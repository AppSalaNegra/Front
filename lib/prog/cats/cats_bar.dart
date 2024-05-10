import 'package:flutter/material.dart';
import 'cats_button.dart';
import 'cats_bar_state.dart';

class CatsBar extends StatefulWidget {
 
  final CatsBarState state;

  const CatsBar({super.key, required this.state});

  @override
  State<CatsBar> createState() => _CatsBarState();
}

class _CatsBarState extends State<CatsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Color de la sombra
            spreadRadius: 0.3, // Radio de expansión de la sombra
            blurRadius: 5, // Desenfoque de la sombra
            offset: const Offset(0, 1), // Desplazamiento de la sombra (horizontal, vertical)
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Eliminar margen inferior
        child: ButtonBar(
          children: CatsBarState.cats.map((cat) {
            return CatButton(
              title: cat,
              isSelected: cat == widget.state.selectedCat,
              onPressed: () {
                setState(() {
                  widget.state.selectCat(cat);
                });
                print("Botón $cat presionado");
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}