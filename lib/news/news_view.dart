import 'package:flutter/material.dart';
import 'package:sala_negra/models/app_posts.dart';
import 'package:sala_negra/news/newsItem/news_list_item.dart';

class NewsView extends StatelessWidget {

  NewsView({ super.key });
  final posts = AppPosts.getInstance().getAllPosts();

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        // Lista de elementos
        Expanded(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index){
              return NewsListItem(post: posts[index]);
            },
          ),
        ),
      ],
    );
  }
}