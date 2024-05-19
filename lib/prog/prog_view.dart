import 'package:flutter/material.dart';
import 'package:sala_negra/models/app_events.dart';
import 'package:sala_negra/models/session.dart';
import 'package:sala_negra/prog/cats/cats_bar.dart';
import 'package:sala_negra/prog/cats/cats_bar_state.dart';
import 'package:sala_negra/prog/listItem/prog_list_item.dart';
import 'package:sala_negra/prog/listItem/prog_list_item_state.dart';

class ProgView extends StatefulWidget {
  
  const ProgView({super.key});

  @override
  State<ProgView> createState() => _ProgViewState();
}

class _ProgViewState extends State<ProgView> {

  final CatsBarState _catsBarState = CatsBarState();
  final events = AppEvents.getInstance().getAllEvents();
  final userEvents = Session.getInstance().userEvents;
  String selectedCat = 'Todos';

  List<ProgListItemState> setItems(){
    List<ProgListItemState> items = [];
    events.sort((a, b) => a.startDateTime.compareTo(b.startDateTime));
    for (var event in events) {
      if (selectedCat != 'Todos' && !event.getCategoryNames().contains(selectedCat)) {
        continue; 
      }
      if(userEvents.isEmpty){
        items.add(ProgListItemState(false, event));
      }else{
        if(userEvents.contains(event)){
          items.add(ProgListItemState(true, event));
        }else {
          items.add(ProgListItemState(false, event));
        }
      }
    }
    return items;
  }

  void updateSelectedCat(String cat) {
    setState(() {
      selectedCat = cat;
    });
  }

  @override
  Widget build(BuildContext context) {
    var items = setItems();
    return Column(
      children: [
        // CatsBar
        CatsBar(
          state: _catsBarState,
          onCatSelected: updateSelectedCat,
        ),
        const SizedBox(height: 10),
        // Expanded para la lista de elementos
        Expanded(
          child: items.isEmpty
              ? const Center(
                  child: Text(
                    'Oops, parece que no hay nada por aquí.',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ProgListItem(state: items[index]);
                  },
                ),
        ),
      ],
    );
  }
}