import 'package:flutter/material.dart';
import 'package:sala_negra/models/app_events.dart';
import 'package:sala_negra/models/session.dart';
import 'package:sala_negra/prog/cats/cats_bar.dart';
import 'package:sala_negra/prog/cats/cats_bar_state.dart';
import 'package:sala_negra/prog/listItem/prog_list_item.dart';
import 'package:sala_negra/prog/listItem/prog_list_item_state.dart';

class ProgView extends StatelessWidget {

  final CatsBarState _catsBarState = CatsBarState();
  final events = AppEvents.getInstance().getAllEvents();
  final userEvents = Session.getInstance().userEvents;

  ProgView({super.key});  

  List<ProgListItemState> setItems(){
    List<ProgListItemState> items = [];
    for (var event in events) {
      if(userEvents.isEmpty){
        items.add(ProgListItemState(false, event));
      } else if(userEvents.contains(event)){
        items.add(ProgListItemState(true, event));
      }
      items.add(ProgListItemState(false, event));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    var items = setItems();
    return Column(
      children: [
        // Lista de elementos
        Expanded(
          child: ListView.builder(
            itemCount: items.length + 1, 
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: [
                    CatsBar(state: _catsBarState),
                    const SizedBox(height: 10),
                  ],
                );
              } else {
                return ProgListItem(state: items[index - 1]);
              }
            },
          ),
        ),
      ],
    );
  }
}