import 'package:flutter/material.dart';
import 'package:sala_negra/models/event.dart';
import 'package:sala_negra/models/session.dart';
import 'package:sala_negra/settings/collection/collection_item.dart';
import 'package:sala_negra/settings/collection/collection_item_state.dart';

class CollectionBody extends StatefulWidget {
  const CollectionBody({super.key});

  @override
  State<CollectionBody> createState() => _CollectionBodyState();
}

class _CollectionBodyState extends State<CollectionBody> {
  List<Event> userEvents = Session.getInstance().userEvents;

  void _refreshBody() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: userEvents.isEmpty
                  ? const Center(
                      child: Text(
                        'Oops, parece que no hay nada por aquí.',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: userEvents.length,
                      itemBuilder: (context, index) {
                        return CollectionItem(
                          state: CollectionItemState(
                            true,
                            userEvents[index],
                          ),
                          onDislike: _refreshBody,
                        );
                      },
                    ),
            ),
          ],
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