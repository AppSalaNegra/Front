import 'package:flutter/material.dart';
import 'package:sala_negra/news/newsItem/news_list_item.dart';

class NewsView extends StatelessWidget {
const NewsView({ super.key });

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        // Lista de elementos
        Expanded(
          child: ListView(
            children: const <Widget>[
              NewsListItem(),
              NewsListItem(),
              NewsListItem()
            ],
          ),
        ),
      ],
    );
  }
}