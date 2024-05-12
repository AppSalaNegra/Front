import 'package:flutter/material.dart';
import 'package:sala_negra/settings/collection/collection_view.dart';

class SettingsCollectionButton extends StatelessWidget{
  
  const SettingsCollectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CollectionView(),
            settings: const RouteSettings(arguments: false),
            )
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: double.infinity, 
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Colección',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}