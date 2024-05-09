import 'package:flutter/material.dart';
import 'package:sala_negra/prog/cats/cats_bar.dart';
import 'package:sala_negra/prog/cats/cats_bar_state.dart';
import 'package:sala_negra/prog/prog_list_item.dart';
import 'package:sala_negra/prog/prog_list_item_state.dart';

class ProgView extends StatelessWidget {

  final CatsBarState _catsBarState = CatsBarState();

  ProgView({super.key});  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Lista de elementos
        Expanded(
          child: ListView(
            children: <Widget>[
              CatsBar(state: _catsBarState,),
              const SizedBox(height: 10,),
              ProgListItem(state: ProgListItemState(),),
              ProgListItem(state: ProgListItemState(),),
              ProgListItem(state: ProgListItemState(),),
              ProgListItem(state: ProgListItemState(),),
              ProgListItem(state: ProgListItemState(),),
              ProgListItem(state: ProgListItemState(),),
            ],
          ),
        ),
      ],
    );
  }
}