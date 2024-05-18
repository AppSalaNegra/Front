import 'package:flutter/material.dart';
import 'package:sala_negra/prog/listItem/prog_list_item.dart';
import 'package:sala_negra/prog/listItem/prog_list_item_state.dart';


class CollectionBody extends StatelessWidget{
  
  const CollectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  ProgListItem(state: ProgListItemState()),
                  ProgListItem(state: ProgListItemState()),
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              left: 20,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                shape: const CircleBorder(),
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
  }
  
}