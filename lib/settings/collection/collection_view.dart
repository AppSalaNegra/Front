import 'package:flutter/material.dart';
import 'package:sala_negra/settings/collection/collection_body.dart';
import 'package:sala_negra/shared/appBar/sala_app_bar.dart';

class CollectionView extends StatelessWidget{
  
  const CollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SalaNegraAppBar(title: 'COLECCIÓN'),
      ),
      body: const CollectionBody(),
    );
  }
}