import 'package:flutter/material.dart';
import 'package:sala_negra/home/filter_bar.dart';
import 'package:sala_negra/home/list_item.dart';

class HomeView extends StatelessWidget {
  
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Aquí colocamos la barra de botones
        const FilterBar(),
        // Aquí colocamos el ListView
        Expanded(
          child: ListView(
            children: const <Widget>[
              ListItem(),
              ListItem(),
              ListItem(),
              // Agrega más elementos de ListItem según sea necesario
            ],
          ),
        ),
      ],
    );
  }
}